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
			<xsl:choose>
				<xsl:when test="$entry = 'all'">
					<xsl:for-each select="entries/entry">
						<xsl:call-template name="entry"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="$entry">
					<xsl:for-each select="entry/entry">
						<xsl:call-template name="entry"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<div class="mod">
						<div class="box articles">
							<h2><a>Journal Entries</a></h2>
							<div class="block">
								<xsl:for-each select="entries/entry">
									<xsl:call-template name="entries-excerpts"/>
								</xsl:for-each>
							</div>
						</div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<div class="unit size2of7">
			<div class="mod">
				<div class="box menu">
					<h2><a>Menu</a></h2>
					<ul class="menu">
						<xsl:for-each select="entries/entry">
							<xsl:call-template name="entries-menu-items"/>
						</xsl:for-each>
					</ul>
				</div>
			</div>
		</div>
	</div>
</xsl:template>

<xsl:template name="entry">
	<div class="mod">
		<div class="box articles">
			<h2><a><xsl:value-of select="date"/></a></h2>
			<div class="block">
				<div class="article">
					<h3><a href="{$root}/{$root-page}/{title/@handle}/"><xsl:value-of select="title"/></a></h3>
					<xsl:call-template name="entry-meta"/>
					<xsl:copy-of select="description/*"/>
					<xsl:copy-of select="body/*"/>
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
	<li>
		<xsl:if test="$entry = title/@handle">
			<xsl:attribute name="class">current</xsl:attribute>
		</xsl:if>
		<a href="{$root}/{$root-page}/{title/@handle}/"><xsl:value-of select="title"/></a>
	</li>
</xsl:template>

<xsl:template name="entry-meta">
	<p class="meta">Posted <xsl:value-of select="date"/>
		<xsl:if test="category">
			<xsl:text> in </xsl:text>
			<xsl:value-of select="category"/>
		</xsl:if>
		| <a href="{$workspace}/pages/journal.xsl" title="View XSL template for this page">XSL</a>
		| <a href="{$root}/{$current-page}/xml/{title/@handle}/" title="View entry as XML">XML</a>
		| <a href="{$root}/{$current-page}/text/{title/@handle}/" title="View entry as text">Text</a>
	</p>
</xsl:template>

</xsl:stylesheet>