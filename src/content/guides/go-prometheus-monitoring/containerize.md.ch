%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Containerize a Golang application
linkTitle: Containerize your app
@y
title: Containerize a Golang application
linkTitle: Containerize your app
@z

@x
keywords: go, golang, containerize, initialize
description: Learn how to containerize a Golang application.
@y
keywords: go, golang, containerize, initialize
description: Learn how to containerize a Golang application.
@z

@x
Containerization helps you bundle the application and its dependencies into a single package called a container. This package can run on any platform without worrying about the environment. In this section, you will learn how to containerize a Golang application using Docker.
@y
Containerization helps you bundle the application and its dependencies into a single package called a container. This package can run on any platform without worrying about the environment. In this section, you will learn how to containerize a Golang application using Docker.
@z

@x
To containerize a Golang application, you first need to create a Dockerfile. The Dockerfile contains instructions to build and run the application in a container. Also, when creating a Dockerfile, you can follow different sets of best practices to optimize the image size and make it more secure.
@y
To containerize a Golang application, you first need to create a Dockerfile. The Dockerfile contains instructions to build and run the application in a container. Also, when creating a Dockerfile, you can follow different sets of best practices to optimize the image size and make it more secure.
@z

@x
## Creating a Dockerfile
@y
## Creating a Dockerfile
@z

@x
Create a new file named `Dockerfile` in the root directory of your Golang application. The Dockerfile contains instructions to build and run the application in a container.
@y
Create a new file named `Dockerfile` in the root directory of your Golang application. The Dockerfile contains instructions to build and run the application in a container.
@z

@x
The following is a Dockerfile for a Golang application. You will also find this file in the `go-prometheus-monitoring` directory.
@y
The following is a Dockerfile for a Golang application. You will also find this file in the `go-prometheus-monitoring` directory.
@z

@x
```dockerfile
# Use the official Golang image as the base
FROM golang:1.24-alpine AS builder
@y
```dockerfile
# Use the official Golang image as the base
FROM golang:1.24-alpine AS builder
@z

@x
# Set environment variables
ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64
@y
# Set environment variables
ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64
@z

@x
# Set working directory inside the container
WORKDIR /build
@y
# Set working directory inside the container
WORKDIR /build
@z

@x
# Copy go.mod and go.sum files for dependency installation
COPY go.mod go.sum ./
@y
# Copy go.mod and go.sum files for dependency installation
COPY go.mod go.sum ./
@z

@x
# Download dependencies
RUN go mod download
@y
# Download dependencies
RUN go mod download
@z

@x
# Copy the entire application source
COPY . .
@y
# Copy the entire application source
COPY . .
@z

@x
# Build the Go binary
RUN go build -o /app .
@y
# Build the Go binary
RUN go build -o /app .
@z

@x
# Final lightweight stage
@y
# Final lightweight stage
@z

@x
# Copy the compiled binary from the builder stage
COPY --from=builder /app /bin/app
@y
# Copy the compiled binary from the builder stage
COPY --from=builder /app /bin/app
@z

@x
# Expose the application's port
EXPOSE 8000
@y
# Expose the application's port
EXPOSE 8000
@z

@x
# Run the application
CMD ["bin/app"]
```
@y
# Run the application
CMD ["bin/app"]
```
@z

@x
## Understanding the Dockerfile
@y
## Understanding the Dockerfile
@z

@x
The Dockerfile consists of two stages:
@y
The Dockerfile consists of two stages:
@z

@x
1. **Build stage**: This stage uses the official Golang image as the base and sets the necessary environment variables. It also sets the working directory inside the container, copies the `go.mod` and `go.sum` files for dependency installation, downloads the dependencies, copies the entire application source, and builds the Go binary.
@y
1. **Build stage**: This stage uses the official Golang image as the base and sets the necessary environment variables. It also sets the working directory inside the container, copies the `go.mod` and `go.sum` files for dependency installation, downloads the dependencies, copies the entire application source, and builds the Go binary.
@z

@x
    You use the `golang:1.24-alpine` image as the base image for the build stage. The `CGO_ENABLED=0` environment variable disables CGO, which is useful for building static binaries. You also set the `GOOS` and `GOARCH` environment variables to `linux` and `amd64`, respectively, to build the binary for the Linux platform.
@y
    You use the `golang:1.24-alpine` image as the base image for the build stage. The `CGO_ENABLED=0` environment variable disables CGO, which is useful for building static binaries. You also set the `GOOS` and `GOARCH` environment variables to `linux` and `amd64`, respectively, to build the binary for the Linux platform.
@z

@x
2. **Final stage**: This stage uses the official Alpine image as the base and copies the compiled binary from the build stage. It also exposes the application's port and runs the application.
@y
2. **Final stage**: This stage uses the official Alpine image as the base and copies the compiled binary from the build stage. It also exposes the application's port and runs the application.
@z

@x
    You use the `alpine:3.21` image as the base image for the final stage. You copy the compiled binary from the build stage to the final image. You expose the application's port using the `EXPOSE` instruction and run the application using the `CMD` instruction.
@y
    You use the `alpine:3.21` image as the base image for the final stage. You copy the compiled binary from the build stage to the final image. You expose the application's port using the `EXPOSE` instruction and run the application using the `CMD` instruction.
@z

@x
    Apart from the multi-stage build, the Dockerfile also follows best practices such as using the official images, setting the working directory, and copying only the necessary files to the final image. You can further optimize the Dockerfile by other best practices.
@y
    Apart from the multi-stage build, the Dockerfile also follows best practices such as using the official images, setting the working directory, and copying only the necessary files to the final image. You can further optimize the Dockerfile by other best practices.
@z

@x
## Build the Docker image and run the application
@y
## Build the Docker image and run the application
@z

@x
One you have the Dockerfile, you can build the Docker image and run the application in a container.
@y
One you have the Dockerfile, you can build the Docker image and run the application in a container.
@z

@x
To build the Docker image, run the following command in the terminal:
@y
To build the Docker image, run the following command in the terminal:
@z

@x
```console
$ docker build -t go-api:latest .
```
@y
```console
$ docker build -t go-api:latest .
```
@z

@x
After building the image, you can run the application in a container using the following command:
@y
After building the image, you can run the application in a container using the following command:
@z

@x
```console
$ docker run -p 8000:8000 go-api:latest
```
@y
```console
$ docker run -p 8000:8000 go-api:latest
```
@z

@x
The application will start running inside the container, and you can access it at `http://localhost:8000`. You can also check the running containers using the `docker ps` command.
@y
The application will start running inside the container, and you can access it at `http://localhost:8000`. You can also check the running containers using the `docker ps` command.
@z

@x
```console
$ docker ps
```
@y
```console
$ docker ps
```
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to containerize a Golang application using a Dockerfile. You created a multi-stage Dockerfile to build and run the application in a container. You also learned about best practices to optimize the Docker image size and make it more secure.
@y
In this section, you learned how to containerize a Golang application using a Dockerfile. You created a multi-stage Dockerfile to build and run the application in a container. You also learned about best practices to optimize the Docker image size and make it more secure.
@z

@x
Related information:
@y
Related information:
@z

@x
 - [Dockerfile reference](/reference/dockerfile.md)
 - [.dockerignore file](/reference/dockerfile.md#dockerignore-file)
@y
 - [Dockerfile reference](reference/dockerfile.md)
 - [.dockerignore file](reference/dockerfile.md#dockerignore-file)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you will learn how to use Docker Compose to connect and run multiple services together to monitor a Golang application with Prometheus and Grafana.
@y
In the next section, you will learn how to use Docker Compose to connect and run multiple services together to monitor a Golang application with Prometheus and Grafana.
@z
