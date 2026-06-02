const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Mensaje = sequelize.define('Mensaje', {

    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    texto: {
        type: DataTypes.TEXT,
        allowNull: false
    },

    remitenteId: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    destinatarioId: {
        type: DataTypes.INTEGER,
        allowNull: false
    }

});

module.exports = Mensaje;