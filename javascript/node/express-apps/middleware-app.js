var express = require('express');
var app = express();

// runs for all endpoints starting from root /
app.use(function (req, res, next) {
    console.log('Time:', Date.now());
    next();
});

app.use('/user/:id', function (req, res, next) {
    console.log('Request URL:', req.originalUrl);
    next();
}, function (req, res, next) {
    console.log('Request Type:', req.method);
    next();
});

app.get('/user/:id', function (req, res, next) {
    console.log('ID:', req.params.id);
    next();
}, function (req, res, next) {
    res.send('User Info');
});

// handler for the /user/:id path, which prints the user ID
app.get('/user/:id', function (req, res, next) {
    res.end(req.params.id);
});

app.listen(3030, function () {
    console.log('listening on port 3030!');
});
