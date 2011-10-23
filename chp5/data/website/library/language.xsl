<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="txt">
	<xsl:choose>
	<xsl:when test="@xml:lang=$lang">
		<xsl:copy-of select="."/>
	</xsl:when>
	<xsl:when test="not(@xml:lang)">
		<xsl:copy-of select="."/>
	</xsl:when>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
