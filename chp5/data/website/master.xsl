<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- define global output methods //-->
	<xsl:output method="html" encoding="iso-8859-1" indent="yes"
	doctype-system="-//W3C//DTD HTML 4.0 Transitional//EN"/>

	<!-- global stylesheet and application data -->
	<xsl:include href="global.xsl"/>
	<xsl:variable name="global" select="document('global.xml')"/>

	<!-- asset stylesheet and data -->
	<xsl:variable name="asset" select="document('resource/asset.xml')"/>
	<xsl:include href="resource/asset.xsl"/>

	<!-- Client and language parameters  //-->

	<xsl:param name="lang">de</xsl:param>
	<xsl:param name="client">web</xsl:param>
	<xsl:param name="tstamp"></xsl:param>
	
</xsl:stylesheet>
