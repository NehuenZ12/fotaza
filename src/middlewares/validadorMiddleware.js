const verificarValidador = (req, res, next) => {

    if (
        req.session.usuarioRol !==
        'VALIDADOR'
    ) {

        return res.send(
            'Acceso denegado'
        );

    }

    next();

};

module.exports =
    verificarValidador;