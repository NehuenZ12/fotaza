const Publicacion = require('../models/Publicacion');

const mostrarFormulario = (req, res) => {

    res.render('crearPublicacion');

};

const crearPublicacion = async (req, res) => {

    try {

        await Publicacion.create({

            titulo: req.body.titulo,
            descripcion: req.body.descripcion,

            usuarioId: req.session.usuarioId

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

        res.render('publicaciones', {
            publicaciones
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