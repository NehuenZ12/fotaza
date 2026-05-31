const express = require('express');
const router = express.Router();

const publicacionController = require('../controllers/publicacionController');
const verificarSesion = require('../middlewares/authMiddleware');

router.get(
    '/',
    publicacionController.listarPublicaciones
);

router.get(
    '/crear',
    verificarSesion,
    publicacionController.mostrarFormulario
);

router.post(
    '/crear',
    verificarSesion,
    publicacionController.crearPublicacion
);

module.exports = router;