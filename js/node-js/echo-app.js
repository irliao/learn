var http = require('http');

// request object is a ReadableStream and the response object is a WritableStream
http.createServer(function(request, response) {
  request.on('error', function(err) {
    console.error(err);
    response.statusCode = 400;
    response.end();
  });
  response.on('error', function(err) {
    console.error(err);
  });
  if (request.method === 'GET' && request.url === '/echo') {
    request.pipe(response);
  } else {
    response.statusCode = 404;
    response.end();
  }
}).listen(8080);

// Unsimplified Version (not using stream)
// http.createServer(function(request, response) {
//   if (request.method === 'GET' && request.url === '/echo') {
//     var body = [];
//     request.on('data', function(chunk) {
//       body.push(chunk);
//     }).on('end', function() {
//       body = Buffer.concat(body).toString();
//       response.end(body);
//     })
//   } else {
//     response.statusCode = 404;
//     response.end();
//   }
// }).listen(8080);