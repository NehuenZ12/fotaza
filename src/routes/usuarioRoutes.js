const express = require('express');
const router = express.Router();

const verificarSesion = require('../middlewares/authMiddleware');
const usuarioController = require('../controllers/usuarioController');

router.get(
    '/',
    verificarSesion,
    usuarioController.listarUsuarios
);

module.exports = router;