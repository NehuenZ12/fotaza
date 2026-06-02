const express = require('express');
const router = express.Router();

const verificarSesion =
    require('../middlewares/authMiddleware');

const interesController =
    require('../controllers/interesController');

router.get(
    '/:id',
    verificarSesion,
    interesController.mostrarInteres
);

module.exports = router;