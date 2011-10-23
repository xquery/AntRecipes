<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- master stylesheet and application data -->
	<xsl:include href="../master.xsl"/>

	<!-- master template-->
	<xsl:template match="resource">
		<html lang="{$lang}">

<xsl:comment><xsl:value-of select="$globalexample"/><xsl:value-of select="$tstamp"/></xsl:comment>
			<head>
				<!-- metatags-->
				<xsl:apply-templates select="$html/asset[@name='metatags']"/>
				<xsl:apply-templates select="$html/asset[@name='pagetitle']"/>
				<!-- css stylesheet-->
				<xsl:apply-templates select="$css/asset[@name='site_style']"/>

			</head>
			<body bgcolor="#c0c0c0">
				<xsl:apply-templates select="$html/asset[@name='header']"/>
				<h1><xsl:apply-templates select="title"/></h1>
				
				<xsl:apply-templates select="$img/asset[@name='testimage']"/>
				
				<br/>
				<xsl:apply-templates select="$html/asset[@name='copyright']"/>
				<xsl:apply-templates select="$html/asset[@name='footer']"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
