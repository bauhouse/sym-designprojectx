<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="main-navigation">
	<ul class="nav">
		<xsl:for-each select="/data/navigation/page[not(types/type = 'admin')]">
			<li>
				<xsl:if test="$current-page = @handle">
					<xsl:attribute name="class">current</xsl:attribute>
				</xsl:if>
				<a href="{$root}/{@handle}/">
					<xsl:if test="types/type = 'index'">
						<xsl:attribute name="href"><xsl:value-of select="concat($root, '/')"/></xsl:attribute>
					</xsl:if>
					<xsl:value-of select="name"/>
				</a>
			</li>
		</xsl:for-each>
	</ul>
</xsl:template>

</xsl:stylesheet>