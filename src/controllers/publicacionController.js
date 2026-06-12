const Publicacion = require('../models/Publicacion');
const Imagen = require('../models/Imagen');
const Etiqueta = require('../models/Etiqueta');
const PublicacionEtiqueta = require('../models/PublicacionEtiqueta');
const Coleccion = require('../models/Coleccion');
const Usuario = require('../models/Usuario');
const cloudinary = require('../config/cloudinary');

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

    for (const archivo of req.files) {

        await Imagen.create({

        ruta: archivo.filename,
        publicacionId: publicacion.id,
        licencia: req.body.licencia,
        marcaagua: req.body.marcaAgua

    });

}

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
            where: {
                activa : true
            },

            order: [['id', 'DESC']]
        });

        const imagenes = await Imagen.findAll();

        const relaciones = await PublicacionEtiqueta.findAll();

        const etiquetas = await Etiqueta.findAll();

        let colecciones = [];

        if (req.session.usuarioId) {

            colecciones =
                await Coleccion.findAll({

                    where: {
                        usuarioId:
                            req.session.usuarioId
                    }

                });

        }
          
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

        const publicacionesOrdenadas =
    [...publicaciones].sort((a, b) => {

        const estadisticaA =
            estadisticasValoraciones[a.id];

        const estadisticaB =
            estadisticasValoraciones[b.id];

        const destacadaA =
            estadisticaA.promedio >= 4 &&
            estadisticaA.cantidad >= 3;

        const destacadaB =
            estadisticaB.promedio >= 4 &&
            estadisticaB.cantidad >= 3;

        if (
            destacadaA &&
            !destacadaB
        ) {
            return -1;
        }

        if (
            !destacadaA &&
            destacadaB
        ) {
            return 1;
        }

        return b.id - a.id;

    });

        const comentarios = await Comentario.findAll({
            order: [['id', 'DESC']]
        });

        const usuarios = await Usuario.findAll();

        res.render('publicaciones', {
            publicaciones: publicacionesOrdenadas,
            imagenes,
            relaciones,
            etiquetas,
            comentarios,
            usuarios,
            valoraciones,
            estadisticasValoraciones,
            colecciones,
            usuarioId: req.session.usuarioId
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