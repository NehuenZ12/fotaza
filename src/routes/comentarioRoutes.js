const express = require('express');
const router = express.Router();

const comentarioController = require('../controllers/comentarioController');
const verificarSesion = require('../middlewares/authMiddleware');

router.post(
    '/crear/:id',
    verificarSesion,
    comentarioController.crearComentario
);

module.exports = router;