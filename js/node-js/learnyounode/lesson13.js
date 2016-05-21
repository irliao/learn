var http = require('http')
var port = process.argv[2]
var url = require('url')

var server = http.createServer(function(req, res){
	var headers = req.headers
    var method = req.method

	if(method == 'GET'){
		var parseUrl = url.parse(req.url, true)
		var pathname = parseUrl.pathname
		var queryObj = parseUrl.query
		var iso = queryObj.iso
		var date = new Date(iso)

		// TODO: figure out where to writeHead
		res.writeHead(200, { 'Content-Type': 'application/json' })

		if(pathname == '/api/parsetime'){
		    var time = {
		    	'hour': date.getHours(),
		    	'minute': date.getMinutes(),
		    	'second': date.getSeconds()
		    }

		    res.end(JSON.stringify(time))
		} else if(pathname == '/api/unixtime'){

			var unixtime = {
				'unixtime': date.getTime()
			}

			res.end(JSON.stringify(unixtime))
		} else {
			console.error('invalid pathname')
		}
	} else{
		console.error('not a GET request')
	}
}).listen(port)

// Example parseUrl object returned
// Url {
//   protocol: null,
//   slashes: null,
//   auth: null,
//   host: null,
//   port: null,
//   hostname: null,
//   hash: null,
//   search: '?iso=2016-03-16T07:32:28.201Z',
//   query: { iso: '2016-03-16T07:32:28.201Z' },
//   pathname: '/api/unixtime',
//   path: '/api/unixtime?iso=2016-03-16T07:32:28.201Z',
//   href: '/api/unixtime?iso=2016-03-16T07:32:28.201Z' }
