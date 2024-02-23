%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Multi container apps
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Using more than one container in your application
@y
title: Multi container apps
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Using more than one container in your application
@z

@x
Up to this point, you've been working with single container apps. But, now you will add MySQL to the
application stack. The following question often arises - "Where will MySQL run? Install it in the same
container or run it separately?" In general, each container should do one thing and do it well. The following are a few reasons to run the container separately:
@y
Up to this point, you've been working with single container apps. But, now you will add MySQL to the
application stack. The following question often arises - "Where will MySQL run? Install it in the same
container or run it separately?" In general, each container should do one thing and do it well. The following are a few reasons to run the container separately:
@z

@x
- There's a good chance you'd have to scale APIs and front-ends differently than databases.
- Separate containers let you version and update versions in isolation.
- While you may use a container for the database locally, you may want to use a managed service
  for the database in production. You don't want to ship your database engine with your app then.
- Running multiple processes will require a process manager (the container only starts one process), which adds complexity to container startup/shutdown.
@y
- There's a good chance you'd have to scale APIs and front-ends differently than databases.
- Separate containers let you version and update versions in isolation.
- While you may use a container for the database locally, you may want to use a managed service
  for the database in production. You don't want to ship your database engine with your app then.
- Running multiple processes will require a process manager (the container only starts one process), which adds complexity to container startup/shutdown.
@z

@x
And there are more reasons. So, like the following diagram, it's best to run your app in multiple containers.
@y
And there are more reasons. So, like the following diagram, it's best to run your app in multiple containers.
@z

@x
![Todo App connected to MySQL container](images/multi-container.webp?w=350h=250)
@y
![Todo App connected to MySQL container](images/multi-container.webp?w=350h=250)
@z

@x
## Container networking
@y
## Container networking
@z

@x
Remember that containers, by default, run in isolation and don't know anything about other processes
or containers on the same machine. So, how do you allow one container to talk to another? The answer is
networking. If you place the two containers on the same network, they can talk to each other.
@y
Remember that containers, by default, run in isolation and don't know anything about other processes
or containers on the same machine. So, how do you allow one container to talk to another? The answer is
networking. If you place the two containers on the same network, they can talk to each other.
@z

@x
## Start MySQL
@y
## Start MySQL
@z

@x
There are two ways to put a container on a network:
 - Assign the network when starting the container.
 - Connect an already running container to a network.
@y
There are two ways to put a container on a network:
 - Assign the network when starting the container.
 - Connect an already running container to a network.
@z

@x
In the following steps, you'll create the network first and then attach the MySQL container at startup.
@y
In the following steps, you'll create the network first and then attach the MySQL container at startup.
@z

@x
1. Create the network.
@y
1. Create the network.
@z

@x
   ```console
   $ docker network create todo-app
   ```
@y
   ```console
   $ docker network create todo-app
   ```
@z

@x
2. Start a MySQL container and attach it to the network. You're also going to define a few environment variables that the
   database will use to initialize the database. To learn more about the MySQL environment variables, see the "Environment Variables" section in the [MySQL Docker Hub listing](https://hub.docker.com/_/mysql/).
@y
2. Start a MySQL container and attach it to the network. You're also going to define a few environment variables that the
   database will use to initialize the database. To learn more about the MySQL environment variables, see the "Environment Variables" section in the [MySQL Docker Hub listing](https://hub.docker.com/_/mysql/).
@z

@x
   {{< tabs >}}
   {{< tab name="Mac / Linux" >}}
@y
   {{< tabs >}}
   {{< tab name="Mac / Linux" >}}
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
   {{< /tab >}}
   {{< tab name="Windows (PowerShell)" >}}
@y
   {{< /tab >}}
   {{< tab name="Windows (PowerShell)" >}}
@z

@x
   ```powershell
   $ docker run -d `
       --network todo-app --network-alias mysql `
       -v todo-mysql-data:/var/lib/mysql `
       -e MYSQL_ROOT_PASSWORD=secret `
       -e MYSQL_DATABASE=todos `
       mysql:8.0
   ```
@y
   ```powershell
   $ docker run -d `
       --network todo-app --network-alias mysql `
       -v todo-mysql-data:/var/lib/mysql `
       -e MYSQL_ROOT_PASSWORD=secret `
       -e MYSQL_DATABASE=todos `
       mysql:8.0
   ```
@z

@x
   {{< /tab >}}
   {{< tab name="Windows (Command Prompt)" >}}
@y
   {{< /tab >}}
   {{< tab name="Windows (Command Prompt)" >}}
@z

@x
   ```console
   $ docker run -d ^
       --network todo-app --network-alias mysql ^
       -v todo-mysql-data:/var/lib/mysql ^
       -e MYSQL_ROOT_PASSWORD=secret ^
       -e MYSQL_DATABASE=todos ^
       mysql:8.0
   ```
@y
   ```console
   $ docker run -d ^
       --network todo-app --network-alias mysql ^
       -v todo-mysql-data:/var/lib/mysql ^
       -e MYSQL_ROOT_PASSWORD=secret ^
       -e MYSQL_DATABASE=todos ^
       mysql:8.0
   ```
@z

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
   In the previous command, you can see the `--network-alias` flag. In a later section, you'll learn more about this flag.
@y
   In the previous command, you can see the `--network-alias` flag. In a later section, you'll learn more about this flag.
@z

@x
   > **Tip**
   >
   > You'll notice a volume named `todo-mysql-data` in the above command that is mounted at `/var/lib/mysql`, which is where MySQL stores its data. However, you never ran a `docker volume create` command. Docker recognizes you want to use a named volume and creates one automatically for you.
   { .tip }
@y
   > **Tip**
   >
   > You'll notice a volume named `todo-mysql-data` in the above command that is mounted at `/var/lib/mysql`, which is where MySQL stores its data. However, you never ran a `docker volume create` command. Docker recognizes you want to use a named volume and creates one automatically for you.
   { .tip }
@z

@x
3. To confirm you have the database up and running, connect to the database and verify that it connects.
@y
3. To confirm you have the database up and running, connect to the database and verify that it connects.
@z

@x
   ```console
   $ docker exec -it <mysql-container-id> mysql -u root -p
   ```
@y
   ```console
   $ docker exec -it <mysql-container-id> mysql -u root -p
   ```
@z

@x
   When the password prompt comes up, type in `secret`. In the MySQL shell, list the databases and verify
   you see the `todos` database.
@y
   When the password prompt comes up, type in `secret`. In the MySQL shell, list the databases and verify
   you see the `todos` database.
@z

@x
   ```console
   mysql> SHOW DATABASES;
   ```
@y
   ```console
   mysql> SHOW DATABASES;
   ```
@z

@x
   You should see output that looks like this:
@y
   You should see output that looks like this:
@z

@x
   ```plaintext
   +--------------------+
   | Database           |
   +--------------------+
   | information_schema |
   | mysql              |
   | performance_schema |
   | sys                |
   | todos              |
   +--------------------+
   5 rows in set (0.00 sec)
   ```
@y
   ```plaintext
   +--------------------+
   | Database           |
   +--------------------+
   | information_schema |
   | mysql              |
   | performance_schema |
   | sys                |
   | todos              |
   +--------------------+
   5 rows in set (0.00 sec)
   ```
@z

@x
4. Exit the MySQL shell to return to the shell on your machine.
@y
4. Exit the MySQL shell to return to the shell on your machine.
@z

@x
   ```console
   mysql> exit
   ```
@y
   ```console
   mysql> exit
   ```
@z

@x
   You now have a `todos` database and it's ready for you to use.
@y
   You now have a `todos` database and it's ready for you to use.
@z

@x
## Connect to MySQL
@y
## Connect to MySQL
@z

@x
Now that you know MySQL is up and running, you can use it. But, how do you use it? If you run
another container on the same network, how do you find the container? Remember that each container has its own IP address.
@y
Now that you know MySQL is up and running, you can use it. But, how do you use it? If you run
another container on the same network, how do you find the container? Remember that each container has its own IP address.
@z

@x
To answer the questions above and better understand container networking, you're going to make use of the [nicolaka/netshoot](https://github.com/nicolaka/netshoot) container,
which ships with a lot of tools that are useful for troubleshooting or debugging networking issues.
@y
To answer the questions above and better understand container networking, you're going to make use of the [nicolaka/netshoot](https://github.com/nicolaka/netshoot) container,
which ships with a lot of tools that are useful for troubleshooting or debugging networking issues.
@z

@x
1. Start a new container using the nicolaka/netshoot image. Make sure to connect it to the same network.
@y
1. Start a new container using the nicolaka/netshoot image. Make sure to connect it to the same network.
@z

@x
   ```console
   $ docker run -it --network todo-app nicolaka/netshoot
   ```
@y
   ```console
   $ docker run -it --network todo-app nicolaka/netshoot
   ```
@z

@x
2. Inside the container, you're going to use the `dig` command, which is a useful DNS tool. You're going to look up
   the IP address for the hostname `mysql`.
@y
2. Inside the container, you're going to use the `dig` command, which is a useful DNS tool. You're going to look up
   the IP address for the hostname `mysql`.
@z

@x
   ```console
   $ dig mysql
   ```
@y
   ```console
   $ dig mysql
   ```
@z

@x
   You should get output like the following.
@y
   You should get output like the following.
@z

@x
   ```text
   ; <<>> DiG 9.18.8 <<>> mysql
   ;; global options: +cmd
   ;; Got answer:
   ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 32162
   ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0
@y
   ```text
   ; <<>> DiG 9.18.8 <<>> mysql
   ;; global options: +cmd
   ;; Got answer:
   ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 32162
   ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0
@z

@x
   ;; QUESTION SECTION:
   ;mysql.				IN	A
@y
   ;; QUESTION SECTION:
   ;mysql.				IN	A
@z

@x
   ;; ANSWER SECTION:
   mysql.			600	IN	A	172.23.0.2
@y
   ;; ANSWER SECTION:
   mysql.			600	IN	A	172.23.0.2
@z

@x
   ;; Query time: 0 msec
   ;; SERVER: 127.0.0.11#53(127.0.0.11)
   ;; WHEN: Tue Oct 01 23:47:24 UTC 2019
   ;; MSG SIZE  rcvd: 44
   ```
@y
   ;; Query time: 0 msec
   ;; SERVER: 127.0.0.11#53(127.0.0.11)
   ;; WHEN: Tue Oct 01 23:47:24 UTC 2019
   ;; MSG SIZE  rcvd: 44
   ```
@z

@x
   In the "ANSWER SECTION", you will see an `A` record for `mysql` that resolves to `172.23.0.2`
   (your IP address will most likely have a different value). While `mysql` isn't normally a valid hostname,
   Docker was able to resolve it to the IP address of the container that had that network alias. Remember, you used the
   `--network-alias` earlier.
@y
   In the "ANSWER SECTION", you will see an `A` record for `mysql` that resolves to `172.23.0.2`
   (your IP address will most likely have a different value). While `mysql` isn't normally a valid hostname,
   Docker was able to resolve it to the IP address of the container that had that network alias. Remember, you used the
   `--network-alias` earlier.
@z

@x
   What this means is that your app only simply needs to connect to a host named `mysql` and it'll talk to the
   database.
@y
   What this means is that your app only simply needs to connect to a host named `mysql` and it'll talk to the
   database.
@z

@x
## Run your app with MySQL
@y
## Run your app with MySQL
@z

@x
The todo app supports the setting of a few environment variables to specify MySQL connection settings. They are:
@y
The todo app supports the setting of a few environment variables to specify MySQL connection settings. They are:
@z

@x
- `MYSQL_HOST` - the hostname for the running MySQL server
- `MYSQL_USER` - the username to use for the connection
- `MYSQL_PASSWORD` - the password to use for the connection
- `MYSQL_DB` - the database to use once connected
@y
- `MYSQL_HOST` - the hostname for the running MySQL server
- `MYSQL_USER` - the username to use for the connection
- `MYSQL_PASSWORD` - the password to use for the connection
- `MYSQL_DB` - the database to use once connected
@z

@x
> **Note**
>
> While using env vars to set connection settings is generally accepted for development, it's highly discouraged
> when running applications in production. Diogo Monica, a former lead of security at Docker,
> [wrote a fantastic blog post](https://diogomonica.com/2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data/)
> explaining why.
>
> A more secure mechanism is to use the secret support provided by your container orchestration framework. In most cases,
> these secrets are mounted as files in the running container. You'll see many apps (including the MySQL image and the todo app)
> also support env vars with a `_FILE` suffix to point to a file containing the variable.
>
> As an example, setting the `MYSQL_PASSWORD_FILE` var will cause the app to use the contents of the referenced file
> as the connection password. Docker doesn't do anything to support these env vars. Your app will need to know to look for
> the variable and get the file contents.
@y
> **Note**
>
> While using env vars to set connection settings is generally accepted for development, it's highly discouraged
> when running applications in production. Diogo Monica, a former lead of security at Docker,
> [wrote a fantastic blog post](https://diogomonica.com/2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data/)
> explaining why.
>
> A more secure mechanism is to use the secret support provided by your container orchestration framework. In most cases,
> these secrets are mounted as files in the running container. You'll see many apps (including the MySQL image and the todo app)
> also support env vars with a `_FILE` suffix to point to a file containing the variable.
>
> As an example, setting the `MYSQL_PASSWORD_FILE` var will cause the app to use the contents of the referenced file
> as the connection password. Docker doesn't do anything to support these env vars. Your app will need to know to look for
> the variable and get the file contents.
@z

@x
You can now start your dev-ready container.
@y
You can now start your dev-ready container.
@z

@x
1. Specify each of the previous environment variables, as well as connect the container to your app network. Make sure that you are in the `getting-started-app` directory when you run this command.
@y
1. Specify each of the previous environment variables, as well as connect the container to your app network. Make sure that you are in the `getting-started-app` directory when you run this command.
@z

@x
   {{< tabs >}}
   {{< tab name="Mac / Linux" >}}
@y
   {{< tabs >}}
   {{< tab name="Mac / Linux" >}}
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
   {{< /tab >}}
   {{< tab name="Windows (PowerShell)" >}}
   In Windows, run this command in PowerShell.
@y
   {{< /tab >}}
   {{< tab name="Windows (PowerShell)" >}}
   In Windows, run this command in PowerShell.
@z

@x
   ```powershell
   $ docker run -dp 127.0.0.1:3000:3000 `
     -w /app -v "$(pwd):/app" `
     --network todo-app `
     -e MYSQL_HOST=mysql `
     -e MYSQL_USER=root `
     -e MYSQL_PASSWORD=secret `
     -e MYSQL_DB=todos `
     node:18-alpine `
     sh -c "yarn install && yarn run dev"
   ```
@y
   ```powershell
   $ docker run -dp 127.0.0.1:3000:3000 `
     -w /app -v "$(pwd):/app" `
     --network todo-app `
     -e MYSQL_HOST=mysql `
     -e MYSQL_USER=root `
     -e MYSQL_PASSWORD=secret `
     -e MYSQL_DB=todos `
     node:18-alpine `
     sh -c "yarn install && yarn run dev"
   ```
@z

@x
   {{< /tab >}}
   {{< tab name="Windows (Command Prompt)" >}}
   In Windows, run this command in Command Prompt.
@y
   {{< /tab >}}
   {{< tab name="Windows (Command Prompt)" >}}
   In Windows, run this command in Command Prompt.
@z

@x
   ```console
   $ docker run -dp 127.0.0.1:3000:3000 ^
     -w /app -v "%cd%:/app" ^
     --network todo-app ^
     -e MYSQL_HOST=mysql ^
     -e MYSQL_USER=root ^
     -e MYSQL_PASSWORD=secret ^
     -e MYSQL_DB=todos ^
     node:18-alpine ^
     sh -c "yarn install && yarn run dev"
   ```
@y
   ```console
   $ docker run -dp 127.0.0.1:3000:3000 ^
     -w /app -v "%cd%:/app" ^
     --network todo-app ^
     -e MYSQL_HOST=mysql ^
     -e MYSQL_USER=root ^
     -e MYSQL_PASSWORD=secret ^
     -e MYSQL_DB=todos ^
     node:18-alpine ^
     sh -c "yarn install && yarn run dev"
   ```
@z

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
2. If you look at the logs for the container (`docker logs -f <container-id>`), you should see a message similar to the following, which indicates it's
   using the mysql database.
@y
2. If you look at the logs for the container (`docker logs -f <container-id>`), you should see a message similar to the following, which indicates it's
   using the mysql database.
@z

@x
   ```console
   $ nodemon src/index.js
   [nodemon] 2.0.20
   [nodemon] to restart at any time, enter `rs`
   [nodemon] watching dir(s): *.*
   [nodemon] starting `node src/index.js`
   Connected to mysql db at host mysql
   Listening on port 3000
   ```
@y
   ```console
   $ nodemon src/index.js
   [nodemon] 2.0.20
   [nodemon] to restart at any time, enter `rs`
   [nodemon] watching dir(s): *.*
   [nodemon] starting `node src/index.js`
   Connected to mysql db at host mysql
   Listening on port 3000
   ```
@z

@x
3. Open the app in your browser and add a few items to your todo list.
@y
3. Open the app in your browser and add a few items to your todo list.
@z

@x
4. Connect to the mysql database and prove that the items are being written to the database. Remember, the password
   is `secret`.
@y
4. Connect to the mysql database and prove that the items are being written to the database. Remember, the password
   is `secret`.
@z

@x
   ```console
   $ docker exec -it <mysql-container-id> mysql -p todos
   ```
@y
   ```console
   $ docker exec -it <mysql-container-id> mysql -p todos
   ```
@z

@x
   And in the mysql shell, run the following:
@y
   And in the mysql shell, run the following:
@z

@x
   ```console
   mysql> select * from todo_items;
   +--------------------------------------+--------------------+-----------+
   | id                                   | name               | completed |
   +--------------------------------------+--------------------+-----------+
   | c906ff08-60e6-44e6-8f49-ed56a0853e85 | Do amazing things! |         0 |
   | 2912a79e-8486-4bc3-a4c5-460793a575ab | Be awesome!        |         0 |
   +--------------------------------------+--------------------+-----------+
   ```
@y
   ```console
   mysql> select * from todo_items;
   +--------------------------------------+--------------------+-----------+
   | id                                   | name               | completed |
   +--------------------------------------+--------------------+-----------+
   | c906ff08-60e6-44e6-8f49-ed56a0853e85 | Do amazing things! |         0 |
   | 2912a79e-8486-4bc3-a4c5-460793a575ab | Be awesome!        |         0 |
   +--------------------------------------+--------------------+-----------+
   ```
@z

@x
   Your table will look different because it has your items. But, you should see them stored there.
@y
   Your table will look different because it has your items. But, you should see them stored there.
@z

@x
## Summary
@y
## Summary
@z

@x
At this point, you have an application that now stores its data in an external database running in a separate
container. You learned a little bit about container networking and service discovery using DNS.
@y
At this point, you have an application that now stores its data in an external database running in a separate
container. You learned a little bit about container networking and service discovery using DNS.
@z

@x
Related information:
 - [docker CLI reference](/reference/cli/docker/)
 - [Networking overview](../network/index.md)
@y
Related information:
 - [docker CLI reference](__SUBDIR__/reference/cli/docker/)
 - [Networking overview](../network/index.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
There's a good chance you are starting to feel a little overwhelmed with everything you need to do to start up
this application. You have to create a network, start containers, specify all of the environment variables, expose
ports, and more. That's a lot to remember and it's certainly making things harder to pass along to someone else.
@y
There's a good chance you are starting to feel a little overwhelmed with everything you need to do to start up
this application. You have to create a network, start containers, specify all of the environment variables, expose
ports, and more. That's a lot to remember and it's certainly making things harder to pass along to someone else.
@z

@x
In the next section, you'll learn about Docker Compose. With Docker Compose, you can share your application stacks in a
much easier way and let others spin them up with a single, simple command.
@y
In the next section, you'll learn about Docker Compose. With Docker Compose, you can share your application stacks in a
much easier way and let others spin them up with a single, simple command.
@z

@x
{{< button text="Use Docker Compose" url="08_using_compose.md" >}}
@y
{{< button text="Use Docker Compose" url="08_using_compose.md" >}}
@z
