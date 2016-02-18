<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<!--vcard template-->
	<xsl:template match="vcard">
		<xsl:for-each select="info">
			<div id="{fn/given-name}{fn/family-name}">
				<div class="vcard">
					<div class="logodiv">
						<img class="logo" src="{logo/@src}" alt="{logo/@alt}"/>
					</div>
					<ul class="info">
						<li class="fn n">
							<strong class="given-name">
								<xsl:value-of select="fn/given-name"/>
							</strong>
							<strong class="family-name">
								<xsl:value-of select="fn/family-name"/>
							</strong>
						</li>
						<li>
							<strong>Email:</strong>
							<xsl:element name="a">
								<xsl:attribute name="href">mailto:<xsl:value-of select="email"/></xsl:attribute>
								<xsl:attribute name="class">email</xsl:attribute>
								<xsl:value-of select="email"/>
							</xsl:element>
						</li>
						<li class="qq">
							<strong>QQ:</strong>
							<xsl:element name="a">
								<xsl:attribute name="href">tencent://message/?uin=<xsl:value-of select="qq"/>&amp;Site=webrebuild.org&amp;Menu=yes</xsl:attribute>
								<xsl:attribute name="class">uid</xsl:attribute>
								<xsl:value-of select="qq"/>
							</xsl:element>
						</li>
						<li>
							<strong>ORG:</strong>
							<xsl:apply-templates select="org"/>
						</li>
						<li class="working">
							<strong>Working For:</strong>
							<xsl:element name="a">
								<xsl:attribute name="href"><xsl:value-of select="working/url"/></xsl:attribute>
								<xsl:attribute name="rel">external</xsl:attribute>
								<xsl:value-of select="working/name"/>
							</xsl:element>
						</li>
						<li class="adr">
							<strong>Address:</strong>
							<xsl:apply-templates select="adr"/>
						</li>
						<li>
							<strong>Contact:</strong>
							<xsl:apply-templates select="contact"/>
						</li>
						<li class="blog">
							<strong>Blog:</strong>
							<xsl:element name="a">
								<xsl:attribute name="href"><xsl:value-of select="blog"/></xsl:attribute>
								<xsl:attribute name="rel">me</xsl:attribute>
								<xsl:value-of select="blog"/>
							</xsl:element>
						</li>
					</ul>
				</div>
			</div>
		</xsl:for-each>
	</xsl:template>
	<!--address template-->
	<xsl:template match="adr">
		<xsl:for-each select="type">
			<address>
				<strong>Office Address:</strong>
				<span class="type">
					<xsl:value-of select="@name"/>
				</span>
				<span class="post-office-box">
					<xsl:value-of select="post-office-box"/>
				</span>,<span class="locality">
					<xsl:value-of select="locality"/>
				</span>,<span class="street-address">
					<xsl:value-of select="street-address"/>
				</span>,<span class="extended-address">
					<xsl:value-of select="extended-address"/>
				</span>,<span class="region">
					<xsl:value-of select="region"/>
				</span>,<span class="country-name">
					<xsl:value-of select="country-name"/>
				</span>
				<br/>
				<strong>Office Zip code:</strong>
				<span class="postal-code">
					<xsl:value-of select="postal-code"/>
				</span>
			</address>
		</xsl:for-each>
	</xsl:template>
	<!--org template-->
	<xsl:template match="org">
		<xsl:choose>
			<xsl:when test="count(url) &gt; 1">
				<xsl:element name="ul">
					<xsl:for-each select="url">
						<xsl:element name="li">
							<xsl:element name="a">
								<xsl:attribute name="href">http://<xsl:value-of select="."/></xsl:attribute>
								<xsl:attribute name="class">org</xsl:attribute>
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="a">
					<xsl:attribute name="href">http://<xsl:value-of select="."/></xsl:attribute>
					<xsl:attribute name="class">org</xsl:attribute>
					<xsl:value-of select="."/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--contact template-->
	<xsl:template match="contact">
		<xsl:choose>
			<xsl:when test="count(tel) &gt; 1">
				<xsl:element name="ul">
					<xsl:for-each select="tel">
						<xsl:element name="li">
							<xsl:element name="span">
								<xsl:attribute name="class">type</xsl:attribute>
								<xsl:value-of select="./@type"/>
							</xsl:element>
              :
              <xsl:element name="span">
								<xsl:attribute name="class">value</xsl:attribute>
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="span">
					<xsl:attribute name="class">type</xsl:attribute>
					<xsl:value-of select="tel/@type"/>
				</xsl:element>
        :
        <xsl:element name="span">
					<xsl:attribute name="class">value</xsl:attribute>
					<xsl:value-of select="."/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>