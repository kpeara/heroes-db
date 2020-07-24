const sqlite = require("sqlite3");
// used by heroes-api and heroes-user-api

// connecting to sqlite database
let db = new sqlite.Database("../heroes-db/db/heroes.db", (err) => {
    if (err) return console.error(err.message);
    console.log("Success: Connected to Heroes Database.");
})

module.exports = db;
// do db.close() by adding a logout button on frontend
