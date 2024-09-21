%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Run your Go image as a container
linkTitle: Run containers
@y
title: コンテナーとしての Go 言語イメージの実行
linkTitle: コンテナーの実行
@z

@x
keywords: get started, go, golang, run, container
description: Learn how to run the image as a container.
@y
keywords: get started, go, golang, run, container
description: Learn how to run the image as a container.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Work through the steps to containerize a Go application in [Build your Go image](build-images.md).
@y
Work through the steps to containerize a Go application in [Build your Go image](build-images.md).
@z

@x
## Overview
@y
## Overview
@z

@x
In the previous module you created a `Dockerfile` for your example application and then you created your Docker image using the command `docker build`. Now that you have the image, you can run that image and see if your application is running correctly.
@y
In the previous module you created a `Dockerfile` for your example application and then you created your Docker image using the command `docker build`. Now that you have the image, you can run that image and see if your application is running correctly.
@z

@x
A container is a normal operating system process except that this process is isolated and has its own file system, its own networking, and its own isolated process tree separate from the host.
@y
A container is a normal operating system process except that this process is isolated and has its own file system, its own networking, and its own isolated process tree separate from the host.
@z

@x
To run an image inside of a container, you use the `docker run` command. It requires one parameter and that's the image name. Start your image and make sure it's running correctly. Run the following command in your terminal.
@y
To run an image inside of a container, you use the `docker run` command. It requires one parameter and that's the image name. Start your image and make sure it's running correctly. Run the following command in your terminal.
@z

@x
```console
$ docker run docker-gs-ping
```
@y
```console
$ docker run docker-gs-ping
```
@z

@x
```text
   ____    __
  / __/___/ /  ___
 / _// __/ _ \/ _ \
/___/\__/_//_/\___/ v4.10.2
High performance, minimalist Go web framework
https://echo.labstack.com
____________________________________O/_______
                                    O\
⇨ http server started on [::]:8080
```
@y
```text
   ____    __
  / __/___/ /  ___
 / _// __/ _ \/ _ \
/___/\__/_//_/\___/ v4.10.2
High performance, minimalist Go web framework
https://echo.labstack.com
____________________________________O/_______
                                    O\
⇨ http server started on [::]:8080
```
@z

@x
When you run this command, you’ll notice that you weren't returned to the command prompt. This is because your application is a REST server and will run in a loop waiting for incoming requests without returning control back to the OS until you stop the container.
@y
When you run this command, you’ll notice that you weren't returned to the command prompt. This is because your application is a REST server and will run in a loop waiting for incoming requests without returning control back to the OS until you stop the container.
@z

@x
Make a GET request to the server using the curl command.
@y
Make a GET request to the server using the curl command.
@z

@x
```console
$ curl http://localhost:8080/
curl: (7) Failed to connect to localhost port 8080: Connection refused
```
@y
```console
$ curl http://localhost:8080/
curl: (7) Failed to connect to localhost port 8080: Connection refused
```
@z

@x
Your curl command failed because the connection to your server was refused.
Meaning that you weren't able to connect to localhost on port 8080. This is
expected because your container is running in isolation which includes
networking. Stop the container and restart with port 8080 published on your
local network.
@y
Your curl command failed because the connection to your server was refused.
Meaning that you weren't able to connect to localhost on port 8080. This is
expected because your container is running in isolation which includes
networking. Stop the container and restart with port 8080 published on your
local network.
@z

@x
To stop the container, press ctrl-c. This will return you to the terminal prompt.
@y
To stop the container, press ctrl-c. This will return you to the terminal prompt.
@z

@x
To publish a port for your container, you’ll use the `--publish` flag (`-p` for short) on the `docker run` command. The format of the `--publish` command is `[host_port]:[container_port]`. So if you wanted to expose port `8080` inside the container to port `3000` outside the container, you would pass `3000:8080` to the `--publish` flag.
@y
To publish a port for your container, you’ll use the `--publish` flag (`-p` for short) on the `docker run` command. The format of the `--publish` command is `[host_port]:[container_port]`. So if you wanted to expose port `8080` inside the container to port `3000` outside the container, you would pass `3000:8080` to the `--publish` flag.
@z

@x
Start the container and expose port `8080` to port `8080` on the host.
@y
Start the container and expose port `8080` to port `8080` on the host.
@z

@x
```console
$ docker run --publish 8080:8080 docker-gs-ping
```
@y
```console
$ docker run --publish 8080:8080 docker-gs-ping
```
@z

@x
Now, rerun the curl command.
@y
Now, rerun the curl command.
@z

@x
```console
$ curl http://localhost:8080/
Hello, Docker! <3
```
@y
```console
$ curl http://localhost:8080/
Hello, Docker! <3
```
@z

@x
Success! You were able to connect to the application running inside of your container on port 8080. Switch back to the terminal where your container is running and you should see the `GET` request logged to the console.
@y
Success! You were able to connect to the application running inside of your container on port 8080. Switch back to the terminal where your container is running and you should see the `GET` request logged to the console.
@z

@x
Press `ctrl-c` to stop the container.
@y
Press `ctrl-c` to stop the container.
@z

@x
## Run in detached mode
@y
## Run in detached mode
@z

@x
This is great so far, but your sample application is a web server and you
shouldn't have to have your terminal connected to the container. Docker can run
your container in detached mode in the background. To do this, you can use the
`--detach` or `-d` for short. Docker will start your container the same as
before but this time will detach from the container and return you to the
terminal prompt.
@y
This is great so far, but your sample application is a web server and you
shouldn't have to have your terminal connected to the container. Docker can run
your container in detached mode in the background. To do this, you can use the
`--detach` or `-d` for short. Docker will start your container the same as
before but this time will detach from the container and return you to the
terminal prompt.
@z

@x
```console
$ docker run -d -p 8080:8080 docker-gs-ping
d75e61fcad1e0c0eca69a3f767be6ba28a66625ce4dc42201a8a323e8313c14e
```
@y
```console
$ docker run -d -p 8080:8080 docker-gs-ping
d75e61fcad1e0c0eca69a3f767be6ba28a66625ce4dc42201a8a323e8313c14e
```
@z

@x
Docker started your container in the background and printed the container ID on the terminal.
@y
Docker started your container in the background and printed the container ID on the terminal.
@z

@x
Again, make sure that your container is running. Run the same `curl` command:
@y
Again, make sure that your container is running. Run the same `curl` command:
@z

@x
```console
$ curl http://localhost:8080/
Hello, Docker! <3
```
@y
```console
$ curl http://localhost:8080/
Hello, Docker! <3
```
@z

@x
## List containers
@y
## List containers
@z

@x
Since you ran your container in the background, how do you know if your container is running or what other containers are running on your machine? Well, to see a list of containers running on your machine, run `docker ps`. This is similar to how the ps command is used to see a list of processes on a Linux machine.
@y
Since you ran your container in the background, how do you know if your container is running or what other containers are running on your machine? Well, to see a list of containers running on your machine, run `docker ps`. This is similar to how the ps command is used to see a list of processes on a Linux machine.
@z

@x
```console
$ docker ps
@y
```console
$ docker ps
@z

@x
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"   41 seconds ago   Up 40 seconds   0.0.0.0:8080->8080/tcp   inspiring_ishizaka
```
@y
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"   41 seconds ago   Up 40 seconds   0.0.0.0:8080->8080/tcp   inspiring_ishizaka
```
@z

@x
The `ps` command tells you a bunch of stuff about your running containers. You can see the container ID, the image running inside the container, the command that was used to start the container, when it was created, the status, ports that are exposed, and the names of the container.
@y
The `ps` command tells you a bunch of stuff about your running containers. You can see the container ID, the image running inside the container, the command that was used to start the container, when it was created, the status, ports that are exposed, and the names of the container.
@z

@x
You are probably wondering where the name of your container is coming from. Since you didn’t provide a name for the container when you started it, Docker generated a random name. You'll fix this in a minute but first you need to stop the container. To stop the container, run the `docker stop` command, passing the container's name or ID.
@y
You are probably wondering where the name of your container is coming from. Since you didn’t provide a name for the container when you started it, Docker generated a random name. You'll fix this in a minute but first you need to stop the container. To stop the container, run the `docker stop` command, passing the container's name or ID.
@z

@x
```console
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@y
```console
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@z

@x
Now rerun the `docker ps` command to see a list of running containers.
@y
Now rerun the `docker ps` command to see a list of running containers.
@z

@x
```console
$ docker ps
@y
```console
$ docker ps
@z

@x
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
@y
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
@z

@x
## Stop, start, and name containers
@y
## Stop, start, and name containers
@z

@x
Docker containers can be started, stopped and restarted. When you stop a container, it's not removed but the status is changed to stopped and the process inside of the container is stopped. When you ran the `docker ps` command, the default output is to only show running containers. If you pass the `--all` or `-a` for short, you will see all containers on your system, including stopped containers and running containers.
@y
Docker containers can be started, stopped and restarted. When you stop a container, it's not removed but the status is changed to stopped and the process inside of the container is stopped. When you ran the `docker ps` command, the default output is to only show running containers. If you pass the `--all` or `-a` for short, you will see all containers on your system, including stopped containers and running containers.
@z

@x
```console
$ docker ps --all
@y
```console
$ docker ps --all
@z

@x
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS                      PORTS     NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        About a minute ago   Exited (2) 23 seconds ago             inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 2 minutes ago              wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 3 minutes ago              magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        9 minutes ago        Exited (2) 3 minutes ago              gifted_mestorf
```
@y
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS                      PORTS     NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        About a minute ago   Exited (2) 23 seconds ago             inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 2 minutes ago              wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        3 minutes ago        Exited (2) 3 minutes ago              magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        9 minutes ago        Exited (2) 3 minutes ago              gifted_mestorf
```
@z

@x
If you’ve been following along, you should see several containers listed. These are containers that you started and stopped but haven't removed yet.
@y
If you’ve been following along, you should see several containers listed. These are containers that you started and stopped but haven't removed yet.
@z

@x
Restart the container that you have just stopped. Locate the name of the container and replace the name of the container in the following `restart` command:
@y
Restart the container that you have just stopped. Locate the name of the container and replace the name of the container in the following `restart` command:
@z

@x
```console
$ docker restart inspiring_ishizaka
```
@y
```console
$ docker restart inspiring_ishizaka
```
@z

@x
Now, list all the containers again using the `ps` command:
@y
Now, list all the containers again using the `ps` command:
@z

@x
```console
$ docker ps -a
@y
```console
$ docker ps -a
@z

@x
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS                     PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        2 minutes ago    Up 5 seconds               0.0.0.0:8080->8080/tcp   inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 2 minutes ago                            wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 4 minutes ago                            magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        10 minutes ago   Exited (2) 4 minutes ago                            gifted_mestorf
```
@y
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS                     PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"        2 minutes ago    Up 5 seconds               0.0.0.0:8080->8080/tcp   inspiring_ishizaka
f65dbbb9a548   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 2 minutes ago                            wizardly_joliot
aade1bf3d330   docker-gs-ping   "/docker-gs-ping"        4 minutes ago    Exited (2) 4 minutes ago                            magical_carson
52d5ce3c15f0   docker-gs-ping   "/docker-gs-ping"        10 minutes ago   Exited (2) 4 minutes ago                            gifted_mestorf
```
@z

@x
Notice that the container you just restarted has been started in detached mode and has port `8080` exposed. Also, note that the status of the container is `Up X seconds`. When you restart a container, it will be started with the same flags or commands that it was originally started with.
@y
Notice that the container you just restarted has been started in detached mode and has port `8080` exposed. Also, note that the status of the container is `Up X seconds`. When you restart a container, it will be started with the same flags or commands that it was originally started with.
@z

@x
Stop and remove all of your containers and take a look at fixing the random naming issue.
@y
Stop and remove all of your containers and take a look at fixing the random naming issue.
@z

@x
Stop the container you just started. Find the name of your running container and replace the name in the following command with the name of the container on your system:
@y
Stop the container you just started. Find the name of your running container and replace the name in the following command with the name of the container on your system:
@z

@x
```console
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@y
```console
$ docker stop inspiring_ishizaka
inspiring_ishizaka
```
@z

@x
Now that all of your containers are stopped, remove them. When a container is removed, it's no longer running nor is it in the stopped state. Instead, the process inside the container is terminated and the metadata for the container is removed.
@y
Now that all of your containers are stopped, remove them. When a container is removed, it's no longer running nor is it in the stopped state. Instead, the process inside the container is terminated and the metadata for the container is removed.
@z

@x
To remove a container, run the `docker rm` command passing the container name. You can pass multiple container names to the command in one command.
@y
To remove a container, run the `docker rm` command passing the container name. You can pass multiple container names to the command in one command.
@z

@x
Again, make sure you replace the containers names in the following command with the container names from your system:
@y
Again, make sure you replace the containers names in the following command with the container names from your system:
@z

@x
```console
$ docker rm inspiring_ishizaka wizardly_joliot magical_carson gifted_mestorf
@y
```console
$ docker rm inspiring_ishizaka wizardly_joliot magical_carson gifted_mestorf
@z

@x
inspiring_ishizaka
wizardly_joliot
magical_carson
gifted_mestorf
```
@y
inspiring_ishizaka
wizardly_joliot
magical_carson
gifted_mestorf
```
@z

@x
Run the `docker ps --all` command again to verify that all containers are gone.
@y
Run the `docker ps --all` command again to verify that all containers are gone.
@z

@x
Now, address the pesky random name issue. Standard practice is to name your containers for the simple reason that it's easier to identify what's running in the container and what application or service it's associated with. Just like good naming conventions for variables in your code makes it simpler to read. So goes naming your containers.
@y
Now, address the pesky random name issue. Standard practice is to name your containers for the simple reason that it's easier to identify what's running in the container and what application or service it's associated with. Just like good naming conventions for variables in your code makes it simpler to read. So goes naming your containers.
@z

@x
To name a container, you must pass the `--name` flag to the `run` command:
@y
To name a container, you must pass the `--name` flag to the `run` command:
@z

@x
```console
$ docker run -d -p 8080:8080 --name rest-server docker-gs-ping
3bbc6a3102ea368c8b966e1878a5ea9b1fc61187afaac1276c41db22e4b7f48f
```
@y
```console
$ docker run -d -p 8080:8080 --name rest-server docker-gs-ping
3bbc6a3102ea368c8b966e1878a5ea9b1fc61187afaac1276c41db22e4b7f48f
```
@z

@x
```console
$ docker ps
@y
```console
$ docker ps
@z

@x
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
3bbc6a3102ea   docker-gs-ping   "/docker-gs-ping"   25 seconds ago   Up 24 seconds   0.0.0.0:8080->8080/tcp   rest-server
```
@y
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
3bbc6a3102ea   docker-gs-ping   "/docker-gs-ping"   25 seconds ago   Up 24 seconds   0.0.0.0:8080->8080/tcp   rest-server
```
@z

@x
Now, you can easily identify your container based on the name.
@y
Now, you can easily identify your container based on the name.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In this module, you learned how to run containers and publish ports. You also learned to manage the lifecycle of containers. You then learned the importance of naming your containers so that they're more easily identifiable. In the next module, you’ll learn how to run a database in a container and connect it to your application.
@y
In this module, you learned how to run containers and publish ports. You also learned to manage the lifecycle of containers. You then learned the importance of naming your containers so that they're more easily identifiable. In the next module, you’ll learn how to run a database in a container and connect it to your application.
@z

@x
{{< button text="How to develop your application" url="develop.md" >}}
@y
{{< button text="How to develop your application" url="develop.md" >}}
@z
