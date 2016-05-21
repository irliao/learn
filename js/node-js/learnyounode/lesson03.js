var fs = require('fs')

var filePath = process.argv[2]

var fileBuf = fs.readFileSync(filePath)

var fileStr = fileBuf.toString()

var fileSplit = fileStr.split('\n')

console.log(fileSplit.length - 1);
