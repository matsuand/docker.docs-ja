%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リン クへの (no slash) 対応
% snip 対応

@x
title: Use containers for Java development
linkTitle: Develop your app
@y
title: Use containers for Java development
linkTitle: Develop your app
@z

@x
keywords: Java, local, development, run,
description: Learn how to develop your application locally.
@y
keywords: Java, local, development, run,
description: Learn how to develop your application locally.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Work through the steps to containerize your application in [Containerize your app](containerize.md).
@y
Work through the steps to containerize your application in [Containerize your app](containerize.md).
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you’ll walk through setting up a local development environment
for the application you containerized in the previous section. This includes:
  - Adding a local database and persisting data
  - Creating a development container to connect a debugger
  - Configuring Compose to automatically update your running Compose services as
   you edit and save your code
@y
In this section, you’ll walk through setting up a local development environment
for the application you containerized in the previous section. This includes:
  - Adding a local database and persisting data
  - Creating a development container to connect a debugger
  - Configuring Compose to automatically update your running Compose services as
   you edit and save your code
@z

@x
## Add a local database and persist data
@y
## Add a local database and persist data
@z

@x
You can use containers to set up local services, like a database. In this section, you'll update the `docker-compose.yaml` file to define a database service and a volume to persist data. Also, this particular application uses a system property to define the database type, so you'll need to update the `Dockerfile` to pass in the system property when starting the app.
@y
You can use containers to set up local services, like a database. In this section, you'll update the `docker-compose.yaml` file to define a database service and a volume to persist data. Also, this particular application uses a system property to define the database type, so you'll need to update the `Dockerfile` to pass in the system property when starting the app.
@z

@x
In the cloned repository's directory, open the `docker-compose.yaml` file in an IDE or text editor. Your Compose file has an example database service, but it'll require a few changes for your unique app.
@y
In the cloned repository's directory, open the `docker-compose.yaml` file in an IDE or text editor. Your Compose file has an example database service, but it'll require a few changes for your unique app.
@z

@x
In the `docker-compose.yaml` file, you need to do the following:
- Uncomment all of the database instructions. You'll now use a database service
  instead of local storage for the data.
- Remove the top-level `secrets` element as well as the element inside the `db`
  service. This example uses the environment variable for the password rather than secrets.
- Remove the `user` element from the `db` service. This example specifies the
  user in the environment variable.
- Update the database environment variables. These are defined by the Postgres
  image. For more details, see the
  [Postgres Official Docker Image](https://hub.docker.com/_/postgres).
- Update the healthcheck test for the `db` service and specify the user. By
  default, the healthcheck uses the root user instead of the `petclinic` user
  you defined.
- Add the database URL as an environment variable in the `server` service. This
  overrides the default value defined in
  `spring-petclinic/src/main/resources/application-postgres.properties`.
@y
In the `docker-compose.yaml` file, you need to do the following:
- Uncomment all of the database instructions. You'll now use a database service
  instead of local storage for the data.
- Remove the top-level `secrets` element as well as the element inside the `db`
  service. This example uses the environment variable for the password rather than secrets.
- Remove the `user` element from the `db` service. This example specifies the
  user in the environment variable.
- Update the database environment variables. These are defined by the Postgres
  image. For more details, see the
  [Postgres Official Docker Image](https://hub.docker.com/_/postgres).
- Update the healthcheck test for the `db` service and specify the user. By
  default, the healthcheck uses the root user instead of the `petclinic` user
  you defined.
- Add the database URL as an environment variable in the `server` service. This
  overrides the default value defined in
  `spring-petclinic/src/main/resources/application-postgres.properties`.
@z

@x
The following is the updated `docker-compose.yaml` file. All comments have been removed.
@y
The following is the updated `docker-compose.yaml` file. All comments have been removed.
@z

@x
```yaml {hl_lines="7-29"}
services:
  server:
    build:
      context: .
    ports:
      - 8080:8080
    depends_on:
      db:
        condition: service_healthy
    environment:
      - POSTGRES_URL=jdbc:postgresql://db:5432/petclinic
  db:
    image: postgres
    restart: always
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=petclinic
      - POSTGRES_USER=petclinic
      - POSTGRES_PASSWORD=petclinic
    ports:
      - 5432:5432
    healthcheck:
      test: [ "CMD", "pg_isready", "-U", "petclinic" ]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
```
@y
```yaml {hl_lines="7-29"}
services:
  server:
    build:
      context: .
    ports:
      - 8080:8080
    depends_on:
      db:
        condition: service_healthy
    environment:
      - POSTGRES_URL=jdbc:postgresql://db:5432/petclinic
  db:
    image: postgres
    restart: always
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=petclinic
      - POSTGRES_USER=petclinic
      - POSTGRES_PASSWORD=petclinic
    ports:
      - 5432:5432
    healthcheck:
      test: [ "CMD", "pg_isready", "-U", "petclinic" ]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
```
@z

@x
Open the `Dockerfile` in an IDE or text editor. In the `ENTRYPOINT` instruction,
update the instruction to pass in the system property as specified in the
`spring-petclinic/src/resources/db/postgres/petclinic_db_setup_postgres.txt`
file.
@y
Open the `Dockerfile` in an IDE or text editor. In the `ENTRYPOINT` instruction,
update the instruction to pass in the system property as specified in the
`spring-petclinic/src/resources/db/postgres/petclinic_db_setup_postgres.txt`
file.
@z

@x
```diff
- ENTRYPOINT [ "java", "org.springframework.boot.loader.launch.JarLauncher" ]
+ ENTRYPOINT [ "java", "-Dspring.profiles.active=postgres", "org.springframework.boot.loader.launch.JarLauncher" ]
```
@y
```diff
- ENTRYPOINT [ "java", "org.springframework.boot.loader.launch.JarLauncher" ]
+ ENTRYPOINT [ "java", "-Dspring.profiles.active=postgres", "org.springframework.boot.loader.launch.JarLauncher" ]
```
@z

@x
Save and close all the files.
@y
Save and close all the files.
@z

@x
Now, run the following `docker compose up` command to start your application.
@y
Now, run the following `docker compose up` command to start your application.
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
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple app for a pet clinic. Browse around the application. Navigate to **Veterinarians** and verify that the application is connected to the database by being able to list veterinarians.
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple app for a pet clinic. Browse around the application. Navigate to **Veterinarians** and verify that the application is connected to the database by being able to list veterinarians.
@z

@x
In the terminal, press `ctrl`+`c` to stop the application.
@y
In the terminal, press `ctrl`+`c` to stop the application.
@z

@x
## Dockerfile for development
@y
## Dockerfile for development
@z

@x
The Dockerfile you have now is great for a small, secure production image with
only the components necessary to run the application. When developing, you may
want a different image that has a different environment.
@y
The Dockerfile you have now is great for a small, secure production image with
only the components necessary to run the application. When developing, you may
want a different image that has a different environment.
@z

@x
For example, in the development image you may want to set up the image to start
the application so that you can connect a debugger to the running Java process.
@y
For example, in the development image you may want to set up the image to start
the application so that you can connect a debugger to the running Java process.
@z

@x
Rather than managing multiple Dockerfiles, you can add a new stage. Your
Dockerfile can then produce a final image which is ready for production as well
as a development image.
@y
Rather than managing multiple Dockerfiles, you can add a new stage. Your
Dockerfile can then produce a final image which is ready for production as well
as a development image.
@z

@x
Replace the contents of your Dockerfile with the following.
@y
Replace the contents of your Dockerfile with the following.
@z

% snip code...

@x
Save and close the `Dockerfile`.
@y
Save and close the `Dockerfile`.
@z

@x
In the `Dockerfile` you added a new stage labeled `development` based on the `extract` stage. In this stage, you copy the extracted files to a common directory, then run a command to start the application. In the command, you expose port 8000 and declare the debug configuration for the JVM so that you can attach a debugger.
@y
In the `Dockerfile` you added a new stage labeled `development` based on the `extract` stage. In this stage, you copy the extracted files to a common directory, then run a command to start the application. In the command, you expose port 8000 and declare the debug configuration for the JVM so that you can attach a debugger.
@z

@x
## Use Compose to develop locally
@y
## Use Compose to develop locally
@z

@x
The current Compose file doesn't start your development container. To do that, you must update your Compose file to target the development stage. Also, update the port mapping of the server service to provide access for the debugger.
@y
The current Compose file doesn't start your development container. To do that, you must update your Compose file to target the development stage. Also, update the port mapping of the server service to provide access for the debugger.
@z

@x
Open the `docker-compose.yaml` and add the following instructions into the file.
@y
Open the `docker-compose.yaml` and add the following instructions into the file.
@z

% snip code...

@x
Now, start your application and to confirm that it's running.
@y
Now, start your application and to confirm that it's running.
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
Finally, test your API endpoint. Run the following curl command:
@y
Finally, test your API endpoint. Run the following curl command:
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
edit and save your code. For more details about Compose Watch, see
[Use Compose Watch](/manuals/compose/file-watch.md).
@y
Use Compose Watch to automatically update your running Compose services as you
edit and save your code. For more details about Compose Watch, see
[Use Compose Watch](manuals/compose/file-watch.md).
@z

@x
Open your `docker-compose.yaml` file in an IDE or text editor and then add the
Compose Watch instructions. The following is the updated `docker-compose.yaml`
file.
@y
Open your `docker-compose.yaml` file in an IDE or text editor and then add the
Compose Watch instructions. The following is the updated `docker-compose.yaml`
file.
@z

@x
```yaml {hl_lines="14-17"}
services:
  server:
    build:
      context: .
      target: development
    ports:
      - 8080:8080
      - 8000:8000
    depends_on:
      db:
        condition: service_healthy
    environment:
      - POSTGRES_URL=jdbc:postgresql://db:5432/petclinic
    develop:
      watch:
        - action: rebuild
          path: .
  db:
    image: postgres
    restart: always
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=petclinic
      - POSTGRES_USER=petclinic
      - POSTGRES_PASSWORD=petclinic
    ports:
      - 5432:5432
    healthcheck:
      test: [ "CMD", "pg_isready", "-U", "petclinic" ]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
```
@y
```yaml {hl_lines="14-17"}
services:
  server:
    build:
      context: .
      target: development
    ports:
      - 8080:8080
      - 8000:8000
    depends_on:
      db:
        condition: service_healthy
    environment:
      - POSTGRES_URL=jdbc:postgresql://db:5432/petclinic
    develop:
      watch:
        - action: rebuild
          path: .
  db:
    image: postgres
    restart: always
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=petclinic
      - POSTGRES_USER=petclinic
      - POSTGRES_PASSWORD=petclinic
    ports:
      - 5432:5432
    healthcheck:
      test: [ "CMD", "pg_isready", "-U", "petclinic" ]
      interval: 10s
      timeout: 5s
      retries: 5
volumes:
  db-data:
```
@z

@x
Run the following command to run your application with Compose Watch.
@y
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
Open a web browser and view the application at [http://localhost:8080](http://localhost:8080). You should see the Spring Pet Clinic home page.
@y
Open a web browser and view the application at [http://localhost:8080](http://localhost:8080). You should see the Spring Pet Clinic home page.
@z

@x
Any changes to the application's source files on your local machine will now be automatically reflected in the running container.
@y
Any changes to the application's source files on your local machine will now be automatically reflected in the running container.
@z

@x
Open `spring-petclinic/src/main/resources/templates/fragments/layout.html` in an IDE or text editor and update the `Home` navigation string by adding an exclamation mark.
@y
Open `spring-petclinic/src/main/resources/templates/fragments/layout.html` in an IDE or text editor and update the `Home` navigation string by adding an exclamation mark.
@z

@x
```diff
-   <li th:replace="~{::menuItem ('/','home','home page','home','Home')}">
+   <li th:replace="~{::menuItem ('/','home','home page','home','Home!')}">
@y
```diff
-   <li th:replace="~{::menuItem ('/','home','home page','home','Home')}">
+   <li th:replace="~{::menuItem ('/','home','home page','home','Home!')}">
@z

@x
```
@y
```
@z

@x
Save the changes to `layout.html` and then you can continue developing while the container automatically rebuilds.
@y
Save the changes to `layout.html` and then you can continue developing while the container automatically rebuilds.
@z

@x
After the container is rebuilt and running, refresh [http://localhost:8080](http://localhost:8080) and then verify that **Home!** now appears in the menu.
@y
After the container is rebuilt and running, refresh [http://localhost:8080](http://localhost:8080) and then verify that **Home!** now appears in the menu.
@z

@x
Press `ctrl+c` in the terminal to stop Compose Watch.
@y
Press `ctrl+c` in the terminal to stop Compose Watch.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you took a look at running a database locally and persisting the data. You also created a development image that contains the JDK and lets you attach a debugger. Finally, you set up your Compose file to expose the debugging port and configured Compose Watch to live reload your changes.
@y
In this section, you took a look at running a database locally and persisting the data. You also created a development image that contains the JDK and lets you attach a debugger. Finally, you set up your Compose file to expose the debugging port and configured Compose Watch to live reload your changes.
@z

@x
Related information:
@y
Related information:
@z

@x
 - [Compose file reference](/reference/compose-file/)
 - [Compose Watch](/manuals/compose/file-watch.md)
 - [Dockerfile reference](/reference/dockerfile/)
@y
 - [Compose file reference](__SUBDIR__/reference/compose-file/)
 - [Compose Watch](manuals/compose/file-watch.md)
 - [Dockerfile reference](__SUBDIR__/reference/dockerfile/)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you’ll take a look at how to run unit tests in Docker.
@y
In the next section, you’ll take a look at how to run unit tests in Docker.
@z

@x
{{< button text="Run your tests" url="run-tests.md" >}}
@y
{{< button text="Run your tests" url="run-tests.md" >}}
@z
