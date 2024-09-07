1.	Clone the Repository :
git clone https://github.com/yourusername/your-repository-name.git
Note:
Artist_Search_app directory contains the Node.js application.
databaseImportFile folder contains the artists.sql file needed to import data into your PostgreSQL database.
2. Access the Node.js App:
Navigate to the Artist_Search_app directory, which contains the Node.js application:
cd Artist_Search_app
3. Install Dependencies inside the Artist_Search_app directory:
npm install
4. Import the Database:
Note : Ensure that PostgreSQL is installed and running on your machine.
4.1 Create a new database:
createdb -U postgres Artists
Note: Replace Artists with your desired database name if needed.
4.2 Import the data from the SQL file :
psql -U postgres -d Artists -f databaseImportFile/artists.sql
5. Start the Application:
Note: In the root of the Artist_Search_app directory, start the server
Note 2: Before starting the application, ensure you modify the db.js file with the following details:
•	Replace ‘Artists’ with the name of your PostgreSQL database.
•	Replace 'postgres' with your PostgreSQL username.
•	Replace 'sisy040120' with your PostgreSQL password.
node app.js or nodemon app.js

Architecture Overview

This project follows a structured architecture to ensure maintainability and clarity:

•	Model: Defines the data structure and the format used across the application. In this project, the model represents an Artist, encapsulating attributes such as name, mbid, url, image_small, and image.

•	Service: Contains the business logic and data handling operations. The ArtistService manages tasks like searching for artists, retrieving random artists, and exporting results to a CSV file.

•	Controller: Handles incoming HTTP requests and interacts with the service layer. The controller processes requests, utilizes service methods, and sends responses back to the client.

Data: Stores the application's data using the following components:

•	randomArtists.json: Holds a list of artist names for fallback purposes when no search results are found.

•	db.js: Contains the database connection and configuration details, and manages database operations.

Behavior:

•	Search Artist:

o	If the artist matching the specified name is found in the database, the API will return the artist details and save them to the specified CSV file.

o	If no artist is found, the API will retrieve random artist names from a JSON source and continue searching until it gathers a list of artists. This list will be saved to the specified CSV file.

Test: 
To test the application, I used Postman.
Endpoint: /api/search-artist
•	Method: GET
•	Query Parameters:
o	name (required): The name of the artist you want to search for.
o	filename (optional): The name of the CSV file where the search results will be saved.
Example :
http://localhost:3000/api/search-artist?name=Arti&filename=Artist4_results.csv
Notes:
•	Replace Arti with the name of the artist you wish to search for.
•	Replace Artist4_results.csv with the desired name for the CSV file where you want to store the search results.

=>The artist's name exists in the database:
![ArtistExist](https://github.com/user-attachments/assets/3b793dab-ba19-4e71-8c20-cffd19f9841e)
The result in the CSV file: 
![ArtistExistCSV](https://github.com/user-attachments/assets/f387e4c3-70b7-41fc-8c07-b6da9e8cd9ef)
=>The artist's name does not exist in the database:
![ArtistNotExist](https://github.com/user-attachments/assets/64add8c8-4201-40cd-999a-a0eb73fabd57)
The result in the CSV file:

![ArtistNotExistCSV](https://github.com/user-attachments/assets/96d4f2df-120a-4728-b918-c20076ba3219)

Tutorial Used:
For this project, I followed this tutorial to export data to a CSV file.
https://medium.com/random-thougths/simple-nodejs-script-to-create-10m-record-and-write-into-csv-3e2cd3c2734c
