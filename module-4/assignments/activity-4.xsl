<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <style>
        table{
            border-radius: 10px;
        }
        th{
            padding: 10px;
        }
        td{
            padding: 10px;
            background-color: lightgrey;
        }
        </style>
            <body>
            <h1>Shippable Items</h1>
                <table border="1">
                    <tr>
                        <th>Product Name</th>
                        <th>Manufacturer id</th>
                        <th>Description</th>
                        <th>USD price</th>
                    </tr>
                    <xsl:for-each select="products/product">
                        <xsl:if test="@shippable='true'">
                            <tr>
                                <td>
                                    <xsl:value-of select="productName"/>
                                </td>
                                <td>
                                    <xsl:value-of select="manufacturer/@id"/>
                                </td>
                                <td>
                                    <xsl:value-of select="description"/>
                                </td>
                                <td>
                                    <xsl:value-of select="prices/price[1]"/>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
                <h1>Acme Items</h1>
                <table border="1">
                    <tr>
                        <th>Product Name</th>
                        <th>Description</th>
                        <th>USD price</th>
                        <th>Euro price</th>
                    </tr>
                    <xsl:for-each select="products/product">
                        <xsl:if test="manufacturer/@id='acme'">
                            <tr>
                                <td>
                                    <xsl:value-of select="productName"/>
                                </td>
                                <td>
                                    <xsl:value-of select="description"/>
                                </td>
                                <td>
                                    <xsl:value-of select="prices/price[1]"/>
                                </td>
                                <td>
                                    <xsl:value-of select="prices/price[3]"/>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet> 