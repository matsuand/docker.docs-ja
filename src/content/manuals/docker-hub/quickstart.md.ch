%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
description: Learn how to get started using Docker Hub
keywords: Docker Hub, push image, pull image, repositories
title: Docker Hub quickstart
linkTitle: Quickstart
@y
description: Learn how to get started using Docker Hub
keywords: Docker Hub, push image, pull image, repositories
title: Docker Hub quickstart
linkTitle: Quickstart
@z

@x
Docker Hub provides a vast library of pre-built images and resources,
accelerating development workflows and reducing setup time. You can build upon
pre-built images from Docker Hub and then use repositories to share and
distribute your own images with your team or millions of other developers.
@y
Docker Hub provides a vast library of pre-built images and resources,
accelerating development workflows and reducing setup time. You can build upon
pre-built images from Docker Hub and then use repositories to share and
distribute your own images with your team or millions of other developers.
@z

@x
This guide shows you how to find and run a pre-built image. It then walks you
through creating a custom image and sharing it through Docker Hub.
@y
This guide shows you how to find and run a pre-built image. It then walks you
through creating a custom image and sharing it through Docker Hub.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- [Download and install Docker](../../get-started/get-docker.md)
- [Create a Docker account](https://app.docker.com/signup)
@y
- [Download and install Docker](../../get-started/get-docker.md)
- [Create a Docker account](https://app.docker.com/signup)
@z

@x
## Step 1: Find an image in Docker Hub's library
@y
## Step 1: Find an image in Docker Hub's library
@z

@x
You can search for content in Docker Hub itself, in the Docker Desktop
Dashboard, or by using the `docker search` CLI command. Searching on Docker Hub
itself offers the most options to explore content.
@y
You can search for content in Docker Hub itself, in the Docker Desktop
Dashboard, or by using the `docker search` CLI command. Searching on Docker Hub
itself offers the most options to explore content.
@z

@x
To search or browse for content on Docker Hub:
@y
To search or browse for content on Docker Hub:
@z

@x
1. Navigate to the [Docker Hub Explore page](https://hub.docker.com/explore).
@y
1. Navigate to the [Docker Hub Explore page](https://hub.docker.com/explore).
@z

@x
   On the Explore page, you can browse by catalog or category, or use the search
   to quickly find content.
@y
   On the Explore page, you can browse by catalog or category, or use the search
   to quickly find content.
@z

@x
2. Under **Categories**, select **Web servers**.
@y
2. Under **Categories**, select **Web servers**.
@z

@x
   After the results are displayed, you can further filter the results using the
   filters on the left side of the page.
@y
   After the results are displayed, you can further filter the results using the
   filters on the left side of the page.
@z

@x
3. In the filters, select **Docker Official Image**.
@y
3. In the filters, select **Docker Official Image**.
@z

@x
   Filtering by Trusted Content ensures that you see only high-quality, secure
   images curated by Docker and verified publishing partners.
@y
   Filtering by Trusted Content ensures that you see only high-quality, secure
   images curated by Docker and verified publishing partners.
@z

@x
4. In the results, select the **nginx** image.
@y
4. In the results, select the **nginx** image.
@z

@x
   Selecting the image opens the image's page where you can learn more about how
   to use the image. On the page, you'll also find the `docker pull` command to
   pull the image.
@y
   Selecting the image opens the image's page where you can learn more about how
   to use the image. On the page, you'll also find the `docker pull` command to
   pull the image.
@z

@x
Now that you've found an image, it's time to pull and run it on your device.
@y
Now that you've found an image, it's time to pull and run it on your device.
@z

@x
## Step 2: Pull and run an image from Docker Hub
@y
## Step 2: Pull and run an image from Docker Hub
@z

@x
1. In your terminal, run the following command to pull and run the Nginx image.
@y
1. In your terminal, run the following command to pull and run the Nginx image.
@z

% snip command...

@x
   The `docker run` command automatically pulls and runs the image without the
   need to run `docker pull` first. To learn more about the command and its
   options, see the [`docker run` CLI
   reference](../../reference/cli/docker/container/run.md). After running the
   command, you should see output similar to the following.
@y
   The `docker run` command automatically pulls and runs the image without the
   need to run `docker pull` first. To learn more about the command and its
   options, see the [`docker run` CLI
   reference](../../reference/cli/docker/container/run.md). After running the
   command, you should see output similar to the following.
@z

% snip output...

@x
2. Visit [https://localhost:8080](https://localhost:8080) to view the default
   Nginx page and verify that the container is running.
@y
2. Visit [https://localhost:8080](https://localhost:8080) to view the default
   Nginx page and verify that the container is running.
@z

@x
3. In the terminal, press CTRL+C to stop the container.
@y
3. In the terminal, press CTRL+C to stop the container.
@z

@x
You've now run a web server without any set up or configuration, all from a
single command. Docker Hub provides instant access to pre-built, ready-to-use
container images, letting you quickly pull and run applications without needing
to install or configure software manually. With Docker Hub's vast library of
images, you can experiment with and deploy applications effortlessly, boosting
productivity and making it easy to try out new tools, set up development
environments, or build on top of existing software.
@y
You've now run a web server without any set up or configuration, all from a
single command. Docker Hub provides instant access to pre-built, ready-to-use
container images, letting you quickly pull and run applications without needing
to install or configure software manually. With Docker Hub's vast library of
images, you can experiment with and deploy applications effortlessly, boosting
productivity and making it easy to try out new tools, set up development
environments, or build on top of existing software.
@z

@x
You can also extend images from Docker Hub, letting you quickly build and
customize your own images to suit specific needs.
@y
You can also extend images from Docker Hub, letting you quickly build and
customize your own images to suit specific needs.
@z

@x
## Step 3: Build and push an image to Docker Hub
@y
## Step 3: Build and push an image to Docker Hub
@z

@x
1. Create a [Dockerfile](/reference/dockerfile.md) to specify your application:
@y
1. Create a [Dockerfile](reference/dockerfile.md) to specify your application:
@z

% snip code...

@x
   This Dockerfile extends the Nginx image from Docker Hub to create a
   simple website. With just a few lines, you can easily set up, customize, and
   share a static website using Docker.
@y
   This Dockerfile extends the Nginx image from Docker Hub to create a
   simple website. With just a few lines, you can easily set up, customize, and
   share a static website using Docker.
@z

@x
2. Run the following command to build your image. Replace `<YOUR-USERNAME>` with your Docker ID.
@y
2. Run the following command to build your image. Replace `<YOUR-USERNAME>` with your Docker ID.
@z

% snip command...

@x
   This command builds your image and tags it so that Docker understands which
   repository to push it to in Docker Hub. To learn more about the command and
   its options, see the [`docker build` CLI
   reference](../../reference/cli/docker/buildx/build.md). After running the
   command, you should see output similar to the following.
@y
   This command builds your image and tags it so that Docker understands which
   repository to push it to in Docker Hub. To learn more about the command and
   its options, see the [`docker build` CLI
   reference](../../reference/cli/docker/buildx/build.md). After running the
   command, you should see output similar to the following.
@z

% snip output...

@x
3. Run the following command to test your image. Replace `<YOUR-USERNAME>` with
   your Docker ID.
@y
3. Run the following command to test your image. Replace `<YOUR-USERNAME>` with
   your Docker ID.
@z

% snip command...

@x
4. Visit [https://localhost:8080](https://localhost:8080) to view the page. You
   should see `Hello world from Docker!`.
@y
4. Visit [https://localhost:8080](https://localhost:8080) to view the page. You
   should see `Hello world from Docker!`.
@z

@x
5. In the terminal, press CTRL+C to stop the container.
@y
5. In the terminal, press CTRL+C to stop the container.
@z

@x
6. Sign in to Docker Desktop. You must be signed in before pushing an image to
   Docker Hub.
@y
6. Sign in to Docker Desktop. You must be signed in before pushing an image to
   Docker Hub.
@z

@x
7. Run the following command to push your image to Docker Hub. Replace `<YOUR-USERNAME>` with your Docker ID.
@y
7. Run the following command to push your image to Docker Hub. Replace `<YOUR-USERNAME>` with your Docker ID.
@z

% snip command...

@x
    > [!NOTE]
    >
    > You must be signed in to Docker Hub through Docker Desktop or the command line, and you must also name your images correctly, as per the above steps.
@y
    > [!NOTE]
    >
    > You must be signed in to Docker Hub through Docker Desktop or the command line, and you must also name your images correctly, as per the above steps.
@z

@x
   The command pushes the image to Docker Hub and automatically
   creates the repository if it doesn't exist. To learn more about the command,
   see the [`docker push` CLI
   reference](../../reference/cli/docker/image/push.md). After running the
   command, you should see output similar to the following.
@y
   The command pushes the image to Docker Hub and automatically
   creates the repository if it doesn't exist. To learn more about the command,
   see the [`docker push` CLI
   reference](../../reference/cli/docker/image/push.md). After running the
   command, you should see output similar to the following.
@z

% snip output...

@x
  Now that you've created a repository and pushed your image, it's time to view
  your repository and explore its options.
@y
  Now that you've created a repository and pushed your image, it's time to view
  your repository and explore its options.
@z

@x
## Step 4: View your repository on Docker Hub and explore options
@y
## Step 4: View your repository on Docker Hub and explore options
@z

@x
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
@y
1. Go to [Docker Hub](https://hub.docker.com) and sign in.
@z

@x
   After signing in, you should be on the **Repositories** page. If not, then go
   to the [**Repositories**](https://hub.docker.com/repositories/) page.
@y
   After signing in, you should be on the **Repositories** page. If not, then go
   to the [**Repositories**](https://hub.docker.com/repositories/) page.
@z

@x
2. Find the **nginx-custom** repository and select that row.
@y
2. Find the **nginx-custom** repository and select that row.
@z

@x
   After selecting the repository, you should see more details and options for
   your repository.
@y
   After selecting the repository, you should see more details and options for
   your repository.
@z

@x
You've now verified that your repository exists on Docker Hub, and you've
discovered more options for it. View the next steps to learn more about some of
these options.
@y
You've now verified that your repository exists on Docker Hub, and you've
discovered more options for it. View the next steps to learn more about some of
these options.
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Add [repository information](./repos/manage/information.md) to help users find and use
your image.
@y
Add [repository information](./repos/manage/information.md) to help users find and use
your image.
@z
