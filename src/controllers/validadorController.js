const Publicacion = require('../models/Publicacion');
const Denuncia = require('../models/Denuncia');
const Imagen = require('../models/Imagen');
const Usuario = require('../models/Usuario');

const listarRevision = async (req, res) => {

    try {

        const publicaciones =
            await Publicacion.findAll({

                where: {
                    enRevision: true
                }

            });

        res.render(
            'validador',
            {
                publicaciones
            }
        );

    } catch (error) {

        console.error(error);

        res.send(
            'Error al cargar revisión'
        );

    }

};

const desestimar = async (req, res) => {

    try {

        const publicacion =
            await Publicacion.findByPk(
                req.params.id
            );

        const imagenes =
            await Imagen.findAll({

                where: {
                    publicacionId:
                        publicacion.id
                }

            });

        for (const imagen of imagenes) {

            await Denuncia.destroy({

                where: {
                    imagenId: imagen.id
                }

            });

        }

        await publicacion.update({

            enRevision: false

        });

        res.redirect('/validador');

    } catch (error) {

        console.error(error);

        res.send(
            'Error al desestimar'
        );

    }

};

const darDeBaja = async (req, res) => {

    try {

        const publicacion =
            await Publicacion.findByPk(
                req.params.id
            );

        await publicacion.update({

            activa: false,
            enRevision: false

        });

        const cantidadBajas =
            await Publicacion.count({

                where: {
                    usuarioId:
                        publicacion.usuarioId,

                    activa: false
                }

            });

        if (cantidadBajas >= 3) {

            const usuario =
                await Usuario.findByPk(
                    publicacion.usuarioId
                );

            if (usuario) {

                await usuario.update({

                    activo: false

                });

            }

        }

        res.redirect('/validador');

    } catch (error) {

        console.error(error);

        res.send(
            'Error al dar de baja'
        );

    }

};

module.exports = {
    listarRevision,
    desestimar,
    darDeBaja
};