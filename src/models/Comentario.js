const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Comentario = sequelize.define('Comentario', {

    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    texto: {
        type: DataTypes.TEXT,
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

module.exports = Comentario;