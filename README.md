# Simply App "Hello world" (node js)
1. For running this program in the local
2. To run this code, make sure you have Node.js installed on your system. Save the code in a file, for example, app.js, and then open your terminal or command prompt, navigate to the folder containing the file, and run:
3. typing `node test.js`
4. After running this command, you should see the message "Server is running on http://localhost:3000/". You can access the server by opening a web browser and navigating to http://localhost:3000/, or you can use tools like curl to make a request from the terminal:
5. open new terminal and type `curl http://localhost:3000/` to see respond in curl

# How to install docker on both instance

## Instance APP

1. aws ssm start-session --target instance-apps
2. install docker

## Instance Proxy

1. aws ssm start-session --target instance-apps
2. install docker

Notes:
Using AWS SSM to remote server

# How to running test.js with docker
1. docker build -t app:v.01 .
2. docker push [myregistry/app:v.01]

# How to deploy node.js on instance-app
1. docker pull [myregistry/app:v.01]
2. docker run [myregistry/app:v.01]

# How to deploy Nginx as reverse proxy
1. Create Nginx config for reverse proxy
2. docker run -d --name nginx-proxy -p 80:80 -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro nginx

# How to rollback apps deployment
1. Docker run [myregistry/app:rollbackversion]

# Additional steps
using Terraform to manage IaC 
1. find directory terraform code(.terraform)
2. initiate terraforn code using command `terraform init`
3. view changes using command `terraform plan`
4. apply changes using command `terraform apply`