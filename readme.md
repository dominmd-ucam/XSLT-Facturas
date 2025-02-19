Aquí tienes un archivo `README.md` adecuado para subir a GitHub:

```markdown
# Proyecto de Transformación de Facturas XML a HTML

Este proyecto tiene como objetivo la transformación de archivos XML de facturas en formato HTML utilizando archivos XSLT. Los archivos XSLT permiten personalizar la estructura del HTML de salida a partir de los datos del XML.

## Estructura del Proyecto

La estructura de archivos en el proyecto es la siguiente:

```
/factura.xml
/factura1.xml
/transformacion.xslt
/transformacion1.xslt
/factura.html
/factura1.html
/index.html
/README.md
```

- **factura.xml**: Archivo XML de la primera factura.
- **factura1.xml**: Archivo XML de la segunda factura.
- **transformacion.xslt**: XSLT utilizado para transformar el primer archivo XML en HTML.
- **transformacion1.xslt**: XSLT utilizado para transformar el segundo archivo XML en HTML.
- **factura.html**: Resultado de la transformación de **factura.xml**.
- **factura1.html**: Resultado de la transformación de **factura1.xml**.
- **index.html**: Página de inicio con enlaces a los archivos del proyecto.
- **README.md**: Este archivo con la documentación del proyecto.

## Facturas

### FACTURA FLORES:

- **XML**: Archivo que contiene los datos de la factura en formato XML.
- **XSLT**: Plantilla XSLT utilizada para transformar el archivo XML a HTML.
- **HTML**: Resultado de la transformación, visualización de la factura en formato HTML.

### FACTURA MOVILES:

- **XML**: Archivo que contiene los datos de la factura en formato XML.
- **XSLT**: Plantilla XSLT utilizada para transformar el archivo XML a HTML.
- **HTML**: Resultado de la transformación, visualización de la factura en formato HTML.

## Ejecutar la Transformación con PowerShell

Sigue estos pasos para ejecutar la transformación en PowerShell:

1. Abre PowerShell.
2. Navega a la carpeta donde se encuentran los archivos del proyecto.
   
   ```powershell
   cd "ruta/a/tu/proyecto"
   ```

3. Ejecuta el siguiente comando para transformar el archivo `factura.xml` con `transformacion.xslt` y generar el archivo `factura.html`:

   ```powershell
   $xmlPath = ".\factura.xml"  # Archivo XML
   $xsltPath = ".\transformacion.xslt"  # Archivo XSLT
   $outputPath = ".\factura.html"  # Archivo de salida HTML

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

   # Cerrar el escritor
   $writer.Close()

   Write-Host "Transformación completada. El archivo HTML se ha guardado en: $outputPath"
   ```

4. Repite el mismo proceso para el archivo `factura1.xml` con su correspondiente archivo `transformacion1.xslt`.

## Ver el Proyecto

Para ver el proyecto en acción, abre el archivo `index.html` en tu navegador. Este archivo contiene enlaces a las facturas transformadas y los archivos fuente.

### Enlaces en `index.html`:

- **Factura Flores**: Enlace a la transformación de la primera factura.
- **Factura Móviles**: Enlace a la transformación de la segunda factura.
- **Ver los archivos fuente**: Enlaces a los archivos XML y XSLT de ambos ejemplos.

## Contribuciones

Si deseas contribuir a este proyecto, realiza un fork del repositorio y envía tus mejoras o correcciones a través de un pull request.

## Licencia

Este proyecto se distribuye bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.
```

Este archivo `README.md` proporciona una visión general de tu proyecto, instrucciones claras para ejecutar la transformación, así como una estructura organizada para que otros puedan ver el código y los resultados.
