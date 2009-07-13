<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="data">
	<div class="line">
		<div class="unit size5of7">
			<xsl:choose>
				<xsl:when test="$entry">
					<xsl:for-each select="entry/entry">
						<xsl:call-template name="entry"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<div class="mod">
						<div class="box articles">
							<h2><a>Tutorials</a></h2>
							<div class="block">
								<xsl:for-each select="tutorials/entry">
									<xsl:call-template name="entries-excerpts"/>
								</xsl:for-each>
							</div>
						</div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<div class="unit size2of7">
			<xsl:if test="$entry">
				<div class="mod">
					<div class="box menu">
						<h2><a>Navigate</a></h2>
						<xsl:for-each select="entry/entry">
							<xsl:call-template name="previous-next-links">
								<xsl:with-param name="current-entry-id" select="@id"/>
							</xsl:call-template>
						</xsl:for-each>
					</div>
				</div>
			</xsl:if>
			<div class="mod">
				<div class="box menu">
					<h2><a>Menu</a></h2>
					<ul class="menu">
						<xsl:for-each select="tutorials/entry">
							<xsl:call-template name="entries-menu-items"/>
						</xsl:for-each>
					</ul>
				</div>
			</div>
		</div>
	</div>
</xsl:template>

<xsl:template name="entry">
	<xsl:param name="formatted-date">
		<xsl:call-template name="format-date" select="date">
			<xsl:with-param name="date" select="date"/>
			<xsl:with-param name="format" select="'x M Y'"/>
		</xsl:call-template>
	</xsl:param>
	<div class="mod">
		<div class="box articles">
			<h2><a><xsl:value-of select="$formatted-date"/></a></h2>
			<div class="block">
				<div class="article">
					<h3><a href="{$root}/{$root-page}/{title/@handle}/"><xsl:value-of select="title"/></a></h3>
					<xsl:call-template name="entry-meta"/>
					<xsl:copy-of select="description/*"/>
					<xsl:apply-templates select="body/*" mode="entry-html"/>
				</div>
			</div>
		</div>
	</div>
</xsl:template>
	
<xsl:template name="entries-excerpts">
	<div class="article">
		<h3><a href="{$root}/{$root-page}/{title/@handle}/"><xsl:value-of select="title"/></a></h3>
		<xsl:call-template name="entry-meta"/>
		<xsl:copy-of select="description/*"/>
	</div>
</xsl:template>

<xsl:template name="entries-menu-items">
	<xsl:param name="formatted-date">
		<xsl:call-template name="format-date" select="date">
			<xsl:with-param name="date" select="date"/>
			<xsl:with-param name="format" select="'x M Y'"/>
		</xsl:call-template>
	</xsl:param>
	<li>
		<xsl:if test="$entry = title/@handle">
			<xsl:attribute name="class">current</xsl:attribute>
		</xsl:if>
		<a href="{$root}/{$root-page}/{title/@handle}/" title="Posted {$formatted-date}"><xsl:value-of select="title"/></a>
	</li>
</xsl:template>

<xsl:template name="entry-meta">
	<xsl:param name="formatted-date">
		<xsl:call-template name="format-date" select="date">
			<xsl:with-param name="date" select="date"/>
			<xsl:with-param name="format" select="'x M Y'"/>
		</xsl:call-template>
	</xsl:param>
	<p class="meta">Posted <xsl:value-of select="$formatted-date"/>
		<xsl:if test="category">
			<xsl:text> in </xsl:text>
			<xsl:value-of select="category"/>
		</xsl:if>
		| <a href="{$workspace}/pages/tutorials.xsl" title="View XSL template for this page">XSL</a>
		| <a href="{$root}/journal/xml/{title/@handle}/" title="View entry as XML">XML</a>
		| <a href="{$root}/journal/text/{title/@handle}/" title="View entry as text">Text</a>
	</p>
</xsl:template>

<xsl:template name="previous-next-links">
	<xsl:param name="current-entry-id"/>
	<xsl:variable name="next" select="/data/tutorials/entry[@id = $current-entry-id]/following-sibling::entry[1]" />
	<xsl:variable name="previous" select="/data/tutorials/entry[@id = $current-entry-id]/preceding-sibling::entry[1]" />
	<ul class="menu">
		<xsl:if test="$previous">
			<li><a href="{$root}/tutorials/{$previous/title/@handle}/">Previous</a></li>
		</xsl:if>
		<xsl:if test="$next">
			<li><a href="{$root}/tutorials/{$next/title/@handle}/">Next</a></li>
		</xsl:if>
	</ul>
</xsl:template>

<xsl:template match="*" mode="entry-html">
	<xsl:element name="{name()}">
		<xsl:apply-templates select="* | @* | text()" mode="entry-html"/>
	</xsl:element>
</xsl:template>

<xsl:template match="@*" mode="entry-html">
	<xsl:attribute name="{name()}">
		<xsl:value-of select="."/>
	</xsl:attribute>
</xsl:template>

<xsl:template match="pre" priority="1" mode="entry-html">
	<pre><xsl:value-of select="./code"/></pre>
</xsl:template>


	
</xsl:stylesheet>