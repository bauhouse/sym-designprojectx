<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="data">
	<div class="line">
		<div class="unit size5of7">
			<xsl:for-each select="entries-by-section/entry">
				<xsl:sort select="date/@time" order="ascending"/>
				<xsl:call-template name="entry"/>
			</xsl:for-each>
		</div>
	</div>
</xsl:template>

<xsl:template name="entry">
	<div class="mod">
		<div class="box">
			<h2><a><xsl:value-of select="title"/></a></h2>
			<div class="block">
				<xsl:copy-of select="description/*"/>
				<xsl:copy-of select="body/*"/>
			</div>
		</div>
	</div>
</xsl:template>
	
</xsl:stylesheet>