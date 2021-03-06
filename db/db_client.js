let mysql = require('mysql');
let connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'developer',
    database: 'huella_carbono'
});

connection.connect();

let DBClient = {
    query: function (query, done, fail) {
        connection.query(query, function (err, rows, fields) {
            if (err) {
                if (fail) {
                    fail(err);
                } else {
                    throw err;
                }
            }

            done(rows);
        });
    }
};

module.exports = DBClient;