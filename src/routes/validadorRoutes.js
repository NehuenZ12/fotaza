const express = require('express');
const router = express.Router();

const validadorController =
    require('../controllers/validadorController');

router.get(
    '/',
    validadorController.listarRevision
);

router.get(
    '/desestimar/:id',
    validadorController.desestimar
);

router.get(
    '/baja/:id',
    validadorController.darDeBaja
);

module.exports = router;