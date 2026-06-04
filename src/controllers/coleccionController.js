const Coleccion =
    require('../models/Coleccion');

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

module.exports = {

    listarColecciones,
    crearColeccion

};