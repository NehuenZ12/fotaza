const express = require('express');
const router = express.Router();

const validadorController =
    require('../controllers/validadorController');

router.get(
    '/',
    validadorController.listarRevision
);

module.exports = router;