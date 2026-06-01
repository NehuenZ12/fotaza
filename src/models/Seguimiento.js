const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Seguimiento = sequelize.define('Seguimiento', {

    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },

    seguidorId: {
        type: DataTypes.INTEGER,
        allowNull: false
    },

    seguidoId: {
        type: DataTypes.INTEGER,
        allowNull: false
    }

});

module.exports = Seguimiento;