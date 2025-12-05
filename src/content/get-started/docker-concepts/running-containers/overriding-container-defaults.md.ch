%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Overriding container defaults
@y
title: コンテナーデフォルトのオーバーライド
@z

@x
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you how to override the container defaults using the `docker run` command.
@y
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you how to override the container defaults using the `docker run` command.
@z

@x
{{< youtube-embed PFszWK3BB8I >}}
@y
{{< youtube-embed PFszWK3BB8I >}}
@z

@x
## Explanation
@y
## Explanation
@z

@x
When a Docker container starts, it executes an application or command. The container gets this executable (script or file) from its image’s configuration. Containers come with default settings that usually work well, but you can change them if needed. These adjustments help the container's program run exactly how you want it to.
@y
When a Docker container starts, it executes an application or command. The container gets this executable (script or file) from its image’s configuration. Containers come with default settings that usually work well, but you can change them if needed. These adjustments help the container's program run exactly how you want it to.
@z

@x
For example, if you have an existing database container that listens on the standard port and you want to run a new instance of the same database container, then you might want to change the port settings the new container listens on so that it doesn’t conflict with the existing container. Sometimes you might want to increase the memory available to the container if the program needs more resources to handle a heavy workload or set the environment variables to provide specific configuration details the program needs to function properly.
@y
For example, if you have an existing database container that listens on the standard port and you want to run a new instance of the same database container, then you might want to change the port settings the new container listens on so that it doesn’t conflict with the existing container. Sometimes you might want to increase the memory available to the container if the program needs more resources to handle a heavy workload or set the environment variables to provide specific configuration details the program needs to function properly.
@z

@x
The `docker run` command offers a powerful way to override these defaults and tailor the container's behavior to your liking. The command offers several flags that let you to customize container behavior on the fly.
@y
The `docker run` command offers a powerful way to override these defaults and tailor the container's behavior to your liking. The command offers several flags that let you to customize container behavior on the fly.
@z

@x
Here's a few ways you can achieve this.
@y
Here's a few ways you can achieve this.
@z

@x
### Overriding the network ports
@y
### Overriding the network ports
@z

@x
Sometimes you might want to use separate database instances for development and testing purposes. Running these database instances on the same port might conflict. You can use the `-p` option in `docker run` to map container ports to host ports, allowing you to run the multiple instances of the container without any conflict.
@y
Sometimes you might want to use separate database instances for development and testing purposes. Running these database instances on the same port might conflict. You can use the `-p` option in `docker run` to map container ports to host ports, allowing you to run the multiple instances of the container without any conflict.
@z

% snip command...

@x
### Setting environment variables
@y
### Setting environment variables
@z

@x
This option sets an environment variable `foo` inside the container with the value `bar`.
@y
This option sets an environment variable `foo` inside the container with the value `bar`.
@z

% snip command...

@x
You will see output like the following:
@y
You will see output like the following:
@z

% snip output...

@x
> [!TIP]
>
> The `.env` file acts as a convenient way to set environment variables for your Docker containers without cluttering your command line with numerous `-e` flags. To use a `.env` file, you can pass `--env-file` option with the `docker run` command.
@y
> [!TIP]
>
> The `.env` file acts as a convenient way to set environment variables for your Docker containers without cluttering your command line with numerous `-e` flags. To use a `.env` file, you can pass `--env-file` option with the `docker run` command.
@z

% snip command...

@x
### Restricting the container to consume the resources
@y
### Restricting the container to consume the resources
@z

@x
You can use the `--memory` and `--cpus` flags with the `docker run` command to restrict how much CPU and memory a container can use. For example, you can set a memory limit for the Python API container, preventing it from consuming excessive resources on your host. Here's the command:
@y
You can use the `--memory` and `--cpus` flags with the `docker run` command to restrict how much CPU and memory a container can use. For example, you can set a memory limit for the Python API container, preventing it from consuming excessive resources on your host. Here's the command:
@z

% snip command...

@x
This command limits container memory usage to 512 MB and defines the CPU quota of 0.5 for half a core.
@y
This command limits container memory usage to 512 MB and defines the CPU quota of 0.5 for half a core.
@z

@x
> **Monitor the real-time resource usage**
>
> You can use the `docker stats` command to monitor the real-time resource usage of running containers. This helps you understand whether the allocated resources are sufficient or need adjustment.
@y
> **Monitor the real-time resource usage**
>
> You can use the `docker stats` command to monitor the real-time resource usage of running containers. This helps you understand whether the allocated resources are sufficient or need adjustment.
@z

@x
By effectively using these `docker run` flags, you can tailor your containerized application's behavior to fit your specific requirements.
@y
By effectively using these `docker run` flags, you can tailor your containerized application's behavior to fit your specific requirements.
@z

@x
## Try it out
@y
## Try it out
@z

@x
In this hands-on guide, you'll see how to use the `docker run` command to override the container defaults.
@y
In this hands-on guide, you'll see how to use the `docker run` command to override the container defaults.
@z

@x
1. [Download and install](/get-started/get-docker/) Docker Desktop.
@y
1. [Download and install](__SUBDIR__/get-started/get-docker/) Docker Desktop.
@z

@x
### Run multiple instances of the Postgres database
@y
### Run multiple instances of the Postgres database
@z

@x
1.  Start a container using the [Postgres image](https://hub.docker.com/_/postgres) with the following command:
@y
1.  Start a container using the [Postgres image](https://hub.docker.com/_/postgres) with the following command:
@z

% snip command...

@x
    This will start the Postgres database in the background, listening on the standard container port `5432` and mapped to port `5432` on the host machine.
@y
    This will start the Postgres database in the background, listening on the standard container port `5432` and mapped to port `5432` on the host machine.
@z

@x
2. Start a second Postgres container mapped to a different port. 
@y
2. Start a second Postgres container mapped to a different port. 
@z

% snip command...

@x
    This will start another Postgres container in the background, listening on the standard postgres port `5432` in the container, but mapped to port `5433` on the host machine. You override the host port just to ensure that this new container doesn't conflict with the existing running container.
@y
    This will start another Postgres container in the background, listening on the standard postgres port `5432` in the container, but mapped to port `5433` on the host machine. You override the host port just to ensure that this new container doesn't conflict with the existing running container.
@z

@x
3. Verify that both containers are running by going to the **Containers** view in the Docker Desktop Dashboard.
@y
3. Verify that both containers are running by going to the **Containers** view in the Docker Desktop Dashboard.
@z

@x
    ![A screenshot of the Docker Desktop Dashboard showing the running instances of Postgres containers](images/running-postgres-containers.webp?border=true)
@y
    ![A screenshot of the Docker Desktop Dashboard showing the running instances of Postgres containers](images/running-postgres-containers.webp?border=true)
@z

@x
### Run Postgres container in a controlled network
@y
### Run Postgres container in a controlled network
@z

@x
By default, containers automatically connect to a special network called a bridge network when you run them. This bridge network acts like a virtual bridge, allowing containers on the same host to communicate with each other while keeping them isolated from the outside world and other hosts. It's a convenient starting point for most container interactions. However, for specific scenarios, you might want more control over the network configuration.
@y
By default, containers automatically connect to a special network called a bridge network when you run them. This bridge network acts like a virtual bridge, allowing containers on the same host to communicate with each other while keeping them isolated from the outside world and other hosts. It's a convenient starting point for most container interactions. However, for specific scenarios, you might want more control over the network configuration.
@z

@x
Here's where the custom network comes in. You create a custom network by passing `--network` flag with the `docker run` command. All containers without a `--network` flag are attached to the default bridge network.
@y
Here's where the custom network comes in. You create a custom network by passing `--network` flag with the `docker run` command. All containers without a `--network` flag are attached to the default bridge network.
@z

@x
Follow the steps to see how to connect a Postgres container to a custom network.
@y
Follow the steps to see how to connect a Postgres container to a custom network.
@z

@x
1. Create a new custom network by using the following command:
@y
1. Create a new custom network by using the following command:
@z

% snip command...

@x
2. Verify the network by running the following command:
@y
2. Verify the network by running the following command:
@z

% snip command...

@x
    This command lists all networks, including the newly created "mynetwork".
@y
    This command lists all networks, including the newly created "mynetwork".
@z

@x
3. Connect Postgres to the custom network by using the following command:
@y
3. Connect Postgres to the custom network by using the following command:
@z

% snip command...

@x
    This will start Postgres container in the background, mapped to the host port 5434 and attached to the `mynetwork` network. You passed the `--network` parameter to override the container default by connecting the container to custom Docker network for better isolation and communication with other containers. You can use `docker network inspect` command to see if the container is tied to this new bridge network.
@y
    This will start Postgres container in the background, mapped to the host port 5434 and attached to the `mynetwork` network. You passed the `--network` parameter to override the container default by connecting the container to custom Docker network for better isolation and communication with other containers. You can use `docker network inspect` command to see if the container is tied to this new bridge network.
@z

@x
    > **Key difference between default bridge and custom networks**
    >
    > 1. DNS resolution: By default, containers connected to the default bridge network can communicate with each other, but only by IP address. (unless you use `--link` option which is considered legacy). It is not recommended for production use due to the various [technical shortcomings](/engine/network/drivers/bridge/#differences-between-user-defined-bridges-and-the-default-bridge). On a custom network, containers can resolve each other by name or alias.
    > 2. Isolation: All containers without a `--network` specified are attached to the default bridge network, hence can be a risk, as unrelated containers are then able to communicate. Using a custom network provides a scoped network in which only containers attached to that network are able to communicate, hence providing better isolation.
@y
    > **Key difference between default bridge and custom networks**
    >
    > 1. DNS resolution: By default, containers connected to the default bridge network can communicate with each other, but only by IP address. (unless you use `--link` option which is considered legacy). It is not recommended for production use due to the various [technical shortcomings](__SUBDIR__/engine/network/drivers/bridge/#differences-between-user-defined-bridges-and-the-default-bridge). On a custom network, containers can resolve each other by name or alias.
    > 2. Isolation: All containers without a `--network` specified are attached to the default bridge network, hence can be a risk, as unrelated containers are then able to communicate. Using a custom network provides a scoped network in which only containers attached to that network are able to communicate, hence providing better isolation.
@z

@x
### Manage the resources
@y
### Manage the resources
@z

@x
By default, containers are not limited in their resource usage. However, on shared systems, it's crucial to manage resources effectively. It's important not to let a running container consume too much of the host machine's memory.
@y
By default, containers are not limited in their resource usage. However, on shared systems, it's crucial to manage resources effectively. It's important not to let a running container consume too much of the host machine's memory.
@z

@x
This is where the `docker run` command shines again. It offers flags like `--memory` and `--cpus` to restrict how much CPU and memory a container can use.
@y
This is where the `docker run` command shines again. It offers flags like `--memory` and `--cpus` to restrict how much CPU and memory a container can use.
@z

% snip command...

@x
The `--cpus` flag specifies the CPU quota for the container. Here, it's set to half a CPU core (0.5) whereas the `--memory` flag specifies the memory limit for the container. In this case, it's set to 512 MB.
@y
The `--cpus` flag specifies the CPU quota for the container. Here, it's set to half a CPU core (0.5) whereas the `--memory` flag specifies the memory limit for the container. In this case, it's set to 512 MB.
@z

@x
### Override the default CMD and ENTRYPOINT in Docker Compose
@y
### Override the default CMD and ENTRYPOINT in Docker Compose
@z

@x
Sometimes, you might need to override the default commands (`CMD`) or entry points (`ENTRYPOINT`) defined in a Docker image, especially when using Docker Compose.
@y
Sometimes, you might need to override the default commands (`CMD`) or entry points (`ENTRYPOINT`) defined in a Docker image, especially when using Docker Compose.
@z

@x
1. Create a `compose.yml` file with the following content:
@y
1. Create a `compose.yml` file with the following content:
@z

% snip code...

@x
    The Compose file defines a service named `postgres` that uses the official Postgres image, sets an entrypoint script, and starts the container with password authentication.
@y
    The Compose file defines a service named `postgres` that uses the official Postgres image, sets an entrypoint script, and starts the container with password authentication.
@z

@x
2. Bring up the service by running the following command:
@y
2. Bring up the service by running the following command:
@z

% snip command...

@x
    This command starts the Postgres service defined in the Docker Compose file.
@y
    This command starts the Postgres service defined in the Docker Compose file.
@z

@x
3. Verify the authentication with Docker Desktop Dashboard.
@y
3. Verify the authentication with Docker Desktop Dashboard.
@z

@x
    Open the Docker Desktop Dashboard, select the **Postgres** container and select **Exec** to enter into the container shell. You can type the following command to connect to the Postgres database:
@y
    Open the Docker Desktop Dashboard, select the **Postgres** container and select **Exec** to enter into the container shell. You can type the following command to connect to the Postgres database:
@z

% snip command...

@x
    ![A screenshot of the Docker Desktop Dashboard selecting the Postgres container and entering into its shell using EXEC button](images/exec-into-postgres-container.webp?border=true)
@y
    ![A screenshot of the Docker Desktop Dashboard selecting the Postgres container and entering into its shell using EXEC button](images/exec-into-postgres-container.webp?border=true)
@z

@x
    > [!NOTE]
    > 
    > The PostgreSQL image sets up trust authentication locally so you may notice a password isn't required when connecting from localhost (inside the same container). However, a password will be required if connecting from a different host/container.
@y
    > [!NOTE]
    > 
    > The PostgreSQL image sets up trust authentication locally so you may notice a password isn't required when connecting from localhost (inside the same container). However, a password will be required if connecting from a different host/container.
@z

@x
### Override the default CMD and ENTRYPOINT with `docker run`
@y
### Override the default CMD and ENTRYPOINT with `docker run`
@z

@x
You can also override defaults directly using the `docker run` command with the following command:
@y
You can also override defaults directly using the `docker run` command with the following command:
@z

% snip command...

@x
This command runs a Postgres container, sets an environment variable for password authentication, overrides the default startup commands and configures hostname and port mapping.
@y
This command runs a Postgres container, sets an environment variable for password authentication, overrides the default startup commands and configures hostname and port mapping.
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
* [Ways to set environment variables with Compose](/compose/how-tos/environment-variables/set-environment-variables/)
* [What is a container](/get-started/docker-concepts/the-basics/what-is-a-container/)
@y
* [Ways to set environment variables with Compose](__SUBDIR__/compose/how-tos/environment-variables/set-environment-variables/)
* [What is a container](__SUBDIR__/get-started/docker-concepts/the-basics/what-is-a-container/)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Now that you have learned about overriding container defaults, it's time to learn how to persist container data.
@y
Now that you have learned about overriding container defaults, it's time to learn how to persist container data.
@z

@x
{{< button text="Persisting container data" url="persisting-container-data" >}}
@y
{{< button text="Persisting container data" url="persisting-container-data" >}}
@z
