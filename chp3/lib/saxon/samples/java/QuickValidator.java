
import com.saxonica.SchemaAwareTransformerFactory;
import net.sf.saxon.FeatureKeys;
import net.sf.saxon.om.Validation;
import org.xml.sax.helpers.DefaultHandler;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;

/**
 * This class performs schema validation of a source document against the
 * schema specified in its xsi:schemaLocation attribute
 */

public class QuickValidator {
    
    private QuickValidator() {
    }

    /**
     * Usage: java QuickValidator source.xml schema.xsd
     * @param args
     * @throws Exception
     */

    public static void main(String[] args) throws Exception {
        if (args.length < 1) {
            System.err.println("No source file supplied");
        }
        try {
            System.setProperty("javax.xml.transform.TransformerFactory",
                               "com.saxonica.SchemaAwareTransformerFactory");
            TransformerFactory factory = TransformerFactory.newInstance();
            factory.setAttribute(FeatureKeys.SCHEMA_VALIDATION, new Integer(Validation.STRICT));
            factory.setAttribute(FeatureKeys.VALIDATION_WARNINGS, Boolean.TRUE);
            if (args.length > 1) {
                StreamSource schema = new StreamSource(new File(args[1]).toURI().toString());
                ((SchemaAwareTransformerFactory)factory).addSchema(schema);
            }
            Transformer trans = factory.newTransformer();
            StreamSource source = new StreamSource(new File(args[0]).toURI().toString());
            SAXResult sink = new SAXResult(new DefaultHandler());
            trans.transform(source, sink);
        } catch (TransformerException err) {
            System.err.println("Validation failed: " + err.getMessage());
        }
    }

}
