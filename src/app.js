const express = require('express');
const path = require('path');

const authRoutes = require('./routes/authRoutes');
const sequelize = require('./config/database');
const Usuario = require('./models/Usuario');

const app = express();
const PORT = 3000;

// Configuracion de PUG
app.set('view engine', 'pug');
app.set('views', path.join(__dirname, 'views'));

// Archivos estaticos
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));
app.use('/auth', authRoutes);

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

app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});