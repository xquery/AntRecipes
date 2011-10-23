
import com.saxonica.validate.SchemaAwareConfiguration;
import com.saxonica.validate.Sink;
import net.sf.saxon.Configuration;
import net.sf.saxon.TransformerFactoryImpl;
import net.sf.saxon.value.Value;
import net.sf.saxon.query.StaticQueryContext;
import net.sf.saxon.query.XQueryExpression;
import net.sf.saxon.query.DynamicQueryContext;
import net.sf.saxon.event.Receiver;
import net.sf.saxon.event.XMLEmitter;
import net.sf.saxon.event.PipelineConfiguration;
import net.sf.saxon.om.NodeInfo;
import net.sf.saxon.om.Validation;
import net.sf.saxon.pull.*;
import net.sf.saxon.tinytree.TinyBuilder;
import net.sf.saxon.trans.XPathException;

import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;
import java.util.Properties;

/**
 * This class contains some examples of how to use the Pull interfaces
 * in Saxon.
 *
 * These interfaces are currently experimental, and not fully integrated
 * into the architecture of the product. They are expected to play a more
 * significant role in future releases.
 */

public class PullExamples {

    private Configuration config = new Configuration();

    /**
     * Serialize a document that is supplied via the pull interface
     */

    public void serialize(PullProvider in, OutputStream out) throws XPathException, IOException {
        XMLEmitter emitter = new XMLEmitter();
        emitter.setOutputProperties(new Properties());
        emitter.setOutputStream(out);
        emitter.setPipelineConfiguration(in.getPipelineConfiguration());
        new PullPushCopier(in, emitter).copy();
    }

    /**
     * Validate a document that is supplied via the pull interface
     * (This requires the schema-aware version of Saxon)
     */

    public void validate(PullProvider in) throws XPathException, IOException {
        SchemaAwareConfiguration config = new SchemaAwareConfiguration();
        in.getPipelineConfiguration().setConfiguration(config);
        Receiver sink = new Sink();
        sink.setPipelineConfiguration(in.getPipelineConfiguration());
        Receiver validator = config.getDocumentValidator(
                sink, in.getSourceLocator().getSystemId(), config.getNamePool(), Validation.STRICT);
        validator.setPipelineConfiguration(in.getPipelineConfiguration());
        //in = new PullTracer(in);
        new PullPushCopier(in, validator).copy();
    }

    /**
     * Transform a document supplied via the pull interface
     */

    public void transform(PullProvider in, File stylesheet, OutputStream out) throws TransformerException {
        TransformerFactory factory = new TransformerFactoryImpl();
        Templates templates = factory.newTemplates(new StreamSource(stylesheet));
        Transformer transformer = templates.newTransformer();
        transformer.transform(
                new PullSource(in),
                new StreamResult(out)
        );
    }

    /**
     * Run a query against input supplied using the pull interface
     */

    public void query(PullProvider in, String query, OutputStream out) throws XPathException {
        final StaticQueryContext sqc = new StaticQueryContext(config);
        final XQueryExpression exp = sqc.compileQuery(query);
        final DynamicQueryContext dynamicContext = new DynamicQueryContext(config);
        dynamicContext.setContextNode(sqc.buildDocument(new PullSource(in)));
        Properties props = new Properties();
        props.setProperty(OutputKeys.INDENT, "yes");
        exp.run(dynamicContext, new StreamResult(out), props);
    }

    /**
     * Build a Saxon tree from input supplied via the pull interface
     */

    public NodeInfo build(PullProvider in) throws XPathException {
        TinyBuilder builder = new TinyBuilder();
        builder.setPipelineConfiguration(in.getPipelineConfiguration());
        new PullPushCopier(in, builder).copy();
        return builder.getCurrentRoot();
    }

    /**
     * Get a PullProvider based on a StAX Parser for a given input file
     */

    public PullProvider getParser(File input) throws FileNotFoundException, XPathException {
        StaxBridge parser = new StaxBridge();
        parser.setInputStream(input.toURI().toString(), new FileInputStream(input));
        parser.setPipelineConfiguration(config.makePipelineConfiguration());
        return parser;
    }

    /**
     * Get a PullProvider based on a document or element node in a Saxon tree
     */

    public PullProvider getTreeWalker(NodeInfo root) {
        return TreeWalker.makeTreeWalker(root);
    }

    /**
     * Create a copy of a document, filtered to remove all elements named "PRICE",
     * together with their contents
     */

    public void removePriceElements(PullProvider in, OutputStream out) throws IOException, XPathException {
        final int priceElement = config.getNamePool().allocate("", "", "PRICE");
        PullFilter filter = new PullFilter(in) {
            public int next() throws XPathException {
                currentEvent = super.next();
                if (currentEvent == START_ELEMENT && getFingerprint() == priceElement) {
                    super.skipToMatchingEnd();
                    currentEvent = next();
                }
                return currentEvent;
            }
        };
        serialize(filter, out);
    }

    /**
     * Get the average price of books, by scanning a document and taking the average of the
     * values of the PRICE elements
     */

     public void displayAveragePrice(PullProvider in, OutputStream out) throws IOException, XPathException {
        final int priceElement = config.getNamePool().allocate("", "", "PRICE");
        double total = 0;
        int count = 0;
        while (true) {
            int event = in.next();
            if (event == PullProvider.END_OF_INPUT) {
                break;
            }
            if (event == PullProvider.START_ELEMENT && in.getFingerprint() == priceElement) {
                double value = Value.stringToNumber(in.getStringValue());
                total += value;
                count++;
            }
        }
        double average = (count==0 ? Double.NaN : total/count);
        String result = "<result>" + average + "</result>";
        OutputStreamWriter writer = new OutputStreamWriter(out);
        writer.write(result);
        writer.flush();
    }

    /**
     * Main program. Arguments:
     * <ol>
     *   <li>Select examples. Each example is identified by a single letter. Use # to run all examples.
     *   <li>-s Source document</li>
     *   <li>-o Output file</li>
     *   <li>-xsl Stylesheet</li>
     *   <li>-q Query
     * </ol>
     */

    public static void main(String[] args) throws Exception {
        String examples;
        if (args.length < 1 || args[0].equals("#")) {
            examples = "abcdefghijklmnopqrstuvwxyz";
        } else {
            examples = args[0];
        }
        File input = null;
        OutputStream output = null;
        String query = null;
        File stylesheet = null;

        for (int i=1; i<args.length; i++) {
            if (args[i].equals("-s")) {
                input = new File(args[++i]);
            } else if (args[i].equals("-o")) {
                output = new FileOutputStream(new File(args[++i]));
            } else if (args[i].equals("-q")) {
                query = readFile(new File(args[++i]));
            } else if (args[i].equals("-xsl")) {
                stylesheet = new File(args[++i]);
            } else {
                System.err.println("Unknown argument " + args[i]);
            }
        }

        if (input==null) {
            input = new File("../data/books.xml");
        }

        if (output==null) {
            output = System.out;
        }

        PullExamples o = new PullExamples();
        PipelineConfiguration pipe = new Configuration().makePipelineConfiguration();
        for (int i=0; i<examples.length(); i++) {
            char ex = examples.charAt(i);
            switch (ex) {
                case 'a': {
                    System.out.println("=== Serialize the input to the output ===");

                    PullProvider p = o.getParser(input);
                    p.setPipelineConfiguration(pipe);
                    o.serialize(p, output);
                    break;
                }
                case 'b': {
                    System.out.println("=== Validate the input ===");

                    PullProvider p = o.getParser(input);
                    p.setPipelineConfiguration(pipe);
                    o.validate(p);
                    break;
                }
                case 'c': {
                    System.out.println("=== Transform the input to the output ===");

                    if (stylesheet == null) {
                        System.err.println("** No stylesheet supplied");
                        break;
                    }
                    PullProvider p = o.getParser(input);
                    p.setPipelineConfiguration(pipe);
                    o.transform(p, stylesheet, output);
                    break;
                }
                case 'd': {
                    System.out.println("=== Run XQuery against the input ===");
                    if (query == null) {
                        query = "<result>{.}</result>";
                    }
                    PullProvider p = o.getParser(input);
                    p.setPipelineConfiguration(pipe);
                    o.query(p, query, output);
                    break;
                }
                case 'e': {
                    System.out.println("=== Remove PRICE elements from the input ===");

                    PullProvider p = o.getParser(input);
                    p.setPipelineConfiguration(pipe);
                    o.removePriceElements(p, output);
                    break;
                }
                case 'f': {
                    System.out.println("=== Compute average of PRICE elements in the input ===");

                    PullProvider p = o.getParser(input);
                    p.setPipelineConfiguration(pipe);
                    o.displayAveragePrice(p, output);
                    break;
                }
            }
        }
    }

    /**
     * Read the contents of a file into a string
     */

    public static String readFile(File file) throws IOException {
        Reader reader = new FileReader(file);
        char[] buffer = new char[4096];
        StringBuffer sb = new StringBuffer(4096);
        while (true) {
            int n = reader.read(buffer);
            if (n>0) {
                sb.append(buffer, 0, n);
            } else {
                break;
            }
        }
        return sb.toString();
    }



}

//
// The contents of this file are subject to the Mozilla Public License Version 1.0 (the "License");
// you may not use this file except in compliance with the License. You may obtain a copy of the
// License at http://www.mozilla.org/MPL/
//
// Software distributed under the License is distributed on an "AS IS" basis,
// WITHOUT WARRANTY OF ANY KIND, either express or implied.
// See the License for the specific language governing rights and limitations under the License.
//
// The Original Code is: all this file.
//
// The Initial Developer of the Original Code is Michael H. Kay.
//
// Portions created by (your name) are Copyright (C) (your legal entity). All Rights Reserved.
//
// Contributor(s): none.
//
