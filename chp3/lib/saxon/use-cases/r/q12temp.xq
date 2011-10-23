declare namespace my="my.uri"
define function my:bid_summary()
  as element()*
{
for $i in distinct-values(doc("bids.xml")//itemno)
  let $b := doc("bids.xml")//bid_tuple[itemno = $i] 
  return <itemno>{ $i }</itemno>
}
my:bid_summary()  


        
