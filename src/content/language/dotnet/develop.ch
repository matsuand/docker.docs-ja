%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Use containers for .NET development
keywords: .net, development
description: Learn how to develop your .NET application locally using containers.
---
@y
---
title: Use containers for .NET development
keywords: .net, development
description: Learn how to develop your .NET application locally using containers.
---
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete [Containerize a .NET application](containerize.md).
@y
Complete [Containerize a .NET application](containerize.md).
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
 - Adding a local database and persisting data
 - Configuring Compose to automatically update your running Compose services as you edit and save your code
 - Creating a development container that contains the .NET Core SDK tools and dependencies
@y
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
 - Adding a local database and persisting data
 - Configuring Compose to automatically update your running Compose services as you edit and save your code
 - Creating a development container that contains the .NET Core SDK tools and dependencies
@z

@x
## Update the application
@y
## Update the application
@z

@x
This section uses a different branch of the `docker-dotnet-sample` repository
that contains an updated .NET application. The updated application is on the
`add-db` branch of the repository you cloned in [Containerize a .NET
application](containerize.md).
@y
This section uses a different branch of the `docker-dotnet-sample` repository
that contains an updated .NET application. The updated application is on the
`add-db` branch of the repository you cloned in [Containerize a .NET
application](containerize.md).
@z

@x
To get the updated code, you need to checkout the `add-db` branch. For the changes you made in [Containerize a .NET application](containerize.md), for this section, you can stash them. In a terminal, run the following commands in the `docker-dotnet-sample` directory.
@y
To get the updated code, you need to checkout the `add-db` branch. For the changes you made in [Containerize a .NET application](containerize.md), for this section, you can stash them. In a terminal, run the following commands in the `docker-dotnet-sample` directory.
@z

@x
1. Stash any previous changes.
@y
1. Stash any previous changes.
@z

@x
   ```console
   $ git stash -u
   ```
@y
   ```console
   $ git stash -u
   ```
@z

@x
2. Check out the new branch with the updated application.
@y
2. Check out the new branch with the updated application.
@z

@x
   ```console
   $ git checkout add-db
   ```
@y
   ```console
   $ git checkout add-db
   ```
@z

@x
In the `add-db` branch, only the .NET application has been updated. None of the Docker assets have been updated yet.
@y
In the `add-db` branch, only the .NET application has been updated. None of the Docker assets have been updated yet.
@z

@x
You should now have the following in your `docker-dotnet-sample` directory.
@y
You should now have the following in your `docker-dotnet-sample` directory.
@z

@x
```text
├── docker-dotnet-sample/
│ ├── .git/
│ ├── src/
│ │ ├── Data/
│ │ ├── Models/
│ │ ├── Pages/
│ │ ├── Properties/
│ │ ├── wwwroot/
│ │ ├── appsettings.Development.json
│ │ ├── appsettings.json
│ │ ├── myWebApp.csproj
│ │ └── Program.cs
│ ├── tests/
│ │ ├── tests.csproj
│ │ ├── UnitTest1.cs
│ │ └── Usings.cs
│ ├── .dockerignore
│ ├── .gitignore
│ ├── compose.yaml
│ ├── Dockerfile
│ ├── README.Docker.md
│ └── README.md
```
@y
```text
├── docker-dotnet-sample/
│ ├── .git/
│ ├── src/
│ │ ├── Data/
│ │ ├── Models/
│ │ ├── Pages/
│ │ ├── Properties/
│ │ ├── wwwroot/
│ │ ├── appsettings.Development.json
│ │ ├── appsettings.json
│ │ ├── myWebApp.csproj
│ │ └── Program.cs
│ ├── tests/
│ │ ├── tests.csproj
│ │ ├── UnitTest1.cs
│ │ └── Usings.cs
│ ├── .dockerignore
│ ├── .gitignore
│ ├── compose.yaml
│ ├── Dockerfile
│ ├── README.Docker.md
│ └── README.md
```
@z

@x
## Add a local database and persist data
@y
## Add a local database and persist data
@z

@x
You can use containers to set up local services, like a database. In this section, you'll update the `compose.yaml` file to define a database service and a volume to persist data.
@y
You can use containers to set up local services, like a database. In this section, you'll update the `compose.yaml` file to define a database service and a volume to persist data.
@z

@x
Open the `compose.yaml` file in an IDE or text editor. You'll notice it
already contains commented-out instructions for a PostgreSQL database and volume.
@y
Open the `compose.yaml` file in an IDE or text editor. You'll notice it
already contains commented-out instructions for a PostgreSQL database and volume.
@z

@x
Open `docker-dotnet-sample/src/appsettings.json` in an IDE or text editor. You'll
notice the connection string with all the database information. The
`compose.yaml` already contains this information, but it's commented out.
Uncomment the database instructions in the `compose.yaml` file.
@y
Open `docker-dotnet-sample/src/appsettings.json` in an IDE or text editor. You'll
notice the connection string with all the database information. The
`compose.yaml` already contains this information, but it's commented out.
Uncomment the database instructions in the `compose.yaml` file.
@z

@x
The following is the updated `compose.yaml` file.
@y
The following is the updated `compose.yaml` file.
@z

@x
```yaml
services:
  server:
    build:
      context: .
      target: final
    ports:
      - 8080:80
    depends_on:
      db:
        condition: service_healthy
  db:
    image: postgres
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: [ "CMD", "pg_isready" ]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@y
```yaml
services:
  server:
    build:
      context: .
      target: final
    ports:
      - 8080:80
    depends_on:
      db:
        condition: service_healthy
  db:
    image: postgres
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: [ "CMD", "pg_isready" ]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@z

@x
> **Note**
>
> To learn more about the instructions in the Compose file, see [Compose file
> reference](/compose/compose-file/).
@y
> **Note**
>
> To learn more about the instructions in the Compose file, see [Compose file
> reference](/compose/compose-file/).
@z

@x
Before you run the application using Compose, notice that this Compose file uses
`secrets` and specifies a `password.txt` file to hold the database's password.
You must create this file as it's not included in the source repository.
@y
Before you run the application using Compose, notice that this Compose file uses
`secrets` and specifies a `password.txt` file to hold the database's password.
You must create this file as it's not included in the source repository.
@z

@x
In the `docker-dotnet-sample` directory, create a new directory named `db` and
inside that directory create a file named `password.txt`. Open `password.txt` in an IDE or text editor and add the following password. The password must be on a single line, with no additional lines in the file.
@y
In the `docker-dotnet-sample` directory, create a new directory named `db` and
inside that directory create a file named `password.txt`. Open `password.txt` in an IDE or text editor and add the following password. The password must be on a single line, with no additional lines in the file.
@z

@x
```text
example
```
@y
```text
example
```
@z

@x
Save and close the `password.txt` file.
@y
Save and close the `password.txt` file.
@z

@x
You should now have the following in your `docker-dotnet-sample` directory.
@y
You should now have the following in your `docker-dotnet-sample` directory.
@z

@x
```text
├── docker-dotnet-sample/
│ ├── .git/
│ ├── db/
│ │ └── password.txt
│ ├── src/
│ ├── tests/
│ ├── .dockerignore
│ ├── .gitignore
│ ├── compose.yaml
│ ├── Dockerfile
│ ├── README.Docker.md
│ └── README.md
```
@y
```text
├── docker-dotnet-sample/
│ ├── .git/
│ ├── db/
│ │ └── password.txt
│ ├── src/
│ ├── tests/
│ ├── .dockerignore
│ ├── .gitignore
│ ├── compose.yaml
│ ├── Dockerfile
│ ├── README.Docker.md
│ └── README.md
```
@z

@x
Run the following command to start your application.
@y
Run the following command to start your application.
@z

@x
```console
$ docker compose up --build
```
@y
```console
$ docker compose up --build
```
@z

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple web application with the text `Student name is`.
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple web application with the text `Student name is`.
@z

@x
The application doesn't display a name because the database is empty. For this application, you need to access the database and then add records.
@y
The application doesn't display a name because the database is empty. For this application, you need to access the database and then add records.
@z

@x
## Add records to the database
@y
## Add records to the database
@z

@x
For the sample application, you must access the database directly to create sample records.
@y
For the sample application, you must access the database directly to create sample records.
@z

@x
You can run commands inside the database container using the `docker exec`
command. Before running that command, you must get the ID of the database
container. Open a new terminal window and run the following command to list all
your running containers.
@y
You can run commands inside the database container using the `docker exec`
command. Before running that command, you must get the ID of the database
container. Open a new terminal window and run the following command to list all
your running containers.
@z

@x
```console
$ docker container ls
```
@y
```console
$ docker container ls
```
@z

@x
You should see output like the following.
@y
You should see output like the following.
@z

@x
```console
CONTAINER ID   IMAGE                  COMMAND                  CREATED              STATUS                        PORTS                  NAMES
cb36e310aa7e   docker-dotnet-server   "dotnet myWebApp.dll"    About a minute ago   Up About a minute             0.0.0.0:8080->80/tcp   docker-dotnet-server-1
39fdcf0aff7b   postgres               "docker-entrypoint.s…"   About a minute ago   Up About a minute (healthy)   5432/tcp               docker-dotnet-db-1
```
@y
```console
CONTAINER ID   IMAGE                  COMMAND                  CREATED              STATUS                        PORTS                  NAMES
cb36e310aa7e   docker-dotnet-server   "dotnet myWebApp.dll"    About a minute ago   Up About a minute             0.0.0.0:8080->80/tcp   docker-dotnet-server-1
39fdcf0aff7b   postgres               "docker-entrypoint.s…"   About a minute ago   Up About a minute (healthy)   5432/tcp               docker-dotnet-db-1
```
@z

@x
In the previous example, the container ID is `39fdcf0aff7b`. Run the following command to start a bash shell in the postgres container. Replace the container ID with your own container ID.
@y
In the previous example, the container ID is `39fdcf0aff7b`. Run the following command to start a bash shell in the postgres container. Replace the container ID with your own container ID.
@z

@x
```console
$ docker exec -it 39fdcf0aff7b bash
```
@y
```console
$ docker exec -it 39fdcf0aff7b bash
```
@z

@x
Then run the following command to connect to the database.
@y
Then run the following command to connect to the database.
@z

@x
```console
postgres@39fdcf0aff7b:/$ psql -d example -U postgres
```
@y
```console
postgres@39fdcf0aff7b:/$ psql -d example -U postgres
```
@z

@x
And finally, insert a record into the database.
@y
And finally, insert a record into the database.
@z

@x
```console
example=# INSERT INTO "Students" ("ID", "LastName", "FirstMidName", "EnrollmentDate") VALUES (DEFAULT, 'Whale', 'Moby', '2013-03-20');
```
@y
```console
example=# INSERT INTO "Students" ("ID", "LastName", "FirstMidName", "EnrollmentDate") VALUES (DEFAULT, 'Whale', 'Moby', '2013-03-20');
```
@z

@x
You should see output like the following.
@y
You should see output like the following.
@z

@x
```console
INSERT 0 1
```
@y
```console
INSERT 0 1
```
@z

@x
Close the database connection and exit the container shell by running `exit` twice.
@y
Close the database connection and exit the container shell by running `exit` twice.
@z

@x
```console
example=# exit
postgres@39fdcf0aff7b:/$ exit
```
@y
```console
example=# exit
postgres@39fdcf0aff7b:/$ exit
```
@z

@x
## Verify that data persists in the database
@y
## Verify that data persists in the database
@z

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple web application with the text `Student name is Whale Moby`.
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple web application with the text `Student name is Whale Moby`.
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
@z

@x
In the terminal, run `docker compose rm` to remove your containers and then run `docker compose up` to run your application again.
@y
In the terminal, run `docker compose rm` to remove your containers and then run `docker compose up` to run your application again.
@z

@x
```console
$ docker compose rm
$ docker compose up --build
```
@y
```console
$ docker compose rm
$ docker compose up --build
```
@z

@x
Refresh [http://localhost:8080](http://localhost:8080) in your browser and verify that the student name persisted, even after the containers were removed and ran again.
@y
Refresh [http://localhost:8080](http://localhost:8080) in your browser and verify that the student name persisted, even after the containers were removed and ran again.
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
@z

@x
## Automatically update services
@y
## Automatically update services
@z

@x
Use Compose Watch to automatically update your running Compose services as you edit and save your code. For more details about Compose Watch, see [Use Compose Watch](../../compose/file-watch.md).
@y
Use Compose Watch to automatically update your running Compose services as you edit and save your code. For more details about Compose Watch, see [Use Compose Watch](../../compose/file-watch.md).
@z

@x
Open your `compose.yaml` file in an IDE or text editor and then add the Compose Watch instructions. The following is the updated `compose.yaml` file.
@y
Open your `compose.yaml` file in an IDE or text editor and then add the Compose Watch instructions. The following is the updated `compose.yaml` file.
@z

@x
```yaml
services:
  server:
    build:
      context: .
      target: final
    ports:
      - 8080:80
    depends_on:
      db:
        condition: service_healthy
    develop:
      watch:
        - action: rebuild
          path: .
  db:
    image: postgres
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: [ "CMD", "pg_isready" ]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
Run the following command to run your application with Compose Watch.
@y
```yaml
services:
  server:
    build:
      context: .
      target: final
    ports:
      - 8080:80
    depends_on:
      db:
        condition: service_healthy
    develop:
      watch:
        - action: rebuild
          path: .
  db:
    image: postgres
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: [ "CMD", "pg_isready" ]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
Run the following command to run your application with Compose Watch.
@z

@x
```console
$ docker compose watch
```
@y
```console
$ docker compose watch
```
@z

@x
Open a browser and verify that the application is running at [http://localhost:8080](http://localhost:8080).
@y
Open a browser and verify that the application is running at [http://localhost:8080](http://localhost:8080).
@z

@x
Any changes to the application's source files on your local machine will now be
immediately reflected in the running container.
@y
Any changes to the application's source files on your local machine will now be
immediately reflected in the running container.
@z

@x
Open `docker-dotnet-sample/src/Pages/Index.cshtml` in an IDE or text editor and update the student name text on line 13 from `Student name is` to `Student name:`.
@y
Open `docker-dotnet-sample/src/Pages/Index.cshtml` in an IDE or text editor and update the student name text on line 13 from `Student name is` to `Student name:`.
@z

@x
```diff
-    <p>Student Name is @Model.StudentName</p>
+    <p>Student name: @Model.StudentName</p>
```
@y
```diff
-    <p>Student Name is @Model.StudentName</p>
+    <p>Student name: @Model.StudentName</p>
```
@z

@x
Save the changes to `Index.cshmtl` and then wait a few seconds for the application to rebuild. Refresh [http://localhost:8080](http://localhost:8080) in your browser and verify that the updated text appears.
@y
Save the changes to `Index.cshmtl` and then wait a few seconds for the application to rebuild. Refresh [http://localhost:8080](http://localhost:8080) in your browser and verify that the updated text appears.
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
@z

@x
## Create a development container
@y
## Create a development container
@z

@x
At this point, when you run your containerized application, it's using the .NET runtime image. While this small image is good for production, it lacks the SDK tools and dependencies you may need when developing. Also, during development, you may not need to run `dotnet publish`. You can use multi-stage builds to build stages for both development and production in the same Dockerfile. For more details, see [Multi-stage builds](../../build/building/multi-stage.md).
@y
At this point, when you run your containerized application, it's using the .NET runtime image. While this small image is good for production, it lacks the SDK tools and dependencies you may need when developing. Also, during development, you may not need to run `dotnet publish`. You can use multi-stage builds to build stages for both development and production in the same Dockerfile. For more details, see [Multi-stage builds](../../build/building/multi-stage.md).
@z

@x
Add a new development stage to your Dockerfile and update your `compose.yaml` file to use this stage for local development.
@y
Add a new development stage to your Dockerfile and update your `compose.yaml` file to use this stage for local development.
@z

@x
The following is the updated Dockerfile.
@y
The following is the updated Dockerfile.
@z

@x
```Dockerfile
# syntax=docker/dockerfile:1
@y
```Dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
ARG TARGETARCH
COPY . /source
WORKDIR /source/src
RUN --mount=type=cache,id=nuget,target=/root/.nuget/packages \
    dotnet publish -a ${TARGETARCH/amd64/x64} --use-current-runtime --self-contained false -o /app
@y
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
ARG TARGETARCH
COPY . /source
WORKDIR /source/src
RUN --mount=type=cache,id=nuget,target=/root/.nuget/packages \
    dotnet publish -a ${TARGETARCH/amd64/x64} --use-current-runtime --self-contained false -o /app
@z

@x
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS development
COPY . /source
WORKDIR /source/src
CMD dotnet run --no-launch-profile
@y
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS development
COPY . /source
WORKDIR /source/src
CMD dotnet run --no-launch-profile
@z

@x
FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine AS final
WORKDIR /app
COPY --from=build /app .
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser
USER appuser
ENTRYPOINT ["dotnet", "myWebApp.dll"]
```
@y
FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine AS final
WORKDIR /app
COPY --from=build /app .
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser
USER appuser
ENTRYPOINT ["dotnet", "myWebApp.dll"]
```
@z

@x
The following is the updated `compose.yaml` file.
@y
The following is the updated `compose.yaml` file.
@z

@x
```yaml
services:
  server:
    build:
      context: .
      target: development
    ports:
      - 8080:80
    depends_on:
      db:
        condition: service_healthy
    develop:
      watch:
        - action: rebuild
          path: .
    environment:
       - ASPNETCORE_ENVIRONMENT=Development
       - ASPNETCORE_URLS=http://+:80'
  db:
    image: postgres
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: [ "CMD", "pg_isready" ]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@y
```yaml
services:
  server:
    build:
      context: .
      target: development
    ports:
      - 8080:80
    depends_on:
      db:
        condition: service_healthy
    develop:
      watch:
        - action: rebuild
          path: .
    environment:
       - ASPNETCORE_ENVIRONMENT=Development
       - ASPNETCORE_URLS=http://+:80'
  db:
    image: postgres
    restart: always
    user: postgres
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=example
      - POSTGRES_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 5432
    healthcheck:
      test: [ "CMD", "pg_isready" ]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@z

@x
Your containerized application will now use the `mcr.microsoft.com/dotnet/sdk:6.0-alpine` image, which includes development tools like `dotnet test`. Continue to the next section to learn how you can run `dotnet test`.
@y
Your containerized application will now use the `mcr.microsoft.com/dotnet/sdk:6.0-alpine` image, which includes development tools like `dotnet test`. Continue to the next section to learn how you can run `dotnet test`.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you took a look at setting up your Compose file to add a local
database and persist data. You also learned how to use Compose Watch to automatically rebuild and run your container when you update your code. And finally, you learned how to create a development container that contains the SDK tools and dependencies needed for development.
@y
In this section, you took a look at setting up your Compose file to add a local
database and persist data. You also learned how to use Compose Watch to automatically rebuild and run your container when you update your code. And finally, you learned how to create a development container that contains the SDK tools and dependencies needed for development.
@z

@x
Related information:
 - [Compose file reference](/compose/compose-file/)
 - [Compose file watch](../../compose/file-watch.md)
 - [Multi-stage builds](../../build/building/multi-stage.md)
@y
Related information:
 - [Compose file reference](/compose/compose-file/)
 - [Compose file watch](../../compose/file-watch.md)
 - [Multi-stage builds](../../build/building/multi-stage.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll learn how to run unit tests using Docker.
@y
In the next section, you'll learn how to run unit tests using Docker.
@z

@x
{{< button text="Run your tests" url="run-tests.md" >}}
@y
{{< button text="Run your tests" url="run-tests.md" >}}
@z
