const express = require('express');
const router = express.Router();

const controller =
    require('../controllers/denunciaComentarioAdminController');

router.get(
    '/',
    controller.listarDenuncias
);

router.get(
    '/eliminar/:id',
    controller.eliminarComentario
);

module.exports = router;