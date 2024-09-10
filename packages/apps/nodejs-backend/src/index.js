import * as http from "node:http";

const PORT = 3000;

http
  .createServer((req, res) => {
    res.writeHead(200, {
      'Content-Type': 'text/plain; charset=UTF-8',
    });

    res.end('Hello World! This is a Node.js backend server.');
  })
  .listen(PORT);

console.log(`Server running at http://127.0.0.1:${PORT}/`);
