var http = require('http')

var url1 = process.argv[2] 
var url2 = process.argv[3] 
var url3 = process.argv[4] 

var urls = [url1, url2, url3]

var contents = []
var counter = 0

// NOTE: Alternative body implementation of function getUrls(index)
// request.on('error', function(err){
//     console.error(err)
// }).on('data', function(data){
//     body.push(data)
// }).on('end', function(){
//     body = Buffer.concat(body).toString() // convert buffer-array to string
// })

// NOTE: Correct Implementation because index (similar to var i below)
//       is in a closure from being INSIDE A FUNCTION, meaning index
//       will be a local copy to each function call
function getUrls(index){
    http.get(urls[index], function callback(response){
        response.setEncoding('utf8')

	    var streamConcat = '' // LOCAL buffer for each callback
	    response.on('data', function(data){
		    streamConcat += data
	    })

	    response.on('end', function(){
            contents[index] = streamConcat
            counter++

            if(counter == 3){
                for(var j = 0; j < 3; j++){
                    console.log(contents[j])
                }
            }
	    })
    })
}

for(var i = 0; i < 3; i++){
    getUrls(i)
}

// NOTE: Wrong Implementation because var i is global,
//       so i is already incremented 3 times by the time callback returns
// for(var i = 0; i < urls.length; i++){
//     http.get(urls[i], function callback(response){
//      response.setEncoding('utf8')

//      var streamConcat = '' // LOCAL buffer for each callback
//      response.on('data', function(data){
//          streamConcat += data
//      })

//      response.on('end', function(){
//             contents[i] = streamConcat

//             if(contents.length == 3){
//                 console.log(contents[0])
//                 console.log(contents[1])
//                 console.log(contents[2])
//             }
//      })
//     })
// }


