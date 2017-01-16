var http = require('http')
var fs = require('fs')
var port = process.argv[2]

var server = http.createServer(function callback(req, res){
    // request handling logic...
    var headers = req.headers
    var method = req.method
    var url = req.url

    if(req.method == 'POST'){
    	var body = ''
    	req.on('error', function(err){
    		console.error(err)
    	}).on('data', function(data){
    		body += data
    	}).on('end', function(){
    		body = body.toUpperCase()
    		// NOTE: res cannot append .end to .writeHead because 
    		//		 res.writeHead does not return res
    		res.writeHead(200, {'Content-Type': 'text/html'})
    		res.end(body)
    	})
    } else {
    	res.end('Error: not a POST request')
    }
}).listen(port)