var express = require('express');
var app = express();
var port = 3030;

app.post('/', function (req, res) {
    console.log('GET at /');
});

app.get('/test', function (req, res) {
    console.log('GET at /test');
});


app.listen(port, function () {
    console.log('listening on port: ' + port);
});
