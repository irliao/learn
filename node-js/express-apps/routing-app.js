var express = require('express');
var app = express();

// route structure: app.METHOD(PATH, HANDLER)

app.get('/', function (req, res) {
  res.send('Got a GET request at root route /');
});

// random.text is just a URI path, actual file does not matter
app.get('/random.text', function (req, res) {
  res.send('Got a GET request at /random.text');
});

app.post('/', function(req, res) {
    res.send('Got a POST request');
});

app.put('/user', function(req, res) {
    res.send('Got a PUT request at /user');
});

app.delete('/user', function(req, res) {
    res.send('Got a DELETE request at /user');
});

// handler will be executed for all HTTP requests to /secret
app.all('/secret', function (req, res, next) {
  console.log('Accessing the secret section ...');
  next(); // pass control to the next handler
});

// simulate synchronous callback calls using next()
var count = 0
app.get('/example/b', function (req, res, next) {
  // anything before next() will 
  console.log('first cb count: ' + ++count);
  next();
}, function (req, res) {
  res.send('second cb count: ' + ++count);
});

// demonstrates an array of functions handling route
var cb0 = function (req, res, next) {
  console.log('CB0');
  next();
}
var cb1 = function (req, res, next) {
  console.log('CB1');
  next();
}
var cb2 = function (req, res) {
  res.send('Hello from C!');
}
app.get('/example/c', [cb0, cb1, cb2]);

// demonstrates independent functions and array of functions handling route
app.get('/example/d', [cb0, cb1], function (req, res, next) {
  console.log('the response will be sent by the next function ...');
  next();
}, function (req, res) {
  res.send('Hello from D!');
});

// listen server
app.listen(3000, function () {
  console.log('listening on port 3000!');
});
