%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Dockerfile overview
@y
title: Dockerfile overview
@z

@x
description: Learn about Dockerfiles and how to use them with Docker Images to build and package your software
keywords: build, buildx, buildkit, getting started, dockerfile
@y
description: Learn about Dockerfiles and how to use them with Docker Images to build and package your software
keywords: build, buildx, buildkit, getting started, dockerfile
@z

@x
## Dockerfile
@y
## Dockerfile
@z

@x
It all starts with a Dockerfile.
@y
It all starts with a Dockerfile.
@z

@x
Docker builds images by reading the instructions from a Dockerfile. A
Dockerfile is a text file containing instructions for building your source
code. The Dockerfile instruction syntax is defined by the specification
reference in the [Dockerfile reference](/reference/dockerfile.md).
@y
Docker builds images by reading the instructions from a Dockerfile. A
Dockerfile is a text file containing instructions for building your source
code. The Dockerfile instruction syntax is defined by the specification
reference in the [Dockerfile reference](reference/dockerfile.md).
@z

@x
Here are the most common types of instructions:
@y
Here are the most common types of instructions:
@z

@x
| Instruction                                                        | Description                                                                                                                                                                                              |
| ------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [`FROM <image>`](/reference/dockerfile.md#from)           | Defines a base for your image.                                                                                                                                                                           |
| [`RUN <command>`](/reference/dockerfile.md#run)           | Executes any commands in a new layer on top of the current image and commits the result. `RUN` also has a shell form for running commands.                                                               |
| [`WORKDIR <directory>`](/reference/dockerfile.md#workdir) | Sets the working directory for any `RUN`, `CMD`, `ENTRYPOINT`, `COPY`, and `ADD` instructions that follow it in the Dockerfile.                                                                          |
| [`COPY <src> <dest>`](/reference/dockerfile.md#copy)      | Copies new files or directories from `<src>` and adds them to the filesystem of the container at the path `<dest>`.                                                                                      |
| [`CMD <command>`](/reference/dockerfile.md#cmd)           | Lets you define the default program that is run once you start the container based on this image. Each Dockerfile only has one `CMD`, and only the last `CMD` instance is respected when multiple exist. |
@y
| Instruction                                                        | Description                                                                                                                                                                                              |
| ------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [`FROM <image>`](reference/dockerfile.md#from)           | Defines a base for your image.                                                                                                                                                                           |
| [`RUN <command>`](reference/dockerfile.md#run)           | Executes any commands in a new layer on top of the current image and commits the result. `RUN` also has a shell form for running commands.                                                               |
| [`WORKDIR <directory>`](reference/dockerfile.md#workdir) | Sets the working directory for any `RUN`, `CMD`, `ENTRYPOINT`, `COPY`, and `ADD` instructions that follow it in the Dockerfile.                                                                          |
| [`COPY <src> <dest>`](reference/dockerfile.md#copy)      | Copies new files or directories from `<src>` and adds them to the filesystem of the container at the path `<dest>`.                                                                                      |
| [`CMD <command>`](reference/dockerfile.md#cmd)           | Lets you define the default program that is run once you start the container based on this image. Each Dockerfile only has one `CMD`, and only the last `CMD` instance is respected when multiple exist. |
@z

@x
Dockerfiles are crucial inputs for image builds and can facilitate automated,
multi-layer image builds based on your unique configurations. Dockerfiles can
start simple and grow with your needs to support more complex scenarios.
@y
Dockerfiles are crucial inputs for image builds and can facilitate automated,
multi-layer image builds based on your unique configurations. Dockerfiles can
start simple and grow with your needs to support more complex scenarios.
@z

@x
### Filename
@y
### Filename
@z

@x
The default filename to use for a Dockerfile is `Dockerfile`, without a file
extension. Using the default name allows you to run the `docker build` command
without having to specify additional command flags.
@y
The default filename to use for a Dockerfile is `Dockerfile`, without a file
extension. Using the default name allows you to run the `docker build` command
without having to specify additional command flags.
@z

@x
Some projects may need distinct Dockerfiles for specific purposes. A common
convention is to name these `<something>.Dockerfile`. You can specify the
Dockerfile filename using the `--file` flag for the `docker build` command.
Refer to the
[`docker build` CLI reference](/reference/cli/docker/buildx/build.md#file)
to learn about the `--file` flag.
@y
Some projects may need distinct Dockerfiles for specific purposes. A common
convention is to name these `<something>.Dockerfile`. You can specify the
Dockerfile filename using the `--file` flag for the `docker build` command.
Refer to the
[`docker build` CLI reference](reference/cli/docker/buildx/build.md#file)
to learn about the `--file` flag.
@z

@x
> [!NOTE]
>
> We recommend using the default (`Dockerfile`) for your project's primary
> Dockerfile.
@y
> [!NOTE]
>
> We recommend using the default (`Dockerfile`) for your project's primary
> Dockerfile.
@z

@x
## Docker images
@y
## Docker images
@z

@x
Docker images consist of layers. Each layer is the result of a build
instruction in the Dockerfile. Layers are stacked sequentially, and each one is
a delta representing the changes applied to the previous layer.
@y
Docker images consist of layers. Each layer is the result of a build
instruction in the Dockerfile. Layers are stacked sequentially, and each one is
a delta representing the changes applied to the previous layer.
@z

@x
### Example
@y
### Example
@z

@x
Here's what a typical workflow for building applications with Docker looks like.
@y
Here's what a typical workflow for building applications with Docker looks like.
@z

@x
The following example code shows a small "Hello World" application written in
Python, using the Flask framework.
@y
The following example code shows a small "Hello World" application written in
Python, using the Flask framework.
@z

@x
```python
from flask import Flask
app = Flask(__name__)
@y
```python
from flask import Flask
app = Flask(__name__)
@z

@x
@app.route("/")
def hello():
    return "Hello World!"
```
@y
@app.route("/")
def hello():
    return "Hello World!"
```
@z

@x
In order to ship and deploy this application without Docker Build, you would
need to make sure that:
@y
In order to ship and deploy this application without Docker Build, you would
need to make sure that:
@z

@x
- The required runtime dependencies are installed on the server
- The Python code gets uploaded to the server's filesystem
- The server starts your application, using the necessary parameters
@y
- The required runtime dependencies are installed on the server
- The Python code gets uploaded to the server's filesystem
- The server starts your application, using the necessary parameters
@z

@x
The following Dockerfile creates a container image, which has all the
dependencies installed and that automatically starts your application.
@y
The following Dockerfile creates a container image, which has all the
dependencies installed and that automatically starts your application.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu:22.04
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu:22.04
@z

@x
# install app dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask==3.0.*
@y
# install app dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask==3.0.*
@z

@x
# install app
COPY hello.py /
@y
# install app
COPY hello.py /
@z

@x
# final configuration
ENV FLASK_APP=hello
EXPOSE 8000
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]
```
@y
# final configuration
ENV FLASK_APP=hello
EXPOSE 8000
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]
```
@z

@x
Here's a breakdown of what this Dockerfile does:
@y
Here's a breakdown of what this Dockerfile does:
@z

@x
- [Dockerfile syntax](#dockerfile-syntax)
- [Base image](#base-image)
- [Environment setup](#environment-setup)
- [Comments](#comments)
- [Installing dependencies](#installing-dependencies)
- [Copying files](#copying-files)
- [Setting environment variables](#setting-environment-variables)
- [Exposed ports](#exposed-ports)
- [Starting the application](#starting-the-application)
@y
- [Dockerfile syntax](#dockerfile-syntax)
- [Base image](#base-image)
- [Environment setup](#environment-setup)
- [Comments](#comments)
- [Installing dependencies](#installing-dependencies)
- [Copying files](#copying-files)
- [Setting environment variables](#setting-environment-variables)
- [Exposed ports](#exposed-ports)
- [Starting the application](#starting-the-application)
@z

@x
### Dockerfile syntax
@y
### Dockerfile syntax
@z

@x
The first line to add to a Dockerfile is a [`# syntax` parser directive](/reference/dockerfile.md#syntax).
While optional, this directive instructs the Docker builder what syntax to use
when parsing the Dockerfile, and allows older Docker versions with [BuildKit enabled](../buildkit/index.md#getting-started)
to use a specific [Dockerfile frontend](../buildkit/frontend.md) before
starting the build. [Parser directives](/reference/dockerfile.md#parser-directives)
must appear before any other comment, whitespace, or Dockerfile instruction in
your Dockerfile, and should be the first line in Dockerfiles.
@y
The first line to add to a Dockerfile is a [`# syntax` parser directive](reference/dockerfile.md#syntax).
While optional, this directive instructs the Docker builder what syntax to use
when parsing the Dockerfile, and allows older Docker versions with [BuildKit enabled](../buildkit/index.md#getting-started)
to use a specific [Dockerfile frontend](../buildkit/frontend.md) before
starting the build. [Parser directives](reference/dockerfile.md#parser-directives)
must appear before any other comment, whitespace, or Dockerfile instruction in
your Dockerfile, and should be the first line in Dockerfiles.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
```
@y
```dockerfile
# syntax=docker/dockerfile:1
```
@z

@x
> [!TIP]
>
> We recommend using `docker/dockerfile:1`, which always points to the latest
> release of the version 1 syntax. BuildKit automatically checks for updates of
> the syntax before building, making sure you are using the most current version.
@y
> [!TIP]
>
> We recommend using `docker/dockerfile:1`, which always points to the latest
> release of the version 1 syntax. BuildKit automatically checks for updates of
> the syntax before building, making sure you are using the most current version.
@z

@x
### Base image
@y
### Base image
@z

@x
The line following the syntax directive defines what base image to use:
@y
The line following the syntax directive defines what base image to use:
@z

@x
```dockerfile
FROM ubuntu:22.04
```
@y
```dockerfile
FROM ubuntu:22.04
```
@z

@x
The [`FROM` instruction](/reference/dockerfile.md#from) sets your base
image to the 22.04 release of Ubuntu. All instructions that follow are executed
in this base image: an Ubuntu environment. The notation `ubuntu:22.04`, follows
the `name:tag` standard for naming Docker images. When you build images, you
use this notation to name your images. There are many public images you can
leverage in your projects, by importing them into your build steps using the
Dockerfile `FROM` instruction.
@y
The [`FROM` instruction](reference/dockerfile.md#from) sets your base
image to the 22.04 release of Ubuntu. All instructions that follow are executed
in this base image: an Ubuntu environment. The notation `ubuntu:22.04`, follows
the `name:tag` standard for naming Docker images. When you build images, you
use this notation to name your images. There are many public images you can
leverage in your projects, by importing them into your build steps using the
Dockerfile `FROM` instruction.
@z

@x
[Docker Hub](https://hub.docker.com/search?image_filter=official&q=&type=image)
contains a large set of official images that you can use for this purpose.
@y
[Docker Hub](https://hub.docker.com/search?image_filter=official&q=&type=image)
contains a large set of official images that you can use for this purpose.
@z

@x
### Environment setup
@y
### Environment setup
@z

@x
The following line executes a build command inside the base image.
@y
The following line executes a build command inside the base image.
@z

@x
```dockerfile
# install app dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
```
@y
```dockerfile
# install app dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
```
@z

@x
This [`RUN` instruction](/reference/dockerfile.md#run) executes a
shell in Ubuntu that updates the APT package index and installs Python tools in
the container.
@y
This [`RUN` instruction](reference/dockerfile.md#run) executes a
shell in Ubuntu that updates the APT package index and installs Python tools in
the container.
@z

@x
### Comments
@y
### Comments
@z

@x
Note the `# install app dependencies` line. This is a comment. Comments in
Dockerfiles begin with the `#` symbol. As your Dockerfile evolves, comments can
be instrumental to document how your Dockerfile works for any future readers
and editors of the file, including your future self!
@y
Note the `# install app dependencies` line. This is a comment. Comments in
Dockerfiles begin with the `#` symbol. As your Dockerfile evolves, comments can
be instrumental to document how your Dockerfile works for any future readers
and editors of the file, including your future self!
@z

@x
> [!NOTE]
>
> You might've noticed that comments are denoted using the same symbol as the
> [syntax directive](#dockerfile-syntax) on the first line of the file.
> The symbol is only interpreted as a directive if the pattern matches a
> directive and appears at the beginning of the Dockerfile. Otherwise, it's
> treated as a comment.
@y
> [!NOTE]
>
> You might've noticed that comments are denoted using the same symbol as the
> [syntax directive](#dockerfile-syntax) on the first line of the file.
> The symbol is only interpreted as a directive if the pattern matches a
> directive and appears at the beginning of the Dockerfile. Otherwise, it's
> treated as a comment.
@z

@x
### Installing dependencies
@y
### Installing dependencies
@z

@x
The second `RUN` instruction installs the `flask` dependency required by the
Python application.
@y
The second `RUN` instruction installs the `flask` dependency required by the
Python application.
@z

@x
```dockerfile
RUN pip install flask==3.0.*
```
@y
```dockerfile
RUN pip install flask==3.0.*
```
@z

@x
A prerequisite for this instruction is that `pip` is installed into the build
container. The first `RUN` command installs `pip`, which ensures that we can
use the command to install the flask web framework.
@y
A prerequisite for this instruction is that `pip` is installed into the build
container. The first `RUN` command installs `pip`, which ensures that we can
use the command to install the flask web framework.
@z

@x
### Copying files
@y
### Copying files
@z

@x
The next instruction uses the
[`COPY` instruction](/reference/dockerfile.md#copy) to copy the
`hello.py` file from the local build context into the root directory of our image. 
@y
The next instruction uses the
[`COPY` instruction](reference/dockerfile.md#copy) to copy the
`hello.py` file from the local build context into the root directory of our image. 
@z

@x
```dockerfile
COPY hello.py /
```
@y
```dockerfile
COPY hello.py /
```
@z

@x
A [build context](./context.md) is the set of files that you can access
in Dockerfile instructions such as `COPY` and `ADD`.
@y
A [build context](./context.md) is the set of files that you can access
in Dockerfile instructions such as `COPY` and `ADD`.
@z

@x
After the `COPY` instruction, the `hello.py` file is added to the filesystem
of the build container.
@y
After the `COPY` instruction, the `hello.py` file is added to the filesystem
of the build container.
@z

@x
### Setting environment variables
@y
### Setting environment variables
@z

@x
If your application uses environment variables, you can set environment variables
in your Docker build using the [`ENV` instruction](/reference/dockerfile.md#env).
@y
If your application uses environment variables, you can set environment variables
in your Docker build using the [`ENV` instruction](reference/dockerfile.md#env).
@z

@x
```dockerfile
ENV FLASK_APP=hello
```
@y
```dockerfile
ENV FLASK_APP=hello
```
@z

@x
This sets a Linux environment variable we'll need later. Flask, the framework
used in this example, uses this variable to start the application. Without this,
flask wouldn't know where to find our application to be able to run it.
@y
This sets a Linux environment variable we'll need later. Flask, the framework
used in this example, uses this variable to start the application. Without this,
flask wouldn't know where to find our application to be able to run it.
@z

@x
### Exposed ports
@y
### Exposed ports
@z

@x
The [`EXPOSE` instruction](/reference/dockerfile.md#expose) marks that
our final image has a service listening on port `8000`.
@y
The [`EXPOSE` instruction](reference/dockerfile.md#expose) marks that
our final image has a service listening on port `8000`.
@z

@x
```dockerfile
EXPOSE 8000
```
@y
```dockerfile
EXPOSE 8000
```
@z

@x
This instruction isn't required, but it is a good practice and helps tools and
team members understand what this application is doing.
@y
This instruction isn't required, but it is a good practice and helps tools and
team members understand what this application is doing.
@z

@x
### Starting the application
@y
### Starting the application
@z

@x
Finally, [`CMD` instruction](/reference/dockerfile.md#cmd) sets the
command that is run when the user starts a container based on this image.
@y
Finally, [`CMD` instruction](reference/dockerfile.md#cmd) sets the
command that is run when the user starts a container based on this image.
@z

@x
```dockerfile
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]
```
@y
```dockerfile
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]
```
@z

@x
This command starts the flask development server listening on all addresses
on port `8000`. The example here uses the "exec form" version of `CMD`.
It's also possible to use the "shell form":
@y
This command starts the flask development server listening on all addresses
on port `8000`. The example here uses the "exec form" version of `CMD`.
It's also possible to use the "shell form":
@z

@x
```dockerfile
CMD flask run --host 0.0.0.0 --port 8000
```
@y
```dockerfile
CMD flask run --host 0.0.0.0 --port 8000
```
@z

@x
There are subtle differences between these two versions,
for example in how they trap signals like `SIGTERM` and `SIGKILL`.
For more information about these differences, see
[Shell and exec form](/reference/dockerfile.md#shell-and-exec-form)
@y
There are subtle differences between these two versions,
for example in how they trap signals like `SIGTERM` and `SIGKILL`.
For more information about these differences, see
[Shell and exec form](reference/dockerfile.md#shell-and-exec-form)
@z

@x
## Building
@y
## Building
@z

@x
To build a container image using the Dockerfile example from the
[previous section](#example), you use the `docker build` command:
@y
To build a container image using the Dockerfile example from the
[previous section](#example), you use the `docker build` command:
@z

@x
```console
$ docker build -t test:latest .
```
@y
```console
$ docker build -t test:latest .
```
@z

@x
The `-t test:latest` option specifies the name and tag of the image.
@y
The `-t test:latest` option specifies the name and tag of the image.
@z

@x
The single dot (`.`) at the end of the command sets the
[build context](./context.md) to the current directory. This means that the
build expects to find the Dockerfile and the `hello.py` file in the directory
where the command is invoked. If those files aren't there, the build fails.
@y
The single dot (`.`) at the end of the command sets the
[build context](./context.md) to the current directory. This means that the
build expects to find the Dockerfile and the `hello.py` file in the directory
where the command is invoked. If those files aren't there, the build fails.
@z

@x
After the image has been built, you can run the application as a container with
`docker run`, specifying the image name:
@y
After the image has been built, you can run the application as a container with
`docker run`, specifying the image name:
@z

@x
```console
$ docker run -p 127.0.0.1:8000:8000 test:latest
```
@y
```console
$ docker run -p 127.0.0.1:8000:8000 test:latest
```
@z

@x
This publishes the container's port 8000 to `http://localhost:8000` on the
Docker host.
@y
This publishes the container's port 8000 to `http://localhost:8000` on the
Docker host.
@z
