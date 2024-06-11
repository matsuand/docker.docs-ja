%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。
% snip 対応

@x
title: Use containers for .NET development
keywords: .net, development
description: Learn how to develop your .NET application locally using containers.
@y
title: Use containers for .NET development
keywords: .net, development
description: Learn how to develop your .NET application locally using containers.
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

% snip command...

@x
2. Check out the new branch with the updated application.
@y
2. Check out the new branch with the updated application.
@z

% snip command...

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

% snip text...

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

% snip code...

@x
> **Note**
>
> To learn more about the instructions in the Compose file, see [Compose file
> reference](/compose/compose-file/).
@y
> **Note**
>
> To learn more about the instructions in the Compose file, see [Compose file
> reference](__SUBDIR__/compose/compose-file/).
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

% snip code...

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

% snip text...

@x
Run the following command to start your application.
@y
Run the following command to start your application.
@z

% snip command...

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

% snip command...

@x
You should see output like the following.
@y
You should see output like the following.
@z

% snip output...

@x
In the previous example, the container ID is `39fdcf0aff7b`. Run the following command to connect to the postgres database in the container. Replace the container ID with your own container ID.
@y
In the previous example, the container ID is `39fdcf0aff7b`. Run the following command to connect to the postgres database in the container. Replace the container ID with your own container ID.
@z

% snip command...

@x
And finally, insert a record into the database.
@y
And finally, insert a record into the database.
@z

% snip command...

@x
You should see output like the following.
@y
You should see output like the following.
@z

% snip output...

@x
Close the database connection and exit the container shell by running `exit`.
@y
Close the database connection and exit the container shell by running `exit`.
@z

% snip command...

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

% snip command...

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
## サービスの自動更新 {#automatically-update-services}
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

% snip code...

% snip command...

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

% snip diff...

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

% snip code...

@x
The following is the updated `compose.yaml` file.
@y
The following is the updated `compose.yaml` file.
@z

% snip code...

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
 - [Compose file reference](__SUBDIR__/compose/compose-file/)
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
