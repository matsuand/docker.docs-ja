%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Dev Environments
keywords: Dev Environments, share, local, Compose
title: Overview of Dev Environments
@y
description: Dev Environments
keywords: Dev Environments, share, local, Compose
title: Overview of Dev Environments
@z

@x
{{< include "dev-envs-changing.md" >}}
@y
{{< include "dev-envs-changing.md" >}}
@z

@x
{{% experimental title="Beta" %}}
The Dev Environments feature is currently in [Beta](../../release-lifecycle.md#beta). 
{{% /experimental %}}
@y
{{% experimental title="Beta" %}}
The Dev Environments feature is currently in [Beta](../../release-lifecycle.md#beta). 
{{% /experimental %}}
@z

@x
Dev Environments let you create a configurable developer environment with all the code and tools you need to quickly get up and running. 
@y
Dev Environments let you create a configurable developer environment with all the code and tools you need to quickly get up and running. 
@z

@x
It uses tools built into code editors that allows Docker to access code mounted into a container rather than on your local host. This isolates the tools, files and running services on your machine allowing multiple versions of them to exist side by side.
@y
It uses tools built into code editors that allows Docker to access code mounted into a container rather than on your local host. This isolates the tools, files and running services on your machine allowing multiple versions of them to exist side by side.
@z

@x
You can use Dev Environments through the intuitive GUI in Docker Dashboard or straight from your terminal with the new [`docker dev` CLI plugin](dev-cli.md).
@y
You can use Dev Environments through the intuitive GUI in Docker Dashboard or straight from your terminal with the new [`docker dev` CLI plugin](dev-cli.md).
@z

@x
## Use Dev Environments
@y
## Use Dev Environments
@z

@x
To use Dev Environments: 
1. Navigate to the **Features in Development** tab in **Settings**. 
2. On the **Beta** tab, select **Turn on Dev Environments**. 
3. Select **Apply & restart**. 
@y
To use Dev Environments: 
1. Navigate to the **Features in Development** tab in **Settings**. 
2. On the **Beta** tab, select **Turn on Dev Environments**. 
3. Select **Apply & restart**. 
@z

@x
The Dev Environments tab is now visible in Docker Dashboard. 
@y
The Dev Environments tab is now visible in Docker Dashboard. 
@z

@x
## How does it work?
@y
## How does it work?
@z

@x
>**Changes to Dev Environments with Docker Desktop 4.13**
>
>Docker has simplified how you configure your dev environment project. All you need to get started is a `compose-dev.yaml` file. If you have an existing project with a `.docker/` folder this is automatically migrated the next time you launch.
@y
>**Changes to Dev Environments with Docker Desktop 4.13**
>
>Docker has simplified how you configure your dev environment project. All you need to get started is a `compose-dev.yaml` file. If you have an existing project with a `.docker/` folder this is automatically migrated the next time you launch.
@z

@x
Dev Environments is powered by [Docker Compose](/compose/). This allows Dev Environments to take advantage of all the benefits and features of Compose whilst adding an intuitive GUI where you can launch environments with the click of a button.
@y
Dev Environments is powered by [Docker Compose](__SUBDIR__/compose/). This allows Dev Environments to take advantage of all the benefits and features of Compose whilst adding an intuitive GUI where you can launch environments with the click of a button.
@z

@x
Every dev environment you want to run needs a `compose-dev.yaml` file which configures your application's services and lives in your project directory. You don't need to be an expert in Docker Compose or write a `compose-dev.yaml` file from scratch as Dev Environments creates a starter `compose-dev.yaml` files based on the main language in your project. 
@y
Every dev environment you want to run needs a `compose-dev.yaml` file which configures your application's services and lives in your project directory. You don't need to be an expert in Docker Compose or write a `compose-dev.yaml` file from scratch as Dev Environments creates a starter `compose-dev.yaml` files based on the main language in your project. 
@z

@x
You can also use the many [sample dev environments](https://github.com/docker/awesome-compose) as a starting point for how to integrate different services. Alternatively, see [Set up a dev environment](set-up.md) for more information. 
@y
You can also use the many [sample dev environments](https://github.com/docker/awesome-compose) as a starting point for how to integrate different services. Alternatively, see [Set up a dev environment](set-up.md) for more information. 
@z

@x
## What's next?
@y
## What's next?
@z

@x
Learn how to:
- [Launch a dev environment](create-dev-env.md)
- [Set up a dev environment](set-up.md)
- [Distribute your dev environment](share.md)
@y
Learn how to:
- [Launch a dev environment](create-dev-env.md)
- [Set up a dev environment](set-up.md)
- [Distribute your dev environment](share.md)
@z
