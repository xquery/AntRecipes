<?xml version="1.0"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0"
		xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
		xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0">

	<xsl:template match="node()|@*" name="copy">
		<xsl:copy>
		<xsl:apply-templates select="node()|@*"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="text:p">
 		<xsl:choose>
		<xsl:when test="contains(., '@webcomposite.com')">
			<xsl:comment>
			<xsl:text>email address removed</xsl:text>
			</xsl:comment>
		</xsl:when>
		<xsl:when test="starts-with(., 'Phone')">
			<xsl:comment>
			<xsl:text>phone number removed</xsl:text>
			</xsl:comment>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="copy"/>
		</xsl:otherwise>

		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
