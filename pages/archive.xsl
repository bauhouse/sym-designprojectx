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
			<div class="mod">
				<div class="box table">
					<h2><a>Entries Archive</a></h2>
					<div class="block">
						<table>
							<thead>
								<tr>
									<th><a>Date</a></th>
									<th><a>Section</a></th>
									<th><a>Title</a></th>
									<!-- th><a>Comments</a></th -->
								</tr>
							</thead>
							<tbody>
								<xsl:choose>
									<xsl:when test="$b">
										<xsl:for-each select="entries-archive/year[@value = $a]/month[@value = $b]/entry">
											<xsl:call-template name="entries-archive-list"/>
										</xsl:for-each>
									</xsl:when>
									<xsl:when test="$a">
										<xsl:for-each select="entries-archive/year[@value = $a]/month/entry">
											<xsl:call-template name="entries-archive-list"/>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:for-each select="entries-archive/year/month/entry">
											<xsl:call-template name="entries-archive-list"/>
										</xsl:for-each>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="unit size2of7">
			<div class="mod">
				<div class="box menu">
					<h2><a>Archive</a></h2>
					<div class="block">
						<ul class="section menu">
							<xsl:for-each select="entries-archive/year">
								<xsl:call-template name="archive-by-date"/>
							</xsl:for-each>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</xsl:template>

<xsl:template name="entries-archive-list">
	<tr>
		<td>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="date"/>
				<xsl:with-param name="format" select="'x m Y'"/>
			</xsl:call-template>
		</td>
		<td><xsl:value-of select="section/item"/></td>
		<td><a href="{$root}/{section/item/@handle}/{title/@handle}/"><xsl:value-of select="title"/></a></td>
		<!-- td><a href="{$root}/{../../@value}/{../@value}/{substring(date, 9, 2)}/{title/@handle}/"><xsl:value-of select="title"/></a></td -->
		<!-- td class="none">0</td -->
	</tr>
</xsl:template>
	
<xsl:template name="archive-by-date">
	<li>
		<a href="{$root}/{$current-page}/{@value}/"><xsl:value-of select="@value"/></a>
		<ul class="menu">
			<xsl:for-each select="month">
				<li>
					<a href="{$root}/{$current-page}/{../@value}/{@value}/">
						<xsl:call-template name="format-month">
							<xsl:with-param name="month" select="@value"/>
							<xsl:with-param name="format" select="'M'"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
						<xsl:value-of select="../@value"/>
					</a>
				</li>
			</xsl:for-each>
		</ul>
	</li>
</xsl:template>

</xsl:stylesheet>