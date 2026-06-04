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

module.exports = router;