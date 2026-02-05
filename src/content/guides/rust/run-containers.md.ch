%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Run your Rust image as a container
linkTitle: Run containers
@y
title: コンテナーとしての Rust イメージの実行
linkTitle: コンテナーの実行
@z

@x
keywords: rust, run, image, container,
description: Learn how to run your Rust image as a container.
@y
keywords: rust, run, image, container,
description: Learn how to run your Rust image as a container.
@z

@x
## Prerequisite
@y
## Prerequisite
@z

@x
You have completed [Build your Rust image](build-images.md) and you have built an image.
@y
You have completed [Build your Rust image](build-images.md) and you have built an image.
@z

@x
## Overview
@y
## Overview
@z

@x
A container is a normal operating system process except that Docker isolates this process so that it has its own file system, its own networking, and its own isolated process tree separate from the host.
@y
A container is a normal operating system process except that Docker isolates this process so that it has its own file system, its own networking, and its own isolated process tree separate from the host.
@z

@x
To run an image inside of a container, you use the `docker run` command. The `docker run` command requires one parameter which is the name of the image.
@y
To run an image inside of a container, you use the `docker run` command. The `docker run` command requires one parameter which is the name of the image.
@z

@x
## Run an image
@y
## Run an image
@z

@x
Use `docker run` to run the image you built in [Build your Rust image](build-images.md).
@y
Use `docker run` to run the image you built in [Build your Rust image](build-images.md).
@z

@x
```console
$ docker run docker-rust-image-dhi
```
@y
```console
$ docker run docker-rust-image-dhi
```
@z

@x
After running this command, you’ll notice that you weren't returned to the command prompt. This is because your application is a server that runs in a loop waiting for incoming requests without returning control back to the OS until you stop the container.
@y
After running this command, you’ll notice that you weren't returned to the command prompt. This is because your application is a server that runs in a loop waiting for incoming requests without returning control back to the OS until you stop the container.
@z

@x
Open a new terminal then make a request to the server using the `curl` command.
@y
Open a new terminal then make a request to the server using the `curl` command.
@z

@x
```console
$ curl http://localhost:8000
```
@y
```console
$ curl http://localhost:8000
```
@z

@x
You should see output like the following.
@y
You should see output like the following.
@z

@x
```console
curl: (7) Failed to connect to localhost port 8000 after 2236 ms: Couldn't connect to server
```
@y
```console
curl: (7) Failed to connect to localhost port 8000 after 2236 ms: Couldn't connect to server
```
@z

@x
As you can see, your `curl` command failed. This means you weren't able to connect to the localhost on port 8000. This is normal because your container is running in isolation which includes networking. Stop the container and restart with port 8000 published on your local network.
@y
As you can see, your `curl` command failed. This means you weren't able to connect to the localhost on port 8000. This is normal because your container is running in isolation which includes networking. Stop the container and restart with port 8000 published on your local network.
@z

@x
To stop the container, press ctrl-c. This will return you to the terminal prompt.
@y
To stop the container, press ctrl-c. This will return you to the terminal prompt.
@z

@x
To publish a port for your container, you’ll use the `--publish` flag (`-p` for short) on the `docker run` command. The format of the `--publish` command is `[host port]:[container port]`. So, if you wanted to expose port 8000 inside the container to port 3001 outside the container, you would pass `3001:8000` to the `--publish` flag.
@y
To publish a port for your container, you’ll use the `--publish` flag (`-p` for short) on the `docker run` command. The format of the `--publish` command is `[host port]:[container port]`. So, if you wanted to expose port 8000 inside the container to port 3001 outside the container, you would pass `3001:8000` to the `--publish` flag.
@z

@x
You didn't specify a port when running the application in the container and the default is 8000. If you want your previous request going to port 8000 to work, you can map the host's port 3001 to the container's port 8000:
@y
You didn't specify a port when running the application in the container and the default is 8000. If you want your previous request going to port 8000 to work, you can map the host's port 3001 to the container's port 8000:
@z

@x
```console
$ docker run --publish 3001:8000 docker-rust-image-dhi
```
@y
```console
$ docker run --publish 3001:8000 docker-rust-image-dhi
```
@z

@x
Now, rerun the curl command. Remember to open a new terminal.
@y
Now, rerun the curl command. Remember to open a new terminal.
@z

@x
```console
$ curl http://localhost:3001
```
@y
```console
$ curl http://localhost:3001
```
@z

@x
You should see output like the following.
@y
You should see output like the following.
@z

@x
```console
Hello, Docker!
```
@y
```console
Hello, Docker!
```
@z

@x
Success! You were able to connect to the application running inside of your container on port 8000. Switch back to the terminal where your container is running and stop it.
@y
Success! You were able to connect to the application running inside of your container on port 8000. Switch back to the terminal where your container is running and stop it.
@z

@x
Press ctrl-c to stop the container.
@y
Press ctrl-c to stop the container.
@z

@x
## Run in detached mode
@y
## Run in detached mode
@z

@x
This is great so far, but your sample application is a web server and you don't have to be connected to the container. Docker can run your container in detached mode or in the background. To do this, you can use the `--detach` or `-d` for short. Docker starts your container the same as before but this time will "detach" from the container and return you to the terminal prompt.
@y
This is great so far, but your sample application is a web server and you don't have to be connected to the container. Docker can run your container in detached mode or in the background. To do this, you can use the `--detach` or `-d` for short. Docker starts your container the same as before but this time will "detach" from the container and return you to the terminal prompt.
@z

@x
```console
$ docker run -d -p 3001:8000 docker-rust-image-dhi
3e4830e7f01304811d97dd3469d47a0c7a916a8b6c28ce0ef19c6f689a521144
```
@y
```console
$ docker run -d -p 3001:8000 docker-rust-image-dhi
3e4830e7f01304811d97dd3469d47a0c7a916a8b6c28ce0ef19c6f689a521144
```
@z

@x
Docker started your container in the background and printed the Container ID on the terminal.
@y
Docker started your container in the background and printed the Container ID on the terminal.
@z

@x
Again, make sure that your container is running properly. Run the curl command again.
@y
Again, make sure that your container is running properly. Run the curl command again.
@z

@x
```console
$ curl http://localhost:3001
```
@y
```console
$ curl http://localhost:3001
```
@z

@x
You should see output like the following.
@y
You should see output like the following.
@z

@x
```console
Hello, Docker!
```
@y
```console
Hello, Docker!
```
@z

@x
## List containers
@y
## List containers
@z

@x
Since you ran your container in the background, how do you know if your container is running or what other containers are running on your machine? Well, to see a list of containers running on your machine, run `docker ps`. This is similar to how you use the ps command in Linux to see a list of processes.
@y
Since you ran your container in the background, how do you know if your container is running or what other containers are running on your machine? Well, to see a list of containers running on your machine, run `docker ps`. This is similar to how you use the ps command in Linux to see a list of processes.
@z

@x
You should see output like the following.
@y
You should see output like the following.
@z

@x
```console
CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS          PORTS                                         NAMES
3e4830e7f013   docker-rust-image-dhi   "/server"                23 seconds ago   Up 22 seconds   0.0.0.0:3001->8000/tcp, [::]:3001->8000/tcp   youthful_lamport
```
@y
```console
CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS          PORTS                                         NAMES
3e4830e7f013   docker-rust-image-dhi   "/server"                23 seconds ago   Up 22 seconds   0.0.0.0:3001->8000/tcp, [::]:3001->8000/tcp   youthful_lamport
```
@z

@x
The `docker ps` command provides a bunch of information about your running containers. You can see the container ID, the image running inside the container, the command that was used to start the container, when it was created, the status, ports that were exposed, and the name of the container.
@y
The `docker ps` command provides a bunch of information about your running containers. You can see the container ID, the image running inside the container, the command that was used to start the container, when it was created, the status, ports that were exposed, and the name of the container.
@z

@x
You are probably wondering where the name of your container is coming from. Since you didn’t provide a name for the container when you started it, Docker generated a random name. You’ll fix this in a minute, but first you need to stop the container. To stop the container, run the `docker stop` command which does just that, stops the container. You need to pass the name of the container or you can use the container ID.
@y
You are probably wondering where the name of your container is coming from. Since you didn’t provide a name for the container when you started it, Docker generated a random name. You’ll fix this in a minute, but first you need to stop the container. To stop the container, run the `docker stop` command which does just that, stops the container. You need to pass the name of the container or you can use the container ID.
@z

@x
```console
$ docker stop youthful_lamport
youthful_lamport
```
@y
```console
$ docker stop youthful_lamport
youthful_lamport
```
@z

@x
Now, rerun the `docker ps` command to see a list of running containers.
@y
Now, rerun the `docker ps` command to see a list of running containers.
@z

@x
```console
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```
@y
```console
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```
@z

@x
## Stop, start, and name containers
@y
## Stop, start, and name containers
@z

@x
You can start, stop, and restart Docker containers. When you stop a container, it's not removed, but the status is changed to stopped and the process inside the container is stopped. When you ran the `docker ps` command in the previous module, the default output only shows running containers. When you pass the `--all` or `-a` for short, you see all containers on your machine, irrespective of their start or stop status.
@y
You can start, stop, and restart Docker containers. When you stop a container, it's not removed, but the status is changed to stopped and the process inside the container is stopped. When you ran the `docker ps` command in the previous module, the default output only shows running containers. When you pass the `--all` or `-a` for short, you see all containers on your machine, irrespective of their start or stop status.
@z

@x
```console
$ docker ps -a
CONTAINER ID   IMAGE                   COMMAND                  CREATED              STATUS                          PORTS                                         NAMES
3e4830e7f013   docker-rust-image-dhi   "/server"                About a minute ago   Exited (0) 28 seconds ago                                                     youthful_lamport
60009b7eaf40   docker-rust-image-dhi   "/server"                2 minutes ago        Exited (0) About a minute ago                                                 sharp_noyce
152e1d7d9eea   docker-rust-image-dhi   "/server ."              4 minutes ago        Exited (0) 2 minutes ago                                                      magical_bhabha
```
@y
```console
$ docker ps -a
CONTAINER ID   IMAGE                   COMMAND                  CREATED              STATUS                          PORTS                                         NAMES
3e4830e7f013   docker-rust-image-dhi   "/server"                About a minute ago   Exited (0) 28 seconds ago                                                     youthful_lamport
60009b7eaf40   docker-rust-image-dhi   "/server"                2 minutes ago        Exited (0) About a minute ago                                                 sharp_noyce
152e1d7d9eea   docker-rust-image-dhi   "/server ."              4 minutes ago        Exited (0) 2 minutes ago                                                      magical_bhabha
```
@z

@x
You should now see several containers listed. These are containers that you started and stopped but you haven't removed.
@y
You should now see several containers listed. These are containers that you started and stopped but you haven't removed.
@z

@x
Restart the container that you just stopped. Locate the name of the container you just stopped and replace the name of the container in following restart command.
@y
Restart the container that you just stopped. Locate the name of the container you just stopped and replace the name of the container in following restart command.
@z

@x
```console
$ docker restart youthful_lamport
```
@y
```console
$ docker restart youthful_lamport
```
@z

@x
Now list all the containers again using the `docker ps --all` command.
@y
Now list all the containers again using the `docker ps --all` command.
@z

@x
```console
$ docker ps --all
CONTAINER ID   IMAGE                   COMMAND                  CREATED             STATUS                         PORTS                                         NAMES
3e4830e7f013   docker-rust-image-dhi   "/server"                3 minutes ago       Up 7 seconds                   0.0.0.0:3001->8000/tcp, [::]:3001->8000/tcp   youthful_lamport
60009b7eaf40   docker-rust-image-dhi   "/server"                4 minutes ago       Exited (0) 3 minutes ago                                                     sharp_noyce
152e1d7d9eea   docker-rust-image-dhi   "/server ."              5 minutes ago       Exited (0) 4 minutes ago                                                     magical_bhabha
```
@y
```console
$ docker ps --all
CONTAINER ID   IMAGE                   COMMAND                  CREATED             STATUS                         PORTS                                         NAMES
3e4830e7f013   docker-rust-image-dhi   "/server"                3 minutes ago       Up 7 seconds                   0.0.0.0:3001->8000/tcp, [::]:3001->8000/tcp   youthful_lamport
60009b7eaf40   docker-rust-image-dhi   "/server"                4 minutes ago       Exited (0) 3 minutes ago                                                     sharp_noyce
152e1d7d9eea   docker-rust-image-dhi   "/server ."              5 minutes ago       Exited (0) 4 minutes ago                                                     magical_bhabha
```
@z

@x
Notice that the container you just restarted has been started in detached mode. Also, observe the status of the container is "Up X seconds". When you restart a container, it starts with the same flags or commands that it was originally started with.
@y
Notice that the container you just restarted has been started in detached mode. Also, observe the status of the container is "Up X seconds". When you restart a container, it starts with the same flags or commands that it was originally started with.
@z

@x
Now, stop and remove all of your containers and take a look at fixing the random naming issue. Stop the container you just started. Find the name of your running container and replace the name in the following command with the name of the container on your system.
@y
Now, stop and remove all of your containers and take a look at fixing the random naming issue. Stop the container you just started. Find the name of your running container and replace the name in the following command with the name of the container on your system.
@z

@x
```console
$ docker stop youthful_lamport
youthful_lamport
```
@y
```console
$ docker stop youthful_lamport
youthful_lamport
```
@z

@x
Now that you have stopped all of your containers, remove them. When you remove a container, it's no longer running, nor is it in the stopped status, but the process inside the container has been stopped and the metadata for the container has been removed.
@y
Now that you have stopped all of your containers, remove them. When you remove a container, it's no longer running, nor is it in the stopped status, but the process inside the container has been stopped and the metadata for the container has been removed.
@z

@x
To remove a container, run the `docker rm` command with the container name. You can pass multiple container names to the command using a single command. Again, replace the container names in the following command with the container names from your system.
@y
To remove a container, run the `docker rm` command with the container name. You can pass multiple container names to the command using a single command. Again, replace the container names in the following command with the container names from your system.
@z

@x
```console
$ docker rm youthful_lamport friendly_montalcini tender_bose
youthful_lamport
sharp_noyce
magical_bhabha
```
@y
```console
$ docker rm youthful_lamport friendly_montalcini tender_bose
youthful_lamport
sharp_noyce
magical_bhabha
```
@z

@x
Run the `docker ps --all` command again to see that Docker removed all containers.
@y
Run the `docker ps --all` command again to see that Docker removed all containers.
@z

@x
Now, it's time to address the random naming issue. Standard practice is to name your containers for the simple reason that it's easier to identify what's running in the container and what application or service it's associated with.
@y
Now, it's time to address the random naming issue. Standard practice is to name your containers for the simple reason that it's easier to identify what's running in the container and what application or service it's associated with.
@z

@x
To name a container, you just need to pass the `--name` flag to the `docker run` command.
@y
To name a container, you just need to pass the `--name` flag to the `docker run` command.
@z

@x
```console
$ docker run -d -p 3001:8000 --name docker-rust-container docker-rust-image-dhi
1aa5d46418a68705c81782a58456a4ccdb56a309cb5e6bd399478d01eaa5cdda
$ docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED         STATUS         PORTS                                         NAMES
219b2e3c7c38   docker-rust-image-dhi   "/server"                6 seconds ago   Up 5 seconds   0.0.0.0:3001->8000/tcp, [::]:3001->8000/tcp   docker-rust-container
```
@y
```console
$ docker run -d -p 3001:8000 --name docker-rust-container docker-rust-image-dhi
1aa5d46418a68705c81782a58456a4ccdb56a309cb5e6bd399478d01eaa5cdda
$ docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED         STATUS         PORTS                                         NAMES
219b2e3c7c38   docker-rust-image-dhi   "/server"                6 seconds ago   Up 5 seconds   0.0.0.0:3001->8000/tcp, [::]:3001->8000/tcp   docker-rust-container
```
@z

@x
That’s better! You can now easily identify your container based on the name.
@y
That’s better! You can now easily identify your container based on the name.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you took a look at running containers. You also took a look at managing containers by starting, stopping, and restarting them. And finally, you looked at naming your containers so they are more easily identifiable.
@y
In this section, you took a look at running containers. You also took a look at managing containers by starting, stopping, and restarting them. And finally, you looked at naming your containers so they are more easily identifiable.
@z

@x
Related information:
@y
Related information:
@z

@x
- [docker run CLI reference](/reference/cli/docker/container/run.md)
@y
- [docker run CLI reference](reference/cli/docker/container/run.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you’ll learn how to run a database in a container and connect it to a Rust application.
@y
In the next section, you’ll learn how to run a database in a container and connect it to a Rust application.
@z
