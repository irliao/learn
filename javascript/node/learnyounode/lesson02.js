var argvs = process.argv
var sum = 0
for (var i = 2; i < argvs.length; i++){
	sum += Number(argvs[i])
}

console.log(sum)
