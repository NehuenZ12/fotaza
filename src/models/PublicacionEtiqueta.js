const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const PublicacionEtiqueta = sequelize.define('PublicacionEtiqueta', {

    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    publicacionId: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    etiquetaId: {
        type: DataTypes.INTEGER,
        allowNull: false
    }

});

module.exports = PublicacionEtiqueta;