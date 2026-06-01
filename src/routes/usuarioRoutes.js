const express = require('express');
const router = express.Router();

const verificarSesion = require('../middlewares/authMiddleware');
const usuarioController = require('../controllers/usuarioController');

router.get(
    '/',
    verificarSesion,
    usuarioController.listarUsuarios
);

router.get(
    '/:id',
    verificarSesion,
    usuarioController.verPerfil
);

module.exports = router;