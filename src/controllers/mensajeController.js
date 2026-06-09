const Mensaje = require('../models/Mensaje');
const Usuario = require('../models/Usuario');
const { Op } = require('sequelize');

const listarMensajes = async (req, res) => {

    try {

        const mensajes = await Mensaje.findAll({

            where: {

                [Op.or]: [

            {
                remitenteId:
                    req.session.usuarioId
            },

            {
                destinatarioId:
                    req.session.usuarioId
            }

        ]

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
                usuarios,
                usuariosId:
                    Number(                 
                        req.session.usuarioId
                    )  
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

const verChat = async (req, res) => {

    try {

        const usuarioDestino =
            await Usuario.findByPk(
                req.params.id
            );

        const mensajes =
            await Mensaje.findAll({

                where: {

                    [Op.or]: [

                        {
                            remitenteId:
                                req.session.usuarioId,

                            destinatarioId:
                                req.params.id
                        },

                        {
                            remitenteId:
                                req.params.id,

                            destinatarioId:
                                req.session.usuarioId
                        }

                    ]

                },

                order: [
                    ['id', 'ASC']
                ]

            });

        res.render(
            'chat',
            {
                mensajes,
                usuarioDestino,
                usuarioId:
                    req.session.usuarioId
            }
        );

    } catch (error) {

        console.error(error);

        res.send(
            'Error al cargar chat'
        );

    }

};

module.exports = {
    listarMensajes,
    enviarMensaje,
    verChat
};