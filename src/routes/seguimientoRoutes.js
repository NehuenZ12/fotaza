const express = require('express');
const router = express.Router();

const verificarSesion = require('../middlewares/authMiddleware');
const seguimientoController =
    require('../controllers/seguimientoController');

router.get(
    '/:id',
    verificarSesion,
    seguimientoController.seguir
);

module.exports = router;