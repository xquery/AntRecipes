import net.sf.saxon.jdom.DocumentWrapper;
import net.sf.saxon.xpath.XPathEvaluator;
import net.sf.saxon.Configuration;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

/**
 * A simple example to show how SAXON can be used with a JDOM tree.
 * It is designed to be used with the source document books.xml and the
 * stylesheet total.xsl
 * @author Michael H. Kay
 */
public class JDOMExample {

    private JDOMExample() {}

    /**
     * Method main
     */
    public static void main(String argv[])
            throws TransformerException, TransformerConfigurationException,
                   JDOMException, IOException {

        if (argv.length == 2) {
            transform(argv[0], argv[1]);
        } else {
            System.err.println("Usage: JDOMExample source.xml style.xsl >out.xml");
        }

    }

    /**
     * Show (a) use of freestanding XPath expressions against the JDOM document, and
     * (b) the simplest possible transformation from system id to output stream.
     */

    public static void transform(String sourceID, String xslID)
            throws TransformerException, TransformerConfigurationException,
                   JDOMException, IOException {


        // Build the JDOM document
        SAXBuilder builder = new SAXBuilder();
        Document doc = builder.build(new File(sourceID));

        // Give it a Saxon wrapper
        DocumentWrapper docw = new DocumentWrapper(doc, sourceID, new Configuration());

        // Retrieve all the ITEM elements
        XPathEvaluator xpath = new XPathEvaluator(docw);
        Iterator iter = xpath.evaluate("//ITEM").iterator();

        // For each of these, compute an additional attribute

        while (iter.hasNext()) {
            //NodeWrapper node = (NodeWrapper)enum.next();
            //Element item = (Element)node.getUnderlyingNode();
            Element item = (Element)iter.next();
            String price = item.getChildText("PRICE");
            String quantity = item.getChildText("QUANTITY");
            try {
                double priceval = Double.parseDouble(price);
                double quantityval = Double.parseDouble(quantity);
                double value = priceval * quantityval;
                item.setAttribute("VALUE", ""+value);
            } catch (NumberFormatException err) {
                item.setAttribute("VALUE", "?");
            }
        }

        // Now do a transformation

        System.setProperty("javax.xml.transform.TransformerFactory",
                           "net.sf.saxon.TransformerFactoryImpl");
        TransformerFactory tfactory = TransformerFactory.newInstance();

        // Un-comment the following lines to get trace output from the transformation
        // tfactory.setAttribute(net.sf.saxon.FeatureKeys.TRACE_LISTENER,
        //                       new net.sf.saxon.trace.XSLTTraceListener());

        Templates templates = tfactory.newTemplates(new StreamSource(xslID));
        Transformer transformer = templates.newTransformer();

        transformer.transform(docw, new StreamResult(System.out));

    }


}
