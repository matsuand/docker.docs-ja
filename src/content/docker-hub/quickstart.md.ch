%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to get started using Docker Hub
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, accounts,
  organizations, repositories, groups, teams
title: Docker Hub Quickstart
aliases:
- /apidocs/docker-cloud/
- /docker-cloud/
- /docker-cloud/migration/
- /docker-cloud/migration/cloud-to-swarm/
- /docker-cloud/migration/cloud-to-kube-aks/
- /docker-cloud/migration/cloud-to-kube-gke/
- /docker-cloud/migration/cloud-to-aws-ecs/
- /docker-cloud/migration/deregister-swarms/
- /docker-cloud/migration/kube-primer/
- /docker-cloud/cloud-swarm/
- /docker-cloud/cloud-swarm/using-swarm-mode/
- /docker-cloud/cloud-swarm/register-swarms/
- /docker-cloud/cloud-swarm/register-swarms/
- /docker-cloud/cloud-swarm/create-cloud-swarm-aws/
- /docker-cloud/cloud-swarm/create-cloud-swarm-azure/
- /docker-cloud/cloud-swarm/connect-to-swarm/
- /docker-cloud/cloud-swarm/link-aws-swarm/
- /docker-cloud/cloud-swarm/link-azure-swarm/
- /docker-cloud/cloud-swarm/ssh-key-setup/
- /docker-cloud/infrastructure/
- /docker-cloud/infrastructure/deployment-strategies/
- /docker-cloud/infrastructure/link-aws/
- /docker-cloud/infrastructure/link-do/
- /docker-cloud/infrastructure/link-azure/
- /docker-cloud/infrastructure/link-packet/
- /docker-cloud/infrastructure/link-softlayer/
- /docker-cloud/infrastructure/ssh-into-a-node/
- /docker-cloud/infrastructure/docker-upgrade/
- /docker-cloud/infrastructure/byoh/
- /docker-cloud/infrastructure/cloud-on-packet.net-faq/
- /docker-cloud/infrastructure/cloud-on-aws-faq/
- /docker-cloud/standard/
- /docker-cloud/getting-started/
- /docker-cloud/getting-started/intro_cloud/
- /docker-cloud/getting-started/connect-infra/
- /docker-cloud/getting-started/your_first_node/
- /docker-cloud/getting-started/your_first_service/
- /docker-cloud/getting-started/deploy-app/1_introduction/
- /docker-cloud/getting-started/deploy-app/2_set_up/
- /docker-cloud/getting-started/deploy-app/3_prepare_the_app/
- /docker-cloud/getting-started/deploy-app/4_push_to_cloud_registry/
- /docker-cloud/getting-started/deploy-app/5_deploy_the_app_as_a_service/
- /docker-cloud/getting-started/deploy-app/6_define_environment_variables/
- /docker-cloud/getting-started/deploy-app/7_scale_the_service/
- /docker-cloud/getting-started/deploy-app/8_view_logs/
- /docker-cloud/getting-started/deploy-app/9_load-balance_the_service/
- /docker-cloud/getting-started/deploy-app/10_provision_a_data_backend_for_your_service/
- /docker-cloud/getting-started/deploy-app/11_service_stacks/
- /docker-cloud/getting-started/deploy-app/12_data_management_with_volumes/
- /docker-cloud/apps/
- /docker-cloud/apps/deploy-to-cloud-btn/
- /docker-cloud/apps/auto-destroy/
- /docker-cloud/apps/autorestart/
- /docker-cloud/apps/auto-redeploy/
- /docker-cloud/apps/load-balance-hello-world/
- /docker-cloud/apps/deploy-tags/
- /docker-cloud/apps/stacks/
- /docker-cloud/apps/ports/
- /docker-cloud/apps/service-redeploy/
- /docker-cloud/apps/service-scaling/
- /docker-cloud/apps/api-roles/
- /docker-cloud/apps/service-links/
- /docker-cloud/apps/triggers/
- /docker-cloud/apps/volumes/
- /docker-cloud/apps/stack-yaml-reference/
- /docker-cloud/installing-cli/
- /docker-cloud/docker-errors-faq/
- /docker-cloud/release-notes/
- /docker-store/
- /apidocs/
- /apidocs/overview/
---
@y
---
description: Learn how to get started using Docker Hub
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, accounts,
  organizations, repositories, groups, teams
title: Docker Hub クィックスタート
aliases:
- /apidocs/docker-cloud/
- /docker-cloud/
- /docker-cloud/migration/
- /docker-cloud/migration/cloud-to-swarm/
- /docker-cloud/migration/cloud-to-kube-aks/
- /docker-cloud/migration/cloud-to-kube-gke/
- /docker-cloud/migration/cloud-to-aws-ecs/
- /docker-cloud/migration/deregister-swarms/
- /docker-cloud/migration/kube-primer/
- /docker-cloud/cloud-swarm/
- /docker-cloud/cloud-swarm/using-swarm-mode/
- /docker-cloud/cloud-swarm/register-swarms/
- /docker-cloud/cloud-swarm/register-swarms/
- /docker-cloud/cloud-swarm/create-cloud-swarm-aws/
- /docker-cloud/cloud-swarm/create-cloud-swarm-azure/
- /docker-cloud/cloud-swarm/connect-to-swarm/
- /docker-cloud/cloud-swarm/link-aws-swarm/
- /docker-cloud/cloud-swarm/link-azure-swarm/
- /docker-cloud/cloud-swarm/ssh-key-setup/
- /docker-cloud/infrastructure/
- /docker-cloud/infrastructure/deployment-strategies/
- /docker-cloud/infrastructure/link-aws/
- /docker-cloud/infrastructure/link-do/
- /docker-cloud/infrastructure/link-azure/
- /docker-cloud/infrastructure/link-packet/
- /docker-cloud/infrastructure/link-softlayer/
- /docker-cloud/infrastructure/ssh-into-a-node/
- /docker-cloud/infrastructure/docker-upgrade/
- /docker-cloud/infrastructure/byoh/
- /docker-cloud/infrastructure/cloud-on-packet.net-faq/
- /docker-cloud/infrastructure/cloud-on-aws-faq/
- /docker-cloud/standard/
- /docker-cloud/getting-started/
- /docker-cloud/getting-started/intro_cloud/
- /docker-cloud/getting-started/connect-infra/
- /docker-cloud/getting-started/your_first_node/
- /docker-cloud/getting-started/your_first_service/
- /docker-cloud/getting-started/deploy-app/1_introduction/
- /docker-cloud/getting-started/deploy-app/2_set_up/
- /docker-cloud/getting-started/deploy-app/3_prepare_the_app/
- /docker-cloud/getting-started/deploy-app/4_push_to_cloud_registry/
- /docker-cloud/getting-started/deploy-app/5_deploy_the_app_as_a_service/
- /docker-cloud/getting-started/deploy-app/6_define_environment_variables/
- /docker-cloud/getting-started/deploy-app/7_scale_the_service/
- /docker-cloud/getting-started/deploy-app/8_view_logs/
- /docker-cloud/getting-started/deploy-app/9_load-balance_the_service/
- /docker-cloud/getting-started/deploy-app/10_provision_a_data_backend_for_your_service/
- /docker-cloud/getting-started/deploy-app/11_service_stacks/
- /docker-cloud/getting-started/deploy-app/12_data_management_with_volumes/
- /docker-cloud/apps/
- /docker-cloud/apps/deploy-to-cloud-btn/
- /docker-cloud/apps/auto-destroy/
- /docker-cloud/apps/autorestart/
- /docker-cloud/apps/auto-redeploy/
- /docker-cloud/apps/load-balance-hello-world/
- /docker-cloud/apps/deploy-tags/
- /docker-cloud/apps/stacks/
- /docker-cloud/apps/ports/
- /docker-cloud/apps/service-redeploy/
- /docker-cloud/apps/service-scaling/
- /docker-cloud/apps/api-roles/
- /docker-cloud/apps/service-links/
- /docker-cloud/apps/triggers/
- /docker-cloud/apps/volumes/
- /docker-cloud/apps/stack-yaml-reference/
- /docker-cloud/installing-cli/
- /docker-cloud/docker-errors-faq/
- /docker-cloud/release-notes/
- /docker-store/
- /apidocs/
- /apidocs/overview/
---
@z

@x
The following section contains step-by-step instructions on how to get started with Docker Hub.
@y
The following section contains step-by-step instructions on how to get started with Docker Hub.
@z

@x
### Step 1: Sign up for a Docker account
@y
### Step 1: Sign up for a Docker account
@z

@x
Start by creating a [Docker ID](https://hub.docker.com/signup).
@y
Start by creating a [Docker ID](https://hub.docker.com/signup).
@z

@x
A Docker ID grants you access to Docker Hub repositories and lets you explore available images from the community and verified publishers. You also need a Docker ID to share images on Docker Hub.
@y
A Docker ID grants you access to Docker Hub repositories and lets you explore available images from the community and verified publishers. You also need a Docker ID to share images on Docker Hub.
@z

@x
### Step 2: Create your first repository
@y
### Step 2: Create your first repository
@z

@x
To create a repository:
@y
To create a repository:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Create a Repository** on the Docker Hub welcome page.
3. Name it **&lt;your-username&gt;/my-private-repo**.
4. Set the visibility to **Private**.
5. Select **Create**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **Create a Repository** on the Docker Hub welcome page.
3. Name it **&lt;your-username&gt;/my-private-repo**.
4. Set the visibility to **Private**.
5. Select **Create**.
@z

@x
    You've created your first repository. 
@y
    You've created your first repository. 
@z

@x
### Step 3: Download and install Docker Desktop
@y
### Step 3: Download and install Docker Desktop
@z

@x
You need to download Docker Desktop to build, push, and pull container images.
@y
You need to download Docker Desktop to build, push, and pull container images.
@z

@x
1. Download and install [Docker Desktop](../desktop/index.md).
@y
1. Download and install [Docker Desktop](../desktop/index.md).
@z

@x
2. Sign in to Docker Desktop using the Docker ID you created in step one.
@y
2. Sign in to Docker Desktop using the Docker ID you created in step one.
@z

@x
### Step 4: Pull and run a container image from Docker Hub
@y
### Step 4: Pull and run a container image from Docker Hub
@z

@x
1. In your terminal, run `docker pull hello-world` to pull the image from Docker Hub. You should see output similar to:
@y
1. In your terminal, run `docker pull hello-world` to pull the image from Docker Hub. You should see output similar to:
@z

@x
   ```console
   $ docker pull hello-world
   Using default tag: latest
   latest: Pulling from library/hello-world
   2db29710123e: Pull complete
   Digest:   sha256:7d246653d0511db2a6b2e0436cfd0e52ac8c066000264b3ce63331ac66dca625
   Status: Downloaded newer image for hello-world:latest
   docker.io/library/hello-world:latest
   ```
@y
   ```console
   $ docker pull hello-world
   Using default tag: latest
   latest: Pulling from library/hello-world
   2db29710123e: Pull complete
   Digest:   sha256:7d246653d0511db2a6b2e0436cfd0e52ac8c066000264b3ce63331ac66dca625
   Status: Downloaded newer image for hello-world:latest
   docker.io/library/hello-world:latest
   ```
@z

@x
2. Run `docker run hello-world` to run the image locally. You should see output similar to:
@y
2. Run `docker run hello-world` to run the image locally. You should see output similar to:
@z

@x
    ```console
    $ docker run hello-world
    Hello from Docker!
    This message shows that your installation appears to be working correctly.
@y
    ```console
    $ docker run hello-world
    Hello from Docker!
    This message shows that your installation appears to be working correctly.
@z

@x
    To generate this message, Docker took the following steps:
     1. The Docker client contacted the Docker daemon.
     2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
     (amd64)
     3. The Docker daemon created a new container from that image which runs the
     executable that produces the output you are currently reading.
     4. The Docker daemon streamed that output to the Docker client, which sent
     it to your terminal.
@y
    To generate this message, Docker took the following steps:
     1. The Docker client contacted the Docker daemon.
     2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
     (amd64)
     3. The Docker daemon created a new container from that image which runs the
     executable that produces the output you are currently reading.
     4. The Docker daemon streamed that output to the Docker client, which sent
     it to your terminal.
@z

@x
    To try something more ambitious, you can run an Ubuntu container with:
     $ docker run -it ubuntu bash
@y
    To try something more ambitious, you can run an Ubuntu container with:
     $ docker run -it ubuntu bash
@z

@x
    Share images, automate workflows, and more with a free Docker ID:
     https://hub.docker.com/
@y
    Share images, automate workflows, and more with a free Docker ID:
     https://hub.docker.com/
@z

@x
    For more examples and ideas, visit:
     https://docs.docker.com/get-started/
    ```
@y
    For more examples and ideas, visit:
     https://docs.docker.com/get-started/
    ```
@z

@x
### Step 5: Build and push a container image to Docker Hub from your computer
@y
### Step 5: Build and push a container image to Docker Hub from your computer
@z

@x
1. Start by creating a [Dockerfile](../engine/reference/builder.md) to specify your application as shown below:
@y
1. Start by creating a [Dockerfile](../engine/reference/builder.md) to specify your application as shown below:
@z

@x
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM busybox
   CMD echo "Hello world! This is my first Docker image."
   ```
@y
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM busybox
   CMD echo "Hello world! This is my first Docker image."
   ```
@z

@x
2. Run `docker build -t <your_username>/my-private-repo .` to build your Docker
   image.
@y
2. Run `docker build -t <your_username>/my-private-repo .` to build your Docker
   image.
@z

@x
3. Run `docker run <your_username>/my-private-repo` to test your
Docker image locally.
@y
3. Run `docker run <your_username>/my-private-repo` to test your
Docker image locally.
@z

@x
4. Run `docker push <your_username>/my-private-repo` to push your Docker image to Docker Hub. You should see output similar to:
@y
4. Run `docker push <your_username>/my-private-repo` to push your Docker image to Docker Hub. You should see output similar to:
@z

@x
    ![Terminal](images/index-terminal.png)
@y
    ![Terminal](images/index-terminal.png)
@z

@x
    >**Note**
    >
    > You must be signed in to Docker Hub through Docker Desktop or the command line, and you must also name your images correctly, as per the above steps.
@y
    >**Note**
    >
    > You must be signed in to Docker Hub through Docker Desktop or the command line, and you must also name your images correctly, as per the above steps.
@z

@x
5. Your repository in Docker Hub should now display a new `latest` tag under **Tags**:
@y
5. Your repository in Docker Hub should now display a new `latest` tag under **Tags**:
@z

@x
    ![Tag created](images/index-tag.png)
@y
    ![Tag created](images/index-tag.png)
@z

@x
You've successfully:
@y
You've successfully:
@z

@x
- Signed up for a Docker account
- Created your first repository
- Pulled an existing container image from Docker Hub
- Built your own container image on your computer
- Pushed it successfully to Docker Hub
@y
- Signed up for a Docker account
- Created your first repository
- Pulled an existing container image from Docker Hub
- Built your own container image on your computer
- Pushed it successfully to Docker Hub
@z

@x
### Next steps
@y
### Next steps
@z

@x
- Create an [organization](orgs.md) to use Docker Hub with your team.
- Automatically build container images from code through [builds](builds/index.md).
- [Explore](https://hub.docker.com/explore) official & publisher images.
- [Upgrade your subscription](https://www.docker.com/pricing) to push additional private Docker images to
Docker Hub.
@y
- Create an [organization](orgs.md) to use Docker Hub with your team.
- Automatically build container images from code through [builds](builds/index.md).
- [Explore](https://hub.docker.com/explore) official & publisher images.
- [Upgrade your subscription](https://www.docker.com/pricing) to push additional private Docker images to
Docker Hub.
@z
