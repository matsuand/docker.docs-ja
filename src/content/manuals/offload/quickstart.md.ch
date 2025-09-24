%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Offload quickstart
linktitle: Quickstart
weight: 10
description: Learn how to use Docker Offload to build and run your container images faster, both locally and in CI.
keywords: cloud, quickstart, cloud mode, Docker Desktop, GPU support, cloud builder, usage
---
@y
---
title: Docker Offload quickstart
linktitle: Quickstart
weight: 10
description: Learn how to use Docker Offload to build and run your container images faster, both locally and in CI.
keywords: cloud, quickstart, cloud mode, Docker Desktop, GPU support, cloud builder, usage
---
@z

@x
{{< summary-bar feature_name="Docker Offload" >}}
@y
{{< summary-bar feature_name="Docker Offload" >}}
@z

@x
This quickstart helps you get started with Docker Offload. Docker Offload lets
you build and run container images faster by offloading resource-intensive tasks
to the cloud. It provides a cloud-based environment that mirrors your local
Docker Desktop experience.
@y
This quickstart helps you get started with Docker Offload. Docker Offload lets
you build and run container images faster by offloading resource-intensive tasks
to the cloud. It provides a cloud-based environment that mirrors your local
Docker Desktop experience.
@z

@x
## Step 1: Sign up and subscribe to Docker Offload for access
@y
## Step 1: Sign up and subscribe to Docker Offload for access
@z

@x
To access Docker Offload, you must [sign
up](https://www.docker.com/products/docker-offload/) and subscribe.
@y
To access Docker Offload, you must [sign
up](https://www.docker.com/products/docker-offload/) and subscribe.
@z

@x
## Step 2: Start Docker Offload
@y
## Step 2: Start Docker Offload
@z

@x
> [!NOTE]
>
> After subscribing to Docker Offload, the first time you start Docker Desktop
> and sign in, you may be prompted to start Docker Offload. If you start Docker
> Offload via this prompt, you can skip the following steps. Note that you can
> use the following steps to start Docker Offload at any time.
@y
> [!NOTE]
>
> After subscribing to Docker Offload, the first time you start Docker Desktop
> and sign in, you may be prompted to start Docker Offload. If you start Docker
> Offload via this prompt, you can skip the following steps. Note that you can
> use the following steps to start Docker Offload at any time.
@z

@x
1. Start Docker Desktop and sign in.
2. Open a terminal and run the following command to start Docker Offload:
@y
1. Start Docker Desktop and sign in.
2. Open a terminal and run the following command to start Docker Offload:
@z

@x
   ```console
   $ docker offload start
   ```
@y
   ```console
   $ docker offload start
   ```
@z

@x
3. When prompted, select your account to use for Docker Offload. This account
   will consume credits for your Docker Offload usage.
@y
3. When prompted, select your account to use for Docker Offload. This account
   will consume credits for your Docker Offload usage.
@z

@x
4. When prompted, select whether to enable GPU support. If you choose to enable
   GPU support, Docker Offload will run in an instance with an NVIDIA L4 GPU,
   which is useful for machine learning or compute-intensive workloads.
@y
4. When prompted, select whether to enable GPU support. If you choose to enable
   GPU support, Docker Offload will run in an instance with an NVIDIA L4 GPU,
   which is useful for machine learning or compute-intensive workloads.
@z

@x
   > [!NOTE]
   >
   > Enabling GPU support consumes more budget. For more details, see [Docker
   > Offload usage](/offload/usage/).
@y
   > [!NOTE]
   >
   > Enabling GPU support consumes more budget. For more details, see [Docker
   > Offload usage](/offload/usage/).
@z

@x
When Docker Offload is started, you'll see a cloud icon ({{< inline-image
src="./images/cloud-mode.png" alt="Offload mode icon" >}})
in the Docker Desktop Dashboard header, and the Docker Desktop Dashboard appears purple.
You can run `docker offload status` in a terminal to check the status of
Docker Offload.
@y
When Docker Offload is started, you'll see a cloud icon ({{< inline-image
src="./images/cloud-mode.png" alt="Offload mode icon" >}})
in the Docker Desktop Dashboard header, and the Docker Desktop Dashboard appears purple.
You can run `docker offload status` in a terminal to check the status of
Docker Offload.
@z

@x
## Step 3: Run a container with Docker Offload
@y
## Step 3: Run a container with Docker Offload
@z

@x
After starting Docker Offload, Docker Desktop connects to a secure cloud environment
that mirrors your local experience. When you run builds or containers, they
execute remotely, but behave just like local ones.
@y
After starting Docker Offload, Docker Desktop connects to a secure cloud environment
that mirrors your local experience. When you run builds or containers, they
execute remotely, but behave just like local ones.
@z

@x
To verify that Docker Offload is working, run a container:
@y
To verify that Docker Offload is working, run a container:
@z

@x
```console
$ docker run --rm hello-world
```
@y
```console
$ docker run --rm hello-world
```
@z

@x
If you enabled GPU support, you can also run a GPU-enabled container:
@y
If you enabled GPU support, you can also run a GPU-enabled container:
@z

@x
```console
$ docker run --rm --gpus all hello-world
```
@y
```console
$ docker run --rm --gpus all hello-world
```
@z

@x
If Docker Offload is working, you'll see `Hello from Docker!` in the terminal output.
@y
If Docker Offload is working, you'll see `Hello from Docker!` in the terminal output.
@z

@x
## Step 4: Stop Docker Offload
@y
## Step 4: Stop Docker Offload
@z

@x
When you're done using Docker Offload, you can stop it. When stopped, you build
images and run containers locally.
@y
When you're done using Docker Offload, you can stop it. When stopped, you build
images and run containers locally.
@z

@x
```console
$ docker offload stop
```
@y
```console
$ docker offload stop
```
@z

@x
To start Docker Offload again, run the `docker offload start` command.
@y
To start Docker Offload again, run the `docker offload start` command.
@z

@x
## What's next
@y
## What's next
@z

@x
- [Configure Docker Offload](configuration.md).
- Try [Docker Model Runner](../ai/model-runner/_index.md) or
  [Compose](../ai/compose/models-and-compose.md) to run AI models using Docker Offload.
@y
- [Configure Docker Offload](configuration.md).
- Try [Docker Model Runner](../ai/model-runner/_index.md) or
  [Compose](../ai/compose/models-and-compose.md) to run AI models using Docker Offload.
@z
