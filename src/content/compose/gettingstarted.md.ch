%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Check out this tutorial on how to use Docker Compose from defining application
  dependencies to experimenting with commands.
keywords: docker compose example, docker compose tutorial, how to use docker compose,
  running docker compose, how to run docker compose, docker compose build image, docker
  compose command example, run docker compose file, how to create a docker compose
  file, run a docker compose file
title: Try Docker Compose
---
@y
---
description: Check out this tutorial on how to use Docker Compose from defining application
  dependencies to experimenting with commands.
keywords: docker compose example, docker compose tutorial, how to use docker compose,
  running docker compose, how to run docker compose, docker compose build image, docker
  compose command example, run docker compose file, how to create a docker compose
  file, run a docker compose file
title: Try Docker Compose
---
@z

@x
This tutorial is designed to introduce the key concepts of Docker Compose whilst building a simple Python web application. The application uses the Flask framework and maintains a hit counter in
Redis. 
@y
This tutorial is designed to introduce the key concepts of Docker Compose whilst building a simple Python web application. The application uses the Flask framework and maintains a hit counter in
Redis. 
@z

@x
The concepts demonstrated here should be understandable even if you're not familiar with Python. 
@y
The concepts demonstrated here should be understandable even if you're not familiar with Python. 
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
You need to have Docker Engine and Docker Compose on your machine. You can either:
- Install [Docker Engine](../get-docker.md) and [Docker Compose](install/index.md) as standalone binaries
- Install [Docker Desktop](../desktop/index.md) which includes both Docker Engine and Docker Compose
@y
You need to have Docker Engine and Docker Compose on your machine. You can either:
- Install [Docker Engine](../get-docker.md) and [Docker Compose](install/index.md) as standalone binaries
- Install [Docker Desktop](../desktop/index.md) which includes both Docker Engine and Docker Compose
@z

@x
You don't need to install Python or Redis, as both are provided by Docker images.
@y
You don't need to install Python or Redis, as both are provided by Docker images.
@z

@x
## Step 1: Define the application dependencies
@y
## Step 1: Define the application dependencies
@z

@x
1. Create a directory for the project:
@y
1. Create a directory for the project:
@z

@x
   ```console
   $ mkdir composetest
   $ cd composetest
   ```
@y
   ```console
   $ mkdir composetest
   $ cd composetest
   ```
@z

@x
2. Create a file called `app.py` in your project directory and paste the following code in:
@y
2. Create a file called `app.py` in your project directory and paste the following code in:
@z

@x
   ```python
   import time
@y
   ```python
   import time
@z

@x
   import redis
   from flask import Flask
@y
   import redis
   from flask import Flask
@z

@x
   app = Flask(__name__)
   cache = redis.Redis(host='redis', port=6379)
@y
   app = Flask(__name__)
   cache = redis.Redis(host='redis', port=6379)
@z

@x
   def get_hit_count():
       retries = 5
       while True:
           try:
               return cache.incr('hits')
           except redis.exceptions.ConnectionError as exc:
               if retries == 0:
                   raise exc
               retries -= 1
               time.sleep(0.5)
@y
   def get_hit_count():
       retries = 5
       while True:
           try:
               return cache.incr('hits')
           except redis.exceptions.ConnectionError as exc:
               if retries == 0:
                   raise exc
               retries -= 1
               time.sleep(0.5)
@z

@x
   @app.route('/')
   def hello():
       count = get_hit_count()
       return 'Hello World! I have been seen {} times.\n'.format(count)
    ```
@y
   @app.route('/')
   def hello():
       count = get_hit_count()
       return 'Hello World! I have been seen {} times.\n'.format(count)
    ```
@z

@x
   In this example, `redis` is the hostname of the redis container on the
   application's network. We use the default port for Redis, `6379`.
@y
   In this example, `redis` is the hostname of the redis container on the
   application's network. We use the default port for Redis, `6379`.
@z

@x
   > Handling transient errors
   >
   > Note the way the `get_hit_count` function is written. This basic retry
   > loop lets us attempt our request multiple times if the redis service is
   > not available. This is useful at startup while the application comes
   > online, but also makes the application more resilient if the Redis
   > service needs to be restarted anytime during the app's lifetime. In a
   > cluster, this also helps handling momentary connection drops between
   > nodes.
@y
   > Handling transient errors
   >
   > Note the way the `get_hit_count` function is written. This basic retry
   > loop lets us attempt our request multiple times if the redis service is
   > not available. This is useful at startup while the application comes
   > online, but also makes the application more resilient if the Redis
   > service needs to be restarted anytime during the app's lifetime. In a
   > cluster, this also helps handling momentary connection drops between
   > nodes.
@z

@x
3. Create another file called `requirements.txt` in your project directory and
   paste the following code in:
@y
3. Create another file called `requirements.txt` in your project directory and
   paste the following code in:
@z

@x
   ```text
   flask
   redis
   ```
@y
   ```text
   flask
   redis
   ```
@z

@x
## Step 2: Create a Dockerfile
@y
## Step 2: Create a Dockerfile
@z

@x
The Dockerfile is used to build a Docker image. The image
contains all the dependencies the Python application requires, including Python
itself.
@y
The Dockerfile is used to build a Docker image. The image
contains all the dependencies the Python application requires, including Python
itself.
@z

@x
In your project directory, create a file named `Dockerfile` and paste the following code in:
@y
In your project directory, create a file named `Dockerfile` and paste the following code in:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]
```
@z

@x
This tells Docker to:
@y
This tells Docker to:
@z

@x
* Build an image starting with the Python 3.7 image.
* Set the working directory to `/code`.
* Set environment variables used by the `flask` command.
* Install gcc and other dependencies
* Copy `requirements.txt` and install the Python dependencies.
* Add metadata to the image to describe that the container is listening on port 5000
* Copy the current directory `.` in the project to the workdir `.` in the image.
* Set the default command for the container to `flask run`.
@y
* Build an image starting with the Python 3.7 image.
* Set the working directory to `/code`.
* Set environment variables used by the `flask` command.
* Install gcc and other dependencies
* Copy `requirements.txt` and install the Python dependencies.
* Add metadata to the image to describe that the container is listening on port 5000
* Copy the current directory `.` in the project to the workdir `.` in the image.
* Set the default command for the container to `flask run`.
@z

@x
>Important
>
>Check that the `Dockerfile` has no file extension like `.txt`. Some editors may append this file extension automatically which results in an error when you run the application.
{ .important }
@y
>Important
>
>Check that the `Dockerfile` has no file extension like `.txt`. Some editors may append this file extension automatically which results in an error when you run the application.
{ .important }
@z

@x
For more information on how to write Dockerfiles, see the
[Docker user guide](../develop/index.md)
and the [Dockerfile reference](/engine/reference/builder/).
@y
For more information on how to write Dockerfiles, see the
[Docker user guide](../develop/index.md)
and the [Dockerfile reference](/engine/reference/builder/).
@z

@x
## Step 3: Define services in a Compose file
@y
## Step 3: Define services in a Compose file
@z

@x
Create a file called `compose.yaml` in your project directory and paste
the following:
@y
Create a file called `compose.yaml` in your project directory and paste
the following:
@z

@x
```yaml
services:
  web:
    build: .
    ports:
      - "8000:5000"
  redis:
    image: "redis:alpine"
```
@y
```yaml
services:
  web:
    build: .
    ports:
      - "8000:5000"
  redis:
    image: "redis:alpine"
```
@z

@x
This Compose file defines two services: `web` and `redis`. 
@y
This Compose file defines two services: `web` and `redis`. 
@z

@x
The `web` service uses an image that's built from the `Dockerfile` in the current directory.
It then binds the container and the host machine to the exposed port, `8000`. This example service uses the default port for the Flask web server, `5000`.
@y
The `web` service uses an image that's built from the `Dockerfile` in the current directory.
It then binds the container and the host machine to the exposed port, `8000`. This example service uses the default port for the Flask web server, `5000`.
@z

@x
The `redis` service uses a public [Redis](https://registry.hub.docker.com/_/redis/) 
image pulled from the Docker Hub registry.
@y
The `redis` service uses a public [Redis](https://registry.hub.docker.com/_/redis/) 
image pulled from the Docker Hub registry.
@z

@x
## Step 4: Build and run your app with Compose
@y
## Step 4: Build and run your app with Compose
@z

@x
1. From your project directory, start up your application by running `docker compose up`.
@y
1. From your project directory, start up your application by running `docker compose up`.
@z

@x
   ```console
   $ docker compose up
@y
   ```console
   $ docker compose up
@z

@x
   Creating network "composetest_default" with the default driver
   Creating composetest_web_1 ...
   Creating composetest_redis_1 ...
   Creating composetest_web_1
   Creating composetest_redis_1 ... done
   Attaching to composetest_web_1, composetest_redis_1
   web_1    |  * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
   redis_1  | 1:C 17 Aug 22:11:10.480 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
   redis_1  | 1:C 17 Aug 22:11:10.480 # Redis version=4.0.1, bits=64, commit=00000000, modified=0, pid=1, just started
   redis_1  | 1:C 17 Aug 22:11:10.480 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
   web_1    |  * Restarting with stat
   redis_1  | 1:M 17 Aug 22:11:10.483 * Running mode=standalone, port=6379.
   redis_1  | 1:M 17 Aug 22:11:10.483 # WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.
   web_1    |  * Debugger is active!
   redis_1  | 1:M 17 Aug 22:11:10.483 # Server initialized
   redis_1  | 1:M 17 Aug 22:11:10.483 # WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run the command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.local in order to retain the setting after a reboot. Redis must be restarted after THP is disabled.
   web_1    |  * Debugger PIN: 330-787-903
   redis_1  | 1:M 17 Aug 22:11:10.483 * Ready to accept connections
   ```
@y
   Creating network "composetest_default" with the default driver
   Creating composetest_web_1 ...
   Creating composetest_redis_1 ...
   Creating composetest_web_1
   Creating composetest_redis_1 ... done
   Attaching to composetest_web_1, composetest_redis_1
   web_1    |  * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
   redis_1  | 1:C 17 Aug 22:11:10.480 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
   redis_1  | 1:C 17 Aug 22:11:10.480 # Redis version=4.0.1, bits=64, commit=00000000, modified=0, pid=1, just started
   redis_1  | 1:C 17 Aug 22:11:10.480 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
   web_1    |  * Restarting with stat
   redis_1  | 1:M 17 Aug 22:11:10.483 * Running mode=standalone, port=6379.
   redis_1  | 1:M 17 Aug 22:11:10.483 # WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.
   web_1    |  * Debugger is active!
   redis_1  | 1:M 17 Aug 22:11:10.483 # Server initialized
   redis_1  | 1:M 17 Aug 22:11:10.483 # WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run the command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.local in order to retain the setting after a reboot. Redis must be restarted after THP is disabled.
   web_1    |  * Debugger PIN: 330-787-903
   redis_1  | 1:M 17 Aug 22:11:10.483 * Ready to accept connections
   ```
@z

@x
   Compose pulls a Redis image, builds an image for your code, and starts the
   services you defined. In this case, the code is statically copied into the image at build time.
@y
   Compose pulls a Redis image, builds an image for your code, and starts the
   services you defined. In this case, the code is statically copied into the image at build time.
@z

@x
2. Enter http://localhost:8000/ in a browser to see the application running.
@y
2. Enter http://localhost:8000/ in a browser to see the application running.
@z

@x
   If this doesn't resolve, you can also try http://127.0.0.1:8000.
@y
   If this doesn't resolve, you can also try http://127.0.0.1:8000.
@z

@x
   You should see a message in your browser saying:
@y
   You should see a message in your browser saying:
@z

@x
   ```console
   Hello World! I have been seen 1 times.
   ```
@y
   ```console
   Hello World! I have been seen 1 times.
   ```
@z

@x
   ![hello world in browser](images/quick-hello-world-1.png)
@y
   ![hello world in browser](images/quick-hello-world-1.png)
@z

@x
3. Refresh the page.
@y
3. Refresh the page.
@z

@x
   The number should increment.
@y
   The number should increment.
@z

@x
   ```console
   Hello World! I have been seen 2 times.
   ```
@y
   ```console
   Hello World! I have been seen 2 times.
   ```
@z

@x
   ![hello world in browser](images/quick-hello-world-2.png)
@y
   ![hello world in browser](images/quick-hello-world-2.png)
@z

@x
4. Switch to another terminal window, and type `docker image ls` to list local images.
@y
4. Switch to another terminal window, and type `docker image ls` to list local images.
@z

@x
   Listing images at this point should return `redis` and `web`.
@y
   Listing images at this point should return `redis` and `web`.
@z

@x
   ```console
   $ docker image ls
@y
   ```console
   $ docker image ls
@z

@x
   REPOSITORY        TAG           IMAGE ID      CREATED        SIZE
   composetest_web   latest        e2c21aa48cc1  4 minutes ago  93.8MB
   python            3.4-alpine    84e6077c7ab6  7 days ago     82.5MB
   redis             alpine        9d8fa9aa0e5b  3 weeks ago    27.5MB
   ```
@y
   REPOSITORY        TAG           IMAGE ID      CREATED        SIZE
   composetest_web   latest        e2c21aa48cc1  4 minutes ago  93.8MB
   python            3.4-alpine    84e6077c7ab6  7 days ago     82.5MB
   redis             alpine        9d8fa9aa0e5b  3 weeks ago    27.5MB
   ```
@z

@x
   You can inspect images with `docker inspect <tag or id>`.
@y
   You can inspect images with `docker inspect <tag or id>`.
@z

@x
5. Stop the application, either by running `docker compose down`
   from within your project directory in the second terminal, or by
   hitting CTRL+C in the original terminal where you started the app.
@y
5. Stop the application, either by running `docker compose down`
   from within your project directory in the second terminal, or by
   hitting CTRL+C in the original terminal where you started the app.
@z

@x
## Step 5: Edit the Compose file to add a bind mount
@y
## Step 5: Edit the Compose file to add a bind mount
@z

@x
Edit the `compose.yaml` file in your project directory to add a
[bind mount](../storage/bind-mounts.md) for the `web` service:
@y
Edit the `compose.yaml` file in your project directory to add a
[bind mount](../storage/bind-mounts.md) for the `web` service:
@z

@x
```yaml
services:
  web:
    build: .
    ports:
      - "8000:5000"
    volumes:
      - .:/code
    environment:
      FLASK_DEBUG: "true"
  redis:
    image: "redis:alpine"
```
@y
```yaml
services:
  web:
    build: .
    ports:
      - "8000:5000"
    volumes:
      - .:/code
    environment:
      FLASK_DEBUG: "true"
  redis:
    image: "redis:alpine"
```
@z

@x
The new `volumes` key mounts the project directory (current directory) on the
host to `/code` inside the container, allowing you to modify the code on the
fly, without having to rebuild the image. The `environment` key sets the
`FLASK_DEBUG` environment variable, which tells `flask run` to run in development
mode and reload the code on change. This mode should only be used in development.
@y
The new `volumes` key mounts the project directory (current directory) on the
host to `/code` inside the container, allowing you to modify the code on the
fly, without having to rebuild the image. The `environment` key sets the
`FLASK_DEBUG` environment variable, which tells `flask run` to run in development
mode and reload the code on change. This mode should only be used in development.
@z

@x
## Step 6: Re-build and run the app with Compose
@y
## Step 6: Re-build and run the app with Compose
@z

@x
From your project directory, type `docker compose up` to build the app with the updated Compose file, and run it.
@y
From your project directory, type `docker compose up` to build the app with the updated Compose file, and run it.
@z

@x
```console
$ docker compose up
@y
```console
$ docker compose up
@z

@x
Creating network "composetest_default" with the default driver
Creating composetest_web_1 ...
Creating composetest_redis_1 ...
Creating composetest_web_1
Creating composetest_redis_1 ... done
Attaching to composetest_web_1, composetest_redis_1
web_1    |  * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
...
```
@y
Creating network "composetest_default" with the default driver
Creating composetest_web_1 ...
Creating composetest_redis_1 ...
Creating composetest_web_1
Creating composetest_redis_1 ... done
Attaching to composetest_web_1, composetest_redis_1
web_1    |  * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
...
```
@z

@x
Check the `Hello World` message in a web browser again, and refresh to see the
count increment.
@y
Check the `Hello World` message in a web browser again, and refresh to see the
count increment.
@z

@x
> Shared folders, volumes, and bind mounts
>
> * If your project is outside of the `Users` directory (`cd ~`), then you
need to share the drive or location of the Dockerfile and volume you are using.
If you get runtime errors indicating an application file is not found, a volume
mount is denied, or a service cannot start, try enabling file or drive sharing.
Volume mounting requires shared drives for projects that live outside of
`C:\Users` (Windows) or `/Users` (Mac), and is required for _any_ project on
Docker Desktop for Mac and Docker Desktop for Windows that uses
[Linux containers](../desktop/faqs/windowsfaqs.md#how-do-i-switch-between-windows-and-linux-containers).
For more information, see
[File sharing on Docker for Mac](../desktop/settings/mac.md#file-sharing),
[File sharing on Docker for Windows](../desktop/settings/windows.md#file-sharing), [File sharing on Docker for Linux](../desktop/settings/linux.md#file-sharing).
and the general examples on how to
> [Manage data in containers](../storage/volumes.md).
>
> * If you are using Oracle VirtualBox on an older Windows OS, you might encounter an issue with shared folders as described in this [VB trouble
ticket](https://www.virtualbox.org/ticket/14920). Newer Windows systems meet the
requirements for [Docker Desktop for Windows](../desktop/install/windows-install.md) and do not
need VirtualBox.
{ .important }
@y
> Shared folders, volumes, and bind mounts
>
> * If your project is outside of the `Users` directory (`cd ~`), then you
need to share the drive or location of the Dockerfile and volume you are using.
If you get runtime errors indicating an application file is not found, a volume
mount is denied, or a service cannot start, try enabling file or drive sharing.
Volume mounting requires shared drives for projects that live outside of
`C:\Users` (Windows) or `/Users` (Mac), and is required for _any_ project on
Docker Desktop for Mac and Docker Desktop for Windows that uses
[Linux containers](../desktop/faqs/windowsfaqs.md#how-do-i-switch-between-windows-and-linux-containers).
For more information, see
[File sharing on Docker for Mac](../desktop/settings/mac.md#file-sharing),
[File sharing on Docker for Windows](../desktop/settings/windows.md#file-sharing), [File sharing on Docker for Linux](../desktop/settings/linux.md#file-sharing).
and the general examples on how to
> [Manage data in containers](../storage/volumes.md).
>
> * If you are using Oracle VirtualBox on an older Windows OS, you might encounter an issue with shared folders as described in this [VB trouble
ticket](https://www.virtualbox.org/ticket/14920). Newer Windows systems meet the
requirements for [Docker Desktop for Windows](../desktop/install/windows-install.md) and do not
need VirtualBox.
{ .important }
@z

@x
## Step 7: Update the application
@y
## Step 7: Update the application
@z

@x
As the application code is now mounted into the container using a volume,
you can make changes to its code and see the changes instantly, without having
to rebuild the image.
@y
As the application code is now mounted into the container using a volume,
you can make changes to its code and see the changes instantly, without having
to rebuild the image.
@z

@x
Change the greeting in `app.py` and save it. For example, change the `Hello World!`
message to `Hello from Docker!`:
@y
Change the greeting in `app.py` and save it. For example, change the `Hello World!`
message to `Hello from Docker!`:
@z

@x
```python
return 'Hello from Docker! I have been seen {} times.\n'.format(count)
```
@y
```python
return 'Hello from Docker! I have been seen {} times.\n'.format(count)
```
@z

@x
Refresh the app in your browser. The greeting should be updated, and the
counter should still be incrementing.
@y
Refresh the app in your browser. The greeting should be updated, and the
counter should still be incrementing.
@z

@x
![hello world in browser](images/quick-hello-world-3.png)
@y
![hello world in browser](images/quick-hello-world-3.png)
@z

@x
## Step 8: Experiment with some other commands
@y
## Step 8: Experiment with some other commands
@z

@x
If you want to run your services in the background, you can pass the `-d` flag
(for "detached" mode) to `docker compose up` and use `docker compose ps` to
see what is currently running:
@y
If you want to run your services in the background, you can pass the `-d` flag
(for "detached" mode) to `docker compose up` and use `docker compose ps` to
see what is currently running:
@z

@x
```console
$ docker compose up -d
@y
```console
$ docker compose up -d
@z

@x
Starting composetest_redis_1...
Starting composetest_web_1...
@y
Starting composetest_redis_1...
Starting composetest_web_1...
@z

@x
$ docker compose ps
@y
$ docker compose ps
@z

@x
       Name                      Command               State           Ports         
-------------------------------------------------------------------------------------
composetest_redis_1   docker-entrypoint.sh redis ...   Up      6379/tcp              
composetest_web_1     flask run                        Up      0.0.0.0:8000->5000/tcp
```
@y
       Name                      Command               State           Ports         
-------------------------------------------------------------------------------------
composetest_redis_1   docker-entrypoint.sh redis ...   Up      6379/tcp              
composetest_web_1     flask run                        Up      0.0.0.0:8000->5000/tcp
```
@z

@x
The `docker compose run` command allows you to run one-off commands for your
services. For example, to see what environment variables are available to the
`web` service:
@y
The `docker compose run` command allows you to run one-off commands for your
services. For example, to see what environment variables are available to the
`web` service:
@z

@x
```console
$ docker compose run web env
```
@y
```console
$ docker compose run web env
```
@z

@x
See `docker compose --help` to see other available commands.
@y
See `docker compose --help` to see other available commands.
@z

@x
If you started Compose with `docker compose up -d`, stop
your services once you've finished with them:
@y
If you started Compose with `docker compose up -d`, stop
your services once you've finished with them:
@z

@x
```console
$ docker compose stop
```
@y
```console
$ docker compose stop
```
@z

@x
You can bring everything down, removing the containers entirely, with the `down`
command. Pass `--volumes` to also remove the data volume used by the Redis
container:
@y
You can bring everything down, removing the containers entirely, with the `down`
command. Pass `--volumes` to also remove the data volume used by the Redis
container:
@z

@x
```console
$ docker compose down --volumes
```
@y
```console
$ docker compose down --volumes
```
@z

@x
## Where to go next
@y
## Where to go next
@z

@x
- Try the [Sample apps with Compose](https://github.com/docker/awesome-compose)
- [Explore the full list of Compose commands](reference/index.md)
- [Explore the Compose file reference](compose-file/index.md)
- To learn more about volumes and bind mounts, see [Manage data in Docker](../storage/index.md)
@y
- Try the [Sample apps with Compose](https://github.com/docker/awesome-compose)
- [Explore the full list of Compose commands](reference/index.md)
- [Explore the Compose file reference](compose-file/index.md)
- To learn more about volumes and bind mounts, see [Manage data in Docker](../storage/index.md)
@z
