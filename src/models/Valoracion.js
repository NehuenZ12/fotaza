const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Valoracion = sequelize.define('Valoracion', {

    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    puntaje: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    usuarioId: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    publicacionId: {
        type: DataTypes.INTEGER,
        allowNull: false
    }

});

module.exports = Valoracion;