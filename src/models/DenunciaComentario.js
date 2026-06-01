const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const DenunciaComentario = sequelize.define('DenunciaComentario', {

    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    motivo: {
        type: DataTypes.STRING,
        allowNull: false
    },

    descripcion: {
        type: DataTypes.TEXT,
        allowNull: false
    },

    usuarioId: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    comentarioId: {
        type: DataTypes.INTEGER,
        allowNull: false
    }

});

module.exports = DenunciaComentario;