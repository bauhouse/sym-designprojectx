<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/date-time.xsl"/>
<xsl:import href="../utilities/html-to-markdown.xsl"/>

<xsl:output method="text" />

<xsl:template match="/">
<xsl:for-each select="data/entry/entry">
<xsl:text>--------------------------------
Title
--------------------------------
</xsl:text>
<xsl:value-of select="title"/>

<xsl:text>


--------------------------------
Description
--------------------------------
</xsl:text>
<xsl:apply-templates select="description" mode="markdown"/>

<xsl:text>

--------------------------------
Body
--------------------------------
</xsl:text>
<xsl:apply-templates select="body" mode="markdown"/>

<xsl:text>

--------------------------------
Date
--------------------------------
</xsl:text>
<xsl:call-template name="format-date">
	<xsl:with-param name="date" select="date"/>
	<xsl:with-param name="format" select="'d m Y t'"/>
</xsl:call-template>
<xsl:text>


--------------------------------
Section
--------------------------------
</xsl:text>
<xsl:value-of select="section/item"/>
<xsl:text>


--------------------------------
Category
--------------------------------
</xsl:text>
<xsl:value-of select="category/item"/>
<xsl:text>


--------------------------------
Tags
--------------------------------
</xsl:text>
<xsl:for-each select="tags/item">
	<xsl:value-of select="."/>
	<xsl:if test="position() != last()">
		<xsl:text>, </xsl:text>
	</xsl:if>
</xsl:for-each>

</xsl:for-each>
</xsl:template>
	
</xsl:stylesheet>