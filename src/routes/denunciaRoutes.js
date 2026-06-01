const express = require('express');
const router = express.Router();

const verificarSesion =
    require('../middlewares/authMiddleware');

const denunciaController =
    require('../controllers/denunciaController');

router.post(
    '/:id',
    verificarSesion,
    denunciaController.crearDenuncia
);

module.exports = router;