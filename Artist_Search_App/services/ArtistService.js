const fs = require('fs');
const path = require('path');
const { Sequelize } = require('sequelize'); 
const createCsvWriter = require('csv-writer').createObjectCsvWriter;
const Artist = require('../Models/Artist')
const randomArtistsData = require('../data/randomArtists.json');

/*Function to search for artists by name in the DataBase table and return the artist's information 
if it exists, if it doesn't exist, return a random list of artist names*/
const searchArtistByName = async (artistName) => {
    const artists = await Artist.findAll({
        where: {
            name: {
                [Sequelize.Op.iLike]: artistName
            }
        }
    });
    const artistData = artists.map(artist => artist.toJSON());
    if (artists.length === 0) {
        return getRandomArtists();
    }

    return artistData;
};

// Function to export results to a CSV file
const ExportResultToCSV = async (artists, csvFileName) => {
    const csvWriter = createCsvWriter({
        path: csvFileName,
        header: [
            { id: 'name', title: 'Name' },
            { id: 'mbid', title: 'MBID' },
            { id: 'url', title: 'URL' },
            { id: 'image_small', title: 'Image Small' },
            { id: 'image', title: 'Image' }
        ]
    });
    await csvWriter.writeRecords(artists);
    console.log(`CSV written successfully to ${csvFileName}`);
};
// the function returns a random artist name from the RandomArtist.json file with a random list length 
const getRandomArtists = () => {
    const randomArtists = [];
    const artistNames = randomArtistsData.artists;
    const maxCount = artistNames.length;
    const randomCount = Math.floor(Math.random() * (maxCount - 1)) + 1;

    while (randomArtists.length < randomCount) {
        const randomIndex = Math.floor(Math.random() * maxCount);
        const artistName = artistNames[randomIndex];
            randomArtists.push({
                name: artistName,
                mbid: '', 
                url: '',
                image_small: '',
                image: ''
            });
        
    }

    return randomArtists;
};



module.exports = {
    searchArtistByName,
    ExportResultToCSV,
    getRandomArtists
};
