%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Offload quickstart
linktitle: Quickstart
@y
title: Docker Offload quickstart
linktitle: Quickstart
@z

@x
description: Learn how to use Docker Offload to build and run your container images in the cloud.
keywords: cloud, quickstart, Docker Desktop, offload
@y
description: Learn how to use Docker Offload to build and run your container images in the cloud.
keywords: cloud, quickstart, Docker Desktop, offload
@z

@x
{{< summary-bar feature_name="Docker Offload" >}}
@y
{{< summary-bar feature_name="Docker Offload" >}}
@z

@x
[Docker Offload](./about.md) lets you build and run containers in the cloud
while using your local Docker Desktop tools and workflow. This means faster
builds, access to powerful cloud resources, and a seamless development
experience.
@y
[Docker Offload](./about.md) lets you build and run containers in the cloud
while using your local Docker Desktop tools and workflow. This means faster
builds, access to powerful cloud resources, and a seamless development
experience.
@z

@x
This quickstart covers the steps developers need to get started with Docker Offload.
@y
This quickstart covers the steps developers need to get started with Docker Offload.
@z

@x
> [!NOTE]
>
> If you're an organization owner, to get started you must [contact
> sales](https://www.docker.com/pricing/contact-sales/) and subscribe your
> organization to use Docker Offload. After subscribing, see [Manage Docker
> products](../admin/organization/manage-products.md) to learn how to manage
> access for the developers in your organization.
@y
> [!NOTE]
>
> If you're an organization owner, to get started you must [contact
> sales](https://www.docker.com/pricing/contact-sales/) and subscribe your
> organization to use Docker Offload. After subscribing, see [Manage Docker
> products](../admin/organization/manage-products.md) to learn how to manage
> access for the developers in your organization.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- You must have [Docker Desktop](/desktop/) installed. Docker recommends using
  the latest version of Docker Desktop to access the newest features and
  improvements in Docker Offload.
- You must have a Docker Business subscription and a Docker Offload subscription.
@y
- You must have [Docker Desktop](__SUBDIR__/desktop/) installed. Docker recommends using
  the latest version of Docker Desktop to access the newest features and
  improvements in Docker Offload.
- You must have a Docker Business subscription and a Docker Offload subscription.
@z

@x
## Step 1: Verify access to Docker Offload
@y
## Step 1: Verify access to Docker Offload
@z

@x
To access Docker Offload, you must be part of an organization that has
subscribed to Docker Offload. As a developer, you can verify this by checking if
the Docker Offload toggle appears in the Docker Desktop Dashboard header.
@y
To access Docker Offload, you must be part of an organization that has
subscribed to Docker Offload. As a developer, you can verify this by checking if
the Docker Offload toggle appears in the Docker Desktop Dashboard header.
@z

@x
1. Start Docker Desktop and sign in.
2. In the Docker Desktop Dashboard header, look for the Docker Offload toggle.
@y
1. Start Docker Desktop and sign in.
2. In the Docker Desktop Dashboard header, look for the Docker Offload toggle.
@z

@x
![Offload toggle](./images/offload-toggle.png)
@y
![Offload toggle](./images/offload-toggle.png)
@z

@x
If you see the Docker Offload toggle, you have access to Docker Offload and can
proceed to the next step. If you don't see the Docker Offload toggle, check if
Docker Offload is disabled in your [Docker Desktop
settings](./configuration.md), and then contact your administrator to verify
that your organization has subscribed to Docker Offload and that they have
enabled access for your organization.
@y
If you see the Docker Offload toggle, you have access to Docker Offload and can
proceed to the next step. If you don't see the Docker Offload toggle, check if
Docker Offload is disabled in your [Docker Desktop
settings](./configuration.md), and then contact your administrator to verify
that your organization has subscribed to Docker Offload and that they have
enabled access for your organization.
@z

@x
## Step 2: Start Docker Offload
@y
## Step 2: Start Docker Offload
@z

@x
You can start Docker Offload from the CLI or in the header of the Docker Desktop
Dashboard. The following steps describe how to start Docker Offload using the
CLI.
@y
You can start Docker Offload from the CLI or in the header of the Docker Desktop
Dashboard. The following steps describe how to start Docker Offload using the
CLI.
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
   > [!TIP]
   >
   > To learn more about the Docker Offload CLI commands, see the [Docker Offload CLI
   > reference](/reference/cli/docker/offload/).
@y
   > [!TIP]
   >
   > To learn more about the Docker Offload CLI commands, see the [Docker Offload CLI
   > reference](__SUBDIR__/reference/cli/docker/offload/).
@z

@x
3. If you are a member of multiple organizations that have access to Docker
   Offload, you have the option to select a profile. Your usage will be
   associated with the organization of the selected profile.
@y
3. If you are a member of multiple organizations that have access to Docker
   Offload, you have the option to select a profile. Your usage will be
   associated with the organization of the selected profile.
@z

@x
When Docker Offload is started, you'll see a cloud icon ({{< inline-image
src="./images/cloud-mode.png" alt="Offload mode icon" >}}) in the Docker Desktop
Dashboard header, and the Docker Desktop Dashboard appears purple. You can run
`docker offload status` in a terminal to check the status of Docker Offload.
@y
When Docker Offload is started, you'll see a cloud icon ({{< inline-image
src="./images/cloud-mode.png" alt="Offload mode icon" >}}) in the Docker Desktop
Dashboard header, and the Docker Desktop Dashboard appears purple. You can run
`docker offload status` in a terminal to check the status of Docker Offload.
@z

@x
## Step 3: Run a container with Docker Offload
@y
## Step 3: Run a container with Docker Offload
@z

@x
After starting Docker Offload, Docker Desktop connects to a secure cloud
environment that mirrors your local experience. When you run builds or
containers, they execute remotely, but behave just like local ones.
@y
After starting Docker Offload, Docker Desktop connects to a secure cloud
environment that mirrors your local experience. When you run builds or
containers, they execute remotely, but behave just like local ones.
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
If Docker Offload is working, you'll see `Hello from Docker!` in the terminal output.
@y
If Docker Offload is working, you'll see `Hello from Docker!` in the terminal output.
@z

@x
## Step 4: Monitor your Offload session
@y
## Step 4: Monitor your Offload session
@z

@x
When Docker Offload is started and you have started session (for example, you've
ran a container), then you can see current session duration estimate in the
Docker Desktop Dashboard footer next to the hourglass icon ({{< inline-image
src="./images/hourglass-icon.png" alt="Offload session duration" >}}).
@y
When Docker Offload is started and you have started session (for example, you've
ran a container), then you can see current session duration estimate in the
Docker Desktop Dashboard footer next to the hourglass icon ({{< inline-image
src="./images/hourglass-icon.png" alt="Offload session duration" >}}).
@z

@x
Also, when Docker Offload is started, you can view detailed session information
by selecting **Docker Offload** > **Insights** in the left navigation of the
Docker Desktop Dashboard.
@y
Also, when Docker Offload is started, you can view detailed session information
by selecting **Docker Offload** > **Insights** in the left navigation of the
Docker Desktop Dashboard.
@z

@x
## Step 5: Stop Docker Offload
@y
## Step 5: Stop Docker Offload
@z

@x
Docker Offload automatically
[idles](./about.md#session-management-and-idle-state) if you do not respond to
periodic prompts that appear in the Docker Desktop Dashboard. You can stop your
Docker Offload session at any time. To stop Docker Offload:
@y
Docker Offload automatically
[idles](./about.md#session-management-and-idle-state) if you do not respond to
periodic prompts that appear in the Docker Desktop Dashboard. You can stop your
Docker Offload session at any time. To stop Docker Offload:
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
When you stop Docker Offload, the cloud environment is terminated and all
running containers and images are removed. When Docker Offload has been idle for
5 minutes, the environment is also terminated and all running containers and
images are removed.
@y
When you stop Docker Offload, the cloud environment is terminated and all
running containers and images are removed. When Docker Offload has been idle for
5 minutes, the environment is also terminated and all running containers and
images are removed.
@z

@x
To start Docker Offload again, run the `docker offload start` command.
@y
To start Docker Offload again, run the `docker offload start` command.
@z
