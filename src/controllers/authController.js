const Usuario = require('../models/Usuario');
const bcrypt = require('bcrypt');

const mostrarLogin = (req, res) => {
    res.render('login');
};

const mostrarRegistro = (req, res) => {
    res.render('register');
};

const registrarUsuario = async (req, res) => {
    try {

        const { nombre, email, password } = req.body;

        const passwordEncriptada = await bcrypt.hash(password, 10);

        await Usuario.create({
            nombre,
            email,
            password: passwordEncriptada
        });

        res.send('Usuario registrado correctamente');

    } catch (error) {
        console.error(error);
        res.send('Error al registrar usuario');
    }
};

module.exports = {
    mostrarLogin,
    mostrarRegistro,
    registrarUsuario
};