const express = require('express');
const router = express.Router();

const verificarSesion =
    require('../middlewares/authMiddleware');

const mensajeController =
    require('../controllers/mensajeController');

router.get(
    '/',
    verificarSesion,
    mensajeController.listarMensajes
);

router.post(
    '/enviar/:id',
    verificarSesion,
    mensajeController.enviarMensaje
);

router.get(
    '/chat/:id',
    verificarSesion,
    mensajeController.verChat
);

module.exports = router;