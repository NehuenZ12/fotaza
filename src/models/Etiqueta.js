const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Etiqueta = sequelize.define('Etiqueta', {

    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    nombre: {
        type: DataTypes.STRING,
        allowNull: false
    }

});

module.exports = Etiqueta;