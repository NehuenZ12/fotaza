const Comentario = require('../models/Comentario');
const Publicacion = require('../models/Publicacion');
const Usuario = require('../models/Usuario');
const Notificacion = require('../models/Notificacion');

const crearComentario = async (req, res) => {

    try {

        const publicacion =
            await Publicacion.findByPk(
                req.params.id
            );

        if (!publicacion) {

            return res.redirect(
                '/publicaciones'
            );

        }

        if (
            !publicacion.comentariosAbiertos
        ) {

            return res.redirect(
                '/publicaciones'
            );

        }

        await Comentario.create({

            texto: req.body.texto,
            usuarioId: req.session.usuarioId,
            publicacionId: req.params.id

        });

        if (
            publicacion.usuarioId !==
            req.session.usuarioId
        ) {

            const usuario =
                await Usuario.findByPk(
                    req.session.usuarioId
                );

            await Notificacion.create({

                mensaje:
                    usuario.nombre +
                    ' comentó tu publicación',

                usuarioId:
                    publicacion.usuarioId

            });

        }

        res.redirect('/publicaciones');

    } catch (error) {

        console.error(error);

        res.send('Error al crear comentario');

    }

};

module.exports = {
    crearComentario
};