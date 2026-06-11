const sequelize = require('./config/database');

async function inicializarBD() {

    try {

        await sequelize.authenticate();

        console.log(
            'Base de datos conectada'
        );

        await sequelize.sync();

        console.log(
            'Tablas creadas correctamente'
        );

        process.exit(0);

    } catch (error) {

        console.error(error);

        process.exit(1);

    }

}

inicializarBD();