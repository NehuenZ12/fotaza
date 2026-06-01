const express = require('express');
const router = express.Router();

const verificarSesion =
    require('../middlewares/authMiddleware');

const denunciaComentarioController =
    require('../controllers/denunciaComentarioController');

router.post(
    '/:id',
    verificarSesion,
    denunciaComentarioController
        .crearDenunciaComentario
);

module.exports = router;