%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Use containers for Java development
keywords: Java, local, development, run,
description: Learn how to develop your application locally.
---
@y
---
title: Use containers for Java development
keywords: Java, local, development, run,
description: Learn how to develop your application locally.
---
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Work through the steps to build an image and run it as a containerized application in [Run your image as a container](run-containers.md).
@y
Work through the steps to build an image and run it as a containerized application in [Run your image as a container](run-containers.md).
@z

@x
## Introduction
@y
## Introduction
@z

@x
In this module, you’ll walk through setting up a local development environment for the application you built in the previous modules. You’ll use Docker to build your images and Docker Compose to make everything a whole lot easier.
@y
In this module, you’ll walk through setting up a local development environment for the application you built in the previous modules. You’ll use Docker to build your images and Docker Compose to make everything a whole lot easier.
@z

@x
## Run a database in a container
@y
## Run a database in a container
@z

@x
First, you’ll take a look at running a database in a container and how you use volumes and networking to persist your data and allow your application to talk with the database. Then you’ll pull everything together into a Compose file which allows you to set up and run a local development environment with one command. Finally, you’ll take a look at connecting a debugger to your application running inside a container.
@y
First, you’ll take a look at running a database in a container and how you use volumes and networking to persist your data and allow your application to talk with the database. Then you’ll pull everything together into a Compose file which allows you to set up and run a local development environment with one command. Finally, you’ll take a look at connecting a debugger to your application running inside a container.
@z

@x
Instead of downloading MySQL, installing, configuring, and then running the MySQL database as a service, you can use the Docker Official Image for MySQL and run it in a container.
@y
Instead of downloading MySQL, installing, configuring, and then running the MySQL database as a service, you can use the Docker Official Image for MySQL and run it in a container.
@z

@x
Before you run MySQL in a container, you'll create a couple of volumes that Docker can manage to store your persistent data and configuration. Use the managed volumes feature that Docker provides instead of using bind mounts. For more details, see [Using volumes](../../storage/volumes.md).
@y
Before you run MySQL in a container, you'll create a couple of volumes that Docker can manage to store your persistent data and configuration. Use the managed volumes feature that Docker provides instead of using bind mounts. For more details, see [Using volumes](../../storage/volumes.md).
@z

@x
Create your volumes now. You’ll create one for the data and one for configuration of MySQL.
@y
Create your volumes now. You’ll create one for the data and one for configuration of MySQL.
@z

@x
```console
$ docker volume create mysql_data
$ docker volume create mysql_config
```
@y
```console
$ docker volume create mysql_data
$ docker volume create mysql_config
```
@z

@x
Now you’ll create a network that your application and database will use to talk to each other. The network is called a user-defined bridge network and gives us a nice DNS lookup service which you can use when creating your connection string.
@y
Now you’ll create a network that your application and database will use to talk to each other. The network is called a user-defined bridge network and gives us a nice DNS lookup service which you can use when creating your connection string.
@z

@x
```console
$ docker network create mysqlnet
```
@y
```console
$ docker network create mysqlnet
```
@z

@x
Now, run MySQL in a container and attach to the volumes and network you created. Docker pulls the image from Hub and runs it locally.
@y
Now, run MySQL in a container and attach to the volumes and network you created. Docker pulls the image from Hub and runs it locally.
@z

@x
```console
$ docker run -it --rm -d -v mysql_data:/var/lib/mysql \
-v mysql_config:/etc/mysql/conf.d \
--network mysqlnet \
--name mysqlserver \
-e MYSQL_USER=petclinic -e MYSQL_PASSWORD=petclinic \
-e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=petclinic \
-p 3306:3306 mysql:8.0
```
@y
```console
$ docker run -it --rm -d -v mysql_data:/var/lib/mysql \
-v mysql_config:/etc/mysql/conf.d \
--network mysqlnet \
--name mysqlserver \
-e MYSQL_USER=petclinic -e MYSQL_PASSWORD=petclinic \
-e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=petclinic \
-p 3306:3306 mysql:8.0
```
@z

@x
Now that you have a running MySQL, update your Dockerfile to activate the MySQL Spring profile defined in the application and switch from an in-memory H2 database to the MySQL server you just created.
@y
Now that you have a running MySQL, update your Dockerfile to activate the MySQL Spring profile defined in the application and switch from an in-memory H2 database to the MySQL server you just created.
@z

@x
You only need to add the MySQL profile as an argument to the `CMD` definition.
@y
You only need to add the MySQL profile as an argument to the `CMD` definition.
@z

@x
```dockerfile
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql"]
```
@y
```dockerfile
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql"]
```
@z

@x
Build your image.
@y
Build your image.
@z

@x
```console
$ docker build --tag java-docker .
```
@y
```console
$ docker build --tag java-docker .
```
@z

@x
Now, run your container. This time, you need to set the `MYSQL_URL` environment variable so that your application knows what connection string to use to access the database. You’ll do this using the `docker run` command.
@y
Now, run your container. This time, you need to set the `MYSQL_URL` environment variable so that your application knows what connection string to use to access the database. You’ll do this using the `docker run` command.
@z

@x
```console
$ docker run --rm -d \
--name springboot-server \
--network mysqlnet \
-e MYSQL_URL=jdbc:mysql://mysqlserver/petclinic \
-p 8080:8080 java-docker
```
@y
```console
$ docker run --rm -d \
--name springboot-server \
--network mysqlnet \
-e MYSQL_URL=jdbc:mysql://mysqlserver/petclinic \
-p 8080:8080 java-docker
```
@z

@x
Test that your application is connected to the database and is able to list Veterinarians.
@y
Test that your application is connected to the database and is able to list Veterinarians.
@z

@x
```console
$ curl  --request GET \
  --url http://localhost:8080/vets \
  --header 'content-type: application/json'
```
@y
```console
$ curl  --request GET \
  --url http://localhost:8080/vets \
  --header 'content-type: application/json'
```
@z

@x
You should receive the following json back from your service.
@y
You should receive the following json back from your service.
@z

@x
```json
{"vetList":[{"id":1,"firstName":"James","lastName":"Carter","specialties":[],"nrOfSpecialties":0,"new":false},{"id":2,"firstName":"Helen","lastName":"Leary","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":3,"firstName":"Linda","lastName":"Douglas","specialties":[{"id":3,"name":"dentistry","new":false},{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":2,"new":false},{"id":4,"firstName":"Rafael","lastName":"Ortega","specialties":[{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":1,"new":false},{"id":5,"firstName":"Henry","lastName":"Stevens","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":6,"firstName":"Sharon","lastName":"Jenkins","specialties":[],"nrOfSpecialties":0,"new":false}]}
```
@y
```json
{"vetList":[{"id":1,"firstName":"James","lastName":"Carter","specialties":[],"nrOfSpecialties":0,"new":false},{"id":2,"firstName":"Helen","lastName":"Leary","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":3,"firstName":"Linda","lastName":"Douglas","specialties":[{"id":3,"name":"dentistry","new":false},{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":2,"new":false},{"id":4,"firstName":"Rafael","lastName":"Ortega","specialties":[{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":1,"new":false},{"id":5,"firstName":"Henry","lastName":"Stevens","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":6,"firstName":"Sharon","lastName":"Jenkins","specialties":[],"nrOfSpecialties":0,"new":false}]}
```
@z

@x
## Multi-stage Dockerfile for development
@y
## Multi-stage Dockerfile for development
@z

@x
Now you can update your Dockerfile to produce a final image which is ready for production as well as a dedicated step to produce a development image.
@y
Now you can update your Dockerfile to produce a final image which is ready for production as well as a dedicated step to produce a development image.
@z

@x
You’ll also set up the Dockerfile to start the application in debug mode in the development container so that you can connect a debugger to the running Java process.
@y
You’ll also set up the Dockerfile to start the application in debug mode in the development container so that you can connect a debugger to the running Java process.
@z

@x
The following is a multi-stage Dockerfile that you'll use to build your production image and your development image. Replace the contents of your Dockerfile with the following.
@y
The following is a multi-stage Dockerfile that you'll use to build your production image and your development image. Replace the contents of your Dockerfile with the following.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM eclipse-temurin:17-jdk-jammy as base
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve
COPY src ./src
@y
FROM eclipse-temurin:17-jdk-jammy as base
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve
COPY src ./src
@z

@x
FROM base as development
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql", "-Dspring-boot.run.jvmArguments='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000'"]
@y
FROM base as development
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql", "-Dspring-boot.run.jvmArguments='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000'"]
@z

@x
FROM base as build
RUN ./mvnw package
@y
FROM base as build
RUN ./mvnw package
@z

@x
FROM eclipse-temurin:17-jre-jammy as production
EXPOSE 8080
COPY --from=build /app/target/spring-petclinic-*.jar /spring-petclinic.jar
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/spring-petclinic.jar"]
```
@y
FROM eclipse-temurin:17-jre-jammy as production
EXPOSE 8080
COPY --from=build /app/target/spring-petclinic-*.jar /spring-petclinic.jar
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/spring-petclinic.jar"]
```
@z

@x
You first add a label to the `FROM eclipse-temurin:17-jdk-jammy` statement. This allows you to refer to this build stage in other build stages. Next, you added a new build stage labeled `development`.
@y
You first add a label to the `FROM eclipse-temurin:17-jdk-jammy` statement. This allows you to refer to this build stage in other build stages. Next, you added a new build stage labeled `development`.
@z

@x
You expose port 8000 and declare the debug configuration for the JVM so that you can attach a debugger.
@y
You expose port 8000 and declare the debug configuration for the JVM so that you can attach a debugger.
@z

@x
## Use Compose to develop locally
@y
## Use Compose to develop locally
@z

@x
You can now create a Compose file to start your development container and the MySQL database using a single command.
@y
You can now create a Compose file to start your development container and the MySQL database using a single command.
@z

@x
Open the `petclinic` in your IDE or a text editor and create a new file named `docker-compose.dev.yml`. Copy and paste the following commands into the file.
@y
Open the `petclinic` in your IDE or a text editor and create a new file named `docker-compose.dev.yml`. Copy and paste the following commands into the file.
@z

@x
```yaml
version: '3.8'
services:
  petclinic:
    build:
      context: .
      target: development
    ports:
      - "8000:8000"
      - "8080:8080"
    environment:
      - SERVER_PORT=8080
      - MYSQL_URL=jdbc:mysql://mysqlserver/petclinic
    volumes:
      - ./:/app
    depends_on:
      - mysqlserver
@y
```yaml
version: '3.8'
services:
  petclinic:
    build:
      context: .
      target: development
    ports:
      - "8000:8000"
      - "8080:8080"
    environment:
      - SERVER_PORT=8080
      - MYSQL_URL=jdbc:mysql://mysqlserver/petclinic
    volumes:
      - ./:/app
    depends_on:
      - mysqlserver
@z

@x
  mysqlserver:
    image: mysql:8.0
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=
      - MYSQL_ALLOW_EMPTY_PASSWORD=true
      - MYSQL_USER=petclinic
      - MYSQL_PASSWORD=petclinic
      - MYSQL_DATABASE=petclinic
    volumes:
      - mysql_data:/var/lib/mysql
      - mysql_config:/etc/mysql/conf.d
volumes:
  mysql_data:
  mysql_config:
```
@y
  mysqlserver:
    image: mysql:8.0
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=
      - MYSQL_ALLOW_EMPTY_PASSWORD=true
      - MYSQL_USER=petclinic
      - MYSQL_PASSWORD=petclinic
      - MYSQL_DATABASE=petclinic
    volumes:
      - mysql_data:/var/lib/mysql
      - mysql_config:/etc/mysql/conf.d
volumes:
  mysql_data:
  mysql_config:
```
@z

@x
This Compose file is super convenient as you don't have to type all the parameters to pass to the `docker run` command. You can declaratively do that using a Compose file.
@y
This Compose file is super convenient as you don't have to type all the parameters to pass to the `docker run` command. You can declaratively do that using a Compose file.
@z

@x
Another Compose feature is that you have service resolution set up to use the service names. Therefore, you are now able to use `mysqlserver` in your connection string. The reason you use `mysqlserver` is because that's what you've named your MySQL service as in the Compose file.
@y
Another Compose feature is that you have service resolution set up to use the service names. Therefore, you are now able to use `mysqlserver` in your connection string. The reason you use `mysqlserver` is because that's what you've named your MySQL service as in the Compose file.
@z

@x
Now, to start your application and to confirm that it's running.
@y
Now, to start your application and to confirm that it's running.
@z

@x
```console
$ docker compose -f docker-compose.dev.yml up --build
```
@y
```console
$ docker compose -f docker-compose.dev.yml up --build
```
@z

@x
You pass the `--build` flag so Docker will compile your image and then starts the containers. You should see similar output if it runs successfully:
@y
You pass the `--build` flag so Docker will compile your image and then starts the containers. You should see similar output if it runs successfully:
@z

@x
![Java Compose output](images/java-compose-output.webp)
@y
![Java Compose output](images/java-compose-output.webp)
@z

@x
Now, test your API endpoint. Run the following curl command:
@y
Now, test your API endpoint. Run the following curl command:
@z

@x
```console
$ curl  --request GET \
  --url http://localhost:8080/vets \
  --header 'content-type: application/json'
```
@y
```console
$ curl  --request GET \
  --url http://localhost:8080/vets \
  --header 'content-type: application/json'
```
@z

@x
You should receive the following response:
@y
You should receive the following response:
@z

@x
```json
{"vetList":[{"id":1,"firstName":"James","lastName":"Carter","specialties":[],"nrOfSpecialties":0,"new":false},{"id":2,"firstName":"Helen","lastName":"Leary","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":3,"firstName":"Linda","lastName":"Douglas","specialties":[{"id":3,"name":"dentistry","new":false},{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":2,"new":false},{"id":4,"firstName":"Rafael","lastName":"Ortega","specialties":[{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":1,"new":false},{"id":5,"firstName":"Henry","lastName":"Stevens","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":6,"firstName":"Sharon","lastName":"Jenkins","specialties":[],"nrOfSpecialties":0,"new":false}]}
```
@y
```json
{"vetList":[{"id":1,"firstName":"James","lastName":"Carter","specialties":[],"nrOfSpecialties":0,"new":false},{"id":2,"firstName":"Helen","lastName":"Leary","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":3,"firstName":"Linda","lastName":"Douglas","specialties":[{"id":3,"name":"dentistry","new":false},{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":2,"new":false},{"id":4,"firstName":"Rafael","lastName":"Ortega","specialties":[{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":1,"new":false},{"id":5,"firstName":"Henry","lastName":"Stevens","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":6,"firstName":"Sharon","lastName":"Jenkins","specialties":[],"nrOfSpecialties":0,"new":false}]}
```
@z

@x
## Connect a Debugger
@y
## Connect a Debugger
@z

@x
You’ll use the debugger that comes with the IntelliJ IDEA. You can use the community version of this IDE. Open your project in IntelliJ IDEA, go to the **Run** menu, and then **Edit Configuration**. Add a new Remote JVM Debug configuration similar to the following:
@y
You’ll use the debugger that comes with the IntelliJ IDEA. You can use the community version of this IDE. Open your project in IntelliJ IDEA, go to the **Run** menu, and then **Edit Configuration**. Add a new Remote JVM Debug configuration similar to the following:
@z

@x
![Java Connect a Debugger](images/connect-debugger.webp)
@y
![Java Connect a Debugger](images/connect-debugger.webp)
@z

@x
Set a breakpoint.
@y
Set a breakpoint.
@z

@x
Open `src/main/java/org/springframework/samples/petclinic/vet/VetController.java` and add a breakpoint inside the `showResourcesVetList` function.
@y
Open `src/main/java/org/springframework/samples/petclinic/vet/VetController.java` and add a breakpoint inside the `showResourcesVetList` function.
@z

@x
To start your debug session, select the **Run** menu and then **Debug _NameOfYourConfiguration_**.
@y
To start your debug session, select the **Run** menu and then **Debug _NameOfYourConfiguration_**.
@z

@x
![Debug menu](images/debug-menu.webp?w=300)
@y
![Debug menu](images/debug-menu.webp?w=300)
@z

@x
You should now see the connection in the logs of your Compose application.
@y
You should now see the connection in the logs of your Compose application.
@z

@x
![Compose log file ](images/compose-logs.webp)
@y
![Compose log file ](images/compose-logs.webp)
@z

@x
You can now call the server endpoint.
@y
You can now call the server endpoint.
@z

@x
```console
$ curl --request GET --url http://localhost:8080/vets
```
@y
```console
$ curl --request GET --url http://localhost:8080/vets
```
@z

@x
You should have seen the code break on the marked line and now you are able to use the debugger just like you would normally. You can also inspect and watch variables, set conditional breakpoints, view stack traces and a do bunch of other stuff.
@y
You should have seen the code break on the marked line and now you are able to use the debugger just like you would normally. You can also inspect and watch variables, set conditional breakpoints, view stack traces and a do bunch of other stuff.
@z

@x
![Debugger code breakpoint](images/debugger-breakpoint.webp)
@y
![Debugger code breakpoint](images/debugger-breakpoint.webp)
@z

@x
You can also activate the live reload option provided by SpringBoot Dev Tools. Check out the [SpringBoot documentation](https://docs.spring.io/spring-boot/docs/current/reference/html/using-spring-boot.html#using-boot-devtools-remote) for information on how to connect to a remote application.
@y
You can also activate the live reload option provided by SpringBoot Dev Tools. Check out the [SpringBoot documentation](https://docs.spring.io/spring-boot/docs/current/reference/html/using-spring-boot.html#using-boot-devtools-remote) for information on how to connect to a remote application.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In this module, you took a look at creating a general development image that you can use pretty much like your normal command line. You also set up your Compose file to expose the debugging port and configure Spring Boot to live reload your changes.
@y
In this module, you took a look at creating a general development image that you can use pretty much like your normal command line. You also set up your Compose file to expose the debugging port and configure Spring Boot to live reload your changes.
@z

@x
In the next module, you’ll take a look at how to run unit tests in Docker.
@y
In the next module, you’ll take a look at how to run unit tests in Docker.
@z

@x
{{< button text="Run your tests" url="run-tests.md" >}}
@y
{{< button text="Run your tests" url="run-tests.md" >}}
@z
