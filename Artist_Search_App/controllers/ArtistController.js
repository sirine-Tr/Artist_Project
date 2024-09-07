const artistService = require('../services/ArtistService');
const express = require('express');
const router = express.Router();

const searchArtist = async (req, res) => {
    const artistName = req.query.name;
    const csvFileName = req.query.filename || 'artist_results.csv';
    try {
        let artists = await artistService.searchArtistByName(artistName); 
        if (artists.length === 0) {
            artists = artistService.getRandomArtists(); 
        }
        await artistService.ExportResultToCSV(artists, csvFileName);
        res.status(200).json({ message: `Results written to ${csvFileName}` });
    } catch (error) {
        console.error('Error:', error);
    }
};


router.get('/search-artist', searchArtist);
module.exports = router;
