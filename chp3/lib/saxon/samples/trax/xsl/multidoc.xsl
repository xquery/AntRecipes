<xsl:stylesheet 
      xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='2.0'
      xmlns:date="java:java.util.Date"
      exclude-result-prefixes="date">

<!-- this stylesheet tests multi-document output by creating a new result document for each element -->

  <xsl:template match="/">
  <output at="{date:toString(date:new())}">
    <xsl:apply-templates/>
  </output>
  </xsl:template>  

  <xsl:template match="*">
    <xsl:result-document href="{local-name()}{count(ancestor::node()|preceding::*)}.out">
      <document>
         <xsl:apply-templates/>
      </document>
    </xsl:result-document>
  </xsl:template>
      
</xsl:stylesheet>