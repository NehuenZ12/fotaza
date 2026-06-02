const Mensaje = require('../models/Mensaje');
const Usuario = require('../models/Usuario');

const listarMensajes = async (req, res) => {

    try {

        const mensajes = await Mensaje.findAll({

            where: {
                destinatarioId:
                    req.session.usuarioId
            },

            order: [
                ['id', 'DESC']
            ]

        });

        const usuarios =
            await Usuario.findAll();

        res.render(
            'mensajes',
            {
                mensajes,
                usuarios
            }
        );

    } catch (error) {

        console.error(error);

        res.send(
            'Error al cargar mensajes'
        );

    }

};

const enviarMensaje = async (req, res) => {

    try {

        await Mensaje.create({

            texto: req.body.texto,

            remitenteId:
                req.session.usuarioId,

            destinatarioId:
                req.params.id

        });

        res.redirect(
            '/mensajes'
        );

    } catch (error) {

        console.error(error);

        res.send(
            'Error al enviar mensaje'
        );

    }

};

module.exports = {
    listarMensajes,
    enviarMensaje
};