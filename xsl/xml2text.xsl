<?xml version="1.0"?>
<!-- Extract plain text from a XML page, adding line breaks between lines -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="utf-8" method="text" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates select="//PAGE"/>
	</xsl:template>
	<xsl:template match="//PAGE">
		<xsl:apply-templates select="TEXT"/>
	</xsl:template>
	<xsl:template match="TEXT">
		<xsl:apply-templates select="TOKEN"/>
		<xsl:text>&#xD;</xsl:text>
	</xsl:template>
	<xsl:template match="TOKEN">
		<!-- actual text -->
		<xsl:value-of select="."/>
		<!-- append space to all but last word -->
		<xsl:choose>
			<xsl:when test="position() != last()">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
