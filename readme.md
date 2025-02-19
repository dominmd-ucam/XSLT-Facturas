# Proyecto de Transformación de Facturas XML a XHTML

Este proyecto permite transformar facturas en formato XML a documentos XHTML, validando y aplicando transformaciones mediante XSLT. Se utiliza PowerShell para ejecutar el proceso de conversión.

## Requisitos

Para ejecutar este proyecto, asegúrese de contar con:
- Windows PowerShell
- Archivos XML con facturas
- Un archivo XSLT para la transformación

## Estructura del Proyecto

```
/proyecto-transformacion
|-- factura.xml             # Archivo XML de entrada
|-- transformacion.xslt     # Archivo XSLT para la transformación
|-- factura.html            # Archivo de salida generado (XHTML)
|-- script.ps1              # Script PowerShell para ejecutar la transformación
```

## Script de Transformación

El siguiente script de PowerShell permite cargar un archivo XML y aplicarle una transformación XSLT para generar una salida XHTML:

```powershell
# Definir rutas a los archivos (rutas relativas)
$xmlPath = ".\factura.xml"  # Archivo XML en la misma carpeta
$xsltPath = ".\transformacion.xslt"  # Archivo XSLT en la misma carpeta
$outputPath = ".\factura.html"  # Archivo de salida en la misma carpeta

# Cargar el archivo XML
$xml = New-Object System.Xml.XmlDocument
$xml.Load($xmlPath)

# Cargar el archivo XSLT
$xslt = New-Object System.Xml.Xsl.XslCompiledTransform
$xslt.Load($xsltPath)

# Crear un escritor para el archivo de salida
$writer = New-Object System.IO.StreamWriter($outputPath)

# Aplicar la transformación XSLT al XML
$xslt.Transform($xml, $null, $writer)
$writer.Close()

Write-Host "Transformación completada. Archivo generado en $outputPath"
```

## Uso

1. Coloque los archivos `factura.xml` y `transformacion.xslt` en la misma carpeta que el script PowerShell.
2. Ejecute el script `script.ps1` en PowerShell.
3. Se generará un archivo `factura.html` con la versión transformada en XHTML.

## Notas
- Asegúrese de que los archivos XML y XSLT sean válidos antes de ejecutar la transformación.
- Puede modificar `transformacion.xslt` para personalizar el formato de salida según sus necesidades.

## Licencia
Este proyecto es de uso libre y puede ser modificado según sea necesario.

