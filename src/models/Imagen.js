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
    }

});

module.exports = Imagen;