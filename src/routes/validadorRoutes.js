const express = require('express');
const router = express.Router();

const validadorController = require('../controllers/validadorController');
const verificarValidador = require('../middlewares/validadorMiddleware');

router.get(
    '/',
    verificarValidador,
    validadorController.listarRevision
);

router.get(
    '/desestimar/:id',
    verificarValidador,
    validadorController.desestimar
);

router.get(
    '/baja/:id',
    verificarValidador,
    validadorController.darDeBaja
);

module.exports = router;