const Publicacion = require('../models/Publicacion');
const Imagen = require('../models/Imagen');

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

        res.redirect('/publicaciones');

    } catch (error) {

        console.error(error);

        res.send('Error al crear publicación');

    }

};

const listarPublicaciones = async (req, res) => {

    try {

        const publicaciones = await Publicacion.findAll({

            order: [
                ['id', 'DESC']
            ]

        });

        const imagenes = await Imagen.findAll();

        res.render('publicaciones', {
            publicaciones,
            imagenes
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