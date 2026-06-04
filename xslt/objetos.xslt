<?xml version="1.0" encoding="UTF-8"?>

<!--
    Hoja de estilos XSLT.
    Transforma el documento XML de objetos de The Binding of Isaac en HTML.
-->
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!--
        Indicamos que la salida será HTML con codificación UTF-8.
    -->
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <!--
        Plantilla principal: se aplica desde la raíz del documento.
    -->
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>The Binding of Isaac - Objetos</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #1a1a2e;
                        color: #e0e0e0;
                        margin: 0;
                        padding: 2rem;
                    }
                    h1 {
                        text-align: center;
                        color: #c0392b;
                        font-size: 2rem;
                        margin-bottom: 1.5rem;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        background-color: #16213e;
                    }
                    th {
                        background-color: #c0392b;
                        color: white;
                        padding: 0.75rem 1rem;
                        text-align: left;
                    }
                    td {
                        padding: 0.65rem 1rem;
                        border-bottom: 1px solid #2d2d4e;
                    }
                    tr:hover td {
                        background-color: #0f3460;
                    }
                    .tipo-pasivo  { color: #5dade2; font-weight: bold; }
                    .tipo-activo  { color: #f39c12; font-weight: bold; }
                    .tipo-familiar { color: #2ecc71; font-weight: bold; }
                </style>
            </head>
            <body>
                <h1>The Binding of Isaac — Listado de objetos</h1>

                <table>
                    <!-- Cabecera de la tabla -->
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Descripción</th>
                        <th>Stat afectado</th>
                        <th>Valor</th>
                        <th>Desbloqueado</th>
                    </tr>

                    <!-- Recorremos cada nodo <objeto> dentro de <objetos> -->
                    <xsl:for-each select="objetos/objeto">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td><xsl:value-of select="nombre"/></td>
                            <td>
                                <!-- Aplicamos clase CSS según el tipo -->
                                <xsl:choose>
                                    <xsl:when test="tipo = 'Pasivo'">
                                        <span class="tipo-pasivo"><xsl:value-of select="tipo"/></span>
                                    </xsl:when>
                                    <xsl:when test="tipo = 'Activo'">
                                        <span class="tipo-activo"><xsl:value-of select="tipo"/></span>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <span class="tipo-familiar"><xsl:value-of select="tipo"/></span>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td><xsl:value-of select="descripcion"/></td>
                            <td><xsl:value-of select="efecto/stat"/></td>
                            <td><xsl:value-of select="efecto/valor"/></td>
                            <td><xsl:value-of select="desbloqueado"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
