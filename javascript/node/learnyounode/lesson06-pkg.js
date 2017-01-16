var fs = require('fs')

// var fileDir = process.argv[2] // directory name

// var fileExt = '.' + process.argv[3] // filename extension string

module.exports = function (fileDir, fileExt, callback){
	fs.readdir(fileDir, function (err, list){
		if(err){
			return callback(err)
		}

		var listOfFiles = list
		var filteredFiles = []
		for(var i = 0; i < listOfFiles.length; i++){
			if(listOfFiles[i].indexOf(fileExt) !== -1){
				filteredFiles.push(listOfFiles[i])
			}
		}

		return callback(null, filteredFiles)
	})
}
