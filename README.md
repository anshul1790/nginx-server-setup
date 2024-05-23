# nginx-server-setup

## Just for Learning Perspective
---

Setting up the NGNIX router using base alpine image for localhost website that is running on port 3000

### Step 1 - Run node one pager service in your local machine
Assume that you are running local node service using this basic code. Idea here is to learn about nginx rather than focusing much on Node.
```
    const express = require('express');
    const app = express();
    const port = 3000;

    app.get('/', (req, res) => {
    res.send('Hello from the Node.js server!');
    });

    app.listen(port, () => {
    console.log(`Node.js server is running on http://localhost:${port}`);
    });
```
#### Just follow the steps
- mkdir node-app && cd node-app
- touch index.js
- add above content in index.js
#### Finally hit the below commands
```
npm init -y
npm install express
npm start
```
---
### Step 2 - Containerize the NGINX server
Clone this git repository that has Docker and NGNIX server configuration and move to this directory
#### Run this docker file
```
docker build -t nginx-alpine-local .
docker run -d -p 8080:80 --name my-nginx-container nginx-alpine-local
docker ps
docker exec -it my-nginx-container sh
```
---
### Step 3 - Verifying it's Working
- Now you have the node service running in your local machine
- For that run `localhost:3000`
- Check the docker container running using `docker ps` command
- The port binding has been done on 8080 port, so if you run `localhost:8080`
- The requests would be routed from NGINX server
- You can validate the same by getting in you docker container by using command
`docker exec -it my-nginx-container sh`
- Then check the NGINX logs here - 
`tail /var/log/nginx/access.log`
---
You can add as much as configuration in your NGINX server. This server is running in your local serving as reverse proxy server and give many benfits like Load Balancing, Cache, Protecting from Attacks etc.


You can update this NGINX file and play around with it as you like.
