const Publicacion = require('../models/Publicacion');
const Imagen = require('../models/Imagen');
const Etiqueta = require('../models/Etiqueta');
const PublicacionEtiqueta = require('../models/PublicacionEtiqueta');

const mostrarFormulario = (req, res) => {

    res.render('crearPublicacion');

};

const crearPublicacion = async (req, res) => {

    try {

        const publicacion = await Publicacion.create({

            titulo: req.body.titulo,
            descripcion: req.body.descripcion,
            usuarioId: req.session.usuarioId

        });

        await Imagen.create({

            ruta: req.file.filename,
            publicacionId: publicacion.id

        });

        if (req.body.etiquetas) {

            const etiquetas = req.body.etiquetas
                .split(',')
                .map(e => e.trim())
                .filter(e => e !== '');

            for (const nombreEtiqueta of etiquetas) {

                let etiqueta = await Etiqueta.findOne({
                    where: {
                        nombre: nombreEtiqueta
                    }
                });

                if (!etiqueta) {

                    etiqueta = await Etiqueta.create({
                        nombre: nombreEtiqueta
                    });

                }

                await PublicacionEtiqueta.create({

                    publicacionId: publicacion.id,
                    etiquetaId: etiqueta.id

                });

            }

        }

        res.redirect('/publicaciones');

    } catch (error) {

        console.error(error);

        res.send('Error al crear publicación');

    }

};

const listarPublicaciones = async (req, res) => {

    try {

        const publicaciones = await Publicacion.findAll({
            order: [['id', 'DESC']]
        });

        const imagenes = await Imagen.findAll();

        const relaciones = await PublicacionEtiqueta.findAll();

        const etiquetas = await Etiqueta.findAll();

        const Comentario = require('../models/Comentario');
        const Valoracion = require('../models/Valoracion');
        const valoraciones = await Valoracion.findAll();
        const estadisticasValoraciones = {};

for (const publicacion of publicaciones) {

    const votos = valoraciones.filter(
        valoracion =>
            valoracion.publicacionId === publicacion.id
    );

    const cantidad = votos.length;

    const suma = votos.reduce(
        (acum, voto) => acum + voto.puntaje,
        0
    );

    const promedio =
        cantidad > 0
            ? (suma / cantidad).toFixed(1)
            : 0;

    estadisticasValoraciones[publicacion.id] = {
        promedio,
        cantidad
    };

}

        const comentarios = await Comentario.findAll({
            order: [['id', 'DESC']]
        });

        res.render('publicaciones', {
            publicaciones,
            imagenes,
            relaciones,
            etiquetas,
            comentarios,
            valoraciones,
            estadisticasValoraciones
        });

    } catch (error) {

        console.error(error);

        res.send('Error al cargar publicaciones');

    }

};

module.exports = {
    mostrarFormulario,
    crearPublicacion,
    listarPublicaciones
};