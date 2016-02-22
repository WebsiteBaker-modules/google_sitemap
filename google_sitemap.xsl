<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:html="http://www.w3.org/TR/REC-html40" xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="1.0" encoding="iso-8859-1" indent="yes"/>

    <xsl:template match="/">
        <html>     
            <head>  
                <title>Sitemap</title>
                <style>
                    body { font-family: Arial; font-size: 14x; padding: 20px;}
                    a { color: blue; text-decoration: none; }
                    a:hover { color: blue; text-decoration: underline; }
					table {border-collapse: collapse;}
					table, td, th {  padding: 5px 20px 5px 0px;}
					td, th {  border-bottom: 1px solid #ddd; }
					tr:nth-child(even) {background-color: #f2f2f2}
					tr:hover {background-color: #dddddd}
                </style>
            </head>

            <body>
                <h1>XML Sitemap by <a href="http://www.dev4me.nl/" target="_blank">Dev4Me</a></h1>        
                <xsl:call-template name="sitemapTable"/>
            </body>
        </html>
    </xsl:template>
  
    <xsl:template name="sitemapTable">
        <table cellspacing="0" cellpadding="3">
            <thead>
                <tr>
                    <th align="left">Page</th>
                    <th align="left">Last modification</th>
                    <th align="left">Change frequency</th>
                    <th align="left">Priority</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="sitemap:urlset/sitemap:url">
                    <xsl:sort select="sitemap:priority" order="descending"/>              
                </xsl:apply-templates>
            </tbody>
        </table><br />
        <strong>This sitemap has a total of <xsl:value-of select="count(sitemap:urlset/sitemap:url)"></xsl:value-of> pages</strong>
    </xsl:template>    
  
    <xsl:template match="sitemap:url">
        <tr>  
            <td>
                <xsl:variable name="sitemapURL"><xsl:value-of select="sitemap:loc"/></xsl:variable>  
                <a href="{$sitemapURL}" target="_blank"><xsl:value-of select="$sitemapURL"></xsl:value-of></a>
            </td>
            <td><xsl:value-of select="sitemap:lastmod"/></td>
            <td><xsl:value-of select="sitemap:changefreq"/></td>
            <td><xsl:value-of select="sitemap:priority"/></td>
        </tr>  
    </xsl:template>
</xsl:stylesheet>