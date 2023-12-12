%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Share the application
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop, docker hub, sharing
description: Sharing your image you built for your example application so you can
  run it else where and other developers can use it
aliases:
- /get-started/part3/
---
@y
---
title: Share the application
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop, docker hub, sharing
description: Sharing your image you built for your example application so you can
  run it else where and other developers can use it
aliases:
- /get-started/part3/
---
@z

@x
Now that you've built an image, you can share it. To share Docker images, you have to use a Docker
registry. The default registry is Docker Hub and is where all of the images you've used have come from.
@y
Now that you've built an image, you can share it. To share Docker images, you have to use a Docker
registry. The default registry is Docker Hub and is where all of the images you've used have come from.
@z

@x
> **Docker ID**
>
> A Docker ID lets you access Docker Hub, which is the world's largest library and community for container images. Create a [Docker ID](https://hub.docker.com/signup) for free if you don't have one.
@y
> **Docker ID**
>
> A Docker ID lets you access Docker Hub, which is the world's largest library and community for container images. Create a [Docker ID](https://hub.docker.com/signup) for free if you don't have one.
@z

@x
## Create a repository
@y
## Create a repository
@z

@x
To push an image, you first need to create a repository on Docker Hub.
@y
To push an image, you first need to create a repository on Docker Hub.
@z

@x
1. [Sign up](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade) or Sign in to [Docker Hub](https://hub.docker.com).
@y
1. [Sign up](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade) or Sign in to [Docker Hub](https://hub.docker.com).
@z

@x
2. Select the **Create Repository** button.
@y
2. Select the **Create Repository** button.
@z

@x
3. For the repository name, use `getting-started`. Make sure the **Visibility** is **Public**.
@y
3. For the repository name, use `getting-started`. Make sure the **Visibility** is **Public**.
@z

@x
4. Select **Create**.
@y
4. Select **Create**.
@z

@x
In the following image, you can see an example Docker command from Docker Hub. This command will push to this repository.
@y
In the following image, you can see an example Docker command from Docker Hub. This command will push to this repository.
@z

@x
![Docker command with push example](images/push-command.webp)
@y
![Docker command with push example](images/push-command.webp)
@z

@x
## Push the image
@y
## Push the image
@z

@x
1. In the command line, run the `docker push` command that you see on Docker
   Hub. Note that your command will have your Docker ID, not "docker".
@y
1. In the command line, run the `docker push` command that you see on Docker
   Hub. Note that your command will have your Docker ID, not "docker".
@z

@x
   ```console
   $ docker push docker/getting-started
   The push refers to repository [docker.io/docker/getting-started]
   An image does not exist locally with the tag: docker/getting-started
   ```
@y
   ```console
   $ docker push docker/getting-started
   The push refers to repository [docker.io/docker/getting-started]
   An image does not exist locally with the tag: docker/getting-started
   ```
@z

@x
    Why did it fail? The push command was looking for an image named `docker/getting-started`, but
    didn't find one. If you run `docker image ls`, you won't see one either.
@y
    Why did it fail? The push command was looking for an image named `docker/getting-started`, but
    didn't find one. If you run `docker image ls`, you won't see one either.
@z

@x
    To fix this, you need to tag your existing image you've built to give it another name.
@y
    To fix this, you need to tag your existing image you've built to give it another name.
@z

@x
2. Sign in to Docker Hub using the command `docker login -u YOUR-USER-NAME`.
@y
2. Sign in to Docker Hub using the command `docker login -u YOUR-USER-NAME`.
@z

@x
3. Use the `docker tag` command to give the `getting-started` image a new name. Replace `YOUR-USER-NAME` with your Docker ID.
@y
3. Use the `docker tag` command to give the `getting-started` image a new name. Replace `YOUR-USER-NAME` with your Docker ID.
@z

@x
   ```console
   $ docker tag getting-started YOUR-USER-NAME/getting-started
   ```
@y
   ```console
   $ docker tag getting-started YOUR-USER-NAME/getting-started
   ```
@z

@x
4. Now run the `docker push` command again. If you're copying the value from
   Docker Hub, you can drop the `tagname` part, as you didn't add a tag to the
   image name. If you don't specify a tag, Docker uses a tag called `latest`.
@y
4. Now run the `docker push` command again. If you're copying the value from
   Docker Hub, you can drop the `tagname` part, as you didn't add a tag to the
   image name. If you don't specify a tag, Docker uses a tag called `latest`.
@z

@x
   ```console
   $ docker push YOUR-USER-NAME/getting-started
   ```
@y
   ```console
   $ docker push YOUR-USER-NAME/getting-started
   ```
@z

@x
## Run the image on a new instance
@y
## Run the image on a new instance
@z

@x
Now that your image has been built and pushed into a registry, try running your app on a brand
new instance that has never seen this container image. To do this, you will use Play with Docker.
@y
Now that your image has been built and pushed into a registry, try running your app on a brand
new instance that has never seen this container image. To do this, you will use Play with Docker.
@z

@x
> **Note**
>
> Play with Docker uses the amd64 platform. If you are using an ARM based Mac with Apple Silicon, you will need to rebuild the image to be compatible with Play with Docker and push the new image to your repository.
>
> To build an image for the amd64 platform, use the `--platform` flag.
> ```console
> $ docker build --platform linux/amd64 -t YOUR-USER-NAME/getting-started .
> ```
>
> Docker buildx also supports building multi-platform images. To learn more, see [Multi-platform images](../build/building/multi-platform.md).
@y
> **Note**
>
> Play with Docker uses the amd64 platform. If you are using an ARM based Mac with Apple Silicon, you will need to rebuild the image to be compatible with Play with Docker and push the new image to your repository.
>
> To build an image for the amd64 platform, use the `--platform` flag.
> ```console
> $ docker build --platform linux/amd64 -t YOUR-USER-NAME/getting-started .
> ```
>
> Docker buildx also supports building multi-platform images. To learn more, see [Multi-platform images](../build/building/multi-platform.md).
@z

@x
1. Open your browser to [Play with Docker](https://labs.play-with-docker.com/).
@y
1. Open your browser to [Play with Docker](https://labs.play-with-docker.com/).
@z

@x
2. Select **Login** and then select **docker** from the drop-down list.
@y
2. Select **Login** and then select **docker** from the drop-down list.
@z

@x
3. Sign in with your Docker Hub account and then select **Start**.
@y
3. Sign in with your Docker Hub account and then select **Start**.
@z

@x
4. Select the **ADD NEW INSTANCE** option on the left side bar. If you don't see it, make your browser a little wider. After a few seconds, a terminal window opens in your browser.
@y
4. Select the **ADD NEW INSTANCE** option on the left side bar. If you don't see it, make your browser a little wider. After a few seconds, a terminal window opens in your browser.
@z

@x
    ![Play with Docker add new instance](images/pwd-add-new-instance.webp)
@y
    ![Play with Docker add new instance](images/pwd-add-new-instance.webp)
@z

@x
5. In the terminal, start your freshly pushed app.
@y
5. In the terminal, start your freshly pushed app.
@z

@x
   ```console
   $ docker run -dp 0.0.0.0:3000:3000 YOUR-USER-NAME/getting-started
   ```
@y
   ```console
   $ docker run -dp 0.0.0.0:3000:3000 YOUR-USER-NAME/getting-started
   ```
@z

@x
    You should see the image get pulled down and eventually start up.
@y
    You should see the image get pulled down and eventually start up.
@z

@x
    > **Tip**
    >
    > You may have noticed that this command binds the port mapping to a
    > different IP address. Previous `docker run` commands published ports to
    > `127.0.0.1:3000` on the host. This time, you're using `0.0.0.0`.
    >
    > Binding to `127.0.0.1` only exposes a container's ports to the loopback
    > interface. Binding to `0.0.0.0`, however, exposes the container's port
    > on all interfaces of the host, making it available to the outside world.
    >
    > For more information about how port mapping works, see
    > [Networking](../network/index.md#published-ports).
    { .tip }
@y
    > **Tip**
    >
    > You may have noticed that this command binds the port mapping to a
    > different IP address. Previous `docker run` commands published ports to
    > `127.0.0.1:3000` on the host. This time, you're using `0.0.0.0`.
    >
    > Binding to `127.0.0.1` only exposes a container's ports to the loopback
    > interface. Binding to `0.0.0.0`, however, exposes the container's port
    > on all interfaces of the host, making it available to the outside world.
    >
    > For more information about how port mapping works, see
    > [Networking](../network/index.md#published-ports).
    { .tip }
@z

@x
6. Select the 3000 badge when it appears.
@y
6. Select the 3000 badge when it appears.
@z

@x
   If the 3000 badge doesn't appear, you can select **Open Port** and specify `3000`.
@y
   If the 3000 badge doesn't appear, you can select **Open Port** and specify `3000`.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to share your images by pushing them to a
registry. You then went to a brand new instance and were able to run the freshly
pushed image. This is quite common in CI pipelines, where the pipeline will
create the image and push it to a registry and then the production environment
can use the latest version of the image.
@y
In this section, you learned how to share your images by pushing them to a
registry. You then went to a brand new instance and were able to run the freshly
pushed image. This is quite common in CI pipelines, where the pipeline will
create the image and push it to a registry and then the production environment
can use the latest version of the image.
@z

@x
Related information:
@y
Related information:
@z

@x
 - [docker CLI reference](/engine/reference/commandline/cli/)
 - [Multi-platform images](../build/building/multi-platform.md)
 - [Docker Hub overview](../docker-hub/index.md)
@y
 - [docker CLI reference](/engine/reference/commandline/cli/)
 - [Multi-platform images](../build/building/multi-platform.md)
 - [Docker Hub overview](../docker-hub/index.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll learn how to persist data in your containerized application.
@y
In the next section, you'll learn how to persist data in your containerized application.
@z

@x
{{< button text="Persist the DB" url="05_persisting_data.md" >}}
@y
{{< button text="Persist the DB" url="05_persisting_data.md" >}}
@z
