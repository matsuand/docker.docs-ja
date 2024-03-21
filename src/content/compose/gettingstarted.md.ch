%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

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
This tutorial aims to introduce fundamental concepts of Docker Compose by guiding you through the development of a basic Python web application. 
@y
This tutorial aims to introduce fundamental concepts of Docker Compose by guiding you through the development of a basic Python web application. 
@z

@x
Using the Flask framework, the application features a hit counter in Redis, providing a practical example of how Docker Compose can be applied in web development scenarios. 
@y
Using the Flask framework, the application features a hit counter in Redis, providing a practical example of how Docker Compose can be applied in web development scenarios. 
@z

@x
The concepts demonstrated here should be understandable even if you're not familiar with Python. 
@y
The concepts demonstrated here should be understandable even if you're not familiar with Python. 
@z

@x
This is a non-normative example that just highlights the key things you can do with Compose.
@y
This is a non-normative example that just highlights the key things you can do with Compose.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Make sure you have:
@y
Make sure you have:
@z

@x
- Installed the latest version of Docker Compose
- A basic understanding of Docker concepts and how Docker works
@y
- Installed the latest version of Docker Compose
- A basic understanding of Docker concepts and how Docker works
@z

@x
## Step 1: Set up
@y
## Step 1: Set up
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
   application's network and the default port, `6379` is used.
@y
   In this example, `redis` is the hostname of the redis container on the
   application's network and the default port, `6379` is used.
@z

@x
   > **Note**
   >
   > Note the way the `get_hit_count` function is written. This basic retry
   > loop attempts the request multiple times if the Redis service is
   > not available. This is useful at startup while the application comes
   > online, but also makes the application more resilient if the Redis
   > service needs to be restarted anytime during the app's lifetime. In a
   > cluster, this also helps handling momentary connection drops between
   > nodes.
@y
   > **Note**
   >
   > Note the way the `get_hit_count` function is written. This basic retry
   > loop attempts the request multiple times if the Redis service is
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
4. Create a `Dockerfile` and paste the following code in:
@y
4. Create a `Dockerfile` and paste the following code in:
@z

@x
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM python:3.10-alpine
   WORKDIR /code
   ENV FLASK_APP=app.py
   ENV FLASK_RUN_HOST=0.0.0.0
   RUN apk add --no-cache gcc musl-dev linux-headers
   COPY requirements.txt requirements.txt
   RUN pip install -r requirements.txt
   EXPOSE 5000
   COPY . .
   CMD ["flask", "run", "--debug"]
   ```
@y
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM python:3.10-alpine
   WORKDIR /code
   ENV FLASK_APP=app.py
   ENV FLASK_RUN_HOST=0.0.0.0
   RUN apk add --no-cache gcc musl-dev linux-headers
   COPY requirements.txt requirements.txt
   RUN pip install -r requirements.txt
   EXPOSE 5000
   COPY . .
   CMD ["flask", "run", "--debug"]
   ```
@z

@x
   {{< accordion title="Understand the Dockerfile" >}}
@y
   {{< accordion title="Understand the Dockerfile" >}}
@z

@x
   This tells Docker to:
@y
   This tells Docker to:
@z

@x
   * Build an image starting with the Python 3.10 image.
   * Set the working directory to `/code`.
   * Set environment variables used by the `flask` command.
   * Install gcc and other dependencies
   * Copy `requirements.txt` and install the Python dependencies.
   * Add metadata to the image to describe that the container is listening on port 5000
   * Copy the current directory `.` in the project to the workdir `.` in the image.
   * Set the default command for the container to `flask run --debug`.
@y
   * Build an image starting with the Python 3.10 image.
   * Set the working directory to `/code`.
   * Set environment variables used by the `flask` command.
   * Install gcc and other dependencies
   * Copy `requirements.txt` and install the Python dependencies.
   * Add metadata to the image to describe that the container is listening on port 5000
   * Copy the current directory `.` in the project to the workdir `.` in the image.
   * Set the default command for the container to `flask run --debug`.
@z

@x
   {{< /accordion >}}
@y
   {{< /accordion >}}
@z

@x
   > **Important**
   >
   >Check that the `Dockerfile` has no file extension like `.txt`. Some editors may append this file extension automatically which results in an error when you run the application.
   { .important }
@y
   > **Important**
   >
   >Check that the `Dockerfile` has no file extension like `.txt`. Some editors may append this file extension automatically which results in an error when you run the application.
   { .important }
@z

@x
   For more information on how to write Dockerfiles, see the [Docker user guide](../develop/index.md) and the [Dockerfile reference](/reference/dockerfile/).
@y
   For more information on how to write Dockerfiles, see the [Docker user guide](../develop/index.md) and the [Dockerfile reference](__SUBDIR__/reference/dockerfile/).
@z

@x
## Step 2: Define services in a Compose file
@y
## Step 2: Define services in a Compose file
@z

@x
Compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single, comprehensible YAML configuration file.
@y
Compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single, comprehensible YAML configuration file.
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
For more information on the `compose.yaml` file, see [How Compose works](compose-application-model.md).
@y
For more information on the `compose.yaml` file, see [How Compose works](compose-application-model.md).
@z

@x
## Step 3: Build and run your app with Compose
@y
## Step 3: Build and run your app with Compose
@z

@x
With a single command, you create and start all the services from your configuration file.
@y
With a single command, you create and start all the services from your configuration file.
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
2. Enter `http://localhost:8000/` in a browser to see the application running.
@y
2. Enter `http://localhost:8000/` in a browser to see the application running.
@z

@x
   If this doesn't resolve, you can also try `http://127.0.0.1:8000`.
@y
   If this doesn't resolve, you can also try `http://127.0.0.1:8000`.
@z

@x
   You should see a message in your browser saying:
@y
   You should see a message in your browser saying:
@z

@x
   ```text
   Hello World! I have been seen 1 times.
   ```
@y
   ```text
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
   ```text
   Hello World! I have been seen 2 times.
   ```
@y
   ```text
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
   hitting `CTRL+C` in the original terminal where you started the app.
@y
5. Stop the application, either by running `docker compose down`
   from within your project directory in the second terminal, or by
   hitting `CTRL+C` in the original terminal where you started the app.
@z

@x
## Step 4: Edit the Compose file to use Compose Watch
@y
## Step 4: Edit the Compose file to use Compose Watch
@z

@x
Edit the `compose.yaml` file in your project directory to use `watch` so you can preview your running Compose services which are automatically updated as you edit and save your code:
@y
Edit the `compose.yaml` file in your project directory to use `watch` so you can preview your running Compose services which are automatically updated as you edit and save your code:
@z

@x
```yaml
services:
  web:
    build: .
    ports:
      - "8000:5000"
    develop:
      watch:
        - action: sync
          path: .
          target: /code
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
    develop:
      watch:
        - action: sync
          path: .
          target: /code
  redis:
    image: "redis:alpine"
```
@z

@x
Whenever a file is changed, Compose syncs the file to the corresponding location under `/code` inside the container. Once copied, the bundler updates the running application without a restart.
@y
Whenever a file is changed, Compose syncs the file to the corresponding location under `/code` inside the container. Once copied, the bundler updates the running application without a restart.
@z

@x
For more information on how Compose Watch works, see [Use Compose Watch](file-watch.md). Alternatively, see [Manage data in containers](../storage/volumes.md) for other options.
@y
For more information on how Compose Watch works, see [Use Compose Watch](file-watch.md). Alternatively, see [Manage data in containers](../storage/volumes.md) for other options.
@z

@x
> **Note**
>
> For this example to work, the `--debug` option is added to the `Dockerfile`. The `--debug` option in Flask enables automatic code reload, making it possible to work on the backend API without the need to restart or rebuild the container.
> After changing the `.py` file, subsequent API calls will use the new code, but the browser UI will not automatically refresh in this small example. Most frontend development servers include native live reload support that works with Compose.
@y
> **Note**
>
> For this example to work, the `--debug` option is added to the `Dockerfile`. The `--debug` option in Flask enables automatic code reload, making it possible to work on the backend API without the need to restart or rebuild the container.
> After changing the `.py` file, subsequent API calls will use the new code, but the browser UI will not automatically refresh in this small example. Most frontend development servers include native live reload support that works with Compose.
@z

@x
## Step 5: Re-build and run the app with Compose
@y
## Step 5: Re-build and run the app with Compose
@z

@x
From your project directory, type `docker compose watch` or `docker compose up --watch` to build and launch the app and start the file watch mode.
@y
From your project directory, type `docker compose watch` or `docker compose up --watch` to build and launch the app and start the file watch mode.
@z

@x
```console
$ docker compose watch
[+] Running 2/2
 ✔ Container docs-redis-1 Created                                                                                                                                                                                                        0.0s
 ✔ Container docs-web-1    Recreated                                                                                                                                                                                                      0.1s
Attaching to redis-1, web-1
         ⦿ watch enabled
...
```
@y
```console
$ docker compose watch
[+] Running 2/2
 ✔ Container docs-redis-1 Created                                                                                                                                                                                                        0.0s
 ✔ Container docs-web-1    Recreated                                                                                                                                                                                                      0.1s
Attaching to redis-1, web-1
         ⦿ watch enabled
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
## Step 6: Update the application
@y
## Step 6: Update the application
@z

@x
To see Compose Watch in action:
@y
To see Compose Watch in action:
@z

@x
1. Change the greeting in `app.py` and save it. For example, change the `Hello World!`
message to `Hello from Docker!`:
@y
1. Change the greeting in `app.py` and save it. For example, change the `Hello World!`
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
2. Refresh the app in your browser. The greeting should be updated, and the
counter should still be incrementing.
@y
2. Refresh the app in your browser. The greeting should be updated, and the
counter should still be incrementing.
@z

@x
   ![hello world in browser](images/quick-hello-world-3.png)
@y
   ![hello world in browser](images/quick-hello-world-3.png)
@z

@x
3. Once you're done, run `docker compose down`.
@y
3. Once you're done, run `docker compose down`.
@z

@x
## Step 7: Split up your services
@y
## Step 7: Split up your services
@z

@x
Using multiple Compose files lets you customize a Compose application for different environments or workflows. This is useful for large applications that may use dozens of containers, with ownership distributed across multiple teams. 
@y
Using multiple Compose files lets you customize a Compose application for different environments or workflows. This is useful for large applications that may use dozens of containers, with ownership distributed across multiple teams. 
@z

@x
1. In your project folder, create a new Compose file called `infra.yaml`.
@y
1. In your project folder, create a new Compose file called `infra.yaml`.
@z

@x
2. Cut the Redis service from your `compose.yaml` file and paste it into your new `infra.yaml` file. Make sure you add the `services` top-level attribute at the top of your file. Your `infra.yaml` file should now look like this:
@y
2. Cut the Redis service from your `compose.yaml` file and paste it into your new `infra.yaml` file. Make sure you add the `services` top-level attribute at the top of your file. Your `infra.yaml` file should now look like this:
@z

@x
   ```yaml
   services:
     redis:
       image: "redis:alpine"
   ```
@y
   ```yaml
   services:
     redis:
       image: "redis:alpine"
   ```
@z

@x
3. In your `compose.yaml` file, add the `include` top-level attribute along with the path to the `infra.yaml` file.
@y
3. In your `compose.yaml` file, add the `include` top-level attribute along with the path to the `infra.yaml` file.
@z

@x
   ```yaml
   include:
      - infra.yaml
   services:
     web:
       build: .
       ports:
         - "8000:5000"
       develop:
         watch:
           - action: sync
             path: .
             target: /code
   ```
@y
   ```yaml
   include:
      - infra.yaml
   services:
     web:
       build: .
       ports:
         - "8000:5000"
       develop:
         watch:
           - action: sync
             path: .
             target: /code
   ```
@z

@x
4. Run `docker compose up` to build the app with the updated Compose files, and run it. You should see the `Hello world` message in your browser. 
@y
4. Run `docker compose up` to build the app with the updated Compose files, and run it. You should see the `Hello world` message in your browser. 
@z

@x
This is a simplified example, but it demonstrates the basic principle of `include` and how it can make it easier to modularize complex applications into sub-Compose files. For more information on `include` and working with multiple Compose files, see [Working with multiple Compose files](multiple-compose-files/_index.md).
@y
This is a simplified example, but it demonstrates the basic principle of `include` and how it can make it easier to modularize complex applications into sub-Compose files. For more information on `include` and working with multiple Compose files, see [Working with multiple Compose files](multiple-compose-files/_index.md).
@z

@x
## Step 8: Experiment with some other commands
@y
## Step 8: Experiment with some other commands
@z

@x
- If you want to run your services in the background, you can pass the `-d` flag (for "detached" mode) to `docker compose up` and use `docker compose ps` to see what is currently running:
@y
- If you want to run your services in the background, you can pass the `-d` flag (for "detached" mode) to `docker compose up` and use `docker compose ps` to see what is currently running:
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
- Run `docker compose --help` to see other available commands.
@y
- Run `docker compose --help` to see other available commands.
@z

@x
- If you started Compose with `docker compose up -d`, stop your services once you've finished with them:
@y
- If you started Compose with `docker compose up -d`, stop your services once you've finished with them:
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
- You can bring everything down, removing the containers entirely, with the `docker compose down` command. 
@y
- You can bring everything down, removing the containers entirely, with the `docker compose down` command. 
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
@y
- Try the [Sample apps with Compose](https://github.com/docker/awesome-compose)
- [Explore the full list of Compose commands](reference/index.md)
- [Explore the Compose file reference](compose-file/index.md)
@z
