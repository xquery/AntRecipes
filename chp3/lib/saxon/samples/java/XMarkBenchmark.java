
import com.saxonica.validate.Sink;
import net.sf.saxon.Configuration;
import net.sf.saxon.Version;
import net.sf.saxon.om.DocumentInfo;
import net.sf.saxon.query.DynamicQueryContext;
import net.sf.saxon.query.StaticQueryContext;
import net.sf.saxon.query.XQueryExpression;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.FileReader;
import java.util.Properties;


/**
 * Runs the XMark XQuery benchmark: see
 * <a href="http://monetdb.cwi.nl/xml/index.html">http://monetdb.cwi.nl/xml/index.html</a
 *
 */
public class XMarkBenchmark {

    /**
     * Class is not instantiated, so give it a private constructor
     */
    private XMarkBenchmark() {
    }

    /**
     * Method main
     */
    public static void main(String argv[]) throws Exception {

        String dir = "c:\\javalib\\xmark\\";
        String[] tests = {"xmark1.xml", "xmark4.xml", "xmark10.xml"};

        System.out.println("<xmark-results product='Saxon' version='" + Version.getProductVersion() + "'>");

        for (int f=0; f<tests.length; f++) {
            File file = new File(dir + tests[f]);

            Configuration config = new Configuration();
            StaticQueryContext env = new StaticQueryContext(config);

            Source streamSource = new StreamSource(file);
            long pstart = System.currentTimeMillis();
            DocumentInfo doc = env.buildDocument(streamSource);
            long pend = System.currentTimeMillis();

            System.out.println("  <file name='" + tests[f] +
                    "' size='" + file.length() +
                    "' build-time='" + (pend-pstart) + "'>");
            Properties props = new Properties();



            for (int q=1; q<=20; q++) {
                //if (q==9) continue;
                File query = new File(dir + 'q' + q + ".xq");
                StaticQueryContext qenv = new StaticQueryContext(config);
                XQueryExpression exp = qenv.compileQuery(new FileReader(query));
                int runs = 0;
                long totalTime = 0;
                long min = Integer.MAX_VALUE;
                long max = 0;
                for (int t=0; t<10; t++) {
                    final DynamicQueryContext context = new DynamicQueryContext(config);
                    context.setContextNode(doc);
                    Result result = new Sink();

                    long start = System.currentTimeMillis();
                    exp.run(context, result, props);
//                    SequenceIterator iter = exp.iterator(context);
//                    SequenceExtent extent = new SequenceExtent(iter);
                    long end = System.currentTimeMillis();
                    runs++;
                    long time = (end - start);
                    if (time < min) min = time;
                    if (time > max) max = time;
                    totalTime += time;
                    if (totalTime > 1000 && t>=2) break;
                }
                System.out.println("    <query q='" + q +
                            "' avg='" + (totalTime / runs) +
                            "' runs='" + runs +
                            "' min='" + min +
                            "' max='" + max + "'/>");
            }
            System.out.println("  </file>");
        }
        System.out.println("</xmark-results>");
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
