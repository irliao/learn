var http = require('http')

var url = process.argv[2] // first command-line argument

// response == Node Stream object (objects that emit events), usually three events are data, error, and end
http.get(url, function callback(response){

	response.setEncoding('utf8')

	// data event emitted when a chunk of data is available and can be processed
	response.on("data", function(data){
		console.log(data)
	})
})