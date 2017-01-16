var fs = require('fs')

var fileDir = process.argv[2]

var fileExt = '.' + process.argv[3]

fs.readdir(fileDir, function callback (err, list){
	if(err){
		console.log("ERROR: " + err)
		return
	}

	var listOfFiles = list
	for(var i = 0; i < listOfFiles.length; i++){
		if(listOfFiles[i].indexOf(fileExt) !== -1){
			console.log(listOfFiles[i])
		}
	}

})

