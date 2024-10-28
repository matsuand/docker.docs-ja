%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: How to develop and test AWS Cloud applications using LocalStack and Docker
keywords: LocalStack, container-supported development
title: Develop and test AWS Cloud applications using LocalStack and Docker
linktitle: AWS development with LocalStack
summary: |
  This guide explains how to use Docker to run LocalStack, a local AWS cloud
  stack emulator.
@y
description: LocalStack と Docker を使った AWS クラウドアプリケーションの開発とテスト
keywords: LocalStack, container-supported development
title: LocalStack と Docker を使った AWS クラウドアプリケーションの開発とテスト
linktitle: AWS development with LocalStack
summary: |
  このガイドでは Docker を使って LocalStack すなわちローカル AWS クラウドスタックエミュレーターを実行する方法について説明します。
@z

@x
subjects: [cloud-services]
languages: [js]
levels: [intermediate]
@y
subjects: [クラウドサービス]
languages: [js]
levels: [中級者向け]
@z

% params:
@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
In modern application development, testing cloud applications locally before deploying them to a live environment helps you ship faster and with more confidence. This approach involves simulating services locally, identifying and fixing issues early, and iterating quickly without incurring costs or facing the complexities of a full cloud environment. Tools like [LocalStack](https://www.localstack.cloud/) have become invaluable in this process, enabling you to emulate AWS services and containerize applications for consistent, isolated testing environments. 
@y
In modern application development, testing cloud applications locally before deploying them to a live environment helps you ship faster and with more confidence. This approach involves simulating services locally, identifying and fixing issues early, and iterating quickly without incurring costs or facing the complexities of a full cloud environment. Tools like [LocalStack](https://www.localstack.cloud/) have become invaluable in this process, enabling you to emulate AWS services and containerize applications for consistent, isolated testing environments. 
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Use Docker to launch up a LocalStack container
- Connect to LocalStack from a non-containerized application
- Connect to LocalStack from a containerized application
@y
- Use Docker to launch up a LocalStack container
- Connect to LocalStack from a non-containerized application
- Connect to LocalStack from a containerized application
@z

@x
## What is LocalStack?
@y
## What is LocalStack?
@z

@x
LocalStack is a cloud service emulator that runs in a single container on your laptop. It provides a powerful, flexible, and cost-effective way to test and develop AWS-based applications locally. 
@y
LocalStack is a cloud service emulator that runs in a single container on your laptop. It provides a powerful, flexible, and cost-effective way to test and develop AWS-based applications locally. 
@z

@x
## Why use LocalStack?
@y
## Why use LocalStack?
@z

@x
Simulating AWS services locally allows you to test how your app interacts with services like S3, Lambda, and DynamoDB without needing to connect to the real AWS cloud. You can quickly iterate on your development, avoiding the cost and complexity of deploying to the cloud during this phase.
@y
Simulating AWS services locally allows you to test how your app interacts with services like S3, Lambda, and DynamoDB without needing to connect to the real AWS cloud. You can quickly iterate on your development, avoiding the cost and complexity of deploying to the cloud during this phase.
@z

@x
By mimicking the behavior of these services locally, LocalStack enables faster feedback loops. Your app can interact with external APIs, but everything runs locally, removing the need to deal with cloud provisioning or network latency.
@y
By mimicking the behavior of these services locally, LocalStack enables faster feedback loops. Your app can interact with external APIs, but everything runs locally, removing the need to deal with cloud provisioning or network latency.
@z

@x
This makes it easier to validate integrations and test cloud-based scenarios without needing to configure IAM roles or policies in a live environment. You can simulate complex cloud architectures locally and push your changes to AWS only when you’re ready.
@y
This makes it easier to validate integrations and test cloud-based scenarios without needing to configure IAM roles or policies in a live environment. You can simulate complex cloud architectures locally and push your changes to AWS only when you’re ready.
@z

@x
## Using LocalStack with Docker
@y
## Using LocalStack with Docker
@z

@x
The [official Docker image for LocalStack](https://hub.docker.com/r/localstack/localstack) provides a convenient way to run LocalStack on your development machine. It’s free to use and doesn’t require any API key to run. You can even use [LocalStack Docker Extension](https://www.docker.com/blog/develop-your-cloud-app-locally-with-the-localstack-extension/) to use LocalStack with a graphical user interface.
@y
The [official Docker image for LocalStack](https://hub.docker.com/r/localstack/localstack) provides a convenient way to run LocalStack on your development machine. It’s free to use and doesn’t require any API key to run. You can even use [LocalStack Docker Extension](https://www.docker.com/blog/develop-your-cloud-app-locally-with-the-localstack-extension/) to use LocalStack with a graphical user interface.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
The following prerequisites are required to follow along with this how-to guide:
@y
The following prerequisites are required to follow along with this how-to guide:
@z

@x
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) 
- [Node.js](https://nodejs.org/en/download/package-manager)
- [Python and pip](https://www.python.org/downloads/)
- Basic knowledge of Docker
@y
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) 
- [Node.js](https://nodejs.org/en/download/package-manager)
- [Python and pip](https://www.python.org/downloads/)
- Basic knowledge of Docker
@z

@x
## Launching LocalStack
@y
## Launching LocalStack
@z

@x
Launch a quick demo of LocalStack by using the following steps:
@y
Launch a quick demo of LocalStack by using the following steps:
@z

@x
1. Start by [cloning a sample application](https://github.com/dockersamples/todo-list-localstack-docker). Open the terminal and run the following command:
@y
1. Start by [cloning a sample application](https://github.com/dockersamples/todo-list-localstack-docker). Open the terminal and run the following command:
@z

@x
   ```console
   $ git clone https://github.com/dockersamples/todo-list-localstack-docker
   $ cd todo-list-localstack-docker
   ```
@y
   ```console
   $ git clone https://github.com/dockersamples/todo-list-localstack-docker
   $ cd todo-list-localstack-docker
   ```
@z

@x
2. Bring up LocalStack
@y
2. Bring up LocalStack
@z

@x
   Run the following command to bring up LocalStack.   
@y
   Run the following command to bring up LocalStack.   
@z

@x
   ```console
   $ docker compose -f compose-native.yml up -d
   ```
@y
   ```console
   $ docker compose -f compose-native.yml up -d
   ```
@z

@x
   This Compose file also includes specifications for a required Mongo database. You can verify the services are up and running by visiting the Docker Desktop Dashboard.
@y
   This Compose file also includes specifications for a required Mongo database. You can verify the services are up and running by visiting the Docker Desktop Dashboard.
@z

@x
   ![Diagram showing the LocalStack and Mongo container up and running on Docker Desktop ](./images/launch-localstack.webp)
@y
   ![Diagram showing the LocalStack and Mongo container up and running on Docker Desktop ](./images/launch-localstack.webp)
@z

@x
3. Verify that LocalStack is up and running by selecting the container and checking the logs.
@y
3. Verify that LocalStack is up and running by selecting the container and checking the logs.
@z

@x
   ![Diagram showing the logs of LocalStack container ](./images/localstack-logs.webp)
@y
   ![Diagram showing the logs of LocalStack container ](./images/localstack-logs.webp)
@z

@x
4. Creating a Local Amazon S3 Bucket
@y
4. Creating a Local Amazon S3 Bucket
@z

@x
   When you create a local S3 bucket using LocalStack, you're essentially simulating the creation of an S3 bucket on AWS. This lets you to test and develop applications that interact with S3 without needing an actual AWS account.
@y
   When you create a local S3 bucket using LocalStack, you're essentially simulating the creation of an S3 bucket on AWS. This lets you to test and develop applications that interact with S3 without needing an actual AWS account.
@z

@x
   To create Local Amazon S3 bucket, you’ll need to install an `awscli-local` package to be installed on your system. This package provides the awslocal command, which is a thin wrapper around the AWS command line interface for use with LocalStack.  It lets you to test and develop against a simulated environment on your local machine without needing to access the real AWS services. You can learn more about this utility [here](https://github.com/localstack/awscli-local).
@y
   To create Local Amazon S3 bucket, you’ll need to install an `awscli-local` package to be installed on your system. This package provides the awslocal command, which is a thin wrapper around the AWS command line interface for use with LocalStack.  It lets you to test and develop against a simulated environment on your local machine without needing to access the real AWS services. You can learn more about this utility [here](https://github.com/localstack/awscli-local).
@z

@x
    ```console
    $ pip install awscli-local
    ```
@y
    ```console
    $ pip install awscli-local
    ```
@z

@x
    Create a new S3 bucket within the LocalStack environment with the following command:
@y
    Create a new S3 bucket within the LocalStack environment with the following command:
@z

@x
    ```console
    $ awslocal s3 mb s3://mysamplebucket
    ```
@y
    ```console
    $ awslocal s3 mb s3://mysamplebucket
    ```
@z

@x
    The command `s3 mb s3://mysamplebucket` tells the AWS CLI to create a new S3 bucket (mb stands for `make bucket`) named `mysamplebucket`.
@y
    The command `s3 mb s3://mysamplebucket` tells the AWS CLI to create a new S3 bucket (mb stands for `make bucket`) named `mysamplebucket`.
@z

@x
    You can verify if the S3 bucket gets created or not by selecting the LocalStack container on the Docker Desktop Dashboard and viewing the logs. The logs indicates that your LocalStack environment is configured correctly and you can now use the `mysamplebucket` for storing and retrieving objects.
@y
    You can verify if the S3 bucket gets created or not by selecting the LocalStack container on the Docker Desktop Dashboard and viewing the logs. The logs indicates that your LocalStack environment is configured correctly and you can now use the `mysamplebucket` for storing and retrieving objects.
@z

@x
    ![Diagram showing the logs of LocalStack that highlights the S3 bucket being created successfully ](./images/localstack-s3put.webp)
@y
    ![Diagram showing the logs of LocalStack that highlights the S3 bucket being created successfully ](./images/localstack-s3put.webp)
@z

@x
## Using LocalStack in development
@y
## Using LocalStack in development
@z

@x
Now that you've familiarized yourself with LocalStack, it's time to see it in action. In this demonstration, you'll use a sample application featuring a React frontend and a Node.js backend. This application stack utilizes the following components:
@y
Now that you've familiarized yourself with LocalStack, it's time to see it in action. In this demonstration, you'll use a sample application featuring a React frontend and a Node.js backend. This application stack utilizes the following components:
@z

@x
- React: A user-friendly frontend for accessing the todo-list application
- Node: A backend responsible for handling the HTTP requests.
- MongoDB: A database to store all the to-do list data
- LocalStack: Emulates the Amazon S3 service and stores and retrieve images.
@y
- React: A user-friendly frontend for accessing the todo-list application
- Node: A backend responsible for handling the HTTP requests.
- MongoDB: A database to store all the to-do list data
- LocalStack: Emulates the Amazon S3 service and stores and retrieve images.
@z

@x
![Diagram showing the tech stack of the sample todo-list application that includes LocalStack, frontend and backend services ](images/localstack-arch.webp)
@y
![Diagram showing the tech stack of the sample todo-list application that includes LocalStack, frontend and backend services ](images/localstack-arch.webp)
@z

@x
## Connecting to LocalStack from a non-containerized app
@y
## Connecting to LocalStack from a non-containerized app
@z

@x
Now it’s time to connect your app to LocalStack. The `index.js` file, located in the backend/ directory, serves as the main entry point for the backend application.
@y
Now it’s time to connect your app to LocalStack. The `index.js` file, located in the backend/ directory, serves as the main entry point for the backend application.
@z

@x
The code interacts with LocalStack’s S3 service, which is accessed via the endpoint defined by the `S3_ENDPOINT_URL` environment variable, typically set to `http://localhost:4556` for local development.
@y
The code interacts with LocalStack’s S3 service, which is accessed via the endpoint defined by the `S3_ENDPOINT_URL` environment variable, typically set to `http://localhost:4556` for local development.
@z

@x
The `S3Client` from the AWS SDK is configured to use this LocalStack endpoint, along with test credentials (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`) that are also sourced from environment variables. This setup lets the application to perform operations on the locally simulated S3 service as if it were interacting with the real AWS S3, making the code flexible for different environments.
@y
The `S3Client` from the AWS SDK is configured to use this LocalStack endpoint, along with test credentials (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`) that are also sourced from environment variables. This setup lets the application to perform operations on the locally simulated S3 service as if it were interacting with the real AWS S3, making the code flexible for different environments.
@z

@x
The code uses `multer` and `multer-s3` to handle file uploads. When a user uploads an image through the /upload route, the file is stored directly in the S3 bucket simulated by LocalStack. The bucket name is retrieved from the environment variable `S3_BUCKET_NAME`. Each uploaded file is given a unique name by appending the current timestamp to the original filename. The route then returns the URL of the uploaded file within the local S3 service, making it accessible just as it would be if hosted on a real AWS S3 bucket.
@y
The code uses `multer` and `multer-s3` to handle file uploads. When a user uploads an image through the /upload route, the file is stored directly in the S3 bucket simulated by LocalStack. The bucket name is retrieved from the environment variable `S3_BUCKET_NAME`. Each uploaded file is given a unique name by appending the current timestamp to the original filename. The route then returns the URL of the uploaded file within the local S3 service, making it accessible just as it would be if hosted on a real AWS S3 bucket.
@z

@x
Let’s see it in action. Start by launching the Node.js backend service.
@y
Let’s see it in action. Start by launching the Node.js backend service.
@z

@x
1. Change to the backend/ directory
@y
1. Change to the backend/ directory
@z

@x
   ```console
   $ cd backend/
   ```
@y
   ```console
   $ cd backend/
   ```
@z

@x
2. Install the required dependencies:
@y
2. Install the required dependencies:
@z

@x
   ```console
   $ npm install
   ```
@y
   ```console
   $ npm install
   ```
@z

@x
3. Setting up AWS environment variables
@y
3. Setting up AWS environment variables
@z

@x
   The `.env` file located in the backend/ directory already contains placeholder credentials and configuration values that LocalStack uses to emulate AWS services. The `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are placeholder credentials, while `S3_BUCKET_NAME` and `S3_ENDPOINT_URL` are configuration settings. No changes are needed as these values are already correctly set for LocalStack.
@y
   The `.env` file located in the backend/ directory already contains placeholder credentials and configuration values that LocalStack uses to emulate AWS services. The `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are placeholder credentials, while `S3_BUCKET_NAME` and `S3_ENDPOINT_URL` are configuration settings. No changes are needed as these values are already correctly set for LocalStack.
@z

@x
   > [!TIP]
   >
   > Given that you’re running Mongo in a Docker container and the backend Node app is running natively on your host, ensure that  `MONGODB_URI=mongodb://localhost:27017/todos` is set in your `.env` file.
@y
   > [!TIP]
   >
   > Given that you’re running Mongo in a Docker container and the backend Node app is running natively on your host, ensure that  `MONGODB_URI=mongodb://localhost:27017/todos` is set in your `.env` file.
@z

@x
   ```plaintext
   MONGODB_URI=mongodb://localhost:27017/todos
   AWS_ACCESS_KEY_ID=test
   AWS_SECRET_ACCESS_KEY=test
   S3_BUCKET_NAME=mysamplebucket
   S3_ENDPOINT_URL=http://localhost:4566
   AWS_REGION=us-east-1
   ```
@y
   ```plaintext
   MONGODB_URI=mongodb://localhost:27017/todos
   AWS_ACCESS_KEY_ID=test
   AWS_SECRET_ACCESS_KEY=test
   S3_BUCKET_NAME=mysamplebucket
   S3_ENDPOINT_URL=http://localhost:4566
   AWS_REGION=us-east-1
   ```
@z

@x
   While the AWS SDK might typically use environment variables starting with `AWS_`, this specific application directly references the following `S3_*` variables in the index.js file (under the `backend/` directory) to configure the S3Client. 
@y
   While the AWS SDK might typically use environment variables starting with `AWS_`, this specific application directly references the following `S3_*` variables in the index.js file (under the `backend/` directory) to configure the S3Client. 
@z

@x
   ```js
   const s3 = new S3Client({
     endpoint: process.env.S3_ENDPOINT_URL, // Use the provided endpoint or fallback to defaults
     credentials: {
       accessKeyId: process.env.AWS_ACCESS_KEY_ID || 'default_access_key', // Default values for development
       secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY || 'default_secret_key',  
     },
   });
   ```
@y
   ```js
   const s3 = new S3Client({
     endpoint: process.env.S3_ENDPOINT_URL, // Use the provided endpoint or fallback to defaults
     credentials: {
       accessKeyId: process.env.AWS_ACCESS_KEY_ID || 'default_access_key', // Default values for development
       secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY || 'default_secret_key',  
     },
   });
   ```
@z

@x
4. Start the backend server:
@y
4. Start the backend server:
@z

@x
   ```console
   $ node index.js
   ```
@y
   ```console
   $ node index.js
   ```
@z

@x
    You will see the message that the backend service has successfully started at port 5000.
@y
    You will see the message that the backend service has successfully started at port 5000.
@z

@x
## Start the frontend service
@y
## Start the frontend service
@z

@x
To start the frontend service, open a new terminal and follow these steps:
@y
To start the frontend service, open a new terminal and follow these steps:
@z

@x
1. Navigate to the `frontend` directory:
@y
1. Navigate to the `frontend` directory:
@z

@x
   ```console
   $ cd frontend
   ```
@y
   ```console
   $ cd frontend
   ```
@z

@x
2. Install the required dependencies
@y
2. Install the required dependencies
@z

@x
   ```console
   $ npm install
   ```
@y
   ```console
   $ npm install
   ```
@z

@x
3. Start the frontend service
@y
3. Start the frontend service
@z

@x
   ```console
   $ npm run dev
   ```
@y
   ```console
   $ npm run dev
   ```
@z

@x
   By now, you should see the following message:
@y
   By now, you should see the following message:
@z

@x
   ```console
   VITE v5.4.2  ready in 110 ms
   ➜  Local: http://localhost:5173/
   ➜  Network: use --host to expose
   ➜  press h + enter to show help
   ```
@y
   ```console
   VITE v5.4.2  ready in 110 ms
   ➜  Local: http://localhost:5173/
   ➜  Network: use --host to expose
   ➜  press h + enter to show help
   ```
@z

@x
   You can now access the app via [http://localhost:5173](http://localhost:5173). Go ahead, and upload an image by choosing an image file and clicking the **Upload** button.
@y
   You can now access the app via [http://localhost:5173](http://localhost:5173). Go ahead, and upload an image by choosing an image file and clicking the **Upload** button.
@z

@x
   ![Diagram showing a working todo-list application](images/localstack-todolist.webp)
@y
   ![Diagram showing a working todo-list application](images/localstack-todolist.webp)
@z

@x
   You can verify the image is uploaded to the S3 bucket by checking the LocalStack container logs:
@y
   You can verify the image is uploaded to the S3 bucket by checking the LocalStack container logs:
@z

@x
   ![Diagram showing the logs of the LocalStack that highlights image uploaded to the emulated S3 bucket](images/localstack-todolist-s3put.webp)
@y
   ![Diagram showing the logs of the LocalStack that highlights image uploaded to the emulated S3 bucket](images/localstack-todolist-s3put.webp)
@z

@x
   The `200` status code signifies that the `putObject` operation, which involves uploading an object to the S3 bucket, was executed successfully within the LocalStack environment. LocalStack logs this entry to provide visibility into the operations being performed. It helps debug and confirm that your application is interacting correctly with the emulated AWS services. 
@y
   The `200` status code signifies that the `putObject` operation, which involves uploading an object to the S3 bucket, was executed successfully within the LocalStack environment. LocalStack logs this entry to provide visibility into the operations being performed. It helps debug and confirm that your application is interacting correctly with the emulated AWS services. 
@z

@x
   Since LocalStack is designed to simulate AWS services locally, this log entry shows that your application is functioning as expected when performing cloud operations in a local sandbox environment.
@y
   Since LocalStack is designed to simulate AWS services locally, this log entry shows that your application is functioning as expected when performing cloud operations in a local sandbox environment.
@z

@x
## Connecting to LocalStack from containerized Node app
@y
## Connecting to LocalStack from containerized Node app
@z

@x
Now that you have learnt how to connect a non-containerized Node.js application to LocalStack, it's time to explore the necessary changes to run the complete application stack in a containerized environment. To achieve this, you will create a Compose file specifying all required services - frontend, backend, database, and LocalStack.
@y
Now that you have learnt how to connect a non-containerized Node.js application to LocalStack, it's time to explore the necessary changes to run the complete application stack in a containerized environment. To achieve this, you will create a Compose file specifying all required services - frontend, backend, database, and LocalStack.
@z

@x
1. Examine the Docker Compose file. 
@y
1. Examine the Docker Compose file. 
@z

@x
   The following Docker Compose file defines four services: `backend`, `frontend`, `mongodb`, and `localstack`. The `backend` and `frontend` services are your Node.js applications, while `mongodb` provides a database and `localstack` simulates AWS services like S3.
@y
   The following Docker Compose file defines four services: `backend`, `frontend`, `mongodb`, and `localstack`. The `backend` and `frontend` services are your Node.js applications, while `mongodb` provides a database and `localstack` simulates AWS services like S3.
@z

@x
   The `backend` service depends on `localstack` and `mongodb` services, ensuring they are running before it starts. It also uses a .env file for environment variables. The frontend service depends on the backend and sets the API URL. The `mongodb` service uses a persistent volume for data storage, and `localstack` is configured to run the S3 service. This setup lets you to develop and test your application locally with AWS-like services.
@y
   The `backend` service depends on `localstack` and `mongodb` services, ensuring they are running before it starts. It also uses a .env file for environment variables. The frontend service depends on the backend and sets the API URL. The `mongodb` service uses a persistent volume for data storage, and `localstack` is configured to run the S3 service. This setup lets you to develop and test your application locally with AWS-like services.
@z

@x
   ```yaml
   services:
      backend:
        build:
          context: ./backend
          dockerfile: Dockerfile
        ports:
          - 5000:5000
        depends_on:
          - localstack
          - mongodb
        env_file:
          - backend/.env
@y
   ```yaml
   services:
      backend:
        build:
          context: ./backend
          dockerfile: Dockerfile
        ports:
          - 5000:5000
        depends_on:
          - localstack
          - mongodb
        env_file:
          - backend/.env
@z

@x
       frontend:
         build:
           context: ./frontend
           dockerfile: Dockerfile
         ports:
           - 5173:5173
         depends_on:
           - backend
         environment:
           - REACT_APP_API_URL=http://backend:5000/api
@y
       frontend:
         build:
           context: ./frontend
           dockerfile: Dockerfile
         ports:
           - 5173:5173
         depends_on:
           - backend
         environment:
           - REACT_APP_API_URL=http://backend:5000/api
@z

@x
        mongodb:
          image: mongo
          container_name: mongodb
          volumes:
            - mongodbdata:/data/db
          ports:
            - 27017:27017
@y
        mongodb:
          image: mongo
          container_name: mongodb
          volumes:
            - mongodbdata:/data/db
          ports:
            - 27017:27017
@z

@x
          localstack:
            image: localstack/localstack
            container_name: localstack
            ports:
              - 4566:4566
            environment:
              - SERVICES=s3
              - GATEWAY_LISTEN=0.0.0.0:4566
            volumes:
              - ./localstack:/docker-entrypoint-initaws.d"
@y
          localstack:
            image: localstack/localstack
            container_name: localstack
            ports:
              - 4566:4566
            environment:
              - SERVICES=s3
              - GATEWAY_LISTEN=0.0.0.0:4566
            volumes:
              - ./localstack:/docker-entrypoint-initaws.d"
@z

@x
   volumes:
     mongodbdata:
   ```
@y
   volumes:
     mongodbdata:
   ```
@z

@x
2. Modify the `.env` file under the `backend/` directory to have the resources connect using the internal network names.
@y
2. Modify the `.env` file under the `backend/` directory to have the resources connect using the internal network names.
@z

@x
   > [!TIP]
   > Given the previous Compose file, the app would connect to LocalStack using the hostname `localstack` while Mongo would connect using the hostname `mongodb`.
@y
   > [!TIP]
   > Given the previous Compose file, the app would connect to LocalStack using the hostname `localstack` while Mongo would connect using the hostname `mongodb`.
@z

@x
   ```plaintext
   MONGODB_URI=mongodb://mongodb:27017/todos
   AWS_ACCESS_KEY_ID=test
   AWS_SECRET_ACCESS_KEY=test
   S3_BUCKET_NAME=mysamplebucket
   S3_ENDPOINT_URL=http://localstack:4566
   AWS_REGION=us-east-1
   ```
@y
   ```plaintext
   MONGODB_URI=mongodb://mongodb:27017/todos
   AWS_ACCESS_KEY_ID=test
   AWS_SECRET_ACCESS_KEY=test
   S3_BUCKET_NAME=mysamplebucket
   S3_ENDPOINT_URL=http://localstack:4566
   AWS_REGION=us-east-1
   ```
@z

@x
3. Stop the running services
@y
3. Stop the running services
@z

@x
   Ensure that you stop the Node frontend and backend service from the previous step by pressing “Ctrl+C” in the terminal. Also, you'll need to stop the LocalStack and Mongo containers by selecting them in the Docker Desktop Dashboard and selecting the "Delete" button. 
@y
   Ensure that you stop the Node frontend and backend service from the previous step by pressing “Ctrl+C” in the terminal. Also, you'll need to stop the LocalStack and Mongo containers by selecting them in the Docker Desktop Dashboard and selecting the "Delete" button. 
@z

@x
4. Start the application stack by executing the following command at the root of your cloned project directory:
@y
4. Start the application stack by executing the following command at the root of your cloned project directory:
@z

@x
   ```console
   $ docker compose -f compose.yml up -d --build
   ```
@y
   ```console
   $ docker compose -f compose.yml up -d --build
   ```
@z

@x
   After a brief moment, the application will be up and running.
@y
   After a brief moment, the application will be up and running.
@z

@x
5. Create an S3 bucket manually
@y
5. Create an S3 bucket manually
@z

@x
   The AWS S3 bucket is not created beforehand by the Compose file. Run the following command to create a new bucket within the LocalStack environment:
@y
   The AWS S3 bucket is not created beforehand by the Compose file. Run the following command to create a new bucket within the LocalStack environment:
@z

@x
   ```console
   $ awslocal s3 mb s3://mysamplebucket
   ```
@y
   ```console
   $ awslocal s3 mb s3://mysamplebucket
   ```
@z

@x
   The command creates an S3 bucket named `mysamplebucket`.
@y
   The command creates an S3 bucket named `mysamplebucket`.
@z

@x
   Open [http://localhost:5173](http://localhost:5173) to access the complete to-do list application and start uploading images to the Amazon S3 bucket. 
@y
   Open [http://localhost:5173](http://localhost:5173) to access the complete to-do list application and start uploading images to the Amazon S3 bucket. 
@z

@x
   > [!TIP]
   > To optimize performance and reduce upload times during development, consider uploading smaller image files. Larger images may take longer to process and could impact the overall responsiveness of the application.
@y
   > [!TIP]
   > To optimize performance and reduce upload times during development, consider uploading smaller image files. Larger images may take longer to process and could impact the overall responsiveness of the application.
@z

@x
## Recap
@y
## Recap
@z

@x
This guide has walked you through setting up a local development environment using LocalStack and Docker. You’ve learned how to test AWS-based applications locally, reducing costs and increasing the efficiency of your development workflow.
@y
This guide has walked you through setting up a local development environment using LocalStack and Docker. You’ve learned how to test AWS-based applications locally, reducing costs and increasing the efficiency of your development workflow.
@z
