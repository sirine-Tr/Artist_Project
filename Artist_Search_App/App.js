const express = require('express');
const path = require('path');
const app = express();
const artistRouter = require('./controllers/ArtistController'); 
const PORT = 3000;

app.use('/api', artistRouter);


app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Something went wrong.' });
});


app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
