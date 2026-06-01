const Publicacion =
    require('../models/Publicacion');

const cerrarComentarios =
    async (req, res) => {

        try {

            const publicacion =
                await Publicacion.findByPk(
                    req.params.id
                );

            if (
                publicacion.usuarioId ===
                req.session.usuarioId
            ) {

                await publicacion.update({

                    comentariosAbiertos: false

                });

            }

            res.redirect(
                '/publicaciones'
            );

        } catch (error) {

            console.error(error);

            res.send(
                'Error al cerrar comentarios'
            );

        }

    };

const abrirComentarios =
    async (req, res) => {

        try {

            const publicacion =
                await Publicacion.findByPk(
                    req.params.id
                );

            if (
                publicacion.usuarioId ===
                req.session.usuarioId
            ) {

                await publicacion.update({

                    comentariosAbiertos: true

                });

            }

            res.redirect(
                '/publicaciones'
            );

        } catch (error) {

            console.error(error);

            res.send(
                'Error al abrir comentarios'
            );

        }

    };

module.exports = {
    cerrarComentarios,
    abrirComentarios
};