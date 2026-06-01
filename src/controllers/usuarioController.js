const Usuario = require('../models/Usuario');
const Seguimiento = require('../models/Seguimiento');
const Publicacion = require('../models/Publicacion');

const listarUsuarios = async (req, res) => {

    try {

        const usuarios = await Usuario.findAll();

        res.render('usuarios', {
            usuarios,
            usuarioLogueado: req.session.usuarioId
        });

    } catch (error) {

        console.error(error);

        res.send('Error al cargar usuarios');

    }

};

const verPerfil = async (req, res) => {

    try {

        const usuario = await Usuario.findByPk(
            req.params.id
        );

        const seguidores =
            await Seguimiento.count({

                where: {
                    seguidoId: req.params.id
                }

            });

        const seguidos =
            await Seguimiento.count({

                where: {
                    seguidorId: req.params.id
                }

            });

        const publicaciones =
            await Publicacion.findAll({

                where: {
                    usuarioId: req.params.id
                }

            });

        res.render('perfilUsuario', {

            usuario,
            seguidores,
            seguidos,
            publicaciones

        });

    } catch (error) {

        console.error(error);

        res.send('Error al cargar perfil');

    }

};

module.exports = {
    listarUsuarios,
    verPerfil
};