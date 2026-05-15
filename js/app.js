async function cargarObjetos() {
    const contenedor = document.getElementById("contenedor-objetos");

    try {
        const respuesta = await fetch("objetos.json");

        if (!respuesta.ok) {
            throw new Error("No se pudo cargar el archivo JSON.");
        }

        const datos = await respuesta.json();

        const objetos = datos.objetos.objeto;

        contenedor.innerHTML = "";

        objetos.forEach((obj) => {
            const tarjeta = document.createElement("article");
            tarjeta.className = "tarjeta-objeto";

            const tipoCss = obj.tipo.toLowerCase();
            tarjeta.classList.add(`tipo-${tipoCss}`);

            tarjeta.innerHTML = `
                <div class="cabecera-tarjeta">
                    <span class="id-objeto">#${obj.id}</span>
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
        contenedor.innerHTML = `<p class="error">Error: ${error.message}</p>`;
    }
}

cargarObjetos();
