xquery version "1.0";

(: Additional use case to demonstrate use of global parameters :)
(: Also demonstrates the text node constructor and comment node constructor :)

declare variable $x external;
declare variable $x-int := xs:integer($x);

<s>
  { for $i in $x-int to $x-int + 20 return 
        text { "[", string(2*$i), "]" }
  }
  <c>{ comment { "x =", $x-int } }</c>
  <pi>{ processing-instruction {"target"} { concat("data=", $x) } }
      { processing-instruction x { 3 } }</pi>
</s>