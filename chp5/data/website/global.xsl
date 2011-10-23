<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- global variables that can be used throughout the website  //-->
	<xsl:variable name="serverIP">127.0.0.1</xsl:variable>
	<xsl:variable name="globalexample">time published:</xsl:variable>


	<!-- shorthand variables which make it easy to reference assets in templates //-->
	<xsl:variable name="css" select="$asset/resource/category[@name='css']"/>
	<xsl:variable name="html" select="$asset/resource/category[@name='html']"/>
	<xsl:variable name="img" select="$asset/resource/category[@name='img']"/>
	<xsl:variable name="jscript" select="$asset/resource/category[@name='javascript']"/>
	<xsl:variable name="flash" select="$asset/resource/category[@name='flash']"/>

	<!-- general language handling template  //-->
	<xsl:template match="txt">
		<xsl:choose>
		<xsl:when test="@xml:lang=$lang">
			<xsl:copy-of select="node()"/>
		</xsl:when>
		<xsl:when test="not(@xml:lang)">
			<xsl:copy-of select="node()"/>
		</xsl:when>	
		</xsl:choose>
	</xsl:template>

	<!-- import 3rd party templates  //-->
	<xsl:include href="library/str.tokenize.template.xsl"/>

</xsl:stylesheet>
