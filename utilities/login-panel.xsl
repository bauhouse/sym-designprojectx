<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="login-panel">
	<xsl:param name="member" select="/data/events/member-login-info"/>
	<form id="login-panel" action="" method="post">
		<fieldset>
			<ul>
				<xsl:choose>
					<xsl:when test="$member/@logged-in = 'true'">
						<li>
							<a href=""><xsl:value-of select="$member/name"/></a>
							<xsl:text> </xsl:text>
							<a href="?member-action=logout">(Logout)</a>
						</li>
					</xsl:when>
					<xsl:otherwise>
						<li><input name="username" value="username"/></li>
						<li><input name="password" type="password" value="password"/></li>
						<li><input id="submit" type="submit" name="member-action[login]" value="Log In"/></li>
					</xsl:otherwise>
				</xsl:choose>
				<input name="redirect" type="hidden" value="{$root}/login/"/>
			</ul>
		</fieldset>
	</form>
</xsl:template>

</xsl:stylesheet>