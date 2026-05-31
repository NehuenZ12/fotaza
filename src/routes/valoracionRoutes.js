const express = require('express');
const router = express.Router();

const verificarSesion = require('../middlewares/authMiddleware');
const valoracionController = require('../controllers/valoracionController');

router.post(
    '/:id',
    verificarSesion,
    valoracionController.valorar
);

module.exports = router;