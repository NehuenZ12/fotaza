const Notificacion =
    require('../models/Notificacion');

const listarNotificaciones =
    async (req, res) => {

        try {

            const notificaciones =
                await Notificacion.findAll({

                    where: {
                        usuarioId:
                            req.session.usuarioId
                    },

                    order: [
                        ['id', 'DESC']
                    ]

                });

            res.render(
                'notificaciones',
                {
                    notificaciones
                }
            );

        } catch (error) {

            console.error(error);

            res.send(
                'Error al cargar notificaciones'
            );

        }

    };

const marcarLeida = async (req, res) => {

    try {

        await Notificacion.update(

            {
                leida: true
            },

            {
                where: {
                    id: req.params.id
                }
            }

        );

        res.redirect(
            '/notificaciones'
        );

    } catch (error) {

        console.error(error);

        res.send(
            'Error al marcar notificación'
        );

    }

};

module.exports = {
    listarNotificaciones,
    marcarLeida
};