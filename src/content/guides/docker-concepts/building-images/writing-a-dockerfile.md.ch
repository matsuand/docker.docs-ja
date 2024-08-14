%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Writing a Dockerfile
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you how to create image using Dockerfile.
@y
title: Writing a Dockerfile
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you how to create image using Dockerfile.
@z

@x
{{< youtube-embed Jx8zoIhiP4c >}}
@y
{{< youtube-embed Jx8zoIhiP4c >}}
@z

@x
## Explanation
@y
## Explanation
@z

@x
A Dockerfile is a text-based document that's used to create a container image. It provides instructions to the image builder on the commands to run, files to copy, startup command, and more.
@y
A Dockerfile is a text-based document that's used to create a container image. It provides instructions to the image builder on the commands to run, files to copy, startup command, and more.
@z

@x
As an example, the following Dockerfile would produce a ready-to-run Python application:
@y
As an example, the following Dockerfile would produce a ready-to-run Python application:
@z

@x within code
# Install the application dependencies
@y
# Install the application dependencies
@z
@x
# Copy in the source code
@y
# Copy in the source code
@z
@x
# Setup an app user so the container doesn't run as the root user
@y
# Setup an app user so the container doesn't run as the root user
@z

@x
### Common instructions
@y
### Common instructions
@z

@x
Some of the most common instructions in a `Dockerfile` include:
@y
Some of the most common instructions in a `Dockerfile` include:
@z

@x
- `FROM <image>` - this specifies the base image that the build will extend.
- `WORKDIR <path>` - this instruction specifies the "working directory" or the path in the image where files will be copied and commands will be executed.
- `COPY <host-path> <image-path>` - this instruction tells the builder to copy files from the host and put them into the container image.
- `RUN <command>` - this instruction tells the builder to run the specified command.
- `ENV <name> <value>` - this instruction sets an environment variable that a running container will use.
- `EXPOSE <port-number>` - this instruction sets configuration on the image that indicates a port the image would like to expose.
- `USER <user-or-uid>` - this instruction sets the default user for all subsequent instructions.
- `CMD ["<command>", "<arg1>"]` - this instruction sets the default command a container using this image will run.
@y
- `FROM <image>` - this specifies the base image that the build will extend.
- `WORKDIR <path>` - this instruction specifies the "working directory" or the path in the image where files will be copied and commands will be executed.
- `COPY <host-path> <image-path>` - this instruction tells the builder to copy files from the host and put them into the container image.
- `RUN <command>` - this instruction tells the builder to run the specified command.
- `ENV <name> <value>` - this instruction sets an environment variable that a running container will use.
- `EXPOSE <port-number>` - this instruction sets configuration on the image that indicates a port the image would like to expose.
- `USER <user-or-uid>` - this instruction sets the default user for all subsequent instructions.
- `CMD ["<command>", "<arg1>"]` - this instruction sets the default command a container using this image will run.
@z

@x
To read through all of the instructions or go into greater detail, check out the [Dockerfile reference](https://docs.docker.com/engine/reference/builder/).
@y
To read through all of the instructions or go into greater detail, check out the [Dockerfile reference](https://docs.docker.com/engine/reference/builder/).
@z

@x
## Try it out
@y
## Try it out
@z

@x
Just as you saw with the previous example, a Dockerfile typically follows these steps:
@y
Just as you saw with the previous example, a Dockerfile typically follows these steps:
@z

@x
1. Determine your base image
2. Install application dependencies
3. Copy in any relevant source code and/or binaries
4. Configure the final image
@y
1. Determine your base image
2. Install application dependencies
3. Copy in any relevant source code and/or binaries
4. Configure the final image
@z

@x
In this quick hands-on guide, you'll write a Dockerfile that builds a simple Node.js application. If you're not familiar with JavaScript-based applications, don't worry. It isn't necessary for following along with this guide.
@y
In this quick hands-on guide, you'll write a Dockerfile that builds a simple Node.js application. If you're not familiar with JavaScript-based applications, don't worry. It isn't necessary for following along with this guide.
@z

@x
### Set up
@y
### Set up
@z

@x
[Download this ZIP file](https://github.com/docker/getting-started-todo-app/raw/build-image-from-scratch/app.zip) and extract the contents into a directory on your machine.
@y
[Download this ZIP file](https://github.com/docker/getting-started-todo-app/raw/build-image-from-scratch/app.zip) and extract the contents into a directory on your machine.
@z

@x
### Creating the Dockerfile
@y
### Creating the Dockerfile
@z

@x
Now that you have the project, you’re ready to create the `Dockerfile`.
@y
Now that you have the project, you’re ready to create the `Dockerfile`.
@z

@x
1. [Download and install](https://www.docker.com/products/docker-desktop/) Docker Desktop.
@y
1. [Download and install](https://www.docker.com/products/docker-desktop/) Docker Desktop.
@z

@x
2. Create a file named `Dockerfile` in the same folder as the file `package.json`.
@y
2. Create a file named `Dockerfile` in the same folder as the file `package.json`.
@z

@x
    > **Dockerfile file extensions**
    >
    > It's important to note that the `Dockerfile` has _no_ file extension. Some editors
    > will automatically add an extension to the file (or complain it doesn't have one).
    { .important }
@y
    > **Dockerfile file extensions**
    >
    > It's important to note that the `Dockerfile` has _no_ file extension. Some editors
    > will automatically add an extension to the file (or complain it doesn't have one).
    { .important }
@z

@x
3. In the `Dockerfile`, define your base image by adding the following line:
@y
3. In the `Dockerfile`, define your base image by adding the following line:
@z

% snip code...

@x
4. Now, define the working directory by using the `WORKDIR` instruction. This will specify where future commands will run and the directory files will be copied inside the container image.
@y
4. Now, define the working directory by using the `WORKDIR` instruction. This will specify where future commands will run and the directory files will be copied inside the container image.
@z

% snip code...

@x
5. Copy all of the files from your project on your machine into the container image by using the `COPY` instruction:
@y
5. Copy all of the files from your project on your machine into the container image by using the `COPY` instruction:
@z

% snip code...

@x
6. Install the app's dependencies by using the `yarn` CLI and package manager. To do so, run a command using the `RUN` instruction:
@y
6. Install the app's dependencies by using the `yarn` CLI and package manager. To do so, run a command using the `RUN` instruction:
@z

% snip code...

@x
7. Finally, specify the default command to run by using the `CMD` instruction:
@y
7. Finally, specify the default command to run by using the `CMD` instruction:
@z

% snip code...

@x
    And with that, you should have the following Dockerfile:
@y
    And with that, you should have the following Dockerfile:
@z

% snip code...

@x
> **This Dockerfile isn't production-ready yet**
>
> It's important to note that this Dockerfile is _not_ following all
> of the best practices yet (by design). It will build the app, but the
> builds won't be as fast, or the images as secure, as they could be.
>
> Keep reading to learn more about how to make the image maximize the
> build cache, run as a non-root user, and multi-stage builds.
{ .important }
@y
> **This Dockerfile isn't production-ready yet**
>
> It's important to note that this Dockerfile is _not_ following all
> of the best practices yet (by design). It will build the app, but the
> builds won't be as fast, or the images as secure, as they could be.
>
> Keep reading to learn more about how to make the image maximize the
> build cache, run as a non-root user, and multi-stage builds.
{ .important }
@z

@x
> **Containerize new projects quickly with `docker init`**
>
> The `docker init` command will analyze your project and quickly create 
> a Dockerfile, a `compose.yaml`, and a `.dockerignore`, helping you get
> up and going. Since you're learning about Dockerfiles specifically here, 
> you won't use it now. But, [learn more about it here](/engine/reference/commandline/init/).
{ .tip }
@y
> **Containerize new projects quickly with `docker init`**
>
> The `docker init` command will analyze your project and quickly create 
> a Dockerfile, a `compose.yaml`, and a `.dockerignore`, helping you get
> up and going. Since you're learning about Dockerfiles specifically here, 
> you won't use it now. But, [learn more about it here](__SUBDIR__/engine/reference/commandline/init/).
{ .tip }
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
To learn more about writing a Dockerfile, visit the following resources:
@y
To learn more about writing a Dockerfile, visit the following resources:
@z

@x
* [Dockerfile reference](/reference/dockerfile/)
* [Dockerfile best practices](/develop/develop-images/dockerfile_best-practices/)
* [Base images](/build/building/base-images/)
* [Getting started with Docker Init](/reference/cli/docker/init/)
@y
* [Dockerfile reference](__SUBDIR__/reference/dockerfile/)
* [Dockerfile best practices](__SUBDIR__/develop/develop-images/dockerfile_best-practices/)
* [Base images](__SUBDIR__/build/building/base-images/)
* [Getting started with Docker Init](__SUBDIR__/reference/cli/docker/init/)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Now that you have created a Dockerfile and learned the basics, it's time to learn about building, tagging, and pushing the images.
@y
Now that you have created a Dockerfile and learned the basics, it's time to learn about building, tagging, and pushing the images.
@z

@x
{{< button text="Build, tag and publish the Image" url="build-tag-and-publish-an-image" >}}
@y
{{< button text="Build, tag and publish the Image" url="build-tag-and-publish-an-image" >}}
@z
