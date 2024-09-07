const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('Artists', 'postgres', 'sisy040120', {
  host: 'localhost',
  dialect: 'postgres', 
});

module.exports = sequelize;
