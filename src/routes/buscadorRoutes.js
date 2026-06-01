const express = require('express');
const router = express.Router();

const buscadorController =
    require('../controllers/buscadorController');

router.get(
    '/',
    buscadorController.buscar
);

module.exports = router;