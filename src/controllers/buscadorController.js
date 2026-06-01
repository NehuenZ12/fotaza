const Etiqueta = require('../models/Etiqueta');
const PublicacionEtiqueta = require('../models/PublicacionEtiqueta');
const Publicacion = require('../models/Publicacion');

const buscar = async (req, res) => {

    try {

        const texto = req.query.etiqueta;

        const etiqueta = await Etiqueta.findOne({

            where: {
                nombre: texto
            }

        });

        if (!etiqueta) {

            return res.render('busqueda', {
                publicaciones: [],
                etiquetaBuscada: texto
            });

        }

        const relaciones =
            await PublicacionEtiqueta.findAll({

                where: {
                    etiquetaId: etiqueta.id
                }

            });

        const ids = relaciones.map(
            relacion => relacion.publicacionId
        );

        const publicaciones =
            await Publicacion.findAll();

        const resultado =
            publicaciones.filter(
                publicacion =>
                    ids.includes(publicacion.id)
            );

        res.render('busqueda', {

            publicaciones: resultado,
            etiquetaBuscada: texto

        });

    } catch (error) {

        console.error(error);

        res.send('Error en búsqueda');

    }

};

module.exports = {
    buscar
};