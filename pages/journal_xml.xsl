<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/xml-pretty-printer.xsl"/>

<xsl:output method="xml" encoding="UTF-8" indent="yes" />

<xsl:template match="/">
	<xsl:for-each select="data/entry">
		<xsl:choose>
			<xsl:when test="$mode = 'pretty'">
				<xsl:apply-templates />
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="entry" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>
</xsl:template>
	
</xsl:stylesheet>