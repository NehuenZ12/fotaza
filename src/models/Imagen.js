const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Imagen = sequelize.define('Imagen', {

    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    ruta: {
        type: DataTypes.STRING,
        allowNull: false
    },

    publicacionId: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    licencia: {
        type: DataTypes.STRING,
        allowNull: false,
        defaultValue: 'libre'
    },

    marcaagua: {
        type: DataTypes.STRING,
        allowNull: true
    }

});

module.exports = Imagen;