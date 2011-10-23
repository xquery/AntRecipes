xquery version "1.0";

(: Additional use case to demonstrate use of global parameters :)


(: This example is the same as addq4 with the addition of typed variables :)

declare variable $x as xs:string external;
declare variable $x-int as xs:int := xs:int($x);

<s>
  {  let $open as xs:string := "[",
         $close as xs:string := "]"
     for $i as xs:integer in $x-int to $x-int + 20 return 
        text { $open, string(2*$i), $close }
  }
</s>