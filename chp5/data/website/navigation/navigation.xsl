<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- master stylesheet and application data -->
	<xsl:include href="../master.xsl"/>

	<!-- master template-->
	<xsl:template match="resource">
		<html lang="{$lang}">
			<head>
				<!-- metatags-->
				<xsl:apply-templates select="$html//asset[@name='metatags']"/>
				<xsl:apply-templates select="$html//asset[@name='pagetitle']"/>
				<!-- css stylesheet-->
				<xsl:apply-templates select="$css/asset[@name='site_style']"/>

			</head>
			<body bgcolor="#ff9900">
				<xsl:apply-templates select="$html/asset[@name='header']"/>
				<h3><a href="../navigation/main.xml" target="main"><xsl:apply-templates select="title"/></a></h3>

<a href="../company/product.xml" target="main">Products</a><br/> <i>(javascript test)</i>
				<br/>
				<br/>
<a href="../company/services.xml" target="main">Services</a><br/> <i>(flash test)</i>
				<br/>
				<br/>
<a href="../company/contact.xml" target="main">Contact</a><br/> <i>(exslt test)</i>
				<br/>
				<br/>
<a href="../company/news.xml" target="main">News </a><br/> <i>(data test)</i>
				<br/>
				<br/>
<a href="../company/about.xml" target="main">About</a><br/> <i>(img test)</i>
				<br/>
				<br/>

			<xsl:apply-templates select="$html/asset[@name='footer']"/>
		</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
