xquery version "1.0";
(: Additional Use Case addq10 :)
(: Use typeswitch :)

declare namespace f="my.uri";
declare function f:show-atomic-type($p) {
  typeswitch ($p)
    case $i as xs:integer return concat("integer ", string($i))
    case xs:string return "string"
    case $b as xs:boolean return concat("boolean ", string($b))
    case xs:decimal return "decimal"
    case xs:double return "double"
    case xdt:anyAtomicType+ return "atomic sequence"
    case xdt:anyAtomicType return "atomic value"
    case xdt:anyAtomicType? return "empty sequence"
    default return "not an atomic value"
};

declare function f:show-node-kind($p) {
  typeswitch ($p)
    case $e as element() return "element"
    case $a as attribute() return "attribute"
    case $t as text() return "text"
    case $c as comment() return "comment"
    case $p as processing-instruction() return "pi"
    case $d as document-node() return "document"
    case node()+ return "node sequence"
    default return "unknown"
}; 
   
<test>
<t1>{f:show-atomic-type(1)}</t1>
<t1>{f:show-atomic-type(true())}</t1>
<t1>{f:show-atomic-type(1.1)}</t1>
<t1>{f:show-atomic-type(1.3e4)}</t1>
<t1>{f:show-atomic-type("jimmy")}</t1>
<t1>{f:show-atomic-type((1,2,3))}</t1>
<t1>{f:show-atomic-type(<a/>)}</t1>
<t2>{f:show-node-kind(<a/>)}</t2>
<t2>{f:show-node-kind(attribute little {"big"})}</t2>
<t2>{f:show-node-kind(text {"tittle-tattle"})}</t2>
</test>
