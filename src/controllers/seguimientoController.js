const Seguimiento = require('../models/Seguimiento');
const Notificacion = require('../models/Notificacion');
const Usuario = require('../models/Usuario');
const Publicacion = require('../models/Publicacion');
const Imagen = require('../models/Imagen');

const seguir = async (req, res) => {

    try {

        const yaExiste = await Seguimiento.findOne({

            where: {
                seguidorId: req.session.usuarioId,
                seguidoId: req.params.id
            }

        });

        if (!yaExiste) {

            await Seguimiento.create({

                seguidorId: req.session.usuarioId,
                seguidoId: req.params.id

            });

            const usuarioSeguidor =
                await Usuario.findByPk(
                    req.session.usuarioId
                );

            await Notificacion.create({

                mensaje:
                    usuarioSeguidor.nombre +
                    ' comenzó a seguirte',

                usuarioId: req.params.id

            });

        }

        res.redirect('/usuarios');

    } catch (error) {

        console.error(error);

        res.send('Error al seguir usuario');

    }

};

const dejarDeSeguir = async (req, res) => {

    try {

        await Seguimiento.destroy({

            where: {
                seguidorId: req.session.usuarioId,
                seguidoId: req.params.id
            }

        });

        res.redirect('/usuarios');

    } catch (error) {

        console.error(error);

        res.send('Error al dejar de seguir');

    }

};

const publicacionesSeguidos = async (req, res) => {

    try {

        const seguimientos =
            await Seguimiento.findAll({

                where: {
                    seguidorId:
                        req.session.usuarioId
                }

            });

        const idsSeguidos =
            seguimientos.map(
                seguimiento =>
                    seguimiento.seguidoId
            );

        const publicacionesFiltradas =
            await Publicacion.findAll({

                where: {
                    usuarioId: idsSeguidos
                },

                order: [
                    ['id', 'DESC']
                ]

            });

        const imagenes = await Imagen.findAll();
        const usuarios = await Usuario.findAll();

        res.render(
            'publicacionesSeguidos',
            {
                publicaciones:
                    publicacionesFiltradas,
                imagenes,
                usuarios
            }
        );

    } catch (error) {

        console.error(error);

        res.send(
            'Error al cargar publicaciones seguidas'
        );

    }

};

module.exports = {
    seguir,
    dejarDeSeguir,
    publicacionesSeguidos
};