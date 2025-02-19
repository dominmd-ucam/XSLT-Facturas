<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fe="http://www.facturae.es/Facturae/2009/v3.2/Facturae">
    
    <xsl:output method="html" indent="yes" />
    
    <xsl:template match="/fe:Invoice">
        <html>
            <head>
                <title>Factura Electrónica</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    h1, h2 { color: #333; }
                    table { width: 100%; border-collapse: collapse; margin-top: 10px; }
                    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                    th { background-color: #f4f4f4; }
                </style>
            </head>
            <body>
                <h1>Factura Electrónica</h1>
                
                <h2>Datos del Emisor</h2>
                <p><strong>Empresa:</strong> <xsl:value-of select="fe:SellerParty/fe:LegalEntity/fe:CorporateName" /></p>
                <p><strong>NIF:</strong> <xsl:value-of select="fe:SellerParty/fe:TaxIdentification/fe:TaxIdentificationNumber" /></p>
                <p><strong>Dirección:</strong> 
                    <xsl:value-of select="fe:SellerParty/fe:LegalEntity/fe:AddressInSpain/fe:Address" />, 
                    <xsl:value-of select="fe:SellerParty/fe:LegalEntity/fe:AddressInSpain/fe:Town" />, 
                    <xsl:value-of select="fe:SellerParty/fe:LegalEntity/fe:AddressInSpain/fe:Province" />
                </p>
                
                <h2>Datos del Receptor</h2>
                <p><strong>Nombre:</strong> 
                    <xsl:value-of select="fe:BuyerParty/fe:Individual/fe:Name" /> 
                    <xsl:value-of select="fe:BuyerParty/fe:Individual/fe:FirstSurname" />
                </p>
                <p><strong>NIF:</strong> <xsl:value-of select="fe:BuyerParty/fe:TaxIdentification/fe:TaxIdentificationNumber" /></p>
                
                <h2>Detalles de la Factura</h2>
                <p><strong>Número:</strong> <xsl:value-of select="fe:InvoiceHeader/fe:InvoiceNumber" /></p>
                <p><strong>Fecha de emisión:</strong> <xsl:value-of select="fe:InvoiceHeader/fe:InvoiceIssueData/fe:IssueDate" /></p>
                
                <h2>Ítems</h2>
                <table>
                    <tr>
                        <th>Descripción</th>
                        <th>Cantidad</th>
                        <th>Precio Unitario</th>
                        <th>Importe Total</th>
                    </tr>
                    <xsl:for-each select="fe:Items/fe:InvoiceLine">
                        <tr>
                            <td><xsl:value-of select="fe:ItemDescription" /></td>
                            <td><xsl:value-of select="fe:Quantity" /></td>
                            <td><xsl:value-of select="fe:UnitPriceWithoutTax" /></td>
                            <td><xsl:value-of select="fe:TotalCost" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <h2>Total</h2>
                <p><strong>Total Factura:</strong> <xsl:value-of select="fe:InvoiceTotals/fe:InvoiceTotal" /> EUR</p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
