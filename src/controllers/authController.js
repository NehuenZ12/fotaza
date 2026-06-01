const iniciarSesion = async (req, res) => {

    try {

        const { email, password } = req.body;

        const usuario = await Usuario.findOne({
            where: { email }
        });

        if (!usuario) {
            return res.send('Usuario no encontrado');
        }

        if (!usuario.activo) {

            return res.send(
                'Tu cuenta ha sido desactivada por incumplir las normas de la comunidad'
            );

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