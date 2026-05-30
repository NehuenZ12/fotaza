const Usuario = require('../models/Usuario');
const bcrypt = require('bcrypt');

const iniciarSesion = async (req, res) => {

    try {

        const { email, password } = req.body;

        const usuario = await Usuario.findOne({
            where: { email }
        });

        if (!usuario) {
            return res.send('Usuario no encontrado');
        }

        const coincidePassword = await bcrypt.compare(
            password,
            usuario.password
        );

        if (!coincidePassword) {
            return res.send('Contraseña incorrecta');
        }

        req.session.usuarioId = usuario.id;
        req.session.usuarioNombre = usuario.nombre;

        res.redirect('/perfil');

    } catch (error) {

        console.error(error);
        res.send('Error al iniciar sesión');

    }

};

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
    registrarUsuario,
    iniciarSesion
};