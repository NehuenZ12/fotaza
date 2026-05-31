const express = require('express');
const router = express.Router();

const publicacionController = require('../controllers/publicacionController');
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

module.exports = router;