<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h1 style="color:magenta;font-size:40px">Product List</h1>
          <ol style="color:Blue;line-height: 30px; font-size: 24px;">
          <xsl:for-each select="products/product">
            <li>
              <xsl:value-of select="productName"/>
            </li>
          </xsl:for-each>
          </ol>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>