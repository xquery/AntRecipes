<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- master stylesheet and application data -->
	<xsl:include href="../master.xsl"/>

	<!-- master template-->
	<xsl:template match="/">

	<xsl:choose>
	<xsl:when test="$client='web'">
		<html lang="{$lang}">


			<xsl:comment><xsl:value-of select="$globalexample"/><xsl:value-of select="$tstamp"/></xsl:comment>
			<head>
				<!-- metatags-->
				<xsl:apply-templates select="$html/asset[@name='metatags']"/>
				<xsl:apply-templates select="$html/asset[@name='pagetitle']"/>
			

			</head>
			<frameset cols="*" frameborder="0" border="0">
				<frameset rows="40,*,40" frameborder="0" border="0" framespacing="0" leftmargin="0" marginheight="0" marginwidth="0" topmargin="0">
					<frame frameborder="0" scrolling="no" src="header.xml" name="header" title="header"/>
					<frameset cols="100,400" frameborder="0" border="0" framespacing="0" leftmargin="0" marginheight="0" marginwidth="0" topmargin="0">
						<frame frameborder="0" scrolling="no" src="navigation.xml" name="navigation" title="navigation"/>
						<frame frameborder="0" scrolling="yes" src="main.xml" name="main" title="main"/>
					</frameset>
					<frame frameborder="0" scrolling="yes" src="footer.xml" name="footer" title="footer"/>
				</frameset>
			</frameset>
		</html>

</xsl:when>

<xsl:when test="$client='text'">
This is a simple example of handling a different client.
</xsl:when>

</xsl:choose>


	</xsl:template>
</xsl:stylesheet>
