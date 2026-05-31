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

        res.render('publicaciones', {
            publicaciones,
            imagenes,
            relaciones,
            etiquetas
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