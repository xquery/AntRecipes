<schema xmlns="http://purl.oclc.org/dsdl/schematron">

  <title>House</title>

  <pattern> 
     <rule context="House">
     	<assert test="count(roof) = 1">Every house needs a roof.</assert>
     	<assert test="count(basement) = 1">Every house needs a basement.</assert>
     	<report test="count(wall) &lt; 4">A house with less then three walls is odd</report>
     </rule>
     <rule context="window">
     	<assert test="count(paw) = 1">.</assert>
     </rule>
  </pattern>
</schema>