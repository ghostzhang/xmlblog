<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" encoding="utf-8" method="html"/>
	<!--rss template-->
	<xsl:template match="rss">
		<xsl:choose>
			<xsl:when test="@type = 'article'">
				<h2>最新文章</h2>
			</xsl:when>
			<xsl:when test="@type = 'photo'">
				<h2>最新相册</h2>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates select="document (@url)/rss/channel"/>
	</xsl:template>
	<!--channel template-->
	<xsl:template match="channel">
		<div class="article">
			<xsl:for-each select="item">
				<div class="article-list">
					<h3>
						<xsl:element name="a">
							<xsl:attribute name="href">
								<xsl:value-of select="link"/>
							</xsl:attribute>
							<xsl:attribute name="class">article-title</xsl:attribute>
							<xsl:copy-of select="title/node()"/>
						</xsl:element>
					</h3>
					<xsl:if test="/rss/@version != '0.92'">
					by 	<strong class="article-author">
							<xsl:value-of select="author"/><xsl:value-of xmlns:dc="http://purl.org/dc/elements/1.1/" select="dc:creator"/>
						</strong>
					on <xsl:value-of select="pubDate"/>
					</xsl:if>
					<div class="article-content">
						<xsl:copy-of select="description/node()"/>
					</div>
					<div>
						<strong>
							<xsl:element name="a">
								<xsl:attribute name="href">
									<xsl:value-of select="link"/>
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="title"/>
								</xsl:attribute>
								阅读全文</xsl:element>
						</strong>
					</div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
</xsl:stylesheet>