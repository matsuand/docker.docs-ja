%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Use containers for Python development
keywords: python, local, development
description: Learn how to develop your Python application locally.
@y
title: Use containers for Python development
keywords: python, local, development
description: Learn how to develop your Python application locally.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete [Containerize a Python application](containerize.md).
@y
Complete [Containerize a Python application](containerize.md).
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
@y
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
@z

@x
- Adding a local database and persisting data
- Configuring Compose to automatically update your running Compose services as you edit and save your code
@y
- Adding a local database and persisting data
- Configuring Compose to automatically update your running Compose services as you edit and save your code
@z

@x
## Get the sample application
@y
## Get the sample application
@z

@x
You'll need to clone a new repository to get a sample application that includes logic to connect to the database.
@y
You'll need to clone a new repository to get a sample application that includes logic to connect to the database.
@z

@x
1. Change to a directory where you want to clone the repository and run the following command.
@y
1. Change to a directory where you want to clone the repository and run the following command.
@z

% snip command...

@x
2. In the cloned repository's directory, manually create the Docker assets or run `docker init` to create the necessary Docker assets.
@y
2. In the cloned repository's directory, manually create the Docker assets or run `docker init` to create the necessary Docker assets.
@z

% snip command...

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
In the cloned repository's directory, open the `compose.yaml` file in an IDE or text editor. `docker init` handled creating most of the instructions, but you'll need to update it for your unique application.
@y
In the cloned repository's directory, open the `compose.yaml` file in an IDE or text editor. `docker init` handled creating most of the instructions, but you'll need to update it for your unique application.
@z

@x
In the `compose.yaml` file, you need to uncomment all of the database instructions. In addition, you need to add the database password file as an environment variable to the server service and specify the secret file to use .
@y
In the `compose.yaml` file, you need to uncomment all of the database instructions. In addition, you need to add the database password file as an environment variable to the server service and specify the secret file to use .
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
Before you run the application using Compose, notice that this Compose file specifies a `password.txt` file to hold the database's password. You must create this file as it's not included in the source repository.
@y
Before you run the application using Compose, notice that this Compose file specifies a `password.txt` file to hold the database's password. You must create this file as it's not included in the source repository.
@z

@x
In the cloned repository's directory, create a new directory named `db` and inside that directory create a file named `password.txt` that contains the password for the database. Using your favorite IDE or text editor, add the following contents to the `password.txt` file.
@y
In the cloned repository's directory, create a new directory named `db` and inside that directory create a file named `password.txt` that contains the password for the database. Using your favorite IDE or text editor, add the following contents to the `password.txt` file.
@z

% snip text...

@x
Save and close the `password.txt` file.
@y
Save and close the `password.txt` file.
@z

@x
You should now have the following contents in your `python-docker-dev`
directory.
@y
You should now have the following contents in your `python-docker-dev`
directory.
@z

% snip text...

@x
Now, run the following `docker compose up` command to start your application.
@y
Now, run the following `docker compose up` command to start your application.
@z

% snip command...

@x
Now test your API endpoint. Open a new terminal then make a request to the server using the curl commands:
@y
Now test your API endpoint. Open a new terminal then make a request to the server using the curl commands:
@z

% snip command...

@x
You should receive the following response:
@y
You should receive the following response:
@z

% snip code...

@x
The response is empty because your database is empty.
@y
The response is empty because your database is empty.
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
Use Compose Watch to automatically update your running Compose services as you
edit and save your code. For more details about Compose Watch, see [Use Compose
Watch](../../compose/file-watch.md).
@y
Use Compose Watch to automatically update your running Compose services as you
edit and save your code. For more details about Compose Watch, see [Use Compose
Watch](../../compose/file-watch.md).
@z

@x
Open your `compose.yaml` file in an IDE or text editor and then add the Compose
Watch instructions. The following is the updated `compose.yaml` file.
@y
Open your `compose.yaml` file in an IDE or text editor and then add the Compose
Watch instructions. The following is the updated `compose.yaml` file.
@z

% snip code...

@x
Run the following command to run your application with Compose Watch.
@y
Run the following command to run your application with Compose Watch.
@z

% snip command...

@x
In a terminal, curl the application to get a response.
@y
In a terminal, curl the application to get a response.
@z

% snip command...

@x
Any changes to the application's source files on your local machine will now be immediately reflected in the running container.
@y
Any changes to the application's source files on your local machine will now be immediately reflected in the running container.
@z

@x
Open `python-docker-dev/app.py` in an IDE or text editor and update the `Hello, Docker!` string by adding a few more exclamation marks.
@y
Open `python-docker-dev/app.py` in an IDE or text editor and update the `Hello, Docker!` string by adding a few more exclamation marks.
@z

% snip code...

@x
Save the changes to `app.py` and then wait a few seconds for the application to rebuild. Curl the application again and verify that the updated text appears.
@y
Save the changes to `app.py` and then wait a few seconds for the application to rebuild. Curl the application again and verify that the updated text appears.
@z

% snip command...

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you took a look at setting up your Compose file to add a local
database and persist data. You also learned how to use Compose Watch to automatically rebuild and run your container when you update your code.
@y
In this section, you took a look at setting up your Compose file to add a local
database and persist data. You also learned how to use Compose Watch to automatically rebuild and run your container when you update your code.
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
In the next section, you'll take a look at how to set up a CI/CD pipeline using GitHub Actions.
@y
In the next section, you'll take a look at how to set up a CI/CD pipeline using GitHub Actions.
@z

@x
{{< button text="Configure CI/CD" url="configure-ci-cd.md" >}}
@y
{{< button text="Configure CI/CD" url="configure-ci-cd.md" >}}
@z
