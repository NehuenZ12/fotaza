const express = require('express');
const router = express.Router();

const verificarSesion =
    require('../middlewares/authMiddleware');

const notificacionController =
    require('../controllers/notificacionController');

router.get(
    '/',
    verificarSesion,
    notificacionController
        .listarNotificaciones
);

module.exports = router;