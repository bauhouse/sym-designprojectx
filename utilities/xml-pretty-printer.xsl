<?xml version='1.0' encoding='iso-8859-1'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

<!--
Name: XML Prettyprinter
Author: Marc Liyanage
URL: http://www.entropy.ch/software/xsl/welcome.html
Download: http://www.entropy.ch/software/xsl/xml-prettyprinter.xslt

Description:
Indents an XML document according to its hierarchical structure.
-->

<xsl:output method='html' version='1.0' encoding='iso-8859-1' indent='no'/>

<xsl:variable name="indent_text" select="'&#x09;'"/>

<xsl:template match="*[count(*) = 0]">
<xsl:param name="indent" select="0"/>
<xsl:call-template name="indent"><xsl:with-param name="count" select="$indent"/></xsl:call-template>
<xsl:element name="{name()}"><xsl:copy-of select="@*"/><xsl:value-of select="normalize-space(.)"/></xsl:element><xsl:text>
</xsl:text>
</xsl:template>

<xsl:template match="*[count(*) > 0]">
<xsl:param name="indent" select="0"/>
<xsl:call-template name="indent"><xsl:with-param name="count" select="$indent"/></xsl:call-template>
<xsl:element name="{name()}"><xsl:copy-of select="@*"/><xsl:text>
</xsl:text>
<xsl:apply-templates><xsl:with-param name="indent" select="$indent + 1"/></xsl:apply-templates>
<xsl:call-template name="indent"><xsl:with-param name="count" select="$indent"/></xsl:call-template></xsl:element><xsl:text>
</xsl:text>
</xsl:template>

<xsl:template name="indent">
<xsl:param name="count"/>

<xsl:if test="$count > 0">
<xsl:copy-of select="$indent_text"/>
<xsl:call-template name="indent">
<xsl:with-param name="count" select="$count - 1"/>
</xsl:call-template>
</xsl:if>

</xsl:template>

<xsl:template match="text()[string-length(normalize-space(.)) &lt; 1]">
</xsl:template>

<xsl:template match="text()[string-length(normalize-space(.)) > 1]">
<xsl:param name="indent" select="0"/>
<xsl:call-template name="indent"><xsl:with-param name="count" select="$indent"/></xsl:call-template>
<xsl:value-of select="normalize-space(.)"/><xsl:text>
</xsl:text>
</xsl:template>

</xsl:stylesheet>
