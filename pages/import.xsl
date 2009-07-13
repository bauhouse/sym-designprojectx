<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:excerpt="http://wordpress.org/export/1.0/excerpt/"
	xmlns:content="http://purl.org/rss/1.0/modules/content/"
	xmlns:wfw="http://wellformedweb.org/CommentAPI/"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:wp="http://wordpress.org/export/1.0/">

<xsl:import href="../utilities/master.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:param name="wordpress-xml" select="document('../assets/xml/wordpress.2009-05-11.xml')"/>

<xsl:template match="data">
	<xsl:param name="sym-data" select="/"/>
	<xsl:param name="selected-entry">
		<xsl:choose>
			<xsl:when test="$a"><xsl:value-of select="$a"/></xsl:when>
			<xsl:otherwise>1</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="total-entries" select="count($wordpress-xml/rss/channel/item)"/>
	<div class="line">
		<div class="unit size2of3">
			<div class="mod">
				<div class="box">
					<h2><a>Import a WordPress Entry</a></h2>
					<div class="block">
						<xsl:for-each select="events/save-entry">
							<p class="{@result}"><strong><xsl:value-of select="message"/></strong></p>
						</xsl:for-each>
						<xsl:for-each select="$wordpress-xml/rss/channel/item[number($selected-entry)]">
							<form method="post" action="" enctype="multipart/form-data">
								<fieldset>
									<legend>Import Fields</legend>
									<input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
									<p>
										<label>Title</label>
										<input name="fields[title]" type="text" value="{title}"/>
									</p>
									<p>
										<label>Description</label>
										<textarea name="fields[description]" rows="6" cols="50">
											<xsl:copy-of select="excerpt:encoded/text()"/>
										</textarea>
									</p>
									<p>
										<label>Body</label>
										<textarea name="fields[body]" rows="30" cols="50">
											<xsl:copy-of select="content:encoded/text()"/>
										</textarea>
									</p>
									<p>
										<label>Section</label>
										<select name="fields[section]">
											<option value=""></option>
											<xsl:for-each select="$sym-data/data/sections/entry">
												<option value="{@id}">
													<xsl:if test="@id = 17">
														<xsl:attribute name="selected">selected</xsl:attribute>
													</xsl:if>
													<xsl:value-of select="title"/>
												</option>
											</xsl:for-each>
										</select>
									</p>
									<p>
										<label>Category</label>
										<select name="fields[category]">
											<option value=""></option>
											<xsl:for-each select="$sym-data/data/categories/entry">
												<option value="{@id}">
													<xsl:if test="@id = 15">
														<xsl:attribute name="selected">selected</xsl:attribute>
													</xsl:if>
													<xsl:value-of select="title"/>
												</option>
											</xsl:for-each>
										</select>
									</p>
									<p>
										<label>Tags</label>
										<xsl:call-template name="csv-tags-input">
											<xsl:with-param name="tags" select="category[@domain = 'tag' and @nicename]"/>
										</xsl:call-template>
									</p>
									<p>
										<label>Date</label>
										<input name="fields[date]" type="text" value="{wp:post_date}" />
									</p>
									<!--p>
										<input name="fields[publish]" type="checkbox" />
										<label>Publish</label>
									</p-->
									<!-- input name="action[save-entry]" type="submit" value="Submit" /-->
								</fieldset>
							</form>
						</xsl:for-each>
					</div>
				</div>
			</div>
		</div>
		<div class="unit size1of3">
			<div class="mod">
				<div class="box menu">
					<h2><a>Select an Entry</a></h2>
					<div class="block">
						<ul class="menu">
							<xsl:if test="$a and $a &gt; 1">
								<li><a href="{$root}/import/{$a - 1}/">Previous</a></li>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="$a &lt; $total-entries">
									<li><a href="{$root}/import/{$a + 1}/">Next</a></li>
								</xsl:when>
								<xsl:when test="not($a)">
									<li><a href="{$root}/import/{2}/">Next</a></li>
								</xsl:when>
							</xsl:choose>
						</ul>
					</div>
				</div>
			</div>
			<div class="mod">
				<div class="box menu">
					<h2><a>Select an Entry by Title</a></h2>
					<div class="block">
						<ul class="menu">
							<xsl:for-each select="$wordpress-xml/rss/channel/item">
								<li>
									<xsl:if test="$a = position() or not($a) and position() = 1">
										<xsl:attribute name="class">current</xsl:attribute>
									</xsl:if>
									<a href="{$root}/import/{position()}/"><xsl:value-of select="title"/></a>
								</li>
							</xsl:for-each>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</xsl:template>

<xsl:template name="csv-tags-input">
	<xsl:param name="tags"/>
	<xsl:param name="csv-tags">
		<xsl:call-template name="csv-values">
			<xsl:with-param name="values" select="$tags"/>
		</xsl:call-template>
	</xsl:param>
	<input name="fields[tags]" type="text" value="{$csv-tags}"/>
</xsl:template>

<xsl:template name="csv-values">
	<xsl:param name="values"/>
	<xsl:for-each select="$values">
		<xsl:value-of select="."/><xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>