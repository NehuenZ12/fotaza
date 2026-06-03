const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Notificacion = sequelize.define('Notificacion', {

    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    leida: {
    type: DataTypes.BOOLEAN,
    defaultValue: false
    },  

    mensaje: {
        type: DataTypes.STRING,
        allowNull: false
    },

    usuarioId: {
        type: DataTypes.INTEGER,
        allowNull: false
    }

});

module.exports = Notificacion;