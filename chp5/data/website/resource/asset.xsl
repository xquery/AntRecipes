<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!--css category template -->
	<xsl:template match="category[@name='css']/asset">
		<xsl:param name="node" select="/.."/>
		<link rel="stylesheet" type="text/css">
			<xsl:attribute name="href"><xsl:value-of select="@src"/></xsl:attribute>
		</link>
	</xsl:template>

	<!--image category template -->
	<xsl:template match="category[@name='img']/asset">
		<img src="{@src}" height="{height}" width="{width}" alt="{alt}"></img>
	</xsl:template>

	<!--html category template -->
	<xsl:template match="category[@name='html']/asset">
	
	<xsl:choose>
	<xsl:when test="txt">
	<xsl:apply-templates select="txt"/>
	</xsl:when>
	<xsl:otherwise>
	<xsl:copy-of select="."/>
	</xsl:otherwise>
	</xsl:choose>

	</xsl:template>

	<!--javascript category template -->
	<xsl:template match="category[@name='javascript']/asset">
		<xsl:param name="node" select="/.."/>
		<script language="JavaScript" TYPE="text/javascript">
		<xsl:choose>
			<xsl:when test="@src">
				<xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
			</xsl:when>
			<xsl:when test="not(@src)">
				<xsl:value-of select="."/>
			</xsl:when>			
		</xsl:choose>
		</script>
	</xsl:template>

	<!--flash category template -->
	<xsl:template match="category[@name='flash']/asset">
		<xsl:param name="node" select="/.."/>
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0">
			<xsl:attribute name="height"><xsl:value-of select="height"/></xsl:attribute>
			<xsl:attribute name="width"><xsl:value-of select="width"/></xsl:attribute>
			<param name="movie">
				<xsl:attribute name="value"><xsl:value-of select="@src"/></xsl:attribute>
			</param>
			<param name="quality" value="high"/>
			<embed quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash">
				<xsl:attribute name="height"><xsl:value-of select="height"/></xsl:attribute>
				<xsl:attribute name="width"><xsl:value-of select="width"/></xsl:attribute>
				<xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
			</embed>
		</object>
	</xsl:template>
	

</xsl:stylesheet>
