from lxml import etree
from pathlib import Path

ruta_base = Path(__file__).parent
ruta_xml  = ruta_base.parent / "datos" / "objetos.xml"
ruta_xslt = ruta_base / "objetos.xslt"
ruta_html = ruta_base / "objetos.html"

xml  = etree.parse(str(ruta_xml))
xslt = etree.parse(str(ruta_xslt))

transformacion = etree.XSLT(xslt)
resultado = transformacion(xml)

with open(ruta_html, "wb") as f:
    f.write(etree.tostring(resultado, pretty_print=True, encoding="UTF-8", method="html"))

print("Conversión completada: objetos.html generado correctamente.")
