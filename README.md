# Práctica UD7 - Conversión y adaptación de documentos

**Módulo:** Lenguajes de Marcas  
**Temática:** The Binding of Isaac — objetos del juego

---

## Descripción

Este proyecto trabaja con un conjunto de datos sobre objetos del videojuego **The Binding of Isaac**. Cada objeto incluye su nombre, ID, tipo (Pasivo, Activo o Familiar), descripción, stat afectado, valor del efecto y si está desbloqueado.

El proyecto parte de un archivo **XML** como fuente de datos original y realiza las siguientes transformaciones:

---

## Estructura del proyecto

```
datos/
    objetos.xml       → Datos originales en XML
    objetos.json      → Conversión automática a JSON (generado por xml2json.py)
    xml2json.py       → Script Python que convierte el XML a JSON

xslt/
    objetos.xslt      → Hoja de estilos XSLT
    xml2html.py       → Script Python que aplica la transformación XSLT
    objetos.html      → HTML generado automáticamente a partir del XML

js/
    index.html        → Página web principal
    app.js            → Script JavaScript que carga y muestra los datos
    styles.css        → Hoja de estilos CSS
    objetos.json      → Copia del JSON usada por JavaScript
```

---

## Partes realizadas

### 1. Datos originales (XML)
El archivo `datos/objetos.xml` contiene 10 objetos del juego con estructura anidada (cada objeto tiene un subelemento `<efecto>` con `<stat>` y `<valor>`).

### 2. Conversión XML → JSON
El script `datos/xml2json.py` usa la biblioteca **xmltodict** para leer el XML y convertirlo automáticamente a JSON. El resultado se guarda en `datos/objetos.json`.

### 3. Transformación XML → HTML mediante XSLT
La hoja `xslt/objetos.xslt` define una tabla HTML estilizada con colores según el tipo de objeto. El script `xslt/xml2html.py` usa **lxml** para aplicar la transformación y generar `xslt/objetos.html`.

### 4. Generación de HTML desde JSON con JavaScript
La carpeta `js/` contiene una página web dinámica. El script `app.js` usa `fetch()` para cargar `objetos.json` y genera tarjetas HTML para cada objeto, con estilos en `styles.css`.

---

## Entorno virtual y dependencias

Desde la raíz del proyecto:

```bash
python3 -m venv venv
source venv/bin/activate      # En Windows: venv\Scripts\activate
pip install xmltodict lxml
```

Para ejecutar los scripts:

```bash
python datos/xml2json.py
python xslt/xml2html.py
```

Para la parte de JavaScript, abre `js/index.html` con un servidor local (por ejemplo con la extensión **Live Server** de VS Code), ya que `fetch()` requiere HTTP.
