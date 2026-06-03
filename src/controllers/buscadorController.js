const Etiqueta = require('../models/Etiqueta');
const PublicacionEtiqueta = require('../models/PublicacionEtiqueta');
const Publicacion = require('../models/Publicacion');
const Imagen = require('../models/Imagen');

const buscar = async (req, res) => {

    try {

        const etiquetaBuscada =
        req.query.etiqueta || '';

        const textoBuscado =
        req.query.texto || '';

        let etiqueta = null;

        if (etiquetaBuscada !== '') {

            etiqueta = await Etiqueta.findOne({

                where: {
                    nombre: etiquetaBuscada
                }

            });

        }

        if (
            etiquetaBuscada !== '' &&
            !etiqueta
        ) {
            return res.render(
                'busqueda', 
                {
                    publicaciones: [],
                    imagenes: [],
                    etiquetaBuscada,
                    textoBuscado
                }
            );
        }

        let relaciones = [];

        if (etiqueta) {

            relaciones =
                await PublicacionEtiqueta.findAll({

                    where: {
                        etiquetaId: etiqueta.id
                    }
                });

        }
        const ids = relaciones.map(
            relacion => relacion.publicacionId
        );

        const publicaciones =
            await Publicacion.findAll();

        let resultado = publicaciones;

        if (etiqueta) {

            resultado =
                resultado.filter(
                    publicacion =>
                        ids.includes(
                            publicacion.id
                        )
                );
        }

        if (textoBuscado !== '') {

            resultado =
                resultado.filter(
                    publicacion =>
                        
                        publicacion.titulo
                            .toLowerCase()
                            .includes(
                                textoBuscado
                                    .toLowerCase()
                            ) 
                        ||

                        (
                            publicacion.descripcion 
                            &&
                            publicacion.descripcion
                                .toLowerCase()
                                .includes(
                                    textoBuscado
                                        .toLowerCase()
                                )
                        )
                );

        }
                

        const imagenes =
            await Imagen.findAll();

        res.render('busqueda', {

            publicaciones: resultado,
            imagenes,
            etiquetaBuscada,
            textoBuscado

        });

    } catch (error) {

        console.error(error);

        res.send('Error en búsqueda');

    }

};

module.exports = {
    buscar
};