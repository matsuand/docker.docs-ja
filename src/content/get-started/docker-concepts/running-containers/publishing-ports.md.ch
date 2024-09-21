%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Publishing and exposing ports
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you the significance of publishing and exposing ports in Docker 
@y
title: ポートの公開
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you the significance of publishing and exposing ports in Docker 
@z

@x
{{< youtube-embed 9JnqOmJ96ds >}}
@y
{{< youtube-embed 9JnqOmJ96ds >}}
@z

@x
## Explanation
@y
## Explanation
@z

@x
If you've been following the guides so far, you understand that containers provide isolated processes for each component of your application. Each component - a React frontend, a Python API, and a Postgres database - runs in its own sandbox environment, completely isolated from everything else on your host machine. This isolation is great for security and managing dependencies, but it also means you can’t access them directly. For example, you can’t access the web app in your browser.
@y
If you've been following the guides so far, you understand that containers provide isolated processes for each component of your application. Each component - a React frontend, a Python API, and a Postgres database - runs in its own sandbox environment, completely isolated from everything else on your host machine. This isolation is great for security and managing dependencies, but it also means you can’t access them directly. For example, you can’t access the web app in your browser.
@z

@x
That’s where port publishing comes in.
@y
That’s where port publishing comes in.
@z

@x
### Publishing ports
@y
### Publishing ports
@z

@x
Publishing a port provides the ability to break through a little bit of networking isolation by setting up a forwarding rule. As an example, you can indicate that requests on your host’s port `8080` should be forwarded to the container’s port `80`. Publishing ports happens during container creation using the `-p` (or `--publish`) flag with `docker run`. The syntax is:
@y
Publishing a port provides the ability to break through a little bit of networking isolation by setting up a forwarding rule. As an example, you can indicate that requests on your host’s port `8080` should be forwarded to the container’s port `80`. Publishing ports happens during container creation using the `-p` (or `--publish`) flag with `docker run`. The syntax is:
@z

@x
```console
$ docker run -d -p HOST_PORT:CONTAINER_PORT nginx
```
@y
```console
$ docker run -d -p HOST_PORT:CONTAINER_PORT nginx
```
@z

@x
- `HOST_PORT`: The port number on your host machine where you want to receive traffic
- `CONTAINER_PORT`: The port number within the container that's listening for connections
@y
- `HOST_PORT`: The port number on your host machine where you want to receive traffic
- `CONTAINER_PORT`: The port number within the container that's listening for connections
@z

@x
For example, to publish the container's port `80` to host port `8080`:
@y
For example, to publish the container's port `80` to host port `8080`:
@z

@x
```console
$ docker run -d -p 8080:80 nginx
```
@y
```console
$ docker run -d -p 8080:80 nginx
```
@z

@x
Now, any traffic sent to port `8080` on your host machine will be forwarded to port `80` within the container.
@y
Now, any traffic sent to port `8080` on your host machine will be forwarded to port `80` within the container.
@z

@x
> [!IMPORTANT]
>
> When a port is published, it's published to all network interfaces by default. This means any traffic that reaches your machine can access the published application. Be mindful of publishing databases or any sensitive information. [Learn more about published ports here](/engine/network/#published-ports).
@y
> [!IMPORTANT]
>
> When a port is published, it's published to all network interfaces by default. This means any traffic that reaches your machine can access the published application. Be mindful of publishing databases or any sensitive information. [Learn more about published ports here](__SUBDIR__/engine/network/#published-ports).
@z

@x
### Publishing to ephemeral ports
@y
### Publishing to ephemeral ports
@z

@x
At times, you may want to simply publish the port but don’t care which host port is used. In these cases, you can let Docker pick the port for you. To do so, simply omit the `HOST_PORT` configuration. 
@y
At times, you may want to simply publish the port but don’t care which host port is used. In these cases, you can let Docker pick the port for you. To do so, simply omit the `HOST_PORT` configuration. 
@z

@x
For example, the following command will publish the container’s port `80` onto an ephemeral port on the host:
@y
For example, the following command will publish the container’s port `80` onto an ephemeral port on the host:
@z

@x
```console
$ docker run -p 80 nginx
```
@y
```console
$ docker run -p 80 nginx
```
@z

@x
Once the container is running, using `docker ps` will show you the port that was chosen:
@y
Once the container is running, using `docker ps` will show you the port that was chosen:
@z

@x
```console
docker ps
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS                    NAMES
a527355c9c53   nginx         "/docker-entrypoint.…"   4 seconds ago    Up 3 seconds    0.0.0.0:54772->80/tcp    romantic_williamson
```
@y
```console
docker ps
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS                    NAMES
a527355c9c53   nginx         "/docker-entrypoint.…"   4 seconds ago    Up 3 seconds    0.0.0.0:54772->80/tcp    romantic_williamson
```
@z

@x
In this example, the app is exposed on the host at port `54772`.
@y
In this example, the app is exposed on the host at port `54772`.
@z

@x
### Publishing all ports
@y
### Publishing all ports
@z

@x
When creating a container image, the `EXPOSE` instruction is used to indicate the packaged application will use the specified port. These ports aren't published by default. 
@y
When creating a container image, the `EXPOSE` instruction is used to indicate the packaged application will use the specified port. These ports aren't published by default. 
@z

@x
With the `-P` or `--publish-all` flag, you can automatically publish all exposed ports to ephemeral ports. This is quite useful when you’re trying to avoid port conflicts in development or testing environments.
@y
With the `-P` or `--publish-all` flag, you can automatically publish all exposed ports to ephemeral ports. This is quite useful when you’re trying to avoid port conflicts in development or testing environments.
@z

@x
For example, the following command will publish all of the exposed ports configured by the image:
@y
For example, the following command will publish all of the exposed ports configured by the image:
@z

@x
```console
$ docker run -P nginx
```
@y
```console
$ docker run -P nginx
```
@z

@x
## Try it out
@y
## Try it out
@z

@x
In this hands-on guide, you'll learn how to publish container ports using both the CLI and Docker Compose for deploying a web application.
@y
In this hands-on guide, you'll learn how to publish container ports using both the CLI and Docker Compose for deploying a web application.
@z

@x
### Use the Docker CLI
@y
### Use the Docker CLI
@z

@x
In this step, you will run a container and publish its port using the Docker CLI.
@y
In this step, you will run a container and publish its port using the Docker CLI.
@z

@x
1. [Download and install](/get-started/get-docker/) Docker Desktop.
@y
1. [Download and install](__SUBDIR__/get-started/get-docker/) Docker Desktop.
@z

@x
2. In a terminal, run the following command to start a new container:
@y
2. In a terminal, run the following command to start a new container:
@z

@x
    ```console
    $ docker run -d -p 8080:80 docker/welcome-to-docker
    ```
@y
    ```console
    $ docker run -d -p 8080:80 docker/welcome-to-docker
    ```
@z

@x
    The first `8080` refers to the host port. This is the port on your local machine that will be used to access the application running inside the container. The second `80` refers to the container port. This is the port that the application inside the container listens on for incoming connections. Hence, the command binds to port `8080` of the host to port `80` on the container system.
@y
    The first `8080` refers to the host port. This is the port on your local machine that will be used to access the application running inside the container. The second `80` refers to the container port. This is the port that the application inside the container listens on for incoming connections. Hence, the command binds to port `8080` of the host to port `80` on the container system.
@z

@x
3. Verify the published port by going to the **Containers** view of the Docker Dashboard.
@y
3. Verify the published port by going to the **Containers** view of the Docker Dashboard.
@z

@x
   ![A screenshot of Docker dashboard showing the published port](images/published-ports.webp?w=5000&border=true)
@y
   ![A screenshot of Docker dashboard showing the published port](images/published-ports.webp?w=5000&border=true)
@z

@x
4. Open the website by either selecting the link in the **Port(s)** column of your container or visiting [http://localhost:8080](http://localhost:8080) in your browser.
@y
4. Open the website by either selecting the link in the **Port(s)** column of your container or visiting [http://localhost:8080](http://localhost:8080) in your browser.
@z

@x
   ![A screenshot of the landing page of the Nginx web server running in a container](/get-started/docker-concepts/the-basics/images/access-the-frontend.webp?border=true)
@y
   ![A screenshot of the landing page of the Nginx web server running in a container](__SUBDIR__/get-started/docker-concepts/the-basics/images/access-the-frontend.webp?border=true)
@z

@x
### Use Docker Compose
@y
### Use Docker Compose
@z

@x
This example will launch the same application using Docker Compose:
@y
This example will launch the same application using Docker Compose:
@z

@x
1. Create a new directory and inside that directory, create a `compose.yaml` file with the following contents:
@y
1. Create a new directory and inside that directory, create a `compose.yaml` file with the following contents:
@z

@x
    ```yaml
    services:
      app:
        image: docker/welcome-to-docker
        ports:
          - 8080:80
    ```
@y
    ```yaml
    services:
      app:
        image: docker/welcome-to-docker
        ports:
          - 8080:80
    ```
@z

@x
    The `ports` configuration accepts a few different forms of syntax for the port definition. In this case, you’re using the same `HOST_PORT:CONTAINER_PORT` used in the `docker run` command.
@y
    The `ports` configuration accepts a few different forms of syntax for the port definition. In this case, you’re using the same `HOST_PORT:CONTAINER_PORT` used in the `docker run` command.
@z

@x
2. Open a terminal and navigate to the directory you created in the previous step.
@y
2. Open a terminal and navigate to the directory you created in the previous step.
@z

@x
3. Use the `docker compose up` command to start the application. 
@y
3. Use the `docker compose up` command to start the application. 
@z

@x
4. Open your browser to [http://localhost:8080](http://localhost:8080).
@y
4. Open your browser to [http://localhost:8080](http://localhost:8080).
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
If you’d like to dive in deeper on this topic, be sure to check out the following resources:
@y
If you’d like to dive in deeper on this topic, be sure to check out the following resources:
@z

@x
* [`docker container port` CLI reference](/reference/cli/docker/container/port/)
* [Published ports](/engine/network/#published-ports)
@y
* [`docker container port` CLI reference](__SUBDIR__/reference/cli/docker/container/port/)
* [Published ports](__SUBDIR__/engine/network/#published-ports)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Now that you understand how to publish and expose ports, you're ready to learn how to override the container defaults using the `docker run` command.
@y
Now that you understand how to publish and expose ports, you're ready to learn how to override the container defaults using the `docker run` command.
@z

@x
{{< button text="Overriding container defaults" url="overriding-container-defaults" >}}
@y
{{< button text="Overriding container defaults" url="overriding-container-defaults" >}}
@z
