var http = require('http')
var fs = require('fs')
var port = process.argv[2]
var filename = process.argv[3]

// request fetches header and query-string from the request
// response is for sending data to the client, both headers and body
// both request and response are Node streams
var server = http.createServer(function callback(request, response){
    // request handling logic...
    var headers = request.headers // always lower case, regardless of how it was sent by client
    var method = request.method
    var url = request.url
    var body = []
    var readStream = fs.createReadStream(filename) // open file as readible stream

    response.writeHead(200, { 'content-type': 'text/plain' }) // write response header

    readStream.on('error', function(err){ // usual errors caught are invalid file names
 		response.send(err)
    }).on('open', function(){ // wait until readable stream is actually valid before piping
 		readStream.pipe(response) // pipes read stream to response object (which is client)
    })  
}).listen(port)