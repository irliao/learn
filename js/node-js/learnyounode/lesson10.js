var net = require('net') // raw TCP server
var port = process.argv[2]

var server = net.createServer(function (socket){
    // socket handling logic
    var date = new Date()
    var year = date.getFullYear()
    var month = date.getMonth() + 1 // starts at 0

    // single digit Month
    if(month < 10){
       month = '0' + month.toString() 
    }

    var day = date.getDate() // returns the day of month
    var hour = date.getHours()

    // single digit Hour
    if(hour < 10){
        hour = '0' + hour.toString()
    }
    var min = date.getMinutes()
    var time = year + '-' + month + '-' + day + ' ' + hour + ':' + min + '\n'

    socket.end(time) // same as socket.write(data); socket.end()
})
server.listen(port)
