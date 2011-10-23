xquery version "1.0";
(: Additional Use Case addq8 :)
(: Use various forms of computed element and attribute constructor,
   also processing instructions and comments :)
declare namespace inner="http://saxon.sf.net/inner";
document {
    <?processing instruction?>,
    <!-- comment -->,
    <?processing-instruction?>,
    <bib>
     {
      for $b in doc("bib.xml")/bib/book
      return
        element book {
          element { concat("inner", ":", local-name($b)) } {
            attribute { expanded-QName("http://saxon.sf.net/attribute", "title") } { string($b/title) },      
            element { expanded-QName("http://saxon.sf.net/inner", "by") } { $b/author/* | $b/editor/* }
    
          }
        }
     }
    </bib> 
}