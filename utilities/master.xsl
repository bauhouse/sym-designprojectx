<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/main-navigation.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:param name="css-path" select="concat($workspace, '/assets/css/')"/>
<xsl:param name="js-path" select="concat($workspace, '/assets/js/')"/>

<xsl:template match="/">
	<html>
		<xsl:call-template name="head"/>
		<body id="www-designprojectx-com">
			<div class="page">
				<xsl:call-template name="header"/>
				<div class="container mod">
					<h2 id="page-heading"><xsl:value-of select="/data/navigation/page[$current-page = @handle]/name"/></h2>

					<xsl:apply-templates/>
					
				</div>
				<xsl:call-template name="footer"/>
			</div>
			<xsl:call-template name="js"/>
			<xsl:call-template name="analytics"/>
		</body>
	</html>
</xsl:template>

<xsl:template name="head">
	<xsl:param name="css"/>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title><xsl:value-of select="$page-title"/> | <xsl:value-of select="$website-name"/></title>
		<xsl:call-template name="css"/>
	</head>
</xsl:template>

<xsl:template name="header">
	<xsl:call-template name="branding"/>
	<xsl:call-template name="main-navigation"/>
</xsl:template>

<xsl:template name="branding">
	<div id="branding">
		<h1><a href="{$root}/"><xsl:value-of select="$website-name"/></a></h1>
	</div>
</xsl:template>

<xsl:template name="footer">
	<div id="site_info">
		<div class="box">
			<p><a href="{$root}/"><xsl:value-of select="$website-name"/></a> | The digital sandbox of Stephen Bau </p>
		</div>
	</div>
</xsl:template>

<xsl:template name="css">
	<link rel="stylesheet" type="text/css" href="{$css-path}reset.css" media="all" />
	<link rel="stylesheet" type="text/css" href="{$css-path}text.css" media="all" />
	<link rel="stylesheet" type="text/css" href="{$css-path}grids.css" media="all" />
	<link rel="stylesheet" type="text/css" href="{$css-path}layout.css" media="all" />
	<link rel="stylesheet" type="text/css" href="{$css-path}nav.css" media="all" />
	<xsl:if test="$current-page = 'tutorials'">
		<link rel="stylesheet" type="text/css" href="{$css-path}xml.css" media="all" />
	</xsl:if>
</xsl:template>

<xsl:template name="js">
	<script type="text/javascript" src="{$js-path}jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="{$js-path}jquery-ui-1.7.1.custom.min.js"></script>
	<script type="text/javascript" src="{$js-path}jquery-fluid.js"></script>
	<xsl:if test="$current-page = 'tutorials'">
		<script type="text/javascript" src="{$js-path}syntax-xml.js"></script>
	</xsl:if>
</xsl:template>

<xsl:template name="analytics">
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-4383733-3");
pageTracker._trackPageview();
} catch(err) {}</script>
</xsl:template>

</xsl:stylesheet>