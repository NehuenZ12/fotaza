const Seguimiento = require('../models/Seguimiento');

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

        }

        res.redirect('/usuarios');

    } catch (error) {

        console.error(error);

        res.send('Error al seguir usuario');

    }

};

module.exports = {
    seguir
};