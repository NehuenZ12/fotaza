const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Coleccion = sequelize.define('Coleccion', {

    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    nombre: {
        type: DataTypes.STRING,
        allowNull: false
    },

    usuarioId: {
        type: DataTypes.INTEGER,
        allowNull: false
    }

});

module.exports = Coleccion;