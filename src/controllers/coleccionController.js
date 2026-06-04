const Coleccion = require('../models/Coleccion');
const ColeccionPublicacion = require('../models/ColeccionPublicacion');

const listarColecciones =
    async (req, res) => {

        try {

            const colecciones =
                await Coleccion.findAll({

                    where: {
                        usuarioId:
                            req.session.usuarioId
                    },

                    order: [
                        ['id', 'DESC']
                    ]

                });

            res.render(
                'colecciones',
                {
                    colecciones
                }
            );

        } catch (error) {

            console.error(error);

            res.send(
                'Error al cargar colecciones'
            );

        }

    };

const crearColeccion =
    async (req, res) => {

        try {

            await Coleccion.create({

                nombre:
                    req.body.nombre,

                usuarioId:
                    req.session.usuarioId

            });

            res.redirect(
                '/colecciones'
            );

        } catch (error) {

            console.error(error);

            res.send(
                'Error al crear colección'
            );

        }

    };

const guardarPublicacion =
    async (req, res) => {

        try {

            const yaExiste =
                await ColeccionPublicacion.findOne({

                    where: {

                        coleccionId:
                            req.body.coleccionId,

                        publicacionId:
                            req.params.id

                    }

                });

            if (!yaExiste) {

                await ColeccionPublicacion.create({

                    coleccionId:
                        req.body.coleccionId,

                    publicacionId:
                        req.params.id

                });

            }

            res.redirect(
                '/publicaciones'
            );

        } catch (error) {

            console.error(error);

            res.send(
                'Error al guardar publicación'
            );

        }

    };

module.exports = {

    listarColecciones,
    crearColeccion,
    guardarPublicacion

};