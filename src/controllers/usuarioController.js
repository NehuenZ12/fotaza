const Usuario = require('../models/Usuario');

const listarUsuarios = async (req, res) => {

    try {

        const usuarios = await Usuario.findAll();

        res.render('usuarios', {
            usuarios,
            usuarioLogueado: req.session.usuarioId
        });

    } catch (error) {

        console.error(error);

        res.send('Error al cargar usuarios');

    }

};

module.exports = {
    listarUsuarios
};