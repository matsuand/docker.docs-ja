%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
title: Use Docker Compose
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Using Docker Compose for multi-container applications
@y
title: Use Docker Compose
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Using Docker Compose for multi-container applications
@z

@x
[Docker Compose](/compose/_index.md) is a tool that helps you define and
share multi-container applications. With Compose, you can create a YAML file to define the services
and with a single command, you can spin everything up or tear it all down.
@y
[Docker Compose](compose/_index.md) is a tool that helps you define and
share multi-container applications. With Compose, you can create a YAML file to define the services
and with a single command, you can spin everything up or tear it all down.
@z

@x
The big advantage of using Compose is you can define your application stack in a file, keep it at the root of
your project repository (it's now version controlled), and easily enable someone else to contribute to your project.
Someone would only need to clone your repository and start the app using Compose. In fact, you might see quite a few projects
on GitHub/GitLab doing exactly this now.
@y
The big advantage of using Compose is you can define your application stack in a file, keep it at the root of
your project repository (it's now version controlled), and easily enable someone else to contribute to your project.
Someone would only need to clone your repository and start the app using Compose. In fact, you might see quite a few projects
on GitHub/GitLab doing exactly this now.
@z

@x
## Create the Compose file
@y
## Create the Compose file
@z

@x
In the `getting-started-app` directory, create a file named `compose.yaml`.
@y
In the `getting-started-app` directory, create a file named `compose.yaml`.
@z

@x
```text
├── getting-started-app/
│ ├── Dockerfile
│ ├── compose.yaml
│ ├── node_modules/
│ ├── package.json
│ ├── spec/
│ ├── src/
│ └── yarn.lock
```
@y
```text
├── getting-started-app/
│ ├── Dockerfile
│ ├── compose.yaml
│ ├── node_modules/
│ ├── package.json
│ ├── spec/
│ ├── src/
│ └── yarn.lock
```
@z

@x
## Define the app service
@y
## Define the app service
@z

@x
In [part 7](./07_multi_container.md), you used the following command to start the application service.
@y
In [part 7](./07_multi_container.md), you used the following command to start the application service.
@z

@x
```console
$ docker run -dp 127.0.0.1:3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  node:18-alpine \
  sh -c "yarn install && yarn run dev"
```
@y
```console
$ docker run -dp 127.0.0.1:3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  node:18-alpine \
  sh -c "yarn install && yarn run dev"
```
@z

@x
You'll now define this service in the `compose.yaml` file.
@y
You'll now define this service in the `compose.yaml` file.
@z

@x
1. Open `compose.yaml` in a text or code editor, and start by defining the name and image of the first service (or container) you want to run as part of your application.
   The name will automatically become a network alias, which will be useful when defining your MySQL service.
@y
1. Open `compose.yaml` in a text or code editor, and start by defining the name and image of the first service (or container) you want to run as part of your application.
   The name will automatically become a network alias, which will be useful when defining your MySQL service.
@z

@x
   ```yaml
   services:
     app:
       image: node:18-alpine
   ```
@y
   ```yaml
   services:
     app:
       image: node:18-alpine
   ```
@z

@x
2. Typically, you will see `command` close to the `image` definition, although there is no requirement on ordering. Add the `command` to your `compose.yaml` file.
@y
2. Typically, you will see `command` close to the `image` definition, although there is no requirement on ordering. Add the `command` to your `compose.yaml` file.
@z

@x
   ```yaml
   services:
     app:
       image: node:18-alpine
       command: sh -c "yarn install && yarn run dev"
   ```
@y
   ```yaml
   services:
     app:
       image: node:18-alpine
       command: sh -c "yarn install && yarn run dev"
   ```
@z

@x
3. Now migrate the `-p 127.0.0.1:3000:3000` part of the command by defining the `ports` for the service.
@y
3. Now migrate the `-p 127.0.0.1:3000:3000` part of the command by defining the `ports` for the service.
@z

@x
   ```yaml
   services:
     app:
       image: node:18-alpine
       command: sh -c "yarn install && yarn run dev"
       ports:
         - 127.0.0.1:3000:3000
   ```
@y
   ```yaml
   services:
     app:
       image: node:18-alpine
       command: sh -c "yarn install && yarn run dev"
       ports:
         - 127.0.0.1:3000:3000
   ```
@z

@x
4. Next, migrate both the working directory (`-w /app`) and the volume mapping
   (`-v "$(pwd):/app"`) by using the `working_dir` and `volumes` definitions.
@y
4. Next, migrate both the working directory (`-w /app`) and the volume mapping
   (`-v "$(pwd):/app"`) by using the `working_dir` and `volumes` definitions.
@z

@x
    One advantage of Docker Compose volume definitions is you can use relative paths from the current directory.
@y
    One advantage of Docker Compose volume definitions is you can use relative paths from the current directory.
@z

@x
   ```yaml
   services:
     app:
       image: node:18-alpine
       command: sh -c "yarn install && yarn run dev"
       ports:
         - 127.0.0.1:3000:3000
       working_dir: /app
       volumes:
         - ./:/app
   ```
@y
   ```yaml
   services:
     app:
       image: node:18-alpine
       command: sh -c "yarn install && yarn run dev"
       ports:
         - 127.0.0.1:3000:3000
       working_dir: /app
       volumes:
         - ./:/app
   ```
@z

@x
5. Finally, you need to migrate the environment variable definitions using the `environment` key.
@y
5. Finally, you need to migrate the environment variable definitions using the `environment` key.
@z

@x
   ```yaml
   services:
     app:
       image: node:18-alpine
       command: sh -c "yarn install && yarn run dev"
       ports:
         - 127.0.0.1:3000:3000
       working_dir: /app
       volumes:
         - ./:/app
       environment:
         MYSQL_HOST: mysql
         MYSQL_USER: root
         MYSQL_PASSWORD: secret
         MYSQL_DB: todos
   ```
@y
   ```yaml
   services:
     app:
       image: node:18-alpine
       command: sh -c "yarn install && yarn run dev"
       ports:
         - 127.0.0.1:3000:3000
       working_dir: /app
       volumes:
         - ./:/app
       environment:
         MYSQL_HOST: mysql
         MYSQL_USER: root
         MYSQL_PASSWORD: secret
         MYSQL_DB: todos
   ```
@z

@x
### Define the MySQL service
@y
### Define the MySQL service
@z

@x
Now, it's time to define the MySQL service. The command that you used for that container was the following:
@y
Now, it's time to define the MySQL service. The command that you used for that container was the following:
@z

@x
```console
$ docker run -d \
  --network todo-app --network-alias mysql \
  -v todo-mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=todos \
  mysql:8.0
```
@y
```console
$ docker run -d \
  --network todo-app --network-alias mysql \
  -v todo-mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=todos \
  mysql:8.0
```
@z

@x
1. First define the new service and name it `mysql` so it automatically gets the network alias. Also specify the image to use as well.
@y
1. First define the new service and name it `mysql` so it automatically gets the network alias. Also specify the image to use as well.
@z

@x
   ```yaml
@y
   ```yaml
@z

@x
   services:
     app:
       # The app service definition
     mysql:
       image: mysql:8.0
   ```
@y
   services:
     app:
       # The app service definition
     mysql:
       image: mysql:8.0
   ```
@z

@x
2. Next, define the volume mapping. When you ran the container with `docker
   run`, Docker created the named volume automatically. However, that doesn't
   happen when running with Compose. You need to define the volume in the
   top-level `volumes:` section and then specify the mountpoint in the service
   config. By simply providing only the volume name, the default options are
   used.
@y
2. Next, define the volume mapping. When you ran the container with `docker
   run`, Docker created the named volume automatically. However, that doesn't
   happen when running with Compose. You need to define the volume in the
   top-level `volumes:` section and then specify the mountpoint in the service
   config. By simply providing only the volume name, the default options are
   used.
@z

@x
   ```yaml
   services:
     app:
       # The app service definition
     mysql:
       image: mysql:8.0
       volumes:
         - todo-mysql-data:/var/lib/mysql
@y
   ```yaml
   services:
     app:
       # The app service definition
     mysql:
       image: mysql:8.0
       volumes:
         - todo-mysql-data:/var/lib/mysql
@z

@x
   volumes:
     todo-mysql-data:
   ```
@y
   volumes:
     todo-mysql-data:
   ```
@z

@x
3. Finally, you need to specify the environment variables.
@y
3. Finally, you need to specify the environment variables.
@z

@x
   ```yaml
   services:
     app:
       # The app service definition
     mysql:
       image: mysql:8.0
       volumes:
         - todo-mysql-data:/var/lib/mysql
       environment:
         MYSQL_ROOT_PASSWORD: secret
         MYSQL_DATABASE: todos
@y
   ```yaml
   services:
     app:
       # The app service definition
     mysql:
       image: mysql:8.0
       volumes:
         - todo-mysql-data:/var/lib/mysql
       environment:
         MYSQL_ROOT_PASSWORD: secret
         MYSQL_DATABASE: todos
@z

@x
   volumes:
     todo-mysql-data:
   ```
@y
   volumes:
     todo-mysql-data:
   ```
@z

@x
At this point, your complete `compose.yaml` should look like this:
@y
At this point, your complete `compose.yaml` should look like this:
@z

@x
```yaml
services:
  app:
    image: node:18-alpine
    command: sh -c "yarn install && yarn run dev"
    ports:
      - 127.0.0.1:3000:3000
    working_dir: /app
    volumes:
      - ./:/app
    environment:
      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: secret
      MYSQL_DB: todos
@y
```yaml
services:
  app:
    image: node:18-alpine
    command: sh -c "yarn install && yarn run dev"
    ports:
      - 127.0.0.1:3000:3000
    working_dir: /app
    volumes:
      - ./:/app
    environment:
      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: secret
      MYSQL_DB: todos
@z

@x
  mysql:
    image: mysql:8.0
    volumes:
      - todo-mysql-data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: todos
@y
  mysql:
    image: mysql:8.0
    volumes:
      - todo-mysql-data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: todos
@z

@x
volumes:
  todo-mysql-data:
```
@y
volumes:
  todo-mysql-data:
```
@z

@x
## Run the application stack
@y
## Run the application stack
@z

@x
Now that you have your `compose.yaml` file, you can start your application.
@y
Now that you have your `compose.yaml` file, you can start your application.
@z

@x
1. Make sure no other copies of the containers are running first. Use `docker ps` to list the containers and `docker rm -f <ids>` to remove them.
@y
1. Make sure no other copies of the containers are running first. Use `docker ps` to list the containers and `docker rm -f <ids>` to remove them.
@z

@x
2. Start up the application stack using the `docker compose up` command. Add the
   `-d` flag to run everything in the background.
@y
2. Start up the application stack using the `docker compose up` command. Add the
   `-d` flag to run everything in the background.
@z

@x
   ```console
   $ docker compose up -d
   ```
@y
   ```console
   $ docker compose up -d
   ```
@z

@x
    When you run the previous command, you should see output like the following:
@y
    When you run the previous command, you should see output like the following:
@z

@x
   ```plaintext
   Creating network "app_default" with the default driver
   Creating volume "app_todo-mysql-data" with default driver
   Creating app_app_1   ... done
   Creating app_mysql_1 ... done
   ```
@y
   ```plaintext
   Creating network "app_default" with the default driver
   Creating volume "app_todo-mysql-data" with default driver
   Creating app_app_1   ... done
   Creating app_mysql_1 ... done
   ```
@z

@x
    You'll notice that Docker Compose created the volume as well as a network. By default, Docker Compose automatically creates a network specifically for the application stack (which is why you didn't define one in the Compose file).
@y
    You'll notice that Docker Compose created the volume as well as a network. By default, Docker Compose automatically creates a network specifically for the application stack (which is why you didn't define one in the Compose file).
@z

@x
3. Look at the logs using the `docker compose logs -f` command. You'll see the logs from each of the services interleaved
    into a single stream. This is incredibly useful when you want to watch for timing-related issues. The `-f` flag follows the
    log, so will give you live output as it's generated.
@y
3. Look at the logs using the `docker compose logs -f` command. You'll see the logs from each of the services interleaved
    into a single stream. This is incredibly useful when you want to watch for timing-related issues. The `-f` flag follows the
    log, so will give you live output as it's generated.
@z

@x
    If you have run the command already, you'll see output that looks like this:
@y
    If you have run the command already, you'll see output that looks like this:
@z

@x
    ```plaintext
    mysql_1  | 2019-10-03T03:07:16.083639Z 0 [Note] mysqld: ready for connections.
    mysql_1  | Version: '8.0.31'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
    app_1    | Connected to mysql db at host mysql
    app_1    | Listening on port 3000
    ```
@y
    ```plaintext
    mysql_1  | 2019-10-03T03:07:16.083639Z 0 [Note] mysqld: ready for connections.
    mysql_1  | Version: '8.0.31'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
    app_1    | Connected to mysql db at host mysql
    app_1    | Listening on port 3000
    ```
@z

@x
    The service name is displayed at the beginning of the line (often colored) to help distinguish messages. If you want to
    view the logs for a specific service, you can add the service name to the end of the logs command (for example,
    `docker compose logs -f app`).
@y
    The service name is displayed at the beginning of the line (often colored) to help distinguish messages. If you want to
    view the logs for a specific service, you can add the service name to the end of the logs command (for example,
    `docker compose logs -f app`).
@z

@x
4. At this point, you should be able to open your app in your browser on [http://localhost:3000](http://localhost:3000) and see it running.
@y
4. At this point, you should be able to open your app in your browser on [http://localhost:3000](http://localhost:3000) and see it running.
@z

@x
## See the app stack in Docker Dashboard
@y
## See the app stack in Docker Dashboard
@z

@x
If you look at the Docker Dashboard, you'll see that there is a group named **getting-started-app**. This is the project name from Docker
Compose and used to group the containers together. By default, the project name is simply the name of the directory that the
`compose.yaml` was located in.
@y
If you look at the Docker Dashboard, you'll see that there is a group named **getting-started-app**. This is the project name from Docker
Compose and used to group the containers together. By default, the project name is simply the name of the directory that the
`compose.yaml` was located in.
@z

@x
If you expand the stack, you'll see the two containers you defined in the Compose file. The names are also a little
more descriptive, as they follow the pattern of `<service-name>-<replica-number>`. So, it's very easy to
quickly see what container is your app and which container is the mysql database.
@y
If you expand the stack, you'll see the two containers you defined in the Compose file. The names are also a little
more descriptive, as they follow the pattern of `<service-name>-<replica-number>`. So, it's very easy to
quickly see what container is your app and which container is the mysql database.
@z

@x
## Tear it all down
@y
## Tear it all down
@z

@x
When you're ready to tear it all down, simply run `docker compose down` or hit the trash can on the Docker Dashboard
for the entire app. The containers will stop and the network will be removed.
@y
When you're ready to tear it all down, simply run `docker compose down` or hit the trash can on the Docker Dashboard
for the entire app. The containers will stop and the network will be removed.
@z

@x
>**Warning**
>
>By default, named volumes in your compose file are not removed when you run `docker compose down`. If you want to
>remove the volumes, you need to add the `--volumes` flag.
>
>The Docker Dashboard does not remove volumes when you delete the app stack.
@y
>**Warning**
>
>By default, named volumes in your compose file are not removed when you run `docker compose down`. If you want to
>remove the volumes, you need to add the `--volumes` flag.
>
>The Docker Dashboard does not remove volumes when you delete the app stack.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned about Docker Compose and how it helps you simplify
the way you define and share multi-service applications.
@y
In this section, you learned about Docker Compose and how it helps you simplify
the way you define and share multi-service applications.
@z

@x
Related information:
 - [Compose overview](/compose/_index.md)
 - [Compose file reference](/reference/compose-file/_index.md)
 - [Compose CLI reference](/reference/cli/docker/compose/_index.md)
@y
Related information:
 - [Compose overview](compose/_index.md)
 - [Compose file reference](reference/compose-file/_index.md)
 - [Compose CLI reference](reference/cli/docker/compose/_index.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, you'll learn about a few best practices you can use to improve your Dockerfile.
@y
Next, you'll learn about a few best practices you can use to improve your Dockerfile.
@z

@x
{{< button text="Image-building best practices" url="09_image_best.md" >}}
@y
{{< button text="Image-building best practices" url="09_image_best.md" >}}
@z
