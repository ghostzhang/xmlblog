<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" encoding="utf-8" method="html"/>
<xsl:param name="lang-type">
<xsl:value-of select="document ('../configure.xml')/cssforest/language"/>
</xsl:param>
<xsl:variable name="langs-test" select="document(concat('../languages/', $lang-type, '.xml'))/cssforest/languages"/>

	<!--template lang-test-box-->
	<xsl:template name="langs-test-box">
		<xsl:param name="lang-value"/>
		<xsl:value-of select="$langs-test/lang[@id = ($lang-value)]"/>
	</xsl:template>
</xsl:stylesheet>
