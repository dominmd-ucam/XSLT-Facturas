<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fe="http://www.facturae.es/Facturae/2009/v3.2/Facturae">

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/">
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

                <!-- Datos del Emisor -->
                <h2>Datos del Emisor</h2>
                <p><strong>Empresa:</strong> 
                    <xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='LegalEntity']/*[local-name()='CorporateName']" />
                </p>
                <p><strong>NIF:</strong> 
                    <xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='TaxIdentification']/*[local-name()='TaxIdentificationNumber']" />
                </p>
                <p><strong>Dirección:</strong> 
                    <xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='LegalEntity']/*[local-name()='AddressInSpain']/*[local-name()='Address']" />, 
                    <xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='LegalEntity']/*[local-name()='AddressInSpain']/*[local-name()='Town']" />, 
                    <xsl:value-of select="//*[local-name()='SellerParty']/*[local-name()='LegalEntity']/*[local-name()='AddressInSpain']/*[local-name()='Province']" />
                </p>

                <!-- Datos del Receptor -->
                <h2>Datos del Receptor</h2>
                <p><strong>Nombre:</strong> 
                    <xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='Name']" /> 
                    <xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='Individual']/*[local-name()='FirstSurname']" />
                </p>
                <p><strong>NIF:</strong> 
                    <xsl:value-of select="//*[local-name()='BuyerParty']/*[local-name()='TaxIdentification']/*[local-name()='TaxIdentificationNumber']" />
                </p>

                <!-- Detalles de la Factura -->
                <h2>Detalles de la Factura</h2>
                <p><strong>Número:</strong> 
                    <xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='InvoiceHeader']/*[local-name()='InvoiceNumber']" />
                </p>
                <p><strong>Fecha de emisión:</strong> 
                    <xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='InvoiceIssueData']/*[local-name()='IssueDate']" />
                </p>

                <!-- Ítems -->
                <h2>Ítems</h2>
                <table>
                    <tr>
                        <th>Descripción</th>
                        <th>Cantidad</th>
                        <th>Precio Unitario</th>
                        <th>Importe Total</th>
                    </tr>
                    <xsl:for-each select="//*[local-name()='Invoice']/*[local-name()='Items']/*[local-name()='InvoiceLine']">
                        <tr>
                            <td><xsl:value-of select="//*[local-name()='ItemDescription']" /></td>
                            <td><xsl:value-of select="//*[local-name()='Quantity']" /></td>
                            <td><xsl:value-of select="//*[local-name()='UnitPriceWithoutTax']" /></td>
                            <td><xsl:value-of select="//*[local-name()='TotalCost']" /></td>
                        </tr>
                    </xsl:for-each>
                </table>

                <!-- Total -->
                <h2>Total</h2>
                <p><strong>Total Factura:</strong> 
                    <xsl:value-of select="//*[local-name()='Invoice']/*[local-name()='InvoiceTotals']/*[local-name()='InvoiceTotal']" /> EUR
                </p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
