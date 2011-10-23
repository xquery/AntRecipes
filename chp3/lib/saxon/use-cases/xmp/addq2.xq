xquery version "1.0";
(: Additional Use Case addq2 :)
(: Demonstrate access to external Java methods :)

declare namespace math="java:java.lang.Math";
<square-roots>
 {
  for $i in 1 to 20 return
    <number value="{$i}" sqrt="{math:sqrt(number($i))}"/>
 }
</square-roots> 