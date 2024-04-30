%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Multi-stage builds
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you about the purpose of the multi-stage build and its benefits
@y
title: Multi-stage builds
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you about the purpose of the multi-stage build and its benefits
@z

@x
{{< youtube-embed vR185cjwxZ8 >}}
@y
{{< youtube-embed vR185cjwxZ8 >}}
@z

@x
## Explanation
@y
## Explanation
@z

@x
In a traditional build, all build instructions are executed in sequence, and in a single build container: downloading dependencies, compiling code, and packaging the application. All those layers end up in your final image. This approach works, but it leads to bulky images carrying unnecessary weight and increasing your security risks. This is where multi-stage builds come in.
@y
In a traditional build, all build instructions are executed in sequence, and in a single build container: downloading dependencies, compiling code, and packaging the application. All those layers end up in your final image. This approach works, but it leads to bulky images carrying unnecessary weight and increasing your security risks. This is where multi-stage builds come in.
@z

@x
Multi-stage builds introduce multiple stages in your Dockerfile, each with a specific purpose. Think of it like the ability to run different parts of a build in multiple different environments, concurrently. By separating the build environment from the final runtime environment, you can significantly reduce the image size and attack surface. This is especially beneficial for applications with large build dependencies.
@y
Multi-stage builds introduce multiple stages in your Dockerfile, each with a specific purpose. Think of it like the ability to run different parts of a build in multiple different environments, concurrently. By separating the build environment from the final runtime environment, you can significantly reduce the image size and attack surface. This is especially beneficial for applications with large build dependencies.
@z

@x
Multi-stage builds are recommended for all types of applications.
@y
Multi-stage builds are recommended for all types of applications.
@z

@x
- For interpreted languages, like JavaScript or Ruby or Python, you can build and minify your code in one stage, and copy the production-ready files to a smaller runtime image. This optimizes your image for deployment.
- For compiled languages, like C or Go or Rust, multi-stage builds let you compile in one stage and copy the compiled binaries into a final runtime image. No need to bundle the entire compiler in your final image.
@y
- For interpreted languages, like JavaScript or Ruby or Python, you can build and minify your code in one stage, and copy the production-ready files to a smaller runtime image. This optimizes your image for deployment.
- For compiled languages, like C or Go or Rust, multi-stage builds let you compile in one stage and copy the compiled binaries into a final runtime image. No need to bundle the entire compiler in your final image.
@z

@x
Here's a simplified example of a multi-stage build structure using pseudo-code. Notice there are multiple `FROM` statements and a new `AS <stage-name>`. In addition, the `COPY` statement in the second stage is copying `--from` the previous stage.
@y
Here's a simplified example of a multi-stage build structure using pseudo-code. Notice there are multiple `FROM` statements and a new `AS <stage-name>`. In addition, the `COPY` statement in the second stage is copying `--from` the previous stage.
@z

@x
```dockerfile
# Stage 1: Build Environment
FROM builder-image AS build-stage 
# Install build tools (e.g., Maven, Gradle)
# Copy source code
# Build commands (e.g., compile, package)
@y
```dockerfile
# Stage 1: Build Environment
FROM builder-image AS build-stage 
# Install build tools (e.g., Maven, Gradle)
# Copy source code
# Build commands (e.g., compile, package)
@z

@x
# Stage 2: Runtime environment
FROM runtime-image AS final-stage  
#  Copy application artifacts from the build stage (e.g., JAR file)
COPY --from=build-stage /path/in/build/stage /path/to/place/in/final/stage
# Define runtime configuration (e.g., CMD, ENTRYPOINT) 
```
@y
# Stage 2: Runtime environment
FROM runtime-image AS final-stage  
#  Copy application artifacts from the build stage (e.g., JAR file)
COPY --from=build-stage /path/in/build/stage /path/to/place/in/final/stage
# Define runtime configuration (e.g., CMD, ENTRYPOINT) 
```
@z

@x
This Dockerfile uses two stages:
@y
This Dockerfile uses two stages:
@z

@x
- The build stage uses a base image containing build tools needed to compile your application. It includes commands to install build tools, copy source code, and execute build commands.
- The final stage uses a smaller base image suitable for running your application. It copies the compiled artifacts (a JAR file, for example) from the build stage. Finally, it defines the runtime configuration (using `CMD` or `ENTRYPOINT`) for starting your application.
@y
- The build stage uses a base image containing build tools needed to compile your application. It includes commands to install build tools, copy source code, and execute build commands.
- The final stage uses a smaller base image suitable for running your application. It copies the compiled artifacts (a JAR file, for example) from the build stage. Finally, it defines the runtime configuration (using `CMD` or `ENTRYPOINT`) for starting your application.
@z

@x
## Try it now
@y
## Try it now
@z

@x
In this hands-on guide, you'll unlock the power of multi-stage builds to create lean and efficient Docker images for a sample Java application. You'll use a simple “Hello World” Spring Boot-based application built with Maven as your example.
@y
In this hands-on guide, you'll unlock the power of multi-stage builds to create lean and efficient Docker images for a sample Java application. You'll use a simple “Hello World” Spring Boot-based application built with Maven as your example.
@z

@x
1. [Download and install](https://www.docker.com/products/docker-desktop/) Docker Desktop.
@y
1. [Download and install](https://www.docker.com/products/docker-desktop/) Docker Desktop.
@z

@x
2. Open this [pre-initialized project](https://start.spring.io/#!type=maven-project&language=java&platformVersion=3.3.0-M3&packaging=jar&jvmVersion=21&groupId=com.example&artifactId=spring-boot-docker&name=spring-boot-docker&description=Demo%20project%20for%20Spring%20Boot&packageName=com.example.spring-boot-docker&dependencies=web) to generate a ZIP file. Here’s how that looks:
@y
2. Open this [pre-initialized project](https://start.spring.io/#!type=maven-project&language=java&platformVersion=3.3.0-M3&packaging=jar&jvmVersion=21&groupId=com.example&artifactId=spring-boot-docker&name=spring-boot-docker&description=Demo%20project%20for%20Spring%20Boot&packageName=com.example.spring-boot-docker&dependencies=web) to generate a ZIP file. Here’s how that looks:
@z

@x
    ![A screenshot of Spring Initializr tool selected with Java 21, Spring Web and Spring Boot 3.3.0](images/spring-initializr.webp?border=true)
@y
    ![A screenshot of Spring Initializr tool selected with Java 21, Spring Web and Spring Boot 3.3.0](images/spring-initializr.webp?border=true)
@z

@x
    [Spring Initializr](https://start.spring.io/) is a quickstart generator for Spring projects. It provides an extensible API to generate JVM-based projects with implementations for several common concepts — like basic language generation for Java, Kotlin, and Groovy. 
@y
    [Spring Initializr](https://start.spring.io/) is a quickstart generator for Spring projects. It provides an extensible API to generate JVM-based projects with implementations for several common concepts — like basic language generation for Java, Kotlin, and Groovy. 
@z

@x
    Select **Generate** to create and download the zip file for this project.
@y
    Select **Generate** to create and download the zip file for this project.
@z

@x
    For this demonstration, you’ve paired Maven build automation with Java, a Spring Web dependency, and Java 21 for your metadata.
@y
    For this demonstration, you’ve paired Maven build automation with Java, a Spring Web dependency, and Java 21 for your metadata.
@z

@x
3. Navigate the project directory. Once you unzip the file, you'll see the following project directory structure:
@y
3. Navigate the project directory. Once you unzip the file, you'll see the following project directory structure:
@z

@x
    ```plaintext
    spring-boot-docker
    ├── Dockerfile
    ├── Dockerfile.multi
    ├── HELP.md
    ├── mvnw
    ├── mvnw.cmd
    ├── pom.xml
    └── src
        ├── main
        │   ├── java
        │   │   └── com
        │   │       └── example
        │   │           └── springbootdocker
        │   │               └── SpringBootDockerApplication.java
        │   └── resources
        │       ├── application.properties
        │       ├── static
        │       └── templates
        └── test
            └── java
                └── com
                    └── example
                        └── springbootdocker
                            └── SpringBootDockerApplicationTests.java
@y
    ```plaintext
    spring-boot-docker
    ├── Dockerfile
    ├── Dockerfile.multi
    ├── HELP.md
    ├── mvnw
    ├── mvnw.cmd
    ├── pom.xml
    └── src
        ├── main
        │   ├── java
        │   │   └── com
        │   │       └── example
        │   │           └── springbootdocker
        │   │               └── SpringBootDockerApplication.java
        │   └── resources
        │       ├── application.properties
        │       ├── static
        │       └── templates
        └── test
            └── java
                └── com
                    └── example
                        └── springbootdocker
                            └── SpringBootDockerApplicationTests.java
@z

@x
    15 directories, 9 files
    ```
@y
    15 directories, 9 files
    ```
@z

@x
   The `src/main/java` directory contains your project's source code, the `src/test/java` directory   
   contains the test source, and the `pom.xml` file is your project’s Project Object Model (POM).
@y
   The `src/main/java` directory contains your project's source code, the `src/test/java` directory   
   contains the test source, and the `pom.xml` file is your project’s Project Object Model (POM).
@z

@x
   The `pom.xml` file is the core of a Maven project's configuration. It's a single configuration file that   
   contains most of the information needed to build a customized project. The POM is huge and can seem    
   daunting. Thankfully, you don't yet need to understand every intricacy to use it effectively. 
@y
   The `pom.xml` file is the core of a Maven project's configuration. It's a single configuration file that   
   contains most of the information needed to build a customized project. The POM is huge and can seem    
   daunting. Thankfully, you don't yet need to understand every intricacy to use it effectively. 
@z

@x
4. Create a RESTful web service that displays "Hello World!". 
@y
4. Create a RESTful web service that displays "Hello World!". 
@z

@x
    Under the `src/main/java/com/example/springbootdocker/` directory, you can modify your  
    `SpringBootDockerApplication.java` file with the following content:
@y
    Under the `src/main/java/com/example/springbootdocker/` directory, you can modify your  
    `SpringBootDockerApplication.java` file with the following content:
@z

@x
    ```java
    package com.example.springbootdocker;
@y
    ```java
    package com.example.springbootdocker;
@z

@x
    import org.springframework.boot.SpringApplication;
    import org.springframework.boot.autoconfigure.SpringBootApplication;
    import org.springframework.web.bind.annotation.RequestMapping;
    import org.springframework.web.bind.annotation.RestController;
@y
    import org.springframework.boot.SpringApplication;
    import org.springframework.boot.autoconfigure.SpringBootApplication;
    import org.springframework.web.bind.annotation.RequestMapping;
    import org.springframework.web.bind.annotation.RestController;
@z

@x
    @RestController
    @SpringBootApplication
    public class SpringBootDockerApplication {
@y
    @RestController
    @SpringBootApplication
    public class SpringBootDockerApplication {
@z

@x
    @RequestMapping("/")
    public String home() {
    return "Hello World";
    }
@y
    @RequestMapping("/")
    public String home() {
    return "Hello World";
    }
@z

@x
    	public static void main(String[] args) {
    		SpringApplication.run(SpringBootDockerApplication.class, args);
    	}
@y
    	public static void main(String[] args) {
    		SpringApplication.run(SpringBootDockerApplication.class, args);
    	}
@z

@x
    }
    ```
@y
    }
    ```
@z

@x
    The `SpringbootDockerApplication.java` file starts by declaring your `com.example.springbootdocker` package and importing necessary Spring frameworks. This Java file creates a simple Spring Boot web application that responds with "Hello World" when a user visits its homepage. 
@y
    The `SpringbootDockerApplication.java` file starts by declaring your `com.example.springbootdocker` package and importing necessary Spring frameworks. This Java file creates a simple Spring Boot web application that responds with "Hello World" when a user visits its homepage. 
@z

@x
### Create the Dockerfile
@y
### Create the Dockerfile
@z

@x
Now that you have the project, you’re ready to create the `Dockerfile`.
@y
Now that you have the project, you’re ready to create the `Dockerfile`.
@z

@x
 1. Create a file named `Dockerfile` in the same folder that contains all the other folders and files (like src, pom.xml, etc.).
@y
 1. Create a file named `Dockerfile` in the same folder that contains all the other folders and files (like src, pom.xml, etc.).
@z

@x
 2. In the `Dockerfile`, define your base image by adding the following line:
@y
 2. In the `Dockerfile`, define your base image by adding the following line:
@z

@x
     ```dockerfile
     FROM eclipse-temurin:21.0.2_13-jdk-jammy
     ```
@y
     ```dockerfile
     FROM eclipse-temurin:21.0.2_13-jdk-jammy
     ```
@z

@x
 3. Now, define the working directory by using the `WORKDIR` instruction. This will specify where future commands will run and the directory files will be copied inside the container image.
@y
 3. Now, define the working directory by using the `WORKDIR` instruction. This will specify where future commands will run and the directory files will be copied inside the container image.
@z

@x
     ```dockerfile
     WORKDIR /app
     ```
@y
     ```dockerfile
     WORKDIR /app
     ```
@z

@x
 4. Copy both the Maven wrapper script and your project's `pom.xml` file into the current working directory `/app` within the Docker container.
@y
 4. Copy both the Maven wrapper script and your project's `pom.xml` file into the current working directory `/app` within the Docker container.
@z

@x
     ```dockerfile
     COPY .mvn/ .mvn
     COPY mvnw pom.xml ./
     ```
@y
     ```dockerfile
     COPY .mvn/ .mvn
     COPY mvnw pom.xml ./
     ```
@z

@x
 5. Execute a command within the container. It runs the `./mvnw dependency:go-offline` command, which uses the Maven wrapper (`./mvnw`) to download all dependencies for your project without building the final JAR file (useful for faster builds).
@y
 5. Execute a command within the container. It runs the `./mvnw dependency:go-offline` command, which uses the Maven wrapper (`./mvnw`) to download all dependencies for your project without building the final JAR file (useful for faster builds).
@z

@x
     ```dockerfile
     RUN ./mvnw dependency:go-offline
     ```
@y
     ```dockerfile
     RUN ./mvnw dependency:go-offline
     ```
@z

@x
 6. Copy the `src` directory from your project on the host machine to the `/app` directory within the container. 
@y
 6. Copy the `src` directory from your project on the host machine to the `/app` directory within the container. 
@z

@x
     ```dockerfile
     COPY src ./src
     ```
@y
     ```dockerfile
     COPY src ./src
     ```
@z

@x
 7. Set the default command to be executed when the container starts. This command instructs the container to run the Maven wrapper (`./mvnw`) with the `spring-boot:run` goal, which will build and execute your Spring Boot application.
@y
 7. Set the default command to be executed when the container starts. This command instructs the container to run the Maven wrapper (`./mvnw`) with the `spring-boot:run` goal, which will build and execute your Spring Boot application.
@z

@x
     ```dockerfile
     CMD ["./mvnw", "spring-boot:run"]
     ```
@y
     ```dockerfile
     CMD ["./mvnw", "spring-boot:run"]
     ```
@z

@x
    And with that, you should have the following Dockerfile:
@y
    And with that, you should have the following Dockerfile:
@z

@x
    ```dockerfile 
    FROM eclipse-temurin:21.0.2_13-jdk-jammy
    WORKDIR /app
    COPY .mvn/ .mvn
    COPY mvnw pom.xml ./
    RUN ./mvnw dependency:go-offline
    COPY src ./src
    CMD ["./mvnw", "spring-boot:run"]
    ```
@y
    ```dockerfile 
    FROM eclipse-temurin:21.0.2_13-jdk-jammy
    WORKDIR /app
    COPY .mvn/ .mvn
    COPY mvnw pom.xml ./
    RUN ./mvnw dependency:go-offline
    COPY src ./src
    CMD ["./mvnw", "spring-boot:run"]
    ```
@z

@x
### Build the container image
@y
### Build the container image
@z

@x
 1. Execute the following command to build the Docker image:
@y
 1. Execute the following command to build the Docker image:
@z

@x
    ```console
    $ docker build -t spring-helloworld .
    ```
@y
    ```console
    $ docker build -t spring-helloworld .
    ```
@z

@x
 2. Check the size of the Docker image by using the `docker images` command:
@y
 2. Check the size of the Docker image by using the `docker images` command:
@z

@x
    ```console
    $ docker images
    ```
@y
    ```console
    $ docker images
    ```
@z

@x
    Doing so will produce output like the following:
@y
    Doing so will produce output like the following:
@z

@x
    ```console
    REPOSITORY          TAG       IMAGE ID       CREATED          SIZE
    spring-helloworld   latest    ff708d5ee194   3 minutes ago    880MB
    ```
@y
    ```console
    REPOSITORY          TAG       IMAGE ID       CREATED          SIZE
    spring-helloworld   latest    ff708d5ee194   3 minutes ago    880MB
    ```
@z

@x
    This output shows that your image is 880MB in size. It contains the full JDK, Maven toolchain, and more. In production, you don’t need that in your final image.
@y
    This output shows that your image is 880MB in size. It contains the full JDK, Maven toolchain, and more. In production, you don’t need that in your final image.
@z

@x
### Run the Spring Boot application
@y
### Run the Spring Boot application
@z

@x
1. Now that you have an image built, it's time to run the container.
@y
1. Now that you have an image built, it's time to run the container.
@z

@x
    ```console
    $ docker run -d -p 8080:8080 spring-helloworld
    ```
@y
    ```console
    $ docker run -d -p 8080:8080 spring-helloworld
    ```
@z

@x
    You'll then see output similar to the following in the container log:
@y
    You'll then see output similar to the following in the container log:
@z

@x
    ```plaintext
    [INFO] --- spring-boot:3.3.0-M3:run (default-cli) @ spring-boot-docker ---
    [INFO] Attaching agents: []
     .   ____          _            __ _ _
     /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
     ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
     \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
     '  |____| .__|_| |_|_| |_\__, | / / / /
      =========|_|==============|___/=/_/_/_/
@y
    ```plaintext
    [INFO] --- spring-boot:3.3.0-M3:run (default-cli) @ spring-boot-docker ---
    [INFO] Attaching agents: []
     .   ____          _            __ _ _
     /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
     ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
     \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
     '  |____| .__|_| |_|_| |_\__, | / / / /
      =========|_|==============|___/=/_/_/_/
@z

@x
     :: Spring Boot ::             (v3.3.0-M3)
@y
     :: Spring Boot ::             (v3.3.0-M3)
@z

@x
     2024-04-04T15:36:47.202Z  INFO 42 --- [spring-boot-docker] [           main]       
     c.e.s.SpringBootDockerApplication        : Starting SpringBootDockerApplication using Java    
     21.0.2 with PID 42 (/app/target/classes started by root in /app)
     ….
     ```
@y
     2024-04-04T15:36:47.202Z  INFO 42 --- [spring-boot-docker] [           main]       
     c.e.s.SpringBootDockerApplication        : Starting SpringBootDockerApplication using Java    
     21.0.2 with PID 42 (/app/target/classes started by root in /app)
     ….
     ```
@z

@x
2. Access your “Hello World” page through your web browser at [http://localhost:8080](http://localhost:8080), or via this curl command:
@y
2. Access your “Hello World” page through your web browser at [http://localhost:8080](http://localhost:8080), or via this curl command:
@z

@x
    ```console
    $ curl localhost:8080
    Hello World
    ```
@y
    ```console
    $ curl localhost:8080
    Hello World
    ```
@z

@x
### Use multi-stage builds
@y
### Use multi-stage builds
@z

@x
1. Consider the following Dockerfile:
@y
1. Consider the following Dockerfile:
@z

@x
    ```dockerfile
    FROM eclipse-temurin:21.0.2_13-jdk-jammy as builder
    WORKDIR /opt/app
    COPY .mvn/ .mvn
    COPY mvnw pom.xml ./
    RUN ./mvnw dependency:go-offline
    COPY ./src ./src
    RUN ./mvnw clean install
    FROM eclipse-temurin:21.0.2_13-jre-jammy as final
    WORKDIR /opt/app
    EXPOSE 8080
    COPY --from=builder /opt/app/target/*.jar /opt/app/*.jar
    ENTRYPOINT ["java", "-jar", "/opt/app/*.jar"]
    ```
@y
    ```dockerfile
    FROM eclipse-temurin:21.0.2_13-jdk-jammy as builder
    WORKDIR /opt/app
    COPY .mvn/ .mvn
    COPY mvnw pom.xml ./
    RUN ./mvnw dependency:go-offline
    COPY ./src ./src
    RUN ./mvnw clean install
    FROM eclipse-temurin:21.0.2_13-jre-jammy as final
    WORKDIR /opt/app
    EXPOSE 8080
    COPY --from=builder /opt/app/target/*.jar /opt/app/*.jar
    ENTRYPOINT ["java", "-jar", "/opt/app/*.jar"]
    ```
@z

@x
    Notice that this Dockerfile has been split into two stages. 
@y
    Notice that this Dockerfile has been split into two stages. 
@z

@x
    - The first stage remains the same as the previous Dockerfile, providing a Java Development Kit (JDK) environment for building the application. This stage is given the name of builder.
@y
    - The first stage remains the same as the previous Dockerfile, providing a Java Development Kit (JDK) environment for building the application. This stage is given the name of builder.
@z

@x
    - The second stage is a new stage named `final`. Since it starts `FROM builder`, it inherits everything from the base stage (JDK environment). It uses a slimmer `eclipse-temurin:21.0.2_13-jre-jammy` image, containing just the Java Runtime Environment (JRE) needed to run the application. This image provides a Java Runtime Environment (JRE) which is enough for running the compiled application (JAR file). 
@y
    - The second stage is a new stage named `final`. Since it starts `FROM builder`, it inherits everything from the base stage (JDK environment). It uses a slimmer `eclipse-temurin:21.0.2_13-jre-jammy` image, containing just the Java Runtime Environment (JRE) needed to run the application. This image provides a Java Runtime Environment (JRE) which is enough for running the compiled application (JAR file). 
@z

@x
   > For production use, it's highly recommended that you produce a custom JRE-like runtime using jlink. JRE images are available for all versions of Eclipse Temurin, but `jlink` allows you to create a minimal runtime containing only the necessary Java modules for your application. This can significantly reduce the size and improve the security of your final image. [Refer to this page](https://hub.docker.com/_/eclipse-temurin) for more information.
  { .tip } 
@y
   > For production use, it's highly recommended that you produce a custom JRE-like runtime using jlink. JRE images are available for all versions of Eclipse Temurin, but `jlink` allows you to create a minimal runtime containing only the necessary Java modules for your application. This can significantly reduce the size and improve the security of your final image. [Refer to this page](https://hub.docker.com/_/eclipse-temurin) for more information.
  { .tip } 
@z

@x
   With multi-stage builds, a Docker build uses one base image for compilation, packaging, and unit tests and then a separate image for the application runtime. As a result, the final image is smaller in size since it doesn’t contain any development or debugging tools. By separating the build environment from the final runtime environment, you can significantly reduce the image size and increase the security of your final images. 
@y
   With multi-stage builds, a Docker build uses one base image for compilation, packaging, and unit tests and then a separate image for the application runtime. As a result, the final image is smaller in size since it doesn’t contain any development or debugging tools. By separating the build environment from the final runtime environment, you can significantly reduce the image size and increase the security of your final images. 
@z

@x
2. Now, rebuild your image and run your ready-to-use production build. 
@y
2. Now, rebuild your image and run your ready-to-use production build. 
@z

@x
    ```console
    $ docker build -t spring-helloworld-builder .
    ```
@y
    ```console
    $ docker build -t spring-helloworld-builder .
    ```
@z

@x
    This command builds a Docker image named `spring-helloworld-builder` using the final stage from your `Dockerfile` file located in the current directory.
@y
    This command builds a Docker image named `spring-helloworld-builder` using the final stage from your `Dockerfile` file located in the current directory.
@z

@x
     > **Note**
     >
     > In your multi-stage Dockerfile, the final stage (final) is the default target for building. This means that if you don't explicitly specify a target stage using the `--target` flag in the `docker build` command, Docker will automatically build the last stage by default. You could use `docker build -t spring-helloworld-builder --target builder .` to build only the builder stage with the JDK environment.
@y
     > **Note**
     >
     > In your multi-stage Dockerfile, the final stage (final) is the default target for building. This means that if you don't explicitly specify a target stage using the `--target` flag in the `docker build` command, Docker will automatically build the last stage by default. You could use `docker build -t spring-helloworld-builder --target builder .` to build only the builder stage with the JDK environment.
@z

@x
3. Look at the image size difference by using the `docker images` command:
@y
3. Look at the image size difference by using the `docker images` command:
@z

@x
    ```console
    $ docker images
    ```
@y
    ```console
    $ docker images
    ```
@z

@x
    You'll get output similar to the following:
@y
    You'll get output similar to the following:
@z

@x
    ```console
    spring-helloworld-builder latest    c5c76cb815c0   24 minutes ago      428MB
    spring-helloworld         latest    ff708d5ee194   About an hour ago   880MB
    ```
@y
    ```console
    spring-helloworld-builder latest    c5c76cb815c0   24 minutes ago      428MB
    spring-helloworld         latest    ff708d5ee194   About an hour ago   880MB
    ```
@z

@x
    Your final image is just 428 MB, compared to the original build size of 880 MB.
@y
    Your final image is just 428 MB, compared to the original build size of 880 MB.
@z

@x
    By optimizing each stage and only including what's necessary, you were able to significantly reduce the   
    overall image size while still achieving the same functionality. This not only improves performance but   
    also makes your Docker images more lightweight, more secure, and easier to manage.
@y
    By optimizing each stage and only including what's necessary, you were able to significantly reduce the   
    overall image size while still achieving the same functionality. This not only improves performance but   
    also makes your Docker images more lightweight, more secure, and easier to manage.
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
* [Multi-stage builds](/build/building/multi-stage/)
* [Dockerfile best practices](/develop/develop-images/dockerfile_best-practices/)
* [Creating a base image](/build/building/base-images/)
* [Spring Boot Docker](https://spring.io/guides/topicals/spring-boot-docker)
@y
* [Multi-stage builds](__SUBDIR__/build/building/multi-stage/)
* [Dockerfile best practices](__SUBDIR__/develop/develop-images/dockerfile_best-practices/)
* [Creating a base image](__SUBDIR__/build/building/base-images/)
* [Spring Boot Docker](https://spring.io/guides/topicals/spring-boot-docker)
@z
