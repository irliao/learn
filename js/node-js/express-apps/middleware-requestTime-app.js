var express = require('express');
var app = express();

var requestTime = function (req, res, next) {
    req.requestTime = Date.now();
    next();
};

app.use(requestTime);

app.get('/', function (req, res){
    var responseText = 'Hello World!';
    responseText += 'Requested at: ' + req.requestTime + '';
    res.send(responseText);
});

app.listen(3030, function () {
    console.log('listening on port 3030!');
});
