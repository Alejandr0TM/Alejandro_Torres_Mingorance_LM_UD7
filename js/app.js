/**
 * Carga el archivo objetos.json y muestra su contenido en la página
 * como tarjetas individuales por cada objeto del juego.
 */
async function cargarObjetos() {
    const contenedor = document.getElementById("contenedor-objetos");

    try {
        // Solicita el archivo JSON
        const respuesta = await fetch("objetos.json");

        // Comprueba si la respuesta ha sido correcta
        if (!respuesta.ok) {
            throw new Error("No se pudo cargar el archivo JSON.");
        }

        // Convierte la respuesta a objeto JavaScript
        const datos = await respuesta.json();

        // Extrae la lista de objetos
        const objetos = datos.objetos.objeto;

        // Borra el mensaje de carga inicial
        contenedor.innerHTML = "";

        // Recorre todos los objetos y crea una tarjeta para cada uno
        objetos.forEach((obj) => {
            const tarjeta = document.createElement("article");
            tarjeta.className = "tarjeta-objeto";

            // Añade clase de color según el tipo
            const tipoCss = obj.tipo.toLowerCase();
            tarjeta.classList.add(`tipo-${tipoCss}`);

            tarjeta.innerHTML = `
                <div class="cabecera-tarjeta">
                    <span class="id-objeto">#${obj["@id"]}</span>
                    <span class="badge-tipo">${obj.tipo}</span>
                </div>
                <h2>${obj.nombre}</h2>
                <p class="descripcion">${obj.descripcion}</p>
                <div class="efecto">
                    <span class="stat">${obj.efecto.stat}</span>
                    <span class="valor">${obj.efecto.valor}</span>
                </div>
            `;

            contenedor.appendChild(tarjeta);
        });

    } catch (error) {
        // Muestra un mensaje si ocurre algún error
        contenedor.innerHTML = `<p class="error">Error: ${error.message}</p>`;
    }
}

// Ejecuta la función principal al cargar la página
cargarObjetos();
