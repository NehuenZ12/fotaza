const DenunciaComentario =
    require('../models/DenunciaComentario');

const Comentario =
    require('../models/Comentario');

const Publicacion =
    require('../models/Publicacion');

const listarDenuncias =
    async (req, res) => {

        try {

            const denuncias =
                await DenunciaComentario.findAll();

            const comentarios =
                await Comentario.findAll();

            res.render(
                'denunciasComentarios',
                {
                    denuncias,
                    comentarios
                }
            );

        } catch (error) {

            console.error(error);

            res.send(
                'Error al cargar denuncias'
            );

        }

    };

const eliminarComentario =
    async (req, res) => {

        try {

            await Comentario.destroy({

                where: {
                    id: req.params.id
                }

            });

            await DenunciaComentario.destroy({

                where: {
                    comentarioId:
                        req.params.id
                }

            });

            res.redirect(
                '/denuncias-comentarios-admin'
            );

        } catch (error) {

            console.error(error);

            res.send(
                'Error al eliminar comentario'
            );

        }

    };

module.exports = {
    listarDenuncias,
    eliminarComentario
};