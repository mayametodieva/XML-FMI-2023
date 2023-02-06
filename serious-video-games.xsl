<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method = "xml" indent = "yes"/>

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="default-page" page-height="10.6in" page-width="8.5in" margin-left="0.8in" margin-right="0.8in" margin-top="0.7in" margin-bottom="0.7in">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="default-page">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block>
                        <fo:block text-align="center">
                            <fo:block padding-bottom="5mm">
                                <fo:inline font-size="25pt" font-weight="bold" color="#759AC9" background-color="#FFFFFF">
                                    <xsl:text>Serious Video Games Journal</xsl:text>
                                </fo:inline>
                            </fo:block>
                        </fo:block>

                        <!-- Genres -->
                        <fo:block text-align="center">
                            <fo:inline font-size="21pt" font-weight="bold" color="#3B577C">
                                <xsl:text>Genres</xsl:text>
                            </fo:inline>
                        </fo:block>
                        <fo:block>
                            <xsl:apply-templates select="catalogue/genres/genre"/>
                        </fo:block>
                        
                        <!-- Sectors -->
                        <fo:block page-break-before="always" text-align="center" padding-bottom="5mm">
                            <fo:inline font-size="21pt" font-weight="bold" color="#3B577C">
                                <xsl:text>Sectors</xsl:text>
                            </fo:inline>
                        </fo:block>
                        <fo:block>
                            <xsl:apply-templates select="catalogue/sectors/sector"/>
                        </fo:block>

                        <!-- Games -->
                        <fo:block page-break-before="always" text-align="center" padding-bottom="5mm">
                            <fo:inline font-size="21pt" font-weight="bold" color="#3B577C">
                                <xsl:text>3. Games</xsl:text>
                            </fo:inline>
                        </fo:block>
                        <fo:block>
                            <xsl:apply-templates select="//game"/>
                        </fo:block>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <!-- Genres Template -->
    <xsl:template match="catalogue/genres/genre">
        <fo:block keep-together.within-column="always">
            <fo:block margin-top="10pt">
                <fo:external-graphic background="transparent" padding-bottom="7.1mm" width="100%" height="40mm" content-width="scale-to-fit" content-height="scale-to-fit" scaling="non-uniform" src="{unparsed-entity-uri(image/@source)}"/>
            </fo:block>
            <fo:block padding-bottom="10mm" padding-left="25mm"  text-align="justify">
                <fo:inline font-weight="bold" color="#000000">
                    <xsl:text>Description:</xsl:text>
                </fo:inline>
                <fo:inline font-size="12pt" color="#000000">
                    <xsl:value-of select="description"/>
                </fo:inline>
            </fo:block>
        </fo:block>
    </xsl:template>

    <!-- Sectors Template -->
    <xsl:template match="catalogue/sectors/sector">
        <fo:block keep-together.within-column="always">
            <fo:block margin-top="10pt">
                <fo:external-graphic background="transparent" padding-bottom="7.1mm" width="100%" height="40mm" content-width="scale-to-fit" content-height="scale-to-fit" scaling="non-uniform" src="{unparsed-entity-uri(image/@source)}"/>
            </fo:block>
            <fo:block padding-bottom="10mm" padding-left="25mm" text-align="justify">
                <fo:inline font-weight="bold" color="#000000">
                    <xsl:text>Description:</xsl:text>
                </fo:inline>
                <fo:inline font-size="12pt" color="#000000">
                    <xsl:value-of select="description"/>
                </fo:inline>
            </fo:block>
        </fo:block>
    </xsl:template>


    <!-- Games Template -->
    <xsl:template match="game">
        <fo:block keep-together.within-column="always">

            <!-- Title -->
            <fo:block padding="2pt" display-align="center">
                <fo:block text-align="center">
                        <fo:inline font-size="14.5pt" font-weight="bold" color="#000000">
                            <xsl:value-of select="@title"/>
                        </fo:inline>
                </fo:block>
            </fo:block>
                
            <!-- IMAGE LOGO -->
            <fo:block padding="2pt" display-align="center">
                <fo:block text-align="center">
                    <fo:external-graphic background="transparent" width="250px" height="110px" content-width="scale-to-fit" content-height="scale-to-fit" scaling="non-uniform" src="{unparsed-entity-uri(about/@logo)}" display-align="center" />
                </fo:block>
            </fo:block>
                    
            <!-- ABOUT INFORMATION -->
            <fo:block padding="8pt" border-style="solid" border-width="1pt" display-align="center" border-bottom="none">
                <fo:block text-align="justify">
                    <fo:inline font-weight="bold" color="#000000">
                        <xsl:text>Website:</xsl:text>
                    </fo:inline>
                    <fo:inline color="#5ec1ff">
                        <xsl:value-of select="about/@website"/>
                    </fo:inline>
                </fo:block>
                <fo:block text-align="justify">
                    <fo:inline font-weight="bold" color="#000000">
                        <xsl:text>Sector:</xsl:text>
                    </fo:inline>
                    <xsl:for-each select="//sector[contains(current()/about/@sectors, @id)]">
                        <fo:inline>
                            <xsl:value-of select="@title"/>
                        </fo:inline>
                    </xsl:for-each>
                </fo:block>
                <fo:block text-align="justify">
                    <fo:inline font-weight="bold" color="#000000">
                        <xsl:text>Genre:</xsl:text>
                    </fo:inline>
                    <xsl:for-each select="//genre[contains(current()/about/@genres, @id)]">
                        <fo:inline>
                            <xsl:value-of select="@title"/>
                        </fo:inline>
                    </xsl:for-each>
                </fo:block>
                <fo:block color="#000000">
                    <fo:inline font-weight="bold">
                        <xsl:text>Release Date:</xsl:text>
                    </fo:inline>
                    <fo:inline>
                        <xsl:value-of select="about/@releaseDate"/>
                    </fo:inline>
                </fo:block>
                <fo:block>
                    <fo:inline font-weight="bold">
                        <xsl:text>Supported languages:</xsl:text>
                    </fo:inline>
                    <fo:inline font-size="12pt" font-weight="normal">
                        <xsl:value-of select="about/supportedLanguages"/>
                    </fo:inline>
                </fo:block>
                <fo:block>
                    <fo:external-graphic width="120pt" content-width="scale-to-fit" height="60pt" content-height="scale-to-fit" scaling="non-uniform" src="url(images/content_rating/{about/@contentRating}.jpg)"/>
                </fo:block>
            </fo:block>

            <!-- Description -->
            <fo:block border-style="solid" border-width="1pt" padding="8pt" display-align="center">
                <fo:block color="#000000" text-align="justify">
                    <fo:inline font-weight="bold">
                        <xsl:text>Description:</xsl:text>
                    </fo:inline>
                    <fo:inline font-size="12pt" font-weight="normal">
                        <xsl:value-of select="description"/>
                    </fo:inline>
                </fo:block>
            </fo:block>
        </fo:block>     

        <!-- System Requirements -->
        <fo:block margin-top="9pt" padding="8pt" border-style="solid" border-width="1pt" keep-together.within-column="always">
            <fo:block padding-top="1mm" padding-bottom="3mm" text-align="center">
                <fo:inline font-weight="bold">System Requirements</fo:inline>
            </fo:block>
            <fo:table>
                <fo:table-column column-width="50%"/>
                <fo:table-column column-width="50%"/>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border-style="solid" border-width="1pt" font-size="11pt" font-weight="bold" padding="2mm" border-right="none" color="#FFFFFF" background-color="#EB3E3E">
                            <fo:block>Minimum</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border-style="solid" border-width="1pt" font-size="11pt" font-weight="bold" padding="2mm" color="#FFFFFF" background-color="#02AAFD">
                            <fo:block>Recommended</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border-style="solid" border-width="1pt" border-right="none" border-top="none" padding="2mm" font-size="9.5pt">
                            <fo:block>
                                <xsl:value-of select="requirements/minimum/os"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border-style="solid" border-width="1pt" border-top="none" padding="2mm" font-size="9.5pt" >
                            <fo:block>
                                <xsl:value-of select="requirements/recommended/os"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border-style="solid" border-width="1pt" border-right="none" border-top="none" padding="2mm" font-size="9.5pt">
                            <fo:block>
                                <xsl:value-of select="requirements/minimum/processor"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border-style="solid" border-width="1pt" border-top="none" padding="2mm" font-size="9.5pt" >
                            <fo:block>    
                                <xsl:value-of select="requirements/recommended/processor"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border-style="solid" border-width="1pt" border-right="none" border-top="none" padding="2mm" font-size="9.5pt">
                            <fo:block>   
                                <xsl:value-of select="requirements/minimum/memory"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border-style="solid" border-width="1pt" border-top="none" padding="2mm" font-size="9.5pt">
                            <fo:block>
                                <xsl:value-of select="requirements/recommended/memory"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border-style="solid" border-width="1pt" border-right="none" border-top="none" padding="2mm" font-size="9.5pt">
                            <fo:block>
                                <xsl:value-of select="requirements/minimum/graphics"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border-style="solid" border-width="1pt" border-top="none" padding="2mm" font-size="9.5pt">
                            <fo:block>
                                <xsl:value-of select="requirements/recommended/graphics"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border-style="solid" border-width="1pt" border-right="none" border-top="none" padding="2mm" font-size="9.5pt">
                            <fo:block>
                                <xsl:value-of select="requirements/minimum/storage"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border-style="solid" border-width="1pt" border-top="none" padding="2mm" font-size="9.5pt">
                            <fo:block>
                                <xsl:value-of select="requirements/recommended/storage"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>

        <!-- Gallery Page -->
        <fo:block keep-together.within-column="always">   
            <!-- Logo -->
            <fo:block padding="2pt" display-align="center">
                <fo:block text-align="center">
                    <fo:external-graphic width="250px" height="110px" content-width="scale-to-fit" content-height="scale-to-fit" scaling="non-uniform" src="{unparsed-entity-uri(about/@logo)}" display-align="center"/>
                </fo:block>
            </fo:block>

            <!-- Gallery -->
            <fo:block>
                <fo:table border-style="solid" border-width="1pt">
                    <fo:table-column column-width="50%"/>
                    <fo:table-column column-width="50%"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell text-align="center" padding-top="0.5mm">
                                <fo:block text-align="center">
                                    <fo:external-graphic width="240px" content-width="scale-to-fit" height="230px" content-height="scale-to-fit" scaling="non-uniform" src="{unparsed-entity-uri(gallery/image[position() = 1]/@source)}" display-align="center" />
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell text-align="center">
                                <fo:block text-align="center" padding-top="0.5mm">
                                    <fo:external-graphic width="240px" content-width="scale-to-fit" height="230px" content-height="scale-to-fit" scaling="non-uniform" src="{unparsed-entity-uri(gallery/image[position() = 2]/@source)}" display-align="center" />
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell text-align="center">
                                <fo:block text-align="center">
                                    <fo:external-graphic width="240px" content-width="scale-to-fit" height="230px" content-height="scale-to-fit" scaling="non-uniform" src="{unparsed-entity-uri(gallery/image[position() = 3]/@source)}" display-align="center" />
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell text-align="center">
                                <fo:block text-align="center">
                                    <fo:external-graphic width="240px" content-width="scale-to-fit" height="230px" content-height="scale-to-fit" scaling="non-uniform" src="{unparsed-entity-uri(gallery/image[position() = 4]/@source)}" display-align="center" />
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:block>
    </xsl:template>
</xsl:stylesheet>