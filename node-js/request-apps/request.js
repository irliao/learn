var request = require('request');
var url = '127.0.0.1:3030/test'
request(url, function (err, res, body) {
    if(!err && res.statusCode == 200)  {
        console.log(body);
    } 
});

