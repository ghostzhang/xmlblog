<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
	<!ENTITY copy "&#169;">
	<!ENTITY reg "&#174;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" encoding="utf-8" method="html"/>
	<!--main template-->
	<xsl:param name="prefix-value">
		<xsl:value-of select="/cssforest/@prefix/."/>
	</xsl:param>
	<xsl:include href="lang.xsl"/>
	<xsl:template match="cssforest">
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">
			<head>
				<xsl:call-template name="head"/>
			</head>
			<body>
				<xsl:apply-templates select="document ('../configure.xml')/cssforest/header"/>
				<div class="menu">
					<map>
						<span class="none">导航：</span>
						<xsl:apply-templates select="document ('../configure.xml')/cssforest/header/menu"/>
						<xsl:if test="header/menu/attribute::custom = 'yes'">
							<xsl:apply-templates select="header/menu"/>
						</xsl:if>
					</map>
				</div>
				<div class="nonce">
					<xsl:call-template name="langs-test-box">
						<xsl:with-param name="lang-value">you_are_here</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="signposts"/>
				</div>
				<h1>
					<xsl:value-of select="/cssforest/@title"/>
				</h1>
				<xsl:apply-templates select="page"/>
				<xsl:apply-templates select="document ('../configure.xml')/cssforest/footer"/>
			</body>
		</html>
	</xsl:template>
	<!--head template-->
	<xsl:template name="head">
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta http-equiv="Content-Language" content="utf-8"/>
		<meta name="robots" content="all"/>
		<meta name="author" content="GhostZhang"/>
		<meta name="Copyright" content="CSSForest.org"/>
		<meta name="Description" content="CSS森林"/>
		<xsl:element name="meta">
			<xsl:attribute name="name">Keywords</xsl:attribute>
			<xsl:attribute name="content">
				<xsl:value-of select="keywords"/>
				<xsl:if test="keywords != ''">,</xsl:if>
				CSSForest,CSS森林,org,CSS,样式表,Blog,博客,XHTML
			</xsl:attribute>
		</xsl:element>
		<link rel="alternate" type="application/rss+xml" title="RSS 1.0" href="http://www.cssforest.org/blog/index.php?rss=1"/>
		<title>
			<xsl:value-of select="/cssforest/@title"/> -- [CSSForest.org]
		</title>
		<xsl:call-template name="styles"/>
		<!--<xsl:element name="script">
			<xsl:attribute name="type">text/javascript</xsl:attribute>
			<xsl:attribute name="src">
				<xsl:value-of select="$prefix-value"/>js/jquery-1.1.3.1.pack.js</xsl:attribute>
		</xsl:element>
		<xsl:element name="script">
			<xsl:attribute name="type">text/javascript</xsl:attribute>
			<xsl:attribute name="src">
				<xsl:value-of select="$prefix-value"/>js/script.js</xsl:attribute>
		 </xsl:element> -->
	</xsl:template>
	<!--header template-->
	<xsl:template match="header">
		<div class="header">
			<div class="title">
				<xsl:apply-templates select="title"/>
			</div>
		</div>
	</xsl:template>
	<!--title template-->
	<xsl:template match="title">
		<xsl:if test="logo/attribute::src != ''">
			<a class="logo" href="{url}" title="{web-name}">
				<img alt="{logo/@alt}" src="{logo/@src}"/>
			</a>
		</xsl:if>
		<xsl:element name="div">
			<xsl:attribute name="class">
				site-title
			</xsl:attribute>
			<a href="{url}">
				<xsl:value-of select="web-name"/>
			</a>
			<xsl:if test="beta != ''">
				<sup>beta <xsl:value-of select="beta"/></sup>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<!--menu template-->
	<xsl:template match="menu-li">
		<xsl:for-each select=".">
			<a href="{./@url}" accesskey="{./@accesskey}" title="快捷键：Alt+{./@accesskey}">
				<xsl:call-template name="langs-test-box">
					<xsl:with-param name="lang-value">
						<xsl:value-of select="."/>
					</xsl:with-param>
				</xsl:call-template>
			</a>
			<span class="none"> | </span>
		</xsl:for-each>
	</xsl:template>
	<!--styles template-->
	<xsl:template name="styles">
		<xsl:param name="styles-type">
			<xsl:value-of select="$prefix-value"/>style/<xsl:value-of select="document ('../configure.xml')/cssforest/styles"/>/css</xsl:param>
		<xsl:param name="css-flie">
			<xsl:value-of select="$styles-type"/>/<xsl:value-of select="/cssforest/header/css"/>
		</xsl:param>
		<xsl:element name="link">
			<xsl:attribute name="type">text/css</xsl:attribute>
			<xsl:attribute name="media">screen</xsl:attribute>
			<xsl:attribute name="rel">stylesheet</xsl:attribute>
			<xsl:attribute name="rev">stylesheet</xsl:attribute>
			<xsl:attribute name="href">
				<xsl:value-of select="$styles-type"/>/public.css</xsl:attribute>
			<xsl:value-of select="name"/>
		</xsl:element>
		<xsl:element name="link">
			<xsl:attribute name="type">text/css</xsl:attribute>
			<xsl:attribute name="media">screen</xsl:attribute>
			<xsl:attribute name="rel">stylesheet</xsl:attribute>
			<xsl:attribute name="rev">stylesheet</xsl:attribute>
			<xsl:attribute name="href">
				<xsl:value-of select="$css-flie"/>
			</xsl:attribute>
			<xsl:value-of select="name"/>
		</xsl:element>
	</xsl:template>
	<!--signposts template-->
	<xsl:template name="signposts">
		<xsl:for-each select="//signpost">
			<a href="{@url}">
				<xsl:call-template name="langs-test-box">
					<xsl:with-param name="lang-value">
						<xsl:value-of select="."/>
					</xsl:with-param>
				</xsl:call-template>
			</a> &gt;
		</xsl:for-each>
		<strong>
			<xsl:value-of select="//nonce/."/>
		</strong>
	</xsl:template>
	<!--footer template-->
	<xsl:template match="footer">
		<!--about-->
		<div class="footer">
			<p>
				<strong>Web © 2007 by
					<xsl:for-each select="about/info">
						<xsl:element name="a">
							<xsl:attribute name="href">
								<xsl:value-of select="name/@url"/>#<xsl:value-of select="name"/>
							</xsl:attribute>
							<xsl:value-of select="name"/>
						</xsl:element>(<xsl:value-of select="@type"/>)<xsl:text/>
						<xsl:if test="position() &lt; count(../info)">、</xsl:if>
					</xsl:for-each>
				</strong>
			</p>
			<p>
				<xsl:value-of select="substring(copyright, 1, 71)"/>
				<a href="{copyright/@href}">
					<xsl:value-of select="substring(copyright, 72, 41)"/>
				</a>
			</p>
		</div>
		<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create','UA-780254-2','cssforest.org');ga('send','pageview');</script>
	</xsl:template>
	<!-- ######## Flash Template (used for flash objects) ################################################ -->
	<xsl:template name="flash">
		<xsl:param name="id"/>
		<xsl:param name="width"/>
		<xsl:param name="height"/>
		<xsl:param name="src"/>
		<xsl:param name="quality"/>
		<xsl:param name="base"/>
		<xsl:param name="flashvars"/>
		<xsl:param name="bgcolor"/>
		<xsl:param name="menu"/>
		<xsl:param name="wmode"/>
		<xsl:param name="noflash"/>
		<div id="{$id}"/>
		<script type="text/javascript">var flashId=&quot;			<xsl:value-of select="$id"/>
&quot;;
		printFlash(&quot;			<xsl:value-of select="$id"/>
&quot;, &quot;			<xsl:value-of select="$src"/>
&quot;, &quot;			<xsl:value-of select="$wmode"/>
&quot;, &quot;			<xsl:value-of select="$menu"/>
&quot;, &quot;			<xsl:value-of select="$bgcolor"/>
&quot;, &quot;			<xsl:value-of select="$width"/>
&quot;, &quot;			<xsl:value-of select="$height"/>
&quot;, &quot;			<xsl:value-of select="$quality"/>
&quot;, &quot;			<xsl:value-of select="$base"/>
&quot;, &quot;			<xsl:value-of select="$flashvars"/>
&quot;, &quot;			<xsl:value-of select="$noflash"/>
&quot;)</script>
	</xsl:template>
</xsl:stylesheet>