const express = require('express');
const router = express.Router();

const verificarSesion =
    require('../middlewares/authMiddleware');

const coleccionController =
    require('../controllers/coleccionController');

router.get(
    '/',
    verificarSesion,
    coleccionController
        .listarColecciones
);

router.post(
    '/crear',
    verificarSesion,
    coleccionController
        .crearColeccion
);

router.post(
    '/guardar/:id',
    verificarSesion,
    coleccionController
        .guardarPublicacion
);

router.get(
    '/:id',
    verificarSesion,
    coleccionController
        .verColeccion
);

module.exports = router;