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
const verificarSesion = require('./middlewares/authMiddleware');
const publicacionRoutes = require('./routes/publicacionRoutes');

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

app.get('/', (req, res) => {
    res.render('index');
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