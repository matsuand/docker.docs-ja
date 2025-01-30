%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: How to deploy a stack to a swarm
keywords: guide, swarm mode, composefile, stack, compose, deploy
title: Deploy a stack to a swarm
@y
description: How to deploy a stack to a swarm
keywords: guide, swarm mode, composefile, stack, compose, deploy
title: Deploy a stack to a swarm
@z

@x
When running Docker Engine in swarm mode, you can use `docker stack deploy` to
deploy a complete application stack to the swarm. The `deploy` command accepts
a stack description in the form of a [Compose file](/reference/compose-file/legacy-versions.md).
@y
When running Docker Engine in swarm mode, you can use `docker stack deploy` to
deploy a complete application stack to the swarm. The `deploy` command accepts
a stack description in the form of a [Compose file](reference/compose-file/legacy-versions.md).
@z

@x
{{% include "swarm-compose-compat.md" %}}
@y
{{% include "swarm-compose-compat.md" %}}
@z

@x
To run through this tutorial, you need:
@y
To run through this tutorial, you need:
@z

@x
1.  A Docker Engine running in [Swarm mode](swarm-mode.md).
    If you're not familiar with Swarm mode, you might want to read
    [Swarm mode key concepts](key-concepts.md)
    and [How services work](how-swarm-mode-works/services.md).
@y
1.  A Docker Engine running in [Swarm mode](swarm-mode.md).
    If you're not familiar with Swarm mode, you might want to read
    [Swarm mode key concepts](key-concepts.md)
    and [How services work](how-swarm-mode-works/services.md).
@z

@x
    > [!NOTE]
    >
    > If you're trying things out on a local development environment,
    > you can put your engine into Swarm mode with `docker swarm init`.
    >
    > If you've already got a multi-node swarm running, keep in mind that all
    > `docker stack` and `docker service` commands must be run from a manager
    > node.
@y
    > [!NOTE]
    >
    > If you're trying things out on a local development environment,
    > you can put your engine into Swarm mode with `docker swarm init`.
    >
    > If you've already got a multi-node swarm running, keep in mind that all
    > `docker stack` and `docker service` commands must be run from a manager
    > node.
@z

@x
2.  A current version of [Docker Compose](/manuals/compose/install/_index.md).
@y
2.  A current version of [Docker Compose](manuals/compose/install/_index.md).
@z

@x
## Set up a Docker registry
@y
## Set up a Docker registry
@z

@x
Because a swarm consists of multiple Docker Engines, a registry is required to
distribute images to all of them. You can use the
[Docker Hub](https://hub.docker.com) or maintain your own. Here's how to create
a throwaway registry, which you can discard afterward.
@y
Because a swarm consists of multiple Docker Engines, a registry is required to
distribute images to all of them. You can use the
[Docker Hub](https://hub.docker.com) or maintain your own. Here's how to create
a throwaway registry, which you can discard afterward.
@z

@x
1.  Start the registry as a service on your swarm:
@y
1.  Start the registry as a service on your swarm:
@z

% snip command...

@x
2.  Check its status with `docker service ls`:
@y
2.  Check its status with `docker service ls`:
@z

% snip command...

@x
    Once it reads `1/1` under `REPLICAS`, it's running. If it reads `0/1`, it's
    probably still pulling the image.
@y
    Once it reads `1/1` under `REPLICAS`, it's running. If it reads `0/1`, it's
    probably still pulling the image.
@z

@x
3.  Check that it's working with `curl`:
@y
3.  Check that it's working with `curl`:
@z

% snip command...

@x
## Create the example application
@y
## Create the example application
@z

@x
The app used in this guide is based on the hit counter app in the
[Get started with Docker Compose](/manuals/compose/gettingstarted.md) guide. It consists
of a Python app which maintains a counter in a Redis instance and increments the
counter whenever you visit it.
@y
The app used in this guide is based on the hit counter app in the
[Get started with Docker Compose](manuals/compose/gettingstarted.md) guide. It consists
of a Python app which maintains a counter in a Redis instance and increments the
counter whenever you visit it.
@z

@x
1.  Create a directory for the project:
@y
1.  Create a directory for the project:
@z

% snip command...

@x
2.  Create a file called `app.py` in the project directory and paste this in:
@y
2.  Create a file called `app.py` in the project directory and paste this in:
@z

% snip code...

@x
3.  Create a file called `requirements.txt` and paste these two lines in:
@y
3.  Create a file called `requirements.txt` and paste these two lines in:
@z

% snip code...

@x
4.  Create a file called `Dockerfile` and paste this in:
@y
4.  Create a file called `Dockerfile` and paste this in:
@z

% snip code...

@x
5.  Create a file called `compose.yml` and paste this in:
@y
5.  Create a file called `compose.yml` and paste this in:
@z

% snip code...

@x
    The image for the web app is built using the Dockerfile defined
    above. It's also tagged with `127.0.0.1:5000` - the address of the registry
    created earlier. This is important when distributing the app to the
    swarm.
@y
    The image for the web app is built using the Dockerfile defined
    above. It's also tagged with `127.0.0.1:5000` - the address of the registry
    created earlier. This is important when distributing the app to the
    swarm.
@z

@x
## Test the app with Compose
@y
## Test the app with Compose
@z

@x
1.  Start the app with `docker compose up`. This builds the web app image,
    pulls the Redis image if you don't already have it, and creates two
    containers.
@y
1.  Start the app with `docker compose up`. This builds the web app image,
    pulls the Redis image if you don't already have it, and creates two
    containers.
@z

@x
    You see a warning about the Engine being in swarm mode. This is because
    Compose doesn't take advantage of swarm mode, and deploys everything to a
    single node. You can safely ignore this.
@y
    You see a warning about the Engine being in swarm mode. This is because
    Compose doesn't take advantage of swarm mode, and deploys everything to a
    single node. You can safely ignore this.
@z

% snip command...

@x
2.  Check that the app is running with `docker compose ps`:
@y
2.  Check that the app is running with `docker compose ps`:
@z

% snip command...

@x
    You can test the app with `curl`:
@y
    You can test the app with `curl`:
@z

% snip command...

@x
3.  Bring the app down:
@y
3.  Bring the app down:
@z

% snip command...

@x
## Push the generated image to the registry
@y
## Push the generated image to the registry
@z

@x
To distribute the web app's image across the swarm, it needs to be pushed to the
registry you set up earlier. With Compose, this is very simple:
@y
To distribute the web app's image across the swarm, it needs to be pushed to the
registry you set up earlier. With Compose, this is very simple:
@z

% snip command...

@x
The stack is now ready to be deployed.
@y
The stack is now ready to be deployed.
@z

@x
## Deploy the stack to the swarm
@y
## Deploy the stack to the swarm
@z

@x
1.  Create the stack with `docker stack deploy`:
@y
1.  Create the stack with `docker stack deploy`:
@z

% snip command...

@x
    The last argument is a name for the stack. Each network, volume and service
    name is prefixed with the stack name.
@y
    The last argument is a name for the stack. Each network, volume and service
    name is prefixed with the stack name.
@z

@x
2.  Check that it's running with `docker stack services stackdemo`:
@y
2.  Check that it's running with `docker stack services stackdemo`:
@z

% snip command...

@x
    Once it's running, you should see `1/1` under `REPLICAS` for both services.
    This might take some time if you have a multi-node swarm, as images need to
    be pulled.
@y
    Once it's running, you should see `1/1` under `REPLICAS` for both services.
    This might take some time if you have a multi-node swarm, as images need to
    be pulled.
@z

@x
    As before, you can test the app with `curl`:
@y
    As before, you can test the app with `curl`:
@z

% snip command...

@x
    With Docker's built-in routing mesh, you can access any node in the
    swarm on port `8000` and get routed to the app:
@y
    With Docker's built-in routing mesh, you can access any node in the
    swarm on port `8000` and get routed to the app:
@z

% snip command...

@x
3.  Bring the stack down with `docker stack rm`:
@y
3.  Bring the stack down with `docker stack rm`:
@z

% snip command...

@x
4.  Bring the registry down with `docker service rm`:
@y
4.  Bring the registry down with `docker service rm`:
@z

% snip command...

@x
5.  If you're just testing things out on a local machine and want to bring your
    Docker Engine out of Swarm mode, use `docker swarm leave`:
@y
5.  If you're just testing things out on a local machine and want to bring your
    Docker Engine out of Swarm mode, use `docker swarm leave`:
@z

% snip command...
