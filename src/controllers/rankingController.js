const Publicacion = require('../models/Publicacion');
const Valoracion = require('../models/Valoracion');

const mostrarRanking = async (req, res) => {

    try {

        const publicaciones = await Publicacion.findAll();

        const valoraciones = await Valoracion.findAll();

        const ranking = [];

        for (const publicacion of publicaciones) {

            const votos = valoraciones.filter(
                valoracion =>
                    valoracion.publicacionId ===
                    publicacion.id
            );

            const cantidad = votos.length;

            const suma = votos.reduce(
                (acum, voto) =>
                    acum + voto.puntaje,
                0
            );

            const promedio =
                cantidad > 0
                    ? suma / cantidad
                    : 0;

            ranking.push({

                publicacion,
                promedio,
                cantidad

            });

        }

        ranking.sort(
            (a, b) =>
                b.promedio - a.promedio
        );

        res.render('ranking', {
            ranking
        });

    } catch (error) {

        console.error(error);

        res.send('Error al cargar ranking');

    }

};

module.exports = {
    mostrarRanking
};