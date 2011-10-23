<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- master stylesheet and application data -->
	<xsl:include href="../master.xsl"/>

	<!-- bring in external data and place in variable -->
	<xsl:variable name="news" select="document('../data/news.xml')"/>

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


<table border="1">
<tr>
<th>Title</th>
<th>Summary</th>
</tr>
<xsl:apply-templates select="$news/resource/asset"/>
</table>

<br/>

<i>note: data extracted from ../data/news.xml using document().</i>

				<xsl:apply-templates select="$html/asset[@name='footer']"/>
				<br/>
				<xsl:apply-templates select="$html/asset[@name='copyright']"/>
			</body>
		</html>
	</xsl:template>

<xsl:template match="asset">
<tr>
<td><xsl:apply-templates select="title"/></td>
<td><xsl:apply-templates select="summary"/></td>
</tr>
</xsl:template>	
</xsl:stylesheet>
