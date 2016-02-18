<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" encoding="utf-8" method="html"/>
	<xsl:template match="/">
		<xsl:apply-templates select="cssforest"/>
	</xsl:template>
	<!--main template-->
	<xsl:template match="cssforest">
		<xsl:apply-templates select="page"/>
	</xsl:template>
	<!--pager template-->
	<xsl:template match="page">
		<xsl:apply-templates select="vcard"/>
	</xsl:template>
	<xsl:include href="includes.xsl"/>
	<xsl:include href="vcard.xsl"/>
</xsl:stylesheet>