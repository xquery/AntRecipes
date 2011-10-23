xquery version "1.0";

(: Additional use case to demonstrate use of global variables :)

declare variable $x := 17;

<s>
  { for $i in $x to $x+20 return 2*$i }
</s>