<?xml version="1.0" encoding="UTF-8"?>
<!--
	Protea.xsl
	Created by Matthew Routley on 2007-10-08.
	Copyright (c) 2007 Information Consultant. All rights reserved.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output encoding="UTF-8" indent="yes" method="text"/>
  <xsl:template match="protea">
    <xsl:apply-templates select="tree"/>
  </xsl:template>
  <xsl:template match="tree">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="internode">
    <xsl:call-template name="basic"/>
<xsl:value-of select="./@length"/>
<xsl:call-template name="delim"/>
<xsl:value-of select="./@bottom"/>
<xsl:call-template name="delim"/>
<xsl:value-of select="./@top"/>
  </xsl:template>
  <xsl:template match="branch">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="bud">
    <xsl:call-template name="basic"/>
    <xsl:value-of select="./@type"/>
  </xsl:template>
  <xsl:template match="inflorescence">
    <xsl:call-template name="basic"/>
    <xsl:value-of select="name()"/>
  </xsl:template>
  <xsl:template name="basic">
    <xsl:value-of select="ancestor::tree/attribute::population"/>
    <xsl:call-template name="delim"/>
    <xsl:value-of select="ancestor::tree/attribute::id"/>
    <xsl:call-template name="delim"/>
    <xsl:call-template name="indent"/>
  </xsl:template>
  <xsl:template name="indent">
    <xsl:if test="parent::branch/attribute::level=1">
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
    </xsl:if>
    <xsl:if test="parent::branch/attribute::level=2">
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
    </xsl:if>
    <xsl:if test="parent::branch/attribute::level=3">
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
    </xsl:if>
    <xsl:if test="parent::branch/attribute::level=4">
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
    </xsl:if>
    <xsl:if test="parent::branch/attribute::level=5">
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
    </xsl:if>
    <xsl:if test="parent::branch/attribute::level=6">
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
      <xsl:call-template name="delim"/>
    </xsl:if>
  </xsl:template>
  <xsl:template name="newline">
  </xsl:template>
  <xsl:template name="delim">
    <xsl:text>	</xsl:text>
  </xsl:template>
</xsl:stylesheet>
