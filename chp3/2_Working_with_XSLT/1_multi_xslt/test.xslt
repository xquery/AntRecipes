<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/">
		<html>
			<body>
				<p>
					Version:<xsl:value-of select="system-property('xsl:version')"/><br/>
					Vendor:<xsl:value-of select="system-property('xsl:vendor')"/><br/>
					Vendor URL:<xsl:value-of select="system-property('xsl:vendor-url')"/>			
				</p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
