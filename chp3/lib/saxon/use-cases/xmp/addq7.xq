xquery version "1.0";
(: Additional Use Case addq7 :)
(: Copy the book elements, producing one output document per book :)

  for $b in doc("bib.xml")/bib/book
  return
    document { $b }