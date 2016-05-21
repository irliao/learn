var fs = require('fs')

var filePath = process.argv[2]

fs.readFile(filePath, function callback(err, data){
	if(err){
		console.log("ERROR: " + err)
		return
	}

	var fileBuf = data // unneeded, only for code clarification
	var fileStr = fileBuf.toString()

	var fileSplit = fileStr.split('\n')

	console.log(fileSplit.length - 1);
})




