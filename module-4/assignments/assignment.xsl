<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <style>
        table{
            display: flex;
            justify-content: center;
            border-radius: 10px;
        }
        th{
            padding: 5px;
        }
        td{
            padding: 5px;
            background-color: lightgrey;
        }
        tr{
            background-color: aqua;
        }
        </style>
        <title>Catalog</title>
            <body>
            <!-- main title is "Catalog" -->
            <h1>Catalog</h1>
            <ul>
                <xsl:for-each select="catalog/product/catalog_item">
                <!-- use html list tag to display catalog -->
                    <li style="font-size: 22px">
                        <article>
                        <!-- render each item as `<article>` inside list item tag -->
                            Item Number: <xsl:value-of select="item_number"/><br/>
                            Price: <xsl:value-of select="price"/><br/>
                            Sizes: <br/>
                            
                            <xsl:for-each select="size">
                            <ul>
                                <li>
                                    <xsl:value-of select="@description"/> /  
                                    Colors:
                                    <xsl:for-each select="color_swatch">
                                        <xsl:value-of select="text()"/>.  
                                    </xsl:for-each>
                                </li>
                            </ul>
                            </xsl:for-each>
                        </article>
                    </li>
                </xsl:for-each>
            </ul>
            
            <!-- display product id as h3 -->
            <h3>Product ID: <xsl:value-of select="catalog/product/@product_id"/></h3>


            <!-- display product description as paragraph -->
            <p>Product description: <xsl:value-of select="catalog/product/@description"/></p>


             <!-- render table of catalog items with columns: item number, price, gender, small, medium, large, extra large -->
            <table border="1"> 
                    <tr> 
                        <th>Item number</th> 
                        <th>Price</th> 
                        <th>Gender</th> 
                        <th>Small</th> 
                        <th>Medium</th> 
                        <th>Large</th> 
                        <th>Extra large</th>
                    </tr> 
                   
                    <xsl:for-each select="catalog/product/catalog_item"> 
                        <tr> 
                            <td><xsl:value-of select="item_number"/></td> 
                            <td><xsl:value-of select="price"/></td> 
                            <!-- for gender column render M for Men, W for Women -->
                            <xsl:if test="@gender='Men'"><td>M</td></xsl:if>
                            <xsl:if test="@gender='Women'"><td>W</td></xsl:if>

                            <td>
                                <table border="1">
                                    <tr>
                                        <th>Color</th>
                                        <th>Image</th>
                                    </tr>
                                    <!-- inside size columns (small, medium, large, and extra large) display subtable with 2 columns: color and image -->
                                    <xsl:for-each select="size[@description='Small']/color_swatch">
                                        <tr>
                                            <td><xsl:value-of select="text()"/></td>
                                            <td><xsl:value-of select="@image"/></td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                            </td>

                            <td>
                                <table border="1">
                                    <tr>
                                        <th>Color</th>
                                        <th>Image</th>
                                    </tr>
                                    <xsl:for-each select="size[@description='Medium']/color_swatch">
                                        <tr>
                                            <td><xsl:value-of select="text()"/></td>
                                            <td><xsl:value-of select="@image"/></td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                            </td>
                           
                            <td>
                                <table border="1">
                                    <tr>
                                        <th>Color</th>
                                        <th>Image</th>
                                    </tr>
                                    <xsl:for-each select="size[@description='Large']/color_swatch">
                                        <tr>
                                            <td><xsl:value-of select="text()"/></td>
                                            <td><xsl:value-of select="@image"/></td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                            </td>
                            
                            <td>
                                <table border="1">
                                    <tr>
                                        <th>Color</th>
                                        <th>Image</th>
                                    </tr>
                                    <xsl:for-each select="size[@description='Extra Large']/color_swatch">
                                        <tr>
                                            <td><xsl:value-of select="text()"/></td>
                                            <td><xsl:value-of select="@image"/></td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                            </td>
                        </tr> 
                    </xsl:for-each> 
                </table> 
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet> 