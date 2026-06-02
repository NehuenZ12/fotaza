const Publicacion =
    require('../models/Publicacion');

const Usuario =
    require('../models/Usuario');

const Notificacion =
    require('../models/Notificacion');

const mostrarInteres =
    async (req, res) => {

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
                publicacion.usuarioId ===
                req.session.usuarioId
            ) {

                return res.redirect(
                    '/publicaciones'
                );

            }

            const usuario =
                await Usuario.findByPk(
                    req.session.usuarioId
                );

            await Notificacion.create({

                mensaje:
                    usuario.nombre +
                    ' está interesado en una de tus imágenes',

                usuarioId:
                    publicacion.usuarioId

            });

            res.redirect(
                '/publicaciones'
            );

        } catch (error) {

            console.error(error);

            res.send(
                'Error al registrar interés'
            );

        }

    };

module.exports = {
    mostrarInteres
};