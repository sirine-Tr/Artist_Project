const { DataTypes } = require('sequelize');
const sequelize = require('../data/db');


const Artist = sequelize.define('Artist', {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  mbid: {
    type: DataTypes.STRING,
  },
  url: {
    type: DataTypes.STRING,
  },
  image_small: {
    type: DataTypes.STRING,
  },
  image: {
    type: DataTypes.STRING,
  },
});


Artist.sync();

module.exports = Artist;
