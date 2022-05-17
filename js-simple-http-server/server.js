const http = require('http');
const url = require('url');
const port = 5678;
const host = '0.0.0.0';

const server = http.createServer(function (req, res) {
    const my_webserver_id = process.env.WEBSERVER_ID;
    const parsedURL = url.parse(req.url, true);
    if (parsedURL.pathname === '/health') {
        res.statusCode = 200;
        res.setHeader('Cache-control', 'no-cache');
        res.end("web-server " + my_webserver_id);
    } else {
        res.statusCode = 200;
        res.setHeader('Cache-control', 'no-cache');
        res.end("Hello from web-server " + my_webserver_id);
    }
});

server.listen(port, host, function () {
    console.log('Web server is running');
});