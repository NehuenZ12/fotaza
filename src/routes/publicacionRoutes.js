const express = require('express');
const router = express.Router();

const publicacionController = require('../controllers/publicacionController');
const publicacionConfigController = require('../controllers/publicacionConfigController');

const verificarSesion = require('../middlewares/authMiddleware');
const upload = require('../config/multer');

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
    upload.single('imagen'),
    publicacionController.crearPublicacion
);

router.get(
    '/cerrar-comentarios/:id',
    verificarSesion,
    publicacionConfigController.cerrarComentarios
);

router.get(
    '/abrir-comentarios/:id',
    verificarSesion,
    publicacionConfigController.abrirComentarios
);

module.exports = router;