const Comentario = require('../models/Comentario');

const crearComentario = async (req, res) => {

    try {

        await Comentario.create({

            texto: req.body.texto,
            usuarioId: req.session.usuarioId,
            publicacionId: req.params.id

        });

        res.redirect('/publicaciones');

    } catch (error) {

        console.error(error);

        res.send('Error al crear comentario');

    }

};

module.exports = {
    crearComentario
};