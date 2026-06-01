const Denuncia = require('../models/Denuncia');
const Imagen = require('../models/Imagen');
const Publicacion = require('../models/Publicacion');

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

        const cantidadDenuncias =
            await Denuncia.count({

                where: {
                    imagenId: req.params.id
                }

            });

        if (cantidadDenuncias >= 3) {

            const imagen =
                await Imagen.findByPk(
                    req.params.id
                );

            if (imagen) {

                const publicacion =
                    await Publicacion.findByPk(
                        imagen.publicacionId
                    );

                if (publicacion) {

                    await publicacion.update({

                        enRevision: true

                    });

                }

            }

        }

        res.redirect('/publicaciones');

    } catch (error) {

        console.error(error);

        res.send('Error al denunciar');

    }

};

module.exports = {
    crearDenuncia
};