rem    set the variable JAVA to the place where the java command is located, for example
rem    set JAVA="c:\Program Files\java\jdk1.5.0\bin\java"

set JAVA=java

rem    modify the following line to set the classpath
rem    for example:
rem    set CP=-cp c:\MyJava\saxon8.jar

set CP=

%JAVA% %CP% net.sf.saxon.Query -t xmp/q1.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/q2.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/q3.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/q4.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/q5.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/q6.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/q7.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/q8.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/q9.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/q11.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/q11.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/q12.xq

%JAVA% %CP% net.sf.saxon.Query -t xmp/addq1.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/addq2.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/addq3.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/addq4.xq x=5
%JAVA% %CP% net.sf.saxon.Query -t xmp/addq5.xq x=5
%JAVA% %CP% net.sf.saxon.Query -t -s xmp/books.xml xmp/addq6.xq
%JAVA% %CP% net.sf.saxon.Query -t -s xmp/books.xml -strip xmp/addq6.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/addq7.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/addq8.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/addq9.xq
%JAVA% %CP% net.sf.saxon.Query -t xmp/addq10.xq

%JAVA% %CP% net.sf.saxon.Query -t tree/q1.xq
%JAVA% %CP% net.sf.saxon.Query -t tree/q2.xq
%JAVA% %CP% net.sf.saxon.Query -t tree/q3.xq
%JAVA% %CP% net.sf.saxon.Query -t tree/q4.xq
%JAVA% %CP% net.sf.saxon.Query -t tree/q5.xq
%JAVA% %CP% net.sf.saxon.Query -t tree/q6.xq

%JAVA% %CP% net.sf.saxon.Query -t seq/q1.xq
%JAVA% %CP% net.sf.saxon.Query -t seq/q2.xq
%JAVA% %CP% net.sf.saxon.Query -t seq/q3.xq
%JAVA% %CP% net.sf.saxon.Query -t seq/q4.xq
%JAVA% %CP% net.sf.saxon.Query -t seq/q5a.xq
%JAVA% %CP% net.sf.saxon.Query -t seq/q5b.xq

%JAVA% %CP% net.sf.saxon.Query -t r/q1.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q2.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q3.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q4.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q5.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q6.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q7.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q8.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q9.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q10.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q11.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q12.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q13.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q14.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q15.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q16.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q17.xq
%JAVA% %CP% net.sf.saxon.Query -t r/q18.xq

%JAVA% %CP% net.sf.saxon.Query -t -s sgml/report.xml sgml/q1.xq
%JAVA% %CP% net.sf.saxon.Query -t -s sgml/report.xml sgml/q2.xq
%JAVA% %CP% net.sf.saxon.Query -t -s sgml/report.xml sgml/q3.xq
%JAVA% %CP% net.sf.saxon.Query -t -s sgml/report.xml sgml/q4.xq
%JAVA% %CP% net.sf.saxon.Query -t -s sgml/report.xml sgml/q5.xq
%JAVA% %CP% net.sf.saxon.Query -t -s sgml/report.xml sgml/q6.xq
%JAVA% %CP% net.sf.saxon.Query -t -s sgml/report.xml sgml/q7.xq
%JAVA% %CP% net.sf.saxon.Query -t -s sgml/report.xml sgml/q8a.xq
%JAVA% %CP% net.sf.saxon.Query -t -s sgml/report.xml sgml/q8b.xq
%JAVA% %CP% net.sf.saxon.Query -t -s sgml/report.xml sgml/q9.xq
%JAVA% %CP% net.sf.saxon.Query -t -s sgml/report.xml sgml/q10.xq

%JAVA% %CP% net.sf.saxon.Query -t -s string/news.xml string/q1.xq
%JAVA% %CP% net.sf.saxon.Query -t -s string/news.xml string/q2.xq
%JAVA% %CP% net.sf.saxon.Query -t -s string/news.xml string/q4.xq
%JAVA% %CP% net.sf.saxon.Query -t -s string/news.xml string/q5.xq

%JAVA% %CP% net.sf.saxon.Query -t -s ns/auction.xml ns/q1.xq
%JAVA% %CP% net.sf.saxon.Query -t -s ns/auction.xml ns/q2.xq
%JAVA% %CP% net.sf.saxon.Query -t -s ns/auction.xml ns/q3.xq
%JAVA% %CP% net.sf.saxon.Query -t -s ns/auction.xml ns/q4.xq
%JAVA% %CP% net.sf.saxon.Query -t -s ns/auction.xml ns/q5.xq
%JAVA% %CP% net.sf.saxon.Query -t -s ns/auction.xml ns/q6.xq
%JAVA% %CP% net.sf.saxon.Query -t -s ns/auction.xml ns/q7.xq
%JAVA% %CP% net.sf.saxon.Query -t -s ns/auction.xml ns/q8.xq

%JAVA% %CP% net.sf.saxon.Query -t -s ns/auction.xml ns/addq1.xq

%JAVA% %CP% net.sf.saxon.Query -t parts/q1.xq