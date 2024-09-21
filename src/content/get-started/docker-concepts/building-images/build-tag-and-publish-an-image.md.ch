%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Build, tag, and publish an image
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you how to build, tag, and publish an image to Docker Hub or any other registry 
summary: |
  Building, tagging, and publishing Docker images are key steps in the
  containerization workflow. In this guide, you’ll learn how to create Docker
  images, how to tag those images with a unique identifier, and how to publish
  your image to a public registry.
@y
title: イメージのビルド、タグづけ、公開
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you how to build, tag, and publish an image to Docker Hub or any other registry 
summary: |
  Building, tagging, and publishing Docker images are key steps in the
  containerization workflow. In this guide, you’ll learn how to create Docker
  images, how to tag those images with a unique identifier, and how to publish
  your image to a public registry.
@z

@x
{{< youtube-embed chiiGLlYRlY >}}
@y
{{< youtube-embed chiiGLlYRlY >}}
@z

@x
## Explanation
@y
## Explanation
@z

@x
In this guide, you will learn the following:
@y
In this guide, you will learn the following:
@z

@x
- Building images - the process of building an image based on a `Dockerfile`
- Tagging images - the process of giving an image a name, which also determines where the image can be distributed
- Publishing images - the process to distribute or share the newly created image using a container registry
@y
- Building images - the process of building an image based on a `Dockerfile`
- Tagging images - the process of giving an image a name, which also determines where the image can be distributed
- Publishing images - the process to distribute or share the newly created image using a container registry
@z

@x
### Building images
@y
### Building images
@z

@x
Most often, images are built using a Dockerfile. The most basic `docker build` command might look like the following:
@y
Most often, images are built using a Dockerfile. The most basic `docker build` command might look like the following:
@z

@x
```bash
docker build .
```
@y
```bash
docker build .
```
@z

@x
The final `.` in the command provides the path or URL to the [build context](https://docs.docker.com/build/concepts/context/#what-is-a-build-context). At this location, the builder will find the `Dockerfile` and other referenced files.
@y
The final `.` in the command provides the path or URL to the [build context](https://docs.docker.com/build/concepts/context/#what-is-a-build-context). At this location, the builder will find the `Dockerfile` and other referenced files.
@z

@x
When you run a build, the builder pulls the base image, if needed, and then runs the instructions specified in the Dockerfile.
@y
When you run a build, the builder pulls the base image, if needed, and then runs the instructions specified in the Dockerfile.
@z

@x
With the previous command, the image will have no name, but the output will provide the ID of the image. As an example, the previous command might produce the following output:
@y
With the previous command, the image will have no name, but the output will provide the ID of the image. As an example, the previous command might produce the following output:
@z

@x
```console
$ docker build .
[+] Building 3.5s (11/11) FINISHED                                              docker:desktop-linux
 => [internal] load build definition from Dockerfile                                            0.0s
 => => transferring dockerfile: 308B                                                            0.0s
 => [internal] load metadata for docker.io/library/python:3.12                                  0.0s
 => [internal] load .dockerignore                                                               0.0s
 => => transferring context: 2B                                                                 0.0s
 => [1/6] FROM docker.io/library/python:3.12                                                    0.0s
 => [internal] load build context                                                               0.0s
 => => transferring context: 123B                                                               0.0s
 => [2/6] WORKDIR /usr/local/app                                                                0.0s
 => [3/6] RUN useradd app                                                                       0.1s
 => [4/6] COPY ./requirements.txt ./requirements.txt                                            0.0s
 => [5/6] RUN pip install --no-cache-dir --upgrade -r requirements.txt                          3.2s
 => [6/6] COPY ./app ./app                                                                      0.0s
 => exporting to image                                                                          0.1s
 => => exporting layers                                                                         0.1s
 => => writing image sha256:9924dfd9350407b3df01d1a0e1033b1e543523ce7d5d5e2c83a724480ebe8f00    0.0s
```
@y
```console
$ docker build .
[+] Building 3.5s (11/11) FINISHED                                              docker:desktop-linux
 => [internal] load build definition from Dockerfile                                            0.0s
 => => transferring dockerfile: 308B                                                            0.0s
 => [internal] load metadata for docker.io/library/python:3.12                                  0.0s
 => [internal] load .dockerignore                                                               0.0s
 => => transferring context: 2B                                                                 0.0s
 => [1/6] FROM docker.io/library/python:3.12                                                    0.0s
 => [internal] load build context                                                               0.0s
 => => transferring context: 123B                                                               0.0s
 => [2/6] WORKDIR /usr/local/app                                                                0.0s
 => [3/6] RUN useradd app                                                                       0.1s
 => [4/6] COPY ./requirements.txt ./requirements.txt                                            0.0s
 => [5/6] RUN pip install --no-cache-dir --upgrade -r requirements.txt                          3.2s
 => [6/6] COPY ./app ./app                                                                      0.0s
 => exporting to image                                                                          0.1s
 => => exporting layers                                                                         0.1s
 => => writing image sha256:9924dfd9350407b3df01d1a0e1033b1e543523ce7d5d5e2c83a724480ebe8f00    0.0s
```
@z

@x
With the previous output, you could start a container by using the referenced image:
@y
With the previous output, you could start a container by using the referenced image:
@z

@x
```console
docker run sha256:9924dfd9350407b3df01d1a0e1033b1e543523ce7d5d5e2c83a724480ebe8f00
```
@y
```console
docker run sha256:9924dfd9350407b3df01d1a0e1033b1e543523ce7d5d5e2c83a724480ebe8f00
```
@z

@x
That name certainly isn't memorable, which is where tagging becomes useful.
@y
That name certainly isn't memorable, which is where tagging becomes useful.
@z

@x
### Tagging images
@y
### Tagging images
@z

@x
Tagging images is the method to provide an image with a memorable name. However, there is a structure to the name of an image. A full image name has the following structure:
@y
Tagging images is the method to provide an image with a memorable name. However, there is a structure to the name of an image. A full image name has the following structure:
@z

@x
```text
[HOST[:PORT_NUMBER]/]PATH[:TAG]
```
@y
```text
[HOST[:PORT_NUMBER]/]PATH[:TAG]
```
@z

@x
- `HOST`: The optional registry hostname where the image is located. If no host is specified, Docker's public registry at `docker.io` is used by default.
- `PORT_NUMBER`: The registry port number if a hostname is provided
- `PATH`: The path of the image, consisting of slash-separated components. For Docker Hub, the format follows `[NAMESPACE/]REPOSITORY`, where namespace is either a user's or organization's name. If no namespace is specified, `library` is used, which is the namespace for Docker Official Images.
- `TAG`: A custom, human-readable identifier that's typically used to identify different versions or variants of an image. If no tag is specified, `latest` is used by default.
@y
- `HOST`: The optional registry hostname where the image is located. If no host is specified, Docker's public registry at `docker.io` is used by default.
- `PORT_NUMBER`: The registry port number if a hostname is provided
- `PATH`: The path of the image, consisting of slash-separated components. For Docker Hub, the format follows `[NAMESPACE/]REPOSITORY`, where namespace is either a user's or organization's name. If no namespace is specified, `library` is used, which is the namespace for Docker Official Images.
- `TAG`: A custom, human-readable identifier that's typically used to identify different versions or variants of an image. If no tag is specified, `latest` is used by default.
@z

@x
Some examples of image names include:
@y
Some examples of image names include:
@z

@x
- `nginx`, equivalent to `docker.io/library/nginx:latest`: this pulls an image from the `docker.io` registry, the `library` namespace, the `nginx` image repository, and the `latest` tag.
- `docker/welcome-to-docker`, equivalent to `docker.io/docker/welcome-to-docker:latest`: this pulls an image from the `docker.io` registry, the `docker` namespace, the `welcome-to-docker` image repository, and the `latest` tag
- `ghcr.io/dockersamples/example-voting-app-vote:pr-311`: this pulls an image from the GitHub Container Registry, the `dockersamples` namespace, the `example-voting-app-vote` image repository, and the `pr-311` tag
@y
- `nginx`, equivalent to `docker.io/library/nginx:latest`: this pulls an image from the `docker.io` registry, the `library` namespace, the `nginx` image repository, and the `latest` tag.
- `docker/welcome-to-docker`, equivalent to `docker.io/docker/welcome-to-docker:latest`: this pulls an image from the `docker.io` registry, the `docker` namespace, the `welcome-to-docker` image repository, and the `latest` tag
- `ghcr.io/dockersamples/example-voting-app-vote:pr-311`: this pulls an image from the GitHub Container Registry, the `dockersamples` namespace, the `example-voting-app-vote` image repository, and the `pr-311` tag
@z

@x
To tag an image during a build, add the `-t` or `--tag` flag:
@y
To tag an image during a build, add the `-t` or `--tag` flag:
@z

@x
```console
docker build -t my-username/my-image .
```
@y
```console
docker build -t my-username/my-image .
```
@z

@x
If you've already built an image, you can add another tag to the image by using the [`docker image tag`](https://docs.docker.com/engine/reference/commandline/image_tag/) command:
@y
If you've already built an image, you can add another tag to the image by using the [`docker image tag`](https://docs.docker.com/engine/reference/commandline/image_tag/) command:
@z

@x
```console
docker image tag my-username/my-image another-username/another-image:v1
```
@y
```console
docker image tag my-username/my-image another-username/another-image:v1
```
@z

@x
### Publishing images
@y
### Publishing images
@z

@x
Once you have an image built and tagged, you're ready to push it to a registry. To do so, use the [`docker push`](https://docs.docker.com/engine/reference/commandline/image_push/) command:
@y
Once you have an image built and tagged, you're ready to push it to a registry. To do so, use the [`docker push`](https://docs.docker.com/engine/reference/commandline/image_push/) command:
@z

@x
```console
docker push my-username/my-image
```
@y
```console
docker push my-username/my-image
```
@z

@x
Within a few seconds, all of the layers for your image will be pushed to the registry.
@y
Within a few seconds, all of the layers for your image will be pushed to the registry.
@z

@x
> **Requiring authentication**
>
> Before you're able to push an image to a repository, you will need to be authenticated.
> To do so, simply use the [docker login](https://docs.docker.com/engine/reference/commandline/login/) command.
{ .information }
@y
> **Requiring authentication**
>
> Before you're able to push an image to a repository, you will need to be authenticated.
> To do so, simply use the [docker login](https://docs.docker.com/engine/reference/commandline/login/) command.
{ .information }
@z

@x
## Try it out
@y
## Try it out
@z

@x
In this hands-on guide, you will build a simple image using a provided Dockerfile and push it to Docker Hub.
@y
In this hands-on guide, you will build a simple image using a provided Dockerfile and push it to Docker Hub.
@z

@x
### Set up
@y
### Set up
@z

@x
1. Get the sample application.
@y
1. Get the sample application.
@z

@x
   If you have Git, you can clone the repository for the sample application. Otherwise, you can download the sample application. Choose one of the following options.
@y
   If you have Git, you can clone the repository for the sample application. Otherwise, you can download the sample application. Choose one of the following options.
@z

@x
   {{< tabs >}}
   {{< tab name="Clone with git" >}}
@y
   {{< tabs >}}
   {{< tab name="Clone with git" >}}
@z

@x
   Use the following command in a terminal to clone the sample application repository.
@y
   Use the following command in a terminal to clone the sample application repository.
@z

@x
   ```console
   $ git clone https://github.com/docker/getting-started-todo-app
   ```
   {{< /tab >}}
   {{< tab name="Download" >}}
@y
   ```console
   $ git clone https://github.com/docker/getting-started-todo-app
   ```
   {{< /tab >}}
   {{< tab name="Download" >}}
@z

@x
   Download the source and extract it.
@y
   Download the source and extract it.
@z

@x
   {{< button url="https://github.com/docker/getting-started-todo-app/raw/cd61f824da7a614a8298db503eed6630eeee33a3/app.zip" text="Download the source" >}}
@y
   {{< button url="https://github.com/docker/getting-started-todo-app/raw/cd61f824da7a614a8298db503eed6630eeee33a3/app.zip" text="Download the source" >}}
@z

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
2. [Download and install](https://www.docker.com/products/docker-desktop/) Docker Desktop.
@y
2. [Download and install](https://www.docker.com/products/docker-desktop/) Docker Desktop.
@z

@x
3. If you don't have a Docker account yet, [create one now](https://hub.docker.com/). Once you've done that, sign in to Docker Desktop using that account.
@y
3. If you don't have a Docker account yet, [create one now](https://hub.docker.com/). Once you've done that, sign in to Docker Desktop using that account.
@z

@x
### Build an image
@y
### Build an image
@z

@x
Now that you have a repository on Docker Hub, it's time for you to build an image and push it to the repository.
@y
Now that you have a repository on Docker Hub, it's time for you to build an image and push it to the repository.
@z

@x
1. Using a terminal in the root of the sample app repository, run the following command. Replace `YOUR_DOCKER_USERNAME` with your Docker Hub username:
@y
1. Using a terminal in the root of the sample app repository, run the following command. Replace `YOUR_DOCKER_USERNAME` with your Docker Hub username:
@z

@x
    ```console
    $ docker build -t <YOUR_DOCKER_USERNAME>/concepts-build-image-demo .
    ```
@y
    ```console
    $ docker build -t <YOUR_DOCKER_USERNAME>/concepts-build-image-demo .
    ```
@z

@x
    As an example, if your username is `mobywhale`, you would run the command:
@y
    As an example, if your username is `mobywhale`, you would run the command:
@z

@x
    ```console
    $ docker build -t mobywhale/concepts-build-image-demo .
    ```
@y
    ```console
    $ docker build -t mobywhale/concepts-build-image-demo .
    ```
@z

@x
2. Once the build has completed, you can view the image by using the following command:
@y
2. Once the build has completed, you can view the image by using the following command:
@z

@x
    ```console
    $ docker image ls
    ```
@y
    ```console
    $ docker image ls
    ```
@z

@x
    The command will produce output similar to the following:
@y
    The command will produce output similar to the following:
@z

@x
    ```plaintext
    REPOSITORY                             TAG       IMAGE ID       CREATED          SIZE
    mobywhale/concepts-build-image-demo    latest    746c7e06537f   24 seconds ago   354MB
    ```
@y
    ```plaintext
    REPOSITORY                             TAG       IMAGE ID       CREATED          SIZE
    mobywhale/concepts-build-image-demo    latest    746c7e06537f   24 seconds ago   354MB
    ```
@z

@x
3. You can actually view the history (or how the image was created) by using the [docker image history](/reference/cli/docker/image/history/) command:
@y
3. You can actually view the history (or how the image was created) by using the [docker image history](__SUBDIR__/reference/cli/docker/image/history/) command:
@z

@x
    ```console
    $ docker image history mobywhale/concepts-build-image-demo
    ```
@y
    ```console
    $ docker image history mobywhale/concepts-build-image-demo
    ```
@z

@x
    You'll then see output similar to the following:
@y
    You'll then see output similar to the following:
@z

@x
    ```plaintext
    IMAGE          CREATED         CREATED BY                                      SIZE      COMMENT
    f279389d5f01   8 seconds ago   CMD ["node" "./src/index.js"]                   0B        buildkit.dockerfile.v0
    <missing>      8 seconds ago   EXPOSE map[3000/tcp:{}]                         0B        buildkit.dockerfile.v0 
    <missing>      8 seconds ago   WORKDIR /app                                    8.19kB    buildkit.dockerfile.v0
    <missing>      4 days ago      /bin/sh -c #(nop)  CMD ["node"]                 0B
    <missing>      4 days ago      /bin/sh -c #(nop)  ENTRYPOINT ["docker-entry…   0B
    <missing>      4 days ago      /bin/sh -c #(nop) COPY file:4d192565a7220e13…   20.5kB
    <missing>      4 days ago      /bin/sh -c apk add --no-cache --virtual .bui…   7.92MB
    <missing>      4 days ago      /bin/sh -c #(nop)  ENV YARN_VERSION=1.22.19     0B
    <missing>      4 days ago      /bin/sh -c addgroup -g 1000 node     && addu…   126MB
    <missing>      4 days ago      /bin/sh -c #(nop)  ENV NODE_VERSION=20.12.0     0B
    <missing>      2 months ago    /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B
    <missing>      2 months ago    /bin/sh -c #(nop) ADD file:d0764a717d1e9d0af…   8.42MB
    ```
@y
    ```plaintext
    IMAGE          CREATED         CREATED BY                                      SIZE      COMMENT
    f279389d5f01   8 seconds ago   CMD ["node" "./src/index.js"]                   0B        buildkit.dockerfile.v0
    <missing>      8 seconds ago   EXPOSE map[3000/tcp:{}]                         0B        buildkit.dockerfile.v0 
    <missing>      8 seconds ago   WORKDIR /app                                    8.19kB    buildkit.dockerfile.v0
    <missing>      4 days ago      /bin/sh -c #(nop)  CMD ["node"]                 0B
    <missing>      4 days ago      /bin/sh -c #(nop)  ENTRYPOINT ["docker-entry…   0B
    <missing>      4 days ago      /bin/sh -c #(nop) COPY file:4d192565a7220e13…   20.5kB
    <missing>      4 days ago      /bin/sh -c apk add --no-cache --virtual .bui…   7.92MB
    <missing>      4 days ago      /bin/sh -c #(nop)  ENV YARN_VERSION=1.22.19     0B
    <missing>      4 days ago      /bin/sh -c addgroup -g 1000 node     && addu…   126MB
    <missing>      4 days ago      /bin/sh -c #(nop)  ENV NODE_VERSION=20.12.0     0B
    <missing>      2 months ago    /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B
    <missing>      2 months ago    /bin/sh -c #(nop) ADD file:d0764a717d1e9d0af…   8.42MB
    ```
@z

@x
    This output shows the layers of the image, highlighting the layers you added and those that were inherited from your base image.
@y
    This output shows the layers of the image, highlighting the layers you added and those that were inherited from your base image.
@z

@x
### Push the image
@y
### Push the image
@z

@x
Now that you have an image built, it's time to push the image to a registry.
@y
Now that you have an image built, it's time to push the image to a registry.
@z

@x
1. Push the image using the [docker push](/reference/cli/docker/image/push/) command:
@y
1. Push the image using the [docker push](__SUBDIR__/reference/cli/docker/image/push/) command:
@z

@x
    ```console
    $ docker push <YOUR_DOCKER_USERNAME>/concepts-build-image-demo
    ```
@y
    ```console
    $ docker push <YOUR_DOCKER_USERNAME>/concepts-build-image-demo
    ```
@z

@x
    If you receive a `requested access to the resource is denied`, make sure you are both logged in and that your Docker username is correct in the image tag.
@y
    If you receive a `requested access to the resource is denied`, make sure you are both logged in and that your Docker username is correct in the image tag.
@z

@x
    After a moment, your image should be pushed to Docker Hub.
@y
    After a moment, your image should be pushed to Docker Hub.
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
To learn more about building, tagging, and publishing images, visit the following resources:
@y
To learn more about building, tagging, and publishing images, visit the following resources:
@z

@x
* [What is a build context?](/build/concepts/context/#what-is-a-build-context)
* [docker build reference](/engine/reference/commandline/image_build/)
* [docker image tag reference](/engine/reference/commandline/image_tag/)
* [docker push reference](/engine/reference/commandline/image_push/)
* [What is a registry?](/get-started/docker-concepts/the-basics/what-is-a-registry/)
@y
* [What is a build context?](__SUBDIR__/build/concepts/context/#what-is-a-build-context)
* [docker build reference](__SUBDIR__/engine/reference/commandline/image_build/)
* [docker image tag reference](__SUBDIR__/engine/reference/commandline/image_tag/)
* [docker push reference](__SUBDIR__/engine/reference/commandline/image_push/)
* [What is a registry?](__SUBDIR__/get-started/docker-concepts/the-basics/what-is-a-registry/)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Now that you have learned about building and publishing images, it's time to learn how to speed up the build process using the Docker build cache.
@y
Now that you have learned about building and publishing images, it's time to learn how to speed up the build process using the Docker build cache.
@z

@x
{{< button text="Using the build cache" url="using-the-build-cache" >}}
@y
{{< button text="Using the build cache" url="using-the-build-cache" >}}
@z
