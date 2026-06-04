const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const ColeccionPublicacion = sequelize.define('ColeccionPublicacion', {

    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    coleccionId: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    publicacionId: {
        type: DataTypes.INTEGER,
        allowNull: false
    }

});

module.exports = ColeccionPublicacion;