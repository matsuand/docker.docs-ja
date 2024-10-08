%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Use containers for PHP development
linkTitle: Develop your app
@y
title: コンテナーを利用した PHP 開発
linkTitle: アプリの開発
@z

@x
keywords: php, development
description: Learn how to develop your PHP application locally using containers.
@y
keywords: php, development
description: Learn how to develop your PHP application locally using containers.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete [Containerize a PHP application](containerize.md).
@y
Complete [Containerize a PHP application](containerize.md).
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
- Adding phpMyAdmin to interact with the database
- Configuring Compose to automatically update your running Compose services as
  you edit and save your code
- Creating a development container that contains the dev dependencies
@y
- Adding a local database and persisting data
- Adding phpMyAdmin to interact with the database
- Configuring Compose to automatically update your running Compose services as
  you edit and save your code
- Creating a development container that contains the dev dependencies
@z

@x
## Add a local database and persist data
@y
## Add a local database and persist data
@z

@x
You can use containers to set up local services, like a database.
To do this for the sample application, you'll need to do the following:
@y
You can use containers to set up local services, like a database.
To do this for the sample application, you'll need to do the following:
@z

@x
- Update the `Dockerfile` to install extensions to connect to the database
- Update the `compose.yaml` file to add a database service and volume to persist data
@y
- Update the `Dockerfile` to install extensions to connect to the database
- Update the `compose.yaml` file to add a database service and volume to persist data
@z

@x
### Update the Dockerfile to install extensions
@y
### Update the Dockerfile to install extensions
@z

@x
To install PHP extensions, you need to update the `Dockerfile`. Open your
Dockerfile in an IDE or text editor and then update the contents. The following
`Dockerfile` includes one new line that installs the `pdo` and `pdo_mysql`
extensions. All comments have been removed.
@y
To install PHP extensions, you need to update the `Dockerfile`. Open your
Dockerfile in an IDE or text editor and then update the contents. The following
`Dockerfile` includes one new line that installs the `pdo` and `pdo_mysql`
extensions. All comments have been removed.
@z

@x
```dockerfile {hl_lines=11}
# syntax=docker/dockerfile:1
@y
```dockerfile {hl_lines=11}
# syntax=docker/dockerfile:1
@z

@x
FROM composer:lts as deps
WORKDIR /app
RUN --mount=type=bind,source=composer.json,target=composer.json \
    --mount=type=bind,source=composer.lock,target=composer.lock \
    --mount=type=cache,target=/tmp/cache \
    composer install --no-dev --no-interaction
@y
FROM composer:lts as deps
WORKDIR /app
RUN --mount=type=bind,source=composer.json,target=composer.json \
    --mount=type=bind,source=composer.lock,target=composer.lock \
    --mount=type=cache,target=/tmp/cache \
    composer install --no-dev --no-interaction
@z

@x
FROM php:8.2-apache as final
RUN docker-php-ext-install pdo pdo_mysql
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY --from=deps app/vendor/ /var/www/html/vendor
COPY ./src /var/www/html
USER www-data
```
@y
FROM php:8.2-apache as final
RUN docker-php-ext-install pdo pdo_mysql
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY --from=deps app/vendor/ /var/www/html/vendor
COPY ./src /var/www/html
USER www-data
```
@z

@x
For more details about installing PHP extensions, see the [Official Docker Image for PHP](https://hub.docker.com/_/php).
@y
For more details about installing PHP extensions, see the [Official Docker Image for PHP](https://hub.docker.com/_/php).
@z

@x
### Update the compose.yaml file to add a db and persist data
@y
### Update the compose.yaml file to add a db and persist data
@z

@x
Open the `compose.yaml` file in an IDE or text editor. You'll notice it
already contains commented-out instructions for a PostgreSQL database and volume. For this application, you'll use MariaDB. For more details about MariaDB, see the [MariaDB Official Docker image](https://hub.docker.com/_/mariadb).
@y
Open the `compose.yaml` file in an IDE or text editor. You'll notice it
already contains commented-out instructions for a PostgreSQL database and volume. For this application, you'll use MariaDB. For more details about MariaDB, see the [MariaDB Official Docker image](https://hub.docker.com/_/mariadb).
@z

@x
Open the `src/database.php` file in an IDE or text editor. You'll notice that it reads environment variables in order to connect to the database.
@y
Open the `src/database.php` file in an IDE or text editor. You'll notice that it reads environment variables in order to connect to the database.
@z

@x
In the `compose.yaml` file, you'll need to update the following:
@y
In the `compose.yaml` file, you'll need to update the following:
@z

@x
1. Uncomment and update the database instructions for MariaDB.
2. Add a secret to the server service to pass in the database password.
3. Add the database connection environment variables to the server service.
4. Uncomment the volume instructions to persist data.
@y
1. Uncomment and update the database instructions for MariaDB.
2. Add a secret to the server service to pass in the database password.
3. Add the database connection environment variables to the server service.
4. Uncomment the volume instructions to persist data.
@z

@x
The following is the updated `compose.yaml` file. All comments have been removed.
@y
The following is the updated `compose.yaml` file. All comments have been removed.
@z

% snip code...

@x
> [!NOTE]
>
> To learn more about the instructions in the Compose file, see [Compose file
> reference](/reference/compose-file/).
@y
> [!NOTE]
>
> To learn more about the instructions in the Compose file, see [Compose file
> reference](__SUBDIR__/reference/compose-file/).
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
In the `docker-php-sample` directory, create a new directory named `db` and
inside that directory create a file named `password.txt`. Open `password.txt` in an IDE or text editor and add the following password. The password must be on a single line, with no additional lines in the file.
@y
In the `docker-php-sample` directory, create a new directory named `db` and
inside that directory create a file named `password.txt`. Open `password.txt` in an IDE or text editor and add the following password. The password must be on a single line, with no additional lines in the file.
@z

% snip code...

@x
Save and close the `password.txt` file.
@y
Save and close the `password.txt` file.
@z

@x
You should now have the following in your `docker-php-sample` directory.
@y
You should now have the following in your `docker-php-sample` directory.
@z

% snip text...

@x
Run the following command to start your application.
@y
Run the following command to start your application.
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:9000/database.php](http://localhost:9000/database.php). You should see a simple web application with text and a counter that increments every time you refresh.
@y
Open a browser and view the application at [http://localhost:9000/database.php](http://localhost:9000/database.php). You should see a simple web application with text and a counter that increments every time you refresh.
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
@z

@x
## Verify that data persists in the database
@y
## Verify that data persists in the database
@z

@x
In the terminal, run `docker compose rm` to remove your containers and then run `docker compose up` to run your application again.
@y
In the terminal, run `docker compose rm` to remove your containers and then run `docker compose up` to run your application again.
@z

% snip command...

@x
Refresh [http://localhost:9000/database.php](http://localhost:9000/database.php) in your browser and verify that the previous count still exists. Without a volume, the database data wouldn't persist after you remove the container.
@y
Refresh [http://localhost:9000/database.php](http://localhost:9000/database.php) in your browser and verify that the previous count still exists. Without a volume, the database data wouldn't persist after you remove the container.
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
@z

@x
## Add phpMyAdmin to interact with the database
@y
## Add phpMyAdmin to interact with the database
@z

@x
You can easily add services to your application stack by updating the `compose.yaml` file.
@y
You can easily add services to your application stack by updating the `compose.yaml` file.
@z

@x
Update your `compose.yaml` to add a new service for phpMyAdmin. For more details, see the [phpMyAdmin Official Docker Image](https://hub.docker.com/_/phpmyadmin). The following is the updated `compose.yaml` file.
@y
Update your `compose.yaml` to add a new service for phpMyAdmin. For more details, see the [phpMyAdmin Official Docker Image](https://hub.docker.com/_/phpmyadmin). The following is the updated `compose.yaml` file.
@z

% snip code...

@x
In the terminal, run `docker compose up` to run your application again.
@y
In the terminal, run `docker compose up` to run your application again.
@z

% snip command...

@x
Open [http://localhost:8080](http://localhost:8080) in your browser to access phpMyAdmin. Log in using `root` as the username and `example` as the password. You can now interact with the database through phpMyAdmin.
@y
Open [http://localhost:8080](http://localhost:8080) in your browser to access phpMyAdmin. Log in using `root` as the username and `example` as the password. You can now interact with the database through phpMyAdmin.
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
Use Compose Watch to automatically update your running Compose services as you edit and save your code. For more details about Compose Watch, see [Use Compose Watch](/manuals/compose/how-tos/file-watch.md).
@y
Use Compose Watch to automatically update your running Compose services as you edit and save your code. For more details about Compose Watch, see [Use Compose Watch](manuals/compose/how-tos/file-watch.md).
@z

@x
Open your `compose.yaml` file in an IDE or text editor and then add the Compose Watch instructions. The following is the updated `compose.yaml` file.
@y
Open your `compose.yaml` file in an IDE or text editor and then add the Compose Watch instructions. The following is the updated `compose.yaml` file.
@z

% snip code...

@x
Run the following command to run your application with Compose Watch.
@y
Run the following command to run your application with Compose Watch.
@z

% snip command...

@x
Open a browser and verify that the application is running at [http://localhost:9000/hello.php](http://localhost:9000/hello.php).
@y
Open a browser and verify that the application is running at [http://localhost:9000/hello.php](http://localhost:9000/hello.php).
@z

@x
Any changes to the application's source files on your local machine will now be
immediately reflected in the running container.
@y
Any changes to the application's source files on your local machine will now be
immediately reflected in the running container.
@z

@x
Open `hello.php` in an IDE or text editor and update the string `Hello, world!` to `Hello, Docker!`.
@y
Open `hello.php` in an IDE or text editor and update the string `Hello, world!` to `Hello, Docker!`.
@z

@x
Save the changes to `hello.php` and then wait a few seconds for the application to sync. Refresh [http://localhost:9000/hello.php](http://localhost:9000/hello.php) in your browser and verify that the updated text appears.
@y
Save the changes to `hello.php` and then wait a few seconds for the application to sync. Refresh [http://localhost:9000/hello.php](http://localhost:9000/hello.php) in your browser and verify that the updated text appears.
@z

@x
Press `ctrl+c` in the terminal to stop Compose Watch. Run `docker compose down` in the terminal to stop the application.
@y
Press `ctrl+c` in the terminal to stop Compose Watch. Run `docker compose down` in the terminal to stop the application.
@z

@x
## Create a development container
@y
## Create a development container
@z

@x
At this point, when you run your containerized application, Composer isn't installing the dev dependencies. While this small image is good for production, it lacks the tools and dependencies you may need when developing and it doesn't include the `tests` directory. You can use multi-stage builds to build stages for both development and production in the same Dockerfile. For more details, see [Multi-stage builds](/manuals/build/building/multi-stage.md).
@y
At this point, when you run your containerized application, Composer isn't installing the dev dependencies. While this small image is good for production, it lacks the tools and dependencies you may need when developing and it doesn't include the `tests` directory. You can use multi-stage builds to build stages for both development and production in the same Dockerfile. For more details, see [Multi-stage builds](manuals/build/building/multi-stage.md).
@z

@x
In the `Dockerfile`, you'll need to update the following:
@y
In the `Dockerfile`, you'll need to update the following:
@z

@x
1. Split the `deps` staged into two stages. One stage for production
   (`prod-deps`) and one stage (`dev-deps`) to install development dependencies.
2. Create a common `base` stage.
3. Create a new `development` stage for development.
4. Update the `final` stage to copy dependencies from the new `prod-deps` stage.
@y
1. Split the `deps` staged into two stages. One stage for production
   (`prod-deps`) and one stage (`dev-deps`) to install development dependencies.
2. Create a common `base` stage.
3. Create a new `development` stage for development.
4. Update the `final` stage to copy dependencies from the new `prod-deps` stage.
@z

@x
The following is the `Dockerfile` before and after the changes.
@y
The following is the `Dockerfile` before and after the changes.
@z

@x
{{< tabs >}}
{{< tab name="Before" >}}
@y
{{< tabs >}}
{{< tab name="Before" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="After" >}}
@y
{{< /tab >}}
{{< tab name="After" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Update your `compose.yaml` file by adding an instruction to target the
development stage.
@y
Update your `compose.yaml` file by adding an instruction to target the
development stage.
@z

@x
The following is the updated section of the `compose.yaml` file.
@y
The following is the updated section of the `compose.yaml` file.
@z

% snip code...

@x
Your containerized application will now install the dev dependencies.
@y
Your containerized application will now install the dev dependencies.
@z

@x
Run the following command to start your application.
@y
Run the following command to start your application.
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:9000/hello.php](http://localhost:9000/hello.php). You should still see the simple "Hello, Docker!" application.
@y
Open a browser and view the application at [http://localhost:9000/hello.php](http://localhost:9000/hello.php). You should still see the simple "Hello, Docker!" application.
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
@z

@x
While the application appears the same, you can now make use of the dev dependencies. Continue to the next section to learn how you can run tests using Docker.
@y
While the application appears the same, you can now make use of the dev dependencies. Continue to the next section to learn how you can run tests using Docker.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you took a look at setting up your Compose file to add a local
database and persist data. You also learned how to use Compose Watch to automatically sync your application when you update your code. And finally, you learned how to create a development container that contains the dependencies needed for development.
@y
In this section, you took a look at setting up your Compose file to add a local
database and persist data. You also learned how to use Compose Watch to automatically sync your application when you update your code. And finally, you learned how to create a development container that contains the dependencies needed for development.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Compose file reference](/reference/compose-file/)
- [Compose file watch](/manuals/compose/how-tos/file-watch.md)
- [Dockerfile reference](/reference/dockerfile.md)
- [Official Docker Image for PHP](https://hub.docker.com/_/php)
@y
- [Compose file reference](__SUBDIR__/reference/compose-file/)
- [Compose file watch](manuals/compose/how-tos/file-watch.md)
- [Dockerfile reference](reference/dockerfile.md)
- [Official Docker Image for PHP](https://hub.docker.com/_/php)
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
