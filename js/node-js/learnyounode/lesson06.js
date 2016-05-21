var fs = require('fs')
var fileDir = process.argv[2] // directory name
var fileExt = '.' + process.argv[3] // filename extension string

var mymodule = require('./lesson06-pkg')

mymodule(fileDir, fileExt, function(err, listOfFiles){
	if(err){
		console.log(err);
	}

	for(var i = 0; i < listOfFiles.length; i++){
		console.log(listOfFiles[i])
	}
})
