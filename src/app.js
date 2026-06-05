const express = require('express');
const path = require('path');

const session = require('express-session');
const authRoutes = require('./routes/authRoutes');
const sequelize = require('./config/database');
const Usuario = require('./models/Usuario');
const Publicacion = require('./models/Publicacion');
const Imagen = require('./models/Imagen');
const Etiqueta = require('./models/Etiqueta');
const PublicacionEtiqueta = require('./models/PublicacionEtiqueta');
const Comentario = require('./models/Comentario');
const Valoracion = require('./models/Valoracion');
const valoracionRoutes = require('./routes/valoracionRoutes');
const comentarioRoutes = require('./routes/comentarioRoutes');
const verificarSesion = require('./middlewares/authMiddleware');
const publicacionRoutes = require('./routes/publicacionRoutes');
const rankingRoutes = require('./routes/rankingRoutes');
const buscadorRoutes = require('./routes/buscadorRoutes');
const Seguimiento = require('./models/Seguimiento');
const seguimientoRoutes = require('./routes/seguimientoRoutes');    
const usuarioRoutes = require('./routes/usuarioRoutes');
const Notificacion = require('./models/Notificacion');
const notificacionRoutes = require('./routes/notificacionRoutes');
const Denuncia = require('./models/Denuncia');
const denunciaRoutes = require('./routes/denunciaRoutes');
const validadorRoutes = require('./routes/validadorRoutes');
const DenunciaComentario = require('./models/DenunciaComentario');
const denunciaComentarioRoutes = require('./routes/denunciaComentarioRoutes');
const denunciaComentarioAdminRoutes = require('./routes/denunciaComentarioAdminRoutes');
const interesRoutes = require('./routes/interesRoutes');
const Mensaje = require('./models/Mensaje');
const mensajeRoutes = require('./routes/mensajeRoutes');
const coleccionRoutes = require('./routes/coleccionRoutes');

const app = express();
const PORT = 3000;

// Configuracion de PUG
app.set('view engine', 'pug');
app.set('views', path.join(__dirname, 'views'));

// Archivos estaticos
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));
app.use(session({
    secret: 'fotaza2026',
    resave: false,
    saveUninitialized: false
}));
app.use('/auth', authRoutes);
app.use('/publicaciones', publicacionRoutes);
app.use('/comentarios', comentarioRoutes);
app.use('/valoraciones', valoracionRoutes);
app.use('/ranking', rankingRoutes);
app.use('/buscar', buscadorRoutes);
app.use('/seguir', seguimientoRoutes);
app.use('/usuarios', usuarioRoutes);
app.use('/notificaciones', notificacionRoutes);
app.use('/denuncias', denunciaRoutes);
app.use('/denuncias-comentarios', denunciaComentarioRoutes);
app.use('/validador', validadorRoutes);
app.use('/denuncias-comentarios-admin', denunciaComentarioAdminRoutes);
app.use('/intereses', interesRoutes);
app.use('/mensajes', mensajeRoutes);
app.use('/colecciones', coleccionRoutes);

app.get('/', (req, res) => {

    if (req.session.usuarioId) {

        return res.redirect(
            '/publicaciones'
        );

    }

    res.redirect(
        '/auth/login'
    );

});

sequelize.authenticate()
    .then(async () => {
        console.log('Base de datos conectada');

        await sequelize.sync();

        console.log('Tablas sincronizadas');
    })
    .catch((error) => {
        console.error('Error de conexión:', error);
    });

app.get('/perfil', verificarSesion, (req, res) => {
    res.render('perfil', {
        nombre: req.session.usuarioNombre
    });
});

app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});