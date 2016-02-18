<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" encoding="utf-8" method="html"/>
	<xsl:template match="/">
		<xsl:apply-templates select="cssforest"/>
	</xsl:template>
	<!--pager template-->
	<xsl:template match="page">
		<xsl:apply-templates select="rss"/>
	</xsl:template>
	<xsl:template match="rss">
		<xsl:choose>
			<xsl:when test="@type = 'article'">
				<h2>最新文章列表</h2>
			</xsl:when>
			<xsl:when test="@type = 'photo'">
				<h2>最新相册列表</h2>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates select="document (@url)/rss/channel"/>
	</xsl:template>
	<!--channel template-->
	<xsl:template match="channel">
		<div class="article">
			<ol>
				<xsl:for-each select="item">
					<li class="article-list">
						《<a href="{./link}" class="article-title"><xsl:copy-of select="title/text()"/></a>
						》
					by 	<strong class="article-author">
							<xsl:value-of select="author"/><xsl:value-of xmlns:dc="http://purl.org/dc/elements/1.1/" select="dc:creator"/>
						</strong>
					on <xsl:value-of select="pubDate"/>
					</li>
				</xsl:for-each>
			</ol>
		</div>
	</xsl:template>
	<xsl:include href="includes.xsl"/>
</xsl:stylesheet>
