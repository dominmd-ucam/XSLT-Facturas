```markdown
# Proyecto de Transformación XML a HTML con XSLT

## Descripción

Este proyecto está diseñado para transformar un archivo **XML** que contiene una factura electrónica en un archivo **HTML** que presenta los detalles de la factura en formato legible para el usuario. La transformación se realiza mediante un archivo **XSLT** que define cómo deben presentarse los datos del XML en el HTML. 

En este proyecto se utilizan tecnologías como **XML**, **XSLT**, y **PowerShell** para realizar la transformación de datos.

---

## Estructura del Proyecto

El proyecto tiene la siguiente estructura básica de archivos:

```
/factura.xml          # Archivo XML de entrada que contiene la factura
/transformacion.xslt  # Archivo XSLT que define cómo transformar el XML en HTML
/factura.html         # Archivo HTML de salida que contiene la factura transformada
README.md             # Este archivo con la explicación del proyecto
```

---

## ¿Cómo Funciona?

### 1. Archivo XML (`factura.xml`)

El archivo XML contiene los datos de la factura, como la información del emisor, receptor, los ítems de la factura y el total de la misma. Este archivo tiene una estructura jerárquica que organiza los datos de manera clara.

El archivo XML sigue un esquema estándar de factura electrónica en formato XML, donde se describen los datos básicos de la factura como el número de la misma, la fecha de emisión, los datos del emisor y receptor, y los detalles de los productos o servicios facturados.

### 2. Archivo XSLT (`transformacion.xslt`)

El archivo XSLT define la **transformación** de los datos del archivo XML a HTML. Este archivo XSLT extrae los datos del archivo XML y los organiza dentro de una estructura HTML, presentando la factura de una forma más comprensible para el usuario.

El XSLT está diseñado para:
- Extraer los datos de la factura, como el nombre del emisor, el número de la factura, los ítems y el total.
- Formatear estos datos en una página HTML utilizando etiquetas HTML estándar, como tablas para los ítems y párrafos para los detalles.

---

## ¿Cómo Ejecutar el Proyecto?

Para ejecutar este proyecto, sigue estos pasos:

1. **Tener los archivos listos:**
    - Asegúrate de tener los archivos **`factura.xml`**, **`transformacion.xslt`** y **`factura.html`** en la misma carpeta.

2. **Ejecutar la transformación con PowerShell:**

    - Abre **PowerShell** y navega a la carpeta donde se encuentran los archivos. Para cambiar de directorio en PowerShell, usa el comando `cd`:
    
      ```powershell
      cd "C:\Ruta\A\Tu\Carpeta"
      ```
      
    - Asegúrate de que tu política de ejecución de scripts permita ejecutar scripts de PowerShell. Si no está habilitada, ejecuta este comando para permitir la ejecución:
    
      ```powershell
      Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
      ```
      
    - Ahora, ejecuta los siguientes comandos en PowerShell para realizar la transformación. Estos comandos cargarán el archivo XML y el archivo XSLT, aplicarán la transformación y generarán el archivo **`factura.html`**:

      ```powershell
      $xmlPath = ".\factura.xml"  # Ruta al archivo XML
      $xsltPath = ".\transformacion.xslt"  # Ruta al archivo XSLT
      $outputPath = ".\factura.html"  # Ruta al archivo HTML de salida

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

3. **Resultado:**
    - Después de ejecutar los comandos, el archivo **`factura.html`** se generará con la factura transformada, mostrando la información de manera legible y bien estructurada.

---

## Contribuciones

Si tienes sugerencias o mejoras para el proyecto, no dudes en realizar un pull request. ¡Tu colaboración será bienvenida!
```
