const Denuncia = require('../models/Denuncia');

const crearDenuncia = async (req, res) => {

    try {

        const yaExiste = await Denuncia.findOne({

            where: {
                usuarioId: req.session.usuarioId,
                imagenId: req.params.id
            }

        });

        if (yaExiste) {

            return res.redirect(
                '/publicaciones'
            );

        }

        await Denuncia.create({

            motivo: req.body.motivo,
            descripcion: req.body.descripcion,
            usuarioId: req.session.usuarioId,
            imagenId: req.params.id

        });

        res.redirect('/publicaciones');

    } catch (error) {

        console.error(error);

        res.send('Error al denunciar');

    }

};

module.exports = {
    crearDenuncia
};