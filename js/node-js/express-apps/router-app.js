var express = require('express');
var app = express();
var router = require('./router-module');

app.use('/', router);

app.listen(3030, function () {
    console.log('listening on port 3030!');
});


