xquery version "1.0";
(: Additional Use Case addq1 :)
(: Produce a numbered list of book titles :)
<bib>
 {
  for $b at $n in doc("bib.xml")/bib/book
  return
    <book number="{ $n }">
     { $b/title }
    </book>
 }
</bib> 