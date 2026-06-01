const Valoracion = require('../models/Valoracion');
const Publicacion = require('../models/Publicacion');

const valorar = async (req, res) => {

    try {

        const publicacion = await Publicacion.findByPk(
            req.params.id
        );

        if (!publicacion) {

            return res.redirect('/publicaciones');

        }

        if (
            publicacion.usuarioId ===
            req.session.usuarioId
        ) {

            return res.redirect('/publicaciones');

        }

        const yaExiste = await Valoracion.findOne({

            where: {
                usuarioId: req.session.usuarioId,
                publicacionId: req.params.id
            }

        });

        if (yaExiste) {

            return res.redirect('/publicaciones');

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