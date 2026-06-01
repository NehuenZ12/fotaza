const DenunciaComentario =
    require('../models/DenunciaComentario');

const crearDenunciaComentario =
    async (req, res) => {

        console.log('DENUNCIA COMENTARIO');
        console.log(req.params.id);
        console.log(req.body);

        try {

            const yaExiste =
                await DenunciaComentario.findOne({

                    where: {
                        usuarioId:
                            req.session.usuarioId,

                        comentarioId:
                            req.params.id
                    }

                });

            if (yaExiste) {

                return res.redirect(
                    '/publicaciones'
                );

            }

            await DenunciaComentario.create({

                motivo:
                    req.body.motivo,

                descripcion:
                    req.body.descripcion,

                usuarioId:
                    req.session.usuarioId,

                comentarioId:
                    req.params.id

            });

            res.redirect(
                '/publicaciones'
            );

        } catch (error) {

            console.error(error);

            res.send(
                'Error al denunciar comentario'
            );

        }

    };

module.exports = {
    crearDenunciaComentario
};