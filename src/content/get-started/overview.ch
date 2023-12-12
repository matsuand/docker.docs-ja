%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Get an in-depth overview of the Docker platform including what it can
  be used for, the architecture it employs, and its underlying technology.
keywords: what is a docker, docker daemon, why use docker, docker architecture, what
  to use docker for, docker client, what is docker for, why docker, uses for docker,
  what is docker container used for, what are docker containers used for
title: Docker overview
aliases:
- /introduction/understanding-docker/
- /engine/userguide/basics/
- /engine/introduction/understanding-docker/
- /engine/understanding-docker/
- /engine/docker-overview/
---
@y
---
description: Get an in-depth overview of the Docker platform including what it can
  be used for, the architecture it employs, and its underlying technology.
keywords: what is a docker, docker daemon, why use docker, docker architecture, what
  to use docker for, docker client, what is docker for, why docker, uses for docker,
  what is docker container used for, what are docker containers used for
title: Docker overview
aliases:
- /introduction/understanding-docker/
- /engine/userguide/basics/
- /engine/introduction/understanding-docker/
- /engine/understanding-docker/
- /engine/docker-overview/
---
@z

@x
Docker is an open platform for developing, shipping, and running applications.
Docker enables you to separate your applications from your infrastructure so
you can deliver software quickly. With Docker, you can manage your infrastructure
in the same ways you manage your applications. By taking advantage of Docker's
methodologies for shipping, testing, and deploying code, you can
significantly reduce the delay between writing code and running it in production.
@y
Docker is an open platform for developing, shipping, and running applications.
Docker enables you to separate your applications from your infrastructure so
you can deliver software quickly. With Docker, you can manage your infrastructure
in the same ways you manage your applications. By taking advantage of Docker's
methodologies for shipping, testing, and deploying code, you can
significantly reduce the delay between writing code and running it in production.
@z

@x
## The Docker platform
@y
## The Docker platform
@z

@x
Docker provides the ability to package and run an application in a loosely isolated
environment called a container. The isolation and security lets you run many
containers simultaneously on a given host. Containers are lightweight and contain
everything needed to run the application, so you don't need to rely on what's
installed on the host. You can share containers while you work,
and be sure that everyone you share with gets the same container that works in the
same way.
@y
Docker provides the ability to package and run an application in a loosely isolated
environment called a container. The isolation and security lets you run many
containers simultaneously on a given host. Containers are lightweight and contain
everything needed to run the application, so you don't need to rely on what's
installed on the host. You can share containers while you work,
and be sure that everyone you share with gets the same container that works in the
same way.
@z

@x
Docker provides tooling and a platform to manage the lifecycle of your containers:
@y
Docker provides tooling and a platform to manage the lifecycle of your containers:
@z

@x
* Develop your application and its supporting components using containers.
* The container becomes the unit for distributing and testing your application.
* When you're ready, deploy your application into your production environment,
  as a container or an orchestrated service. This works the same whether your
  production environment is a local data center, a cloud provider, or a hybrid
  of the two.
@y
* Develop your application and its supporting components using containers.
* The container becomes the unit for distributing and testing your application.
* When you're ready, deploy your application into your production environment,
  as a container or an orchestrated service. This works the same whether your
  production environment is a local data center, a cloud provider, or a hybrid
  of the two.
@z

@x
## What can I use Docker for?
@y
## What can I use Docker for?
@z

@x
### Fast, consistent delivery of your applications
@y
### Fast, consistent delivery of your applications
@z

@x
Docker streamlines the development lifecycle by allowing developers to work in
standardized environments using local containers which provide your applications
and services. Containers are great for continuous integration and continuous
delivery (CI/CD) workflows.
@y
Docker streamlines the development lifecycle by allowing developers to work in
standardized environments using local containers which provide your applications
and services. Containers are great for continuous integration and continuous
delivery (CI/CD) workflows.
@z

@x
Consider the following example scenario:
@y
Consider the following example scenario:
@z

@x
- Your developers write code locally and share their work with their colleagues
  using Docker containers.
- They use Docker to push their applications into a test environment and run
  automated and manual tests.
- When developers find bugs, they can fix them in the development environment
  and redeploy them to the test environment for testing and validation.
- When testing is complete, getting the fix to the customer is as simple as
  pushing the updated image to the production environment.
@y
- Your developers write code locally and share their work with their colleagues
  using Docker containers.
- They use Docker to push their applications into a test environment and run
  automated and manual tests.
- When developers find bugs, they can fix them in the development environment
  and redeploy them to the test environment for testing and validation.
- When testing is complete, getting the fix to the customer is as simple as
  pushing the updated image to the production environment.
@z

@x
### Responsive deployment and scaling
@y
### Responsive deployment and scaling
@z

@x
Docker's container-based platform allows for highly portable workloads. Docker
containers can run on a developer's local laptop, on physical or virtual
machines in a data center, on cloud providers, or in a mixture of environments.
@y
Docker's container-based platform allows for highly portable workloads. Docker
containers can run on a developer's local laptop, on physical or virtual
machines in a data center, on cloud providers, or in a mixture of environments.
@z

@x
Docker's portability and lightweight nature also make it easy to dynamically
manage workloads, scaling up or tearing down applications and services as
business needs dictate, in near real time.
@y
Docker's portability and lightweight nature also make it easy to dynamically
manage workloads, scaling up or tearing down applications and services as
business needs dictate, in near real time.
@z

@x
### Running more workloads on the same hardware
@y
### Running more workloads on the same hardware
@z

@x
Docker is lightweight and fast. It provides a viable, cost-effective alternative
to hypervisor-based virtual machines, so you can use more of your server
capacity to achieve your business goals. Docker is perfect for high density
environments and for small and medium deployments where you need to do more with
fewer resources.
@y
Docker is lightweight and fast. It provides a viable, cost-effective alternative
to hypervisor-based virtual machines, so you can use more of your server
capacity to achieve your business goals. Docker is perfect for high density
environments and for small and medium deployments where you need to do more with
fewer resources.
@z

@x
## Docker architecture
@y
## Docker architecture
@z

@x
Docker uses a client-server architecture. The Docker client talks to the
Docker daemon, which does the heavy lifting of building, running, and
distributing your Docker containers. The Docker client and daemon can
run on the same system, or you can connect a Docker client to a remote Docker
daemon. The Docker client and daemon communicate using a REST API, over UNIX
sockets or a network interface. Another Docker client is Docker Compose,
that lets you work with applications consisting of a set of containers.
@y
Docker uses a client-server architecture. The Docker client talks to the
Docker daemon, which does the heavy lifting of building, running, and
distributing your Docker containers. The Docker client and daemon can
run on the same system, or you can connect a Docker client to a remote Docker
daemon. The Docker client and daemon communicate using a REST API, over UNIX
sockets or a network interface. Another Docker client is Docker Compose,
that lets you work with applications consisting of a set of containers.
@z

@x
![Docker Architecture diagram](images/docker-architecture.webp)
@y
![Docker Architecture diagram](images/docker-architecture.webp)
@z

@x
### The Docker daemon
@y
### The Docker daemon
@z

@x
The Docker daemon (`dockerd`) listens for Docker API requests and manages Docker
objects such as images, containers, networks, and volumes. A daemon can also
communicate with other daemons to manage Docker services.
@y
The Docker daemon (`dockerd`) listens for Docker API requests and manages Docker
objects such as images, containers, networks, and volumes. A daemon can also
communicate with other daemons to manage Docker services.
@z

@x
### The Docker client
@y
### The Docker client
@z

@x
The Docker client (`docker`) is the primary way that many Docker users interact
with Docker. When you use commands such as `docker run`, the client sends these
commands to `dockerd`, which carries them out. The `docker` command uses the
Docker API. The Docker client can communicate with more than one daemon.
@y
The Docker client (`docker`) is the primary way that many Docker users interact
with Docker. When you use commands such as `docker run`, the client sends these
commands to `dockerd`, which carries them out. The `docker` command uses the
Docker API. The Docker client can communicate with more than one daemon.
@z

@x
### Docker Desktop
@y
### Docker Desktop
@z

@x
Docker Desktop is an easy-to-install application for your Mac, Windows or Linux environment that enables you to build and share containerized applications and microservices. Docker Desktop includes the Docker daemon (`dockerd`), the Docker client (`docker`), Docker Compose, Docker Content Trust, Kubernetes, and Credential Helper. For more information, see [Docker Desktop](../desktop/index.md).
@y
Docker Desktop is an easy-to-install application for your Mac, Windows or Linux environment that enables you to build and share containerized applications and microservices. Docker Desktop includes the Docker daemon (`dockerd`), the Docker client (`docker`), Docker Compose, Docker Content Trust, Kubernetes, and Credential Helper. For more information, see [Docker Desktop](../desktop/index.md).
@z

@x
### Docker registries
@y
### Docker registries
@z

@x
A Docker registry stores Docker images. Docker Hub is a public
registry that anyone can use, and Docker looks for images on
Docker Hub by default. You can even run your own private registry.
@y
A Docker registry stores Docker images. Docker Hub is a public
registry that anyone can use, and Docker looks for images on
Docker Hub by default. You can even run your own private registry.
@z

@x
When you use the `docker pull` or `docker run` commands, Docker pulls the required images from your configured registry. When you use the `docker push` command, Docker pushes
your image to your configured registry.
@y
When you use the `docker pull` or `docker run` commands, Docker pulls the required images from your configured registry. When you use the `docker push` command, Docker pushes
your image to your configured registry.
@z

@x
### Docker objects
@y
### Docker objects
@z

@x
When you use Docker, you are creating and using images, containers, networks,
volumes, plugins, and other objects. This section is a brief overview of some
of those objects.
@y
When you use Docker, you are creating and using images, containers, networks,
volumes, plugins, and other objects. This section is a brief overview of some
of those objects.
@z

@x
#### Images
@y
#### Images
@z

@x
An image is a read-only template with instructions for creating a Docker
container. Often, an image is based on another image, with some additional
customization. For example, you may build an image which is based on the `ubuntu`
image, but installs the Apache web server and your application, as well as the
configuration details needed to make your application run.
@y
An image is a read-only template with instructions for creating a Docker
container. Often, an image is based on another image, with some additional
customization. For example, you may build an image which is based on the `ubuntu`
image, but installs the Apache web server and your application, as well as the
configuration details needed to make your application run.
@z

@x
You might create your own images or you might only use those created by others
and published in a registry. To build your own image, you create a Dockerfile
with a simple syntax for defining the steps needed to create the image and run
it. Each instruction in a Dockerfile creates a layer in the image. When you
change the Dockerfile and rebuild the image, only those layers which have
changed are rebuilt. This is part of what makes images so lightweight, small,
and fast, when compared to other virtualization technologies.
@y
You might create your own images or you might only use those created by others
and published in a registry. To build your own image, you create a Dockerfile
with a simple syntax for defining the steps needed to create the image and run
it. Each instruction in a Dockerfile creates a layer in the image. When you
change the Dockerfile and rebuild the image, only those layers which have
changed are rebuilt. This is part of what makes images so lightweight, small,
and fast, when compared to other virtualization technologies.
@z

@x
#### Containers
@y
#### Containers
@z

@x
A container is a runnable instance of an image. You can create, start, stop,
move, or delete a container using the Docker API or CLI. You can connect a
container to one or more networks, attach storage to it, or even create a new
image based on its current state.
@y
A container is a runnable instance of an image. You can create, start, stop,
move, or delete a container using the Docker API or CLI. You can connect a
container to one or more networks, attach storage to it, or even create a new
image based on its current state.
@z

@x
By default, a container is relatively well isolated from other containers and
its host machine. You can control how isolated a container's network, storage,
or other underlying subsystems are from other containers or from the host
machine.
@y
By default, a container is relatively well isolated from other containers and
its host machine. You can control how isolated a container's network, storage,
or other underlying subsystems are from other containers or from the host
machine.
@z

@x
A container is defined by its image as well as any configuration options you
provide to it when you create or start it. When a container is removed, any changes to
its state that aren't stored in persistent storage disappear.
@y
A container is defined by its image as well as any configuration options you
provide to it when you create or start it. When a container is removed, any changes to
its state that aren't stored in persistent storage disappear.
@z

@x
##### Example `docker run` command
@y
##### Example `docker run` command
@z

@x
The following command runs an `ubuntu` container, attaches interactively to your
local command-line session, and runs `/bin/bash`.
@y
The following command runs an `ubuntu` container, attaches interactively to your
local command-line session, and runs `/bin/bash`.
@z

@x
```console
$ docker run -i -t ubuntu /bin/bash
```
@y
```console
$ docker run -i -t ubuntu /bin/bash
```
@z

@x
When you run this command, the following happens (assuming you are using
the default registry configuration):
@y
When you run this command, the following happens (assuming you are using
the default registry configuration):
@z

@x
1.  If you don't have the `ubuntu` image locally, Docker pulls it from your
    configured registry, as though you had run `docker pull ubuntu` manually.
@y
1.  If you don't have the `ubuntu` image locally, Docker pulls it from your
    configured registry, as though you had run `docker pull ubuntu` manually.
@z

@x
2.  Docker creates a new container, as though you had run a `docker container create`
    command manually.
@y
2.  Docker creates a new container, as though you had run a `docker container create`
    command manually.
@z

@x
3.  Docker allocates a read-write filesystem to the container, as its final
    layer. This allows a running container to create or modify files and
    directories in its local filesystem.
@y
3.  Docker allocates a read-write filesystem to the container, as its final
    layer. This allows a running container to create or modify files and
    directories in its local filesystem.
@z

@x
4.  Docker creates a network interface to connect the container to the default
    network, since you didn't specify any networking options. This includes
    assigning an IP address to the container. By default, containers can
    connect to external networks using the host machine's network connection.
@y
4.  Docker creates a network interface to connect the container to the default
    network, since you didn't specify any networking options. This includes
    assigning an IP address to the container. By default, containers can
    connect to external networks using the host machine's network connection.
@z

@x
5.  Docker starts the container and executes `/bin/bash`. Because the container
    is running interactively and attached to your terminal (due to the `-i` and `-t`
    flags), you can provide input using your keyboard while Docker logs the output to
    your terminal.
@y
5.  Docker starts the container and executes `/bin/bash`. Because the container
    is running interactively and attached to your terminal (due to the `-i` and `-t`
    flags), you can provide input using your keyboard while Docker logs the output to
    your terminal.
@z

@x
6.  When you run `exit` to terminate the `/bin/bash` command, the container
    stops but isn't removed. You can start it again or remove it.
@y
6.  When you run `exit` to terminate the `/bin/bash` command, the container
    stops but isn't removed. You can start it again or remove it.
@z

@x
## The underlying technology
Docker is written in the [Go programming language](https://golang.org/) and takes
advantage of several features of the Linux kernel to deliver its functionality.
Docker uses a technology called `namespaces` to provide the isolated workspace
called the container. When you run a container, Docker creates a set of
namespaces for that container.
@y
## The underlying technology
Docker is written in the [Go programming language](https://golang.org/) and takes
advantage of several features of the Linux kernel to deliver its functionality.
Docker uses a technology called `namespaces` to provide the isolated workspace
called the container. When you run a container, Docker creates a set of
namespaces for that container.
@z

@x
These namespaces provide a layer of isolation. Each aspect of a container runs
in a separate namespace and its access is limited to that namespace.
@y
These namespaces provide a layer of isolation. Each aspect of a container runs
in a separate namespace and its access is limited to that namespace.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Install Docker](../get-docker.md)
- [Get started with Docker](index.md)
@y
- [Install Docker](../get-docker.md)
- [Get started with Docker](index.md)
@z
