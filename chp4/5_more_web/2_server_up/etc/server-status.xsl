<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output encoding="UTF-8" indent="yes" method="xml" />
	<xsl:param name="webserver.up"/>
	<xsl:param name="emailserver.up"/>
	<xsl:param name="ftpserver.up"/>

	<xsl:template match="/">
		<html>
		     <head>
		         <style>
		             .good {background-color: #3F0;}
		             .bad {background-color:#F30;}
		         </style>
		 </head>
		    <body>
		        <h1>Server Status</h1>

		            <p>
						WebServer:
		            	<xsl:choose>
			                <xsl:when test="contains($webserver.up,'true')">
			                    <div class="good">passed </div>
			                </xsl:when>
			                <xsl:otherwise>
			                    <div class="bad">failed </div>
			                </xsl:otherwise>
			            </xsl:choose>			            
		            </p>
		            <p>
						EmailServer:
		            	<xsl:choose>
			                <xsl:when test="contains($emailserver.up,'true')">
			                    <div class="good">passed </div>
			                </xsl:when>
			                <xsl:otherwise>
			                    <div class="bad">failed </div>
			                </xsl:otherwise>
			            </xsl:choose>			            
		            </p>
		            <p>
						FTP Server:
		            	<xsl:choose>
			                <xsl:when test="contains($ftpserver.up,'true')">
			                    <div class="good">passed </div>
			                </xsl:when>
			                <xsl:otherwise>
			                    <div class="bad">failed </div>
			                </xsl:otherwise>
			            </xsl:choose>			            
		            </p>		
		</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
