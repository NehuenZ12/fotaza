const Publicacion = require('../models/Publicacion');

const listarRevision = async (req, res) => {

    try {

        const publicaciones =
            await Publicacion.findAll({

                where: {
                    enRevision: true
                }

            });

        res.render(
            'validador',
            {
                publicaciones
            }
        );

    } catch (error) {

        console.error(error);

        res.send(
            'Error al cargar revisión'
        );

    }

};

module.exports = {
    listarRevision
};