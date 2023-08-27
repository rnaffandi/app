1. Create terraform IAM for execution & authentication to the AWS by terraform
2. Create SSH KeyPair manually from AWS console

# Create instance with Terraform

using Terraform to manage IaC 
1. find directory terraform code(.terraform)
2. initiate terraforn code using command `terraform init`
3. view changes using command `terraform plan`
4. apply changes using command `terraform apply`

# Simply App "Hello world" (node js)

1. For running this program in the local
2. To run this code, make sure you have Node.js installed on your system. Save the code in a file, for example, app.js, and then open your terminal or command prompt, navigate to the folder containing the file, and run:
3. typing `node test.js`
4. After running this command, you should see the message "Server is running on http://localhost:3000/". You can access the server by opening a web browser and navigating to http://localhost:3000/, or you can use tools like curl to make a request from the terminal:
5. open new terminal and type `curl http://localhost:3000/` to see respond in curl

# How to install docker on both instance

## Instance-a

1. ssh using keypair because the vm is open to public port 22
2. install docker

This guide will walk you through the steps to install Docker on Ubuntu.

Prerequisites

- An Ubuntu system (18.04 or later recommended)

### Installation Steps

1. **Update Package Index:**

   Open a terminal and run the following command to update the package index:
   ```bash
   sudo apt update
   ```

2. **Install Dependencies:**

   Install required dependencies:
   ```bash
   sudo apt install apt-transport-https ca-certificates curl software-properties-common
   ```

3. **Add Docker GPG Key:**

   Add Docker's official GPG key:
   ```bash
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   ```

4. **Add Docker Repository:**

   Add Docker repository to sources:
   ```bash
   echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```

5. **Update Package Index:**

   Update package index to include Docker packages:
   ```bash
   sudo apt update
   ```

6. **Install Docker Engine:**

   Install Docker Engine:
   ```bash
   sudo apt install docker-ce docker-ce-cli containerd.io
   ```

7. **Start and Enable Docker:**

   Start Docker service and enable auto-start on boot:
   ```bash
   sudo systemctl start docker
   sudo systemctl enable docker
   ```

8. **Check Docker Version:**

   Verify Docker installation:
   ```bash
   docker --version
   ```

9. **Add User to Docker Group (Optional):**

   To avoid using `sudo` for Docker commands:
   ```bash
   sudo usermod -aG docker $USER
   ```

10. **Test Docker:**

    Test Docker installation:
    ```bash
    docker run hello-world
    ```

That's it! You've successfully installed Docker on your Ubuntu system.

--- 

## Instance-b

1. ssh using keypair because the vm is open to public port 22
2. install docker

This guide will walk you through the steps to install Docker on Ubuntu.

Prerequisites

- An Ubuntu system (18.04 or later recommended)

### Installation Steps

1. **Update Package Index:**

   Open a terminal and run the following command to update the package index:
   ```bash
   sudo apt update
   ```

2. **Install Dependencies:**

   Install required dependencies:
   ```bash
   sudo apt install apt-transport-https ca-certificates curl software-properties-common
   ```

3. **Add Docker GPG Key:**

   Add Docker's official GPG key:
   ```bash
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   ```

4. **Add Docker Repository:**

   Add Docker repository to sources:
   ```bash
   echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```

5. **Update Package Index:**

   Update package index to include Docker packages:
   ```bash
   sudo apt update
   ```

6. **Install Docker Engine:**

   Install Docker Engine:
   ```bash
   sudo apt install docker-ce docker-ce-cli containerd.io
   ```

7. **Start and Enable Docker:**

   Start Docker service and enable auto-start on boot:
   ```bash
   sudo systemctl start docker
   sudo systemctl enable docker
   ```

8. **Check Docker Version:**

   Verify Docker installation:
   ```bash
   docker --version
   ```

9. **Add User to Docker Group (Optional):**

   To avoid using `sudo` for Docker commands:
   ```bash
   sudo usermod -aG docker $USER
   ```

10. **Test Docker:**

    Test Docker installation:
    ```bash
    docker run hello-world
    ```

That's it! You've successfully installed Docker on your Ubuntu system.

--- 

Notes:
Using AWS SSH to remote server

# How to migrate the code to AWS console
```bash
use scp -i instance-privatekey.pem Dockerfile ubuntu@xxx
```
1. scp: This command is used to securely copy files and directories between hosts over an SSH connection. It stands for "secure copy."

2. -i instance-privatekey.pem: This flag specifies the identity file (private key) to use for the SSH connection. The instance-privatekey.pem is the private key file used for authentication.

3. Dockerfile: This is the name of the file you want to copy. In this case, it's the Dockerfile.

4. ubuntu@xxx: This specifies the remote destination where the file will be copied. ubuntu is the username you are using for the SSH connection. xxx represents the hostname or IP address of the remote machine.

5. So, the overall command is using scp to securely copy the Dockerfile from your local machine to a remote machine (ubuntu@xxx) using the specified private key (instance-privatekey.pem) for authentication.

6. After running this command, the Dockerfile will be copied to the remote machine, allowing you to use it for building Docker images on that machine.

# How to running test.js with docker
1. docker buildx build -t app:v.01 .
2. docker run app:v.01
----
### docker buildx build -t app:v.01 .

docker buildx build: This command is used to build a Docker image using the Buildx extension, which provides advanced features for building images.

-t app:v.01: This flag specifies the name and tag for the image being built. In this case, the image will be tagged as app with version v.01.

.: The dot . at the end represents the build context, which is the directory containing the Dockerfile and any other files needed for the build.

So, this command builds a Docker image named app with version v.01 using the Dockerfile in the current directory as the build context.

### docker run app:v.01

docker run: This command is used to run a Docker container from an image.

app:v.01: This specifies the name and tag of the image you want to run. In this case, it's the app image with version v.01.

So, this command runs a Docker container based on the app:v.01 image. The container runs an instance of your application using the image you've built in the previous step.

These commands are commonly used in the Docker workflow to build and run Docker images and containers, allowing you to package and deploy your applications in a consistent and isolated environment.

# How to deploy Nginx as reverse proxy
1. Create Nginx config for reverse proxy
2. docker run -d --name nginx-proxy -p 80:80 -v $(pwd)/nginx.conf:/home/ubuntu/app/Nginx/nginx.conf:ro nginx

# How to rollback apps deployment
1. Docker run [myregistry/app:rollbackversion]