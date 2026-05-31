const Valoracion = require('../models/Valoracion');

const valorar = async (req, res) => {

    try {

        const yaExiste = await Valoracion.findOne({

            where: {
                usuarioId: req.session.usuarioId,
                publicacionId: req.params.id
            }

        });

        if (yaExiste) {

            return res.send(
                'Ya valoraste esta publicación'
            );

        }

        await Valoracion.create({

            puntaje: req.body.puntaje,
            usuarioId: req.session.usuarioId,
            publicacionId: req.params.id

        });

        res.redirect('/publicaciones');

    } catch (error) {

        console.error(error);

        res.send('Error al valorar');

    }

};

module.exports = {
    valorar
};