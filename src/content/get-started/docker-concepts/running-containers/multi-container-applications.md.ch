%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リン クへの (no slash) 対応

@x
title: Multi-container applications
weight: 5
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you the significance of multi-container application and how it is different from single-container application
@y
title: Multi-container applications
weight: 5
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you the significance of multi-container application and how it is different from single-container application
@z

@x
{{< youtube-embed 1jUwR6F9hvM >}}
@y
{{< youtube-embed 1jUwR6F9hvM >}}
@z

@x
## Explanation
@y
## Explanation
@z

@x
Starting up a single-container application is easy. For example, a Python script that performs a specific data processing task runs within a container with all its dependencies. Similarly, a Node.js application serving a static website with a small API endpoint can be effectively containerized with all its necessary libraries and dependencies. However, as applications grow in size, managing them as individual containers becomes more difficult.
@y
Starting up a single-container application is easy. For example, a Python script that performs a specific data processing task runs within a container with all its dependencies. Similarly, a Node.js application serving a static website with a small API endpoint can be effectively containerized with all its necessary libraries and dependencies. However, as applications grow in size, managing them as individual containers becomes more difficult.
@z

@x
Imagine the data processing Python script needs to connect to a database. Suddenly, you're now managing not just the script but also a database server within the same container. If the script requires user logins, you'll need an authentication mechanism, further bloating the container size. 
@y
Imagine the data processing Python script needs to connect to a database. Suddenly, you're now managing not just the script but also a database server within the same container. If the script requires user logins, you'll need an authentication mechanism, further bloating the container size. 
@z

@x
One best practice for containers is that each container should do one thing and do it well. While there are exceptions to this rule, avoid the tendency to have one container do multiple things.
@y
One best practice for containers is that each container should do one thing and do it well. While there are exceptions to this rule, avoid the tendency to have one container do multiple things.
@z

@x
Now you might ask, "Do I need to run these containers separately? If I run them separately, how shall I connect them all together?"
@y
Now you might ask, "Do I need to run these containers separately? If I run them separately, how shall I connect them all together?"
@z

@x
While `docker run` is a convenient tool for launching containers, it becomes difficult to manage a growing application stack with it. Here's why:
@y
While `docker run` is a convenient tool for launching containers, it becomes difficult to manage a growing application stack with it. Here's why:
@z

@x
- Imagine running several `docker run` commands (frontend, backend, and database) with different configurations for development, testing, and production environments. It's error-prone and time-consuming.
- Applications often rely on each other. Manually starting containers in a specific order and managing network connections become difficult as the stack expands.
- Each application needs its `docker run` command, making it difficult to scale individual services. Scaling the entire application means potentially wasting resources on components that don't need a boost.
- Persisting data for each application requires separate volume mounts or configurations within each `docker run` command. This creates a scattered data management approach.
- Setting environment variables for each application through separate `docker run` commands is tedious and error-prone.
@y
- Imagine running several `docker run` commands (frontend, backend, and database) with different configurations for development, testing, and production environments. It's error-prone and time-consuming.
- Applications often rely on each other. Manually starting containers in a specific order and managing network connections become difficult as the stack expands.
- Each application needs its `docker run` command, making it difficult to scale individual services. Scaling the entire application means potentially wasting resources on components that don't need a boost.
- Persisting data for each application requires separate volume mounts or configurations within each `docker run` command. This creates a scattered data management approach.
- Setting environment variables for each application through separate `docker run` commands is tedious and error-prone.
@z

@x
That's where Docker Compose comes to the rescue.
@y
That's where Docker Compose comes to the rescue.
@z

@x
Docker Compose defines your entire multi-container application in a single YAML file called `compose.yml`. This file specifies configurations for all your containers, their dependencies, environment variables, and even volumes and networks. With Docker Compose:
@y
Docker Compose defines your entire multi-container application in a single YAML file called `compose.yml`. This file specifies configurations for all your containers, their dependencies, environment variables, and even volumes and networks. With Docker Compose:
@z

@x
- You don't need to run multiple `docker run` commands. All you need to do is define your entire multi-container application in a single YAML file. This centralizes configuration and simplifies management.
- You can run containers in a specific order and manage network connections easily.
- You can simply scale individual services up or down within the multi-container setup. This allows for efficient allocation based on real-time needs.
- You can implement persistent volumes with ease.
- It's easy to set environment variables once in your Docker Compose file.
@y
- You don't need to run multiple `docker run` commands. All you need to do is define your entire multi-container application in a single YAML file. This centralizes configuration and simplifies management.
- You can run containers in a specific order and manage network connections easily.
- You can simply scale individual services up or down within the multi-container setup. This allows for efficient allocation based on real-time needs.
- You can implement persistent volumes with ease.
- It's easy to set environment variables once in your Docker Compose file.
@z

@x
By leveraging Docker Compose for running multi-container setups, you can build complex applications with modularity, scalability, and consistency at their core.
@y
By leveraging Docker Compose for running multi-container setups, you can build complex applications with modularity, scalability, and consistency at their core.
@z

@x
## Try it out
@y
## Try it out
@z

@x
In this hands-on guide, you'll first see how to build and run a counter web application based on Node.js, an Nginx reverse proxy, and a Redis database using the `docker run` commands. You’ll also see how you can simplify the entire deployment process using Docker Compose.
@y
In this hands-on guide, you'll first see how to build and run a counter web application based on Node.js, an Nginx reverse proxy, and a Redis database using the `docker run` commands. You’ll also see how you can simplify the entire deployment process using Docker Compose.
@z

@x
### Set up
@y
### Set up
@z

@x
1. Get the sample application. If you have Git, you can clone the repository for the sample application. Otherwise, you can download the sample application. Choose one of the following options.
@y
1. Get the sample application. If you have Git, you can clone the repository for the sample application. Otherwise, you can download the sample application. Choose one of the following options.
@z

@x
   {{< tabs >}}
   {{< tab name="Clone with git" >}}
@y
   {{< tabs >}}
   {{< tab name="Clone with git" >}}
@z

@x
   Use the following command in a terminal to clone the sample application repository.
@y
   Use the following command in a terminal to clone the sample application repository.
@z

@x
   ```console
   $ git clone https://github.com/dockersamples/nginx-node-redis
   ```
@y
   ```console
   $ git clone https://github.com/dockersamples/nginx-node-redis
   ```
@z

@x
   Navigate into the `nginx-node-redis` directory:
@y
   Navigate into the `nginx-node-redis` directory:
@z

@x
   ```console
   $ cd nginx-node-redis
   ```
@y
   ```console
   $ cd nginx-node-redis
   ```
@z

@x
   Inside this directory, you'll find two sub-directories - `nginx` and `web`.
@y
   Inside this directory, you'll find two sub-directories - `nginx` and `web`.
@z

@x
   {{< /tab >}}
   {{< tab name="Download" >}}
@y
   {{< /tab >}}
   {{< tab name="Download" >}}
@z

@x
   Download the source and extract it.
@y
   Download the source and extract it.
@z

@x
   {{< button url="https://github.com/dockersamples/nginx-node-redis/archive/refs/heads/main.zip" text="Download the source" >}}
@y
   {{< button url="https://github.com/dockersamples/nginx-node-redis/archive/refs/heads/main.zip" text="Download the source" >}}
@z

@x
   Navigate into the `nginx-node-redis-main` directory:
@y
   Navigate into the `nginx-node-redis-main` directory:
@z

@x
   ```console
   $ cd nginx-node-redis-main
   ```
@y
   ```console
   $ cd nginx-node-redis-main
   ```
@z

@x
   Inside this directory, you'll find two sub-directories - `nginx` and `web`.
@y
   Inside this directory, you'll find two sub-directories - `nginx` and `web`.
@z

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
2. [Download and install](/get-started/get-docker.md) Docker Desktop.
@y
2. [Download and install](get-started/get-docker.md) Docker Desktop.
@z

@x
### Build the images
@y
### Build the images
@z

@x
1. Navigate into the `nginx` directory to build the image by running the following command:
@y
1. Navigate into the `nginx` directory to build the image by running the following command:
@z

@x
    ```console
    $ docker build -t nginx .
    ```
@y
    ```console
    $ docker build -t nginx .
    ```
@z

@x
2. Navigate into the `web` directory and run the following command to build the first web image:
@y
2. Navigate into the `web` directory and run the following command to build the first web image:
@z

@x
    ```console
    $ docker build -t web .
    ```
@y
    ```console
    $ docker build -t web .
    ```
@z

@x
### Run the containers
@y
### Run the containers
@z

@x
1. Before you can run a multi-container application, you need to create a network for them all to communicate through. You can do so using the `docker network create` command:
@y
1. Before you can run a multi-container application, you need to create a network for them all to communicate through. You can do so using the `docker network create` command:
@z

@x
    ```console
    $ docker network create sample-app
    ```
@y
    ```console
    $ docker network create sample-app
    ```
@z

@x
2. Start the Redis container by running the following command, which will attach it to the previously created network and create a network alias (useful for DNS lookups):
@y
2. Start the Redis container by running the following command, which will attach it to the previously created network and create a network alias (useful for DNS lookups):
@z

@x
    ```console
    $ docker run -d  --name redis --network sample-app --network-alias redis redis
    ```
@y
    ```console
    $ docker run -d  --name redis --network sample-app --network-alias redis redis
    ```
@z

@x
3. Start the first web container by running the following command:
@y
3. Start the first web container by running the following command:
@z

@x
    ```console
    $ docker run -d --name web1 -h web1 --network sample-app --network-alias web1 web
    ```
@y
    ```console
    $ docker run -d --name web1 -h web1 --network sample-app --network-alias web1 web
    ```
@z

@x
4. Start the second web container by running the following:
@y
4. Start the second web container by running the following:
@z

@x
    ```console
    $ docker run -d --name web2 -h web2 --network sample-app --network-alias web2 web
    ```
@y
    ```console
    $ docker run -d --name web2 -h web2 --network sample-app --network-alias web2 web
    ```
@z

@x
5. Start the Nginx container by running the following command:
@y
5. Start the Nginx container by running the following command:
@z

@x
    ```console
    $ docker run -d --name nginx --network sample-app  -p 80:80 nginx
    ```
@y
    ```console
    $ docker run -d --name nginx --network sample-app  -p 80:80 nginx
    ```
@z

@x
     > [!NOTE]
     >
     > Nginx is typically used as a reverse proxy for web applications, routing traffic to backend servers. In this case, it routes to the Node.js backend containers (web1 or web2).
@y
     > [!NOTE]
     >
     > Nginx is typically used as a reverse proxy for web applications, routing traffic to backend servers. In this case, it routes to the Node.js backend containers (web1 or web2).
@z

@x
6.  Verify the containers are up by running the following command:
@y
6.  Verify the containers are up by running the following command:
@z

@x
    ```console
    $ docker ps
    ```
@y
    ```console
    $ docker ps
    ```
@z

@x
    You will see output like the following: 
@y
    You will see output like the following: 
@z

@x
    ```text
    CONTAINER ID   IMAGE     COMMAND                  CREATED              STATUS              PORTS                NAMES
    2cf7c484c144   nginx     "/docker-entrypoint.…"   9 seconds ago        Up 8 seconds        0.0.0.0:80->80/tcp   nginx
    7a070c9ffeaa   web       "docker-entrypoint.s…"   19 seconds ago       Up 18 seconds                            web2
    6dc6d4e60aaf   web       "docker-entrypoint.s…"   34 seconds ago       Up 33 seconds                            web1
    008e0ecf4f36   redis     "docker-entrypoint.s…"   About a minute ago   Up About a minute   6379/tcp             redis
    ```
@y
    ```text
    CONTAINER ID   IMAGE     COMMAND                  CREATED              STATUS              PORTS                NAMES
    2cf7c484c144   nginx     "/docker-entrypoint.…"   9 seconds ago        Up 8 seconds        0.0.0.0:80->80/tcp   nginx
    7a070c9ffeaa   web       "docker-entrypoint.s…"   19 seconds ago       Up 18 seconds                            web2
    6dc6d4e60aaf   web       "docker-entrypoint.s…"   34 seconds ago       Up 33 seconds                            web1
    008e0ecf4f36   redis     "docker-entrypoint.s…"   About a minute ago   Up About a minute   6379/tcp             redis
    ```
@z

@x
7. If you look at the Docker Dashboard, you can see the containers and dive deeper into their configuration.
@y
7. If you look at the Docker Dashboard, you can see the containers and dive deeper into their configuration.
@z

@x
   ![A screenshot of Docker Dashboard showing multi-container applications](images/multi-container-apps.webp?w=5000&border=true)
@y
   ![A screenshot of Docker Dashboard showing multi-container applications](images/multi-container-apps.webp?w=5000&border=true)
@z

@x
8. With everything up and running, you can open [http://localhost](http://localhost) in your browser to see the site. Refresh the page several times to see the host that’s handling the request and the total number of requests:
@y
8. With everything up and running, you can open [http://localhost](http://localhost) in your browser to see the site. Refresh the page several times to see the host that’s handling the request and the total number of requests:
@z

@x
    ```console
    web2: Number of visits is: 9
    web1: Number of visits is: 10
    web2: Number of visits is: 11
    web1: Number of visits is: 12
    ```
@y
    ```console
    web2: Number of visits is: 9
    web1: Number of visits is: 10
    web2: Number of visits is: 11
    web1: Number of visits is: 12
    ```
@z

@x
    > [!NOTE]
    >
    > You might have noticed that Nginx, acting as a reverse proxy, likely distributes incoming requests in a round-robin fashion between the two backend containers. This means each request might be directed to a different container (web1 and web2) on a rotating basis. The output shows consecutive increments for both the web1 and web2 containers and the actual counter value stored in Redis is updated only after the response is sent back to the client.
@y
    > [!NOTE]
    >
    > You might have noticed that Nginx, acting as a reverse proxy, likely distributes incoming requests in a round-robin fashion between the two backend containers. This means each request might be directed to a different container (web1 and web2) on a rotating basis. The output shows consecutive increments for both the web1 and web2 containers and the actual counter value stored in Redis is updated only after the response is sent back to the client.
@z

@x
9. You can use the Docker Dashboard to remove the containers by selecting the containers and selecting the **Delete** button.
@y
9. You can use the Docker Dashboard to remove the containers by selecting the containers and selecting the **Delete** button.
@z

@x
   ![A screenshot of Docker Dashboard showing how to delete the multi-container applications](images/delete-multi-container-apps.webp?border=true)
@y
   ![A screenshot of Docker Dashboard showing how to delete the multi-container applications](images/delete-multi-container-apps.webp?border=true)
@z

@x
## Simplify the deployment using Docker Compose
@y
## Simplify the deployment using Docker Compose
@z

@x
Docker Compose provides a structured and streamlined approach for managing multi-container deployments. As stated earlier, with Docker Compose, you don’t need to run multiple `docker run` commands. All you need to do is define your entire multi-container application in a single YAML file called `compose.yml`. Let’s see how it works.
@y
Docker Compose provides a structured and streamlined approach for managing multi-container deployments. As stated earlier, with Docker Compose, you don’t need to run multiple `docker run` commands. All you need to do is define your entire multi-container application in a single YAML file called `compose.yml`. Let’s see how it works.
@z

@x
Navigate to the root of the project directory. Inside this directory, you'll find a file named `compose.yml`. This YAML file is where all the magic happens. It defines all the services that make up your application, along with their configurations. Each service specifies its image, ports, volumes, networks, and any other settings necessary for its functionality.
@y
Navigate to the root of the project directory. Inside this directory, you'll find a file named `compose.yml`. This YAML file is where all the magic happens. It defines all the services that make up your application, along with their configurations. Each service specifies its image, ports, volumes, networks, and any other settings necessary for its functionality.
@z

@x
1. Use the `docker compose up` command to start the application:
@y
1. Use the `docker compose up` command to start the application:
@z

@x
    ```console
    $ docker compose up -d --build
    ```
@y
    ```console
    $ docker compose up -d --build
    ```
@z

@x
    When you run this command, you should see output similar to the following:
@y
    When you run this command, you should see output similar to the following:
@z

@x
    ```console
    Running 5/5
    ✔ Network nginx-nodejs-redis_default    Created                                                0.0s
    ✔ Container nginx-nodejs-redis-web1-1   Started                                                0.1s
    ✔ Container nginx-nodejs-redis-redis-1  Started                                                0.1s
    ✔ Container nginx-nodejs-redis-web2-1   Started                                                0.1s
    ✔ Container nginx-nodejs-redis-nginx-1  Started
    ```
@y
    ```console
    Running 5/5
    ✔ Network nginx-nodejs-redis_default    Created                                                0.0s
    ✔ Container nginx-nodejs-redis-web1-1   Started                                                0.1s
    ✔ Container nginx-nodejs-redis-redis-1  Started                                                0.1s
    ✔ Container nginx-nodejs-redis-web2-1   Started                                                0.1s
    ✔ Container nginx-nodejs-redis-nginx-1  Started
    ```
@z

@x
2. If you look at the Docker Dashboard, you can see the containers and dive deeper into their configuration.
@y
2. If you look at the Docker Dashboard, you can see the containers and dive deeper into their configuration.
@z

@x
    ![A screenshot of Docker Dashboard showing the containers of the application stack deployed using Docker Compose](images/list-containers.webp?border=true)
@y
    ![A screenshot of Docker Dashboard showing the containers of the application stack deployed using Docker Compose](images/list-containers.webp?border=true)
@z

@x
3. Alternatively, you can use the Docker Dashboard to remove the containers by selecting the application stack and selecting the **Delete** button.
@y
3. Alternatively, you can use the Docker Dashboard to remove the containers by selecting the application stack and selecting the **Delete** button.
@z

@x
   ![A screenshot of Docker Dashboard that shows how to remove the containers that you deployed using Docker Compose](images/delete-containers.webp?border=true)
@y
   ![A screenshot of Docker Dashboard that shows how to remove the containers that you deployed using Docker Compose](images/delete-containers.webp?border=true)
@z

@x
In this guide, you learned how easy it is to use Docker Compose to start and stop a multi-container application compared to `docker run` which is error-prone and difficult to manage.
@y
In this guide, you learned how easy it is to use Docker Compose to start and stop a multi-container application compared to `docker run` which is error-prone and difficult to manage.
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
* [`docker container run` CLI reference](reference/cli/docker/container/run/)
* [What is Docker Compose](/get-started/docker-concepts/the-basics/what-is-docker-compose/)
@y
* [`docker container run` CLI reference](reference/cli/docker/container/run/)
* [What is Docker Compose](__SUBDIR__/get-started/docker-concepts/the-basics/what-is-docker-compose/)
@z
