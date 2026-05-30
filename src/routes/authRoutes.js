const express = require('express');
const router = express.Router();

const authController = require('../controllers/authController');

router.get('/login', authController.mostrarLogin);

router.get('/register', authController.mostrarRegistro);

router.post('/register', authController.registrarUsuario);

module.exports = router;