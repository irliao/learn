var http = require('http')

var url = process.argv[2] // first command-line argument

http.get(url, function callback(response){
	response.setEncoding('utf8')

	var streamConcat = ''
	response.on('data', function(data){
		streamConcat += data
	})

	response.on('end', function(){
		console.log(streamConcat.length)
		console.log(streamConcat)
	})
})
