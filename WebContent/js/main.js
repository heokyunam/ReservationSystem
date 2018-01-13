var http = require("http");

http.createServer(function(request, response) {
	response.writeHead(200, {'Content-Type' : 'text/plain'});
	
	response.end("hello World\n");
}).listen(8081);

console.log("Server running")