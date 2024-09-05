%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Build and push your first image
keywords: concepts, container, docker desktop
description: This concept page will teach you how to build and push your first image
@y
title: 初めてのイメージ作りとプッシュ
keywords: concepts, container, docker desktop
description: This concept page will teach you how to build and push your first image
@z

% snip youbute...

@x
## Explanation
@y
## 説明 {#explanation}
@z

@x
Now that you've updated the [to-do list app](develop-with-containers.md), you’re ready to create a container image for the application and share it on Docker Hub. To do so, you will need to do the following:
@y
ここまでに [todo リストのアプリ](develop-with-containers.md) を更新してきたので、このアプリケーションに対応するコンテナーイメージを生成して、Docker Hub 上にて共有することにします。
そのためには、以下のことを行っていく必要があります。
@z

@x
1. Sign in with your Docker account
2. Create an image repository on Docker Hub
3. Build the container image
4. Push the image to Docker Hub
@y
1. Docker アカウントを使ってサインイン
2. Docker Hub 上でのイメージリポジトリの生成
3. コンテナーイメージのビルド
4. Docker Hub へのイメージのプッシュ
@z

@x
Before you dive into the hands-on guide, the following are a few core concepts that you should be aware of.
@y
この実践的なガイドに進んでいくにあたり、確認しておくべき基本的な考え方について、以下に見ておくことにしましょう。
@z

@x
### Container images
@y
### コンテナーイメージ {#container-images}
@z

@x
If you’re new to container images, think of them as a standardized package that contains everything needed to run an application, including its files, configuration, and dependencies. These packages can then be distributed and shared with others.
@y
コンテナーイメージについてよく分かっていないなら、以下のように考えてください。
つまりコンテナーイメージとはパッケージが標準化されたものであり、そこにはアプリケーションの実行に必要なファイル、設定、依存パッケージがすべて含まれているものです。
このようなパッケージは他者への配布や共有を容易にしてくれます。
@z

@x
### Docker Hub
@y
### Docker Hub
@z

@x
To share your Docker images, you need a place to store them. This is where registries come in. While there are many registries, Docker Hub is the default and go-to registry for images. Docker Hub provides both a place for you to store your own images and to find images from others to either run or use as the bases for your own images.
@y
Docker イメージを共有したいなら、それを保存しておく場所が必要になります。
ですからレジストリの登場となります。
While there are many registries, Docker Hub is the default and go-to registry for images. Docker Hub provides both a place for you to store your own images and to find images from others to either run or use as the bases for your own images.
@z

@x
In [Develop with containers](develop-with-containers.md), you used the following images that came from Docker Hub, each of which are [Docker Official Images](/trusted-content/official-images/):
@y
[コンテナーを使った開発](develop-with-containers.md) では Docker Hub から入手した以下のイメージを利用しました。
すべては [Docker 公式イメージ](__SUBDIR__/trusted-content/official-images/) です。
@z

@x
- [node](https://hub.docker.com/_/node) - provides a Node environment and is used as the base of your development efforts. This image is also used as the base for the final application image.
- [mysql](https://hub.docker.com/_/mysql) - provides a MySQL database to store the to-do list items
- [phpmyadmin](https://hub.docker.com/_/phpmyadmin) - provides phpMyAdmin, a web-based interface to the MySQL database
- [traefik](https://hub.docker.com/_/traefik) - provides Traefik, a modern HTTP reverse proxy and load balancer that routes requests to the appropriate container based on routing rules
@y
- [node](https://hub.docker.com/_/node) - provides a Node environment and is used as the base of your development efforts. This image is also used as the base for the final application image.
- [mysql](https://hub.docker.com/_/mysql) - provides a MySQL database to store the to-do list items
- [phpmyadmin](https://hub.docker.com/_/phpmyadmin) - provides phpMyAdmin, a web-based interface to the MySQL database
- [traefik](https://hub.docker.com/_/traefik) - provides Traefik, a modern HTTP reverse proxy and load balancer that routes requests to the appropriate container based on routing rules
@z

@x
Explore the full catalog of [Docker Official Images](https://hub.docker.com/search?image_filter=official&q=), [Docker Verified Publishers](https://hub.docker.com/search?q=&image_filter=store), and [Docker Sponsored Open Source Software](https://hub.docker.com/search?q=&image_filter=open_source) images to see more of what there is to run and build on.
@y
Explore the full catalog of [Docker Official Images](https://hub.docker.com/search?image_filter=official&q=), [Docker Verified Publishers](https://hub.docker.com/search?q=&image_filter=store), and [Docker Sponsored Open Source Software](https://hub.docker.com/search?q=&image_filter=open_source) images to see more of what there is to run and build on.
@z

@x
## Try it out
@y
## Try it out {#try-it-out}
@z

@x
In this hands-on guide, you'll learn how to sign in to Docker Hub and push images to Docker Hub repository.
@y
In this hands-on guide, you'll learn how to sign in to Docker Hub and push images to Docker Hub repository.
@z

@x
## Sign in with your Docker account
@y
## Sign in with your Docker account
@z

@x
To push images to Docker Hub, you will need to sign in with a Docker account.
@y
To push images to Docker Hub, you will need to sign in with a Docker account.
@z

@x
1. Open the Docker Dashboard.
@y
1. Open the Docker Dashboard.
@z

@x
2. Select **Sign in** at the top-right corner.
@y
2. Select **Sign in** at the top-right corner.
@z

@x
3. If needed, create an account and then complete the sign-in flow.
@y
3. If needed, create an account and then complete the sign-in flow.
@z

@x
Once you're done, you should see the **Sign in** button turn into a profile picture.
@y
Once you're done, you should see the **Sign in** button turn into a profile picture.
@z

@x
## Create an image repository
@y
## Create an image repository
@z

@x
Now that you have an account, you can create an image repository. Just as a Git repository holds source code, an image repository stores container images.
@y
Now that you have an account, you can create an image repository. Just as a Git repository holds source code, an image repository stores container images.
@z

@x
1. Go to [Docker Hub](https://hub.docker.com).
@y
1. Go to [Docker Hub](https://hub.docker.com).
@z

@x
2. Select **Create repository**.
@y
2. Select **Create repository**.
@z

@x
3. On the **Create repository** page, enter the following information:
@y
3. On the **Create repository** page, enter the following information:
@z

@x
    - **Repository name** - `getting-started-todo-app`
    - **Short description** - feel free to enter a description if you'd like
    - **Visibility** - select **Public** to allow others to pull your customized to-do app
@y
    - **Repository name** - `getting-started-todo-app`
    - **Short description** - feel free to enter a description if you'd like
    - **Visibility** - select **Public** to allow others to pull your customized to-do app
@z

@x
4. Select **Create** to create the repository.
@y
4. Select **Create** to create the repository.
@z

@x
## Build and push the image
@y
## Build and push the image
@z

@x
Now that you have a repository, you are ready to build and push your image. An important note is that the image you are building extends the Node image, meaning you don't need to install or configure Node, yarn, etc. You can simply focus on what makes your application unique.
@y
Now that you have a repository, you are ready to build and push your image. An important note is that the image you are building extends the Node image, meaning you don't need to install or configure Node, yarn, etc. You can simply focus on what makes your application unique.
@z

@x
> **What is an image/Dockerfile?**
>
> Without going too deep yet, think of a container image as a single package that contains
> everything needed to run a process. In this case, it will contain a Node environment,
> the backend code, and the compiled React code. 
>
> Any machine that runs a container using the image, will then be able to run the application as 
> it was built without needing anything else pre-installed on the machine. 
>
> A `Dockerfile` is a text-based script that provides the instruction set on how to build
> the image. For this quick start, the repository already contains the Dockerfile.
@y
> **What is an image/Dockerfile?**
>
> Without going too deep yet, think of a container image as a single package that contains
> everything needed to run a process. In this case, it will contain a Node environment,
> the backend code, and the compiled React code. 
>
> Any machine that runs a container using the image, will then be able to run the application as 
> it was built without needing anything else pre-installed on the machine. 
>
> A `Dockerfile` is a text-based script that provides the instruction set on how to build
> the image. For this quick start, the repository already contains the Dockerfile.
@z

@x
{{< tabs group="cli-or-vs-code" persist=true >}}
{{< tab name="CLI" >}}
@y
{{< tabs group="cli-or-vs-code" persist=true >}}
{{< tab name="CLI" >}}
@z

@x
1. To get started, either clone or [download the project as a ZIP file](https://github.com/docker/getting-started-todo-app/archive/refs/heads/main.zip) to your local machine.
@y
1. To get started, either clone or [download the project as a ZIP file](https://github.com/docker/getting-started-todo-app/archive/refs/heads/main.zip) to your local machine.
@z

@x
   ```console
   $ git clone https://github.com/docker/getting-started-todo-app
   ```
@y
   ```console
   $ git clone https://github.com/docker/getting-started-todo-app
   ```
@z

@x
   And after the project is cloned, navigate into the new directory created by the clone:
@y
   And after the project is cloned, navigate into the new directory created by the clone:
@z

@x
   ```console
   $ cd getting-started-todo-app
   ```
@y
   ```console
   $ cd getting-started-todo-app
   ```
@z

@x
2. Build the project by running the following command, swapping out `DOCKER_USERNAME` with your username.
@y
2. Build the project by running the following command, swapping out `DOCKER_USERNAME` with your username.
@z

@x
    ```console
    $ docker build -t <DOCKER_USERNAME>/getting-started-todo-app .
    ```
@y
    ```console
    $ docker build -t <DOCKER_USERNAME>/getting-started-todo-app .
    ```
@z

@x
    For example, if your Docker username was `mobydock`, you would run the following:
@y
    For example, if your Docker username was `mobydock`, you would run the following:
@z

@x
    ```console
    $ docker build -t mobydock/getting-started-todo-app .
    ```
@y
    ```console
    $ docker build -t mobydock/getting-started-todo-app .
    ```
@z

@x
3. To verify the image exists locally, you can use the `docker image ls` command:
@y
3. To verify the image exists locally, you can use the `docker image ls` command:
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
    You will see output similar to the following:
@y
    You will see output similar to the following:
@z

@x
    ```console
    REPOSITORY                          TAG       IMAGE ID       CREATED          SIZE
    mobydock/getting-started-todo-app   latest    1543656c9290   2 minutes ago    1.12GB
    ...
    ```
@y
    ```console
    REPOSITORY                          TAG       IMAGE ID       CREATED          SIZE
    mobydock/getting-started-todo-app   latest    1543656c9290   2 minutes ago    1.12GB
    ...
    ```
@z

@x
4. To push the image, use the `docker push` command. Be sure to replace `DOCKER_USERNAME` with your username:
@y
4. To push the image, use the `docker push` command. Be sure to replace `DOCKER_USERNAME` with your username:
@z

@x
    ```console
    $ docker push <DOCKER_USERNAME>/getting-started-todo-app
    ```
@y
    ```console
    $ docker push <DOCKER_USERNAME>/getting-started-todo-app
    ```
@z

@x
    Depending on your upload speeds, this may take a moment to push.
@y
    Depending on your upload speeds, this may take a moment to push.
@z

@x
{{< /tab >}}
{{< tab name="VS Code" >}}
@y
{{< /tab >}}
{{< tab name="VS Code" >}}
@z

@x
1. Open Visual Studio Code. In the **File** menu, select **Open Folder**. Choose **Clone Git Repository** and paste this URL: [https://github.com/docker/getting-started-todo-app](https://github.com/docker/getting-started-todo-app)
@y
1. Open Visual Studio Code. In the **File** menu, select **Open Folder**. Choose **Clone Git Repository** and paste this URL: [https://github.com/docker/getting-started-todo-app](https://github.com/docker/getting-started-todo-app)
@z

@x
    ![Screenshot of VS code showing how to clone a repository](images/clone-the-repo.webp?border=true)
@y
    ![Screenshot of VS code showing how to clone a repository](images/clone-the-repo.webp?border=true)
@z

@x
2. Right-click the `Dockerfile` and select the **Build Image...** menu item.
@y
2. Right-click the `Dockerfile` and select the **Build Image...** menu item.
@z

@x
    ![Screenshot of VS Code showing the right-click menu and "Build Image" menu item](images/build-vscode-menu-item.webp?border=true)
@y
    ![Screenshot of VS Code showing the right-click menu and "Build Image" menu item](images/build-vscode-menu-item.webp?border=true)
@z

@x
3. In the dialog that appears, enter a name of `DOCKER_USERNAME/getting-started-todo-app`, replacing `DOCKER_USERNAME` with your Docker username. 
@y
3. In the dialog that appears, enter a name of `DOCKER_USERNAME/getting-started-todo-app`, replacing `DOCKER_USERNAME` with your Docker username. 
@z

@x
4. After pressing **Enter**, you'll see a terminal appear where the build will occur. Once it's completed, feel free to close the terminal.
@y
4. After pressing **Enter**, you'll see a terminal appear where the build will occur. Once it's completed, feel free to close the terminal.
@z

@x
5. Open the Docker Extension for VS Code by selecting the Docker logo in the left nav menu.
@y
5. Open the Docker Extension for VS Code by selecting the Docker logo in the left nav menu.
@z

@x
6. Find the image you created. It'll have a name of `docker.io/DOCKER_USERNAME/getting-started-todo-app`. 
@y
6. Find the image you created. It'll have a name of `docker.io/DOCKER_USERNAME/getting-started-todo-app`. 
@z

@x
7. Expand the image to view the tags (or different versions) of the image. You should see a tag named `latest`, which is the default tag given to an image.
@y
7. Expand the image to view the tags (or different versions) of the image. You should see a tag named `latest`, which is the default tag given to an image.
@z

@x
8. Right-click on the **latest** item and select the **Push...** option.
@y
8. Right-click on the **latest** item and select the **Push...** option.
@z

@x
    ![Screenshot of the Docker Extension and the right-click menu to push an image](images/build-vscode-push-image.webp)
@y
    ![Screenshot of the Docker Extension and the right-click menu to push an image](images/build-vscode-push-image.webp)
@z

@x
9. Press **Enter** to confirm and then watch as your image is pushed to Docker Hub. Depending on your upload speeds, it might take a moment to push the image.
@y
9. Press **Enter** to confirm and then watch as your image is pushed to Docker Hub. Depending on your upload speeds, it might take a moment to push the image.
@z

@x
    Once the upload is finished, feel free to close the terminal.
@y
    Once the upload is finished, feel free to close the terminal.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Recap
@y
## Recap
@z

@x
Before you move on, take a moment and reflect on what happened here. Within a few moments, you were able to build a container image that packages your application and push it to Docker Hub.
@y
Before you move on, take a moment and reflect on what happened here. Within a few moments, you were able to build a container image that packages your application and push it to Docker Hub.
@z

@x
Going forward, you’ll want to remember that:
@y
Going forward, you’ll want to remember that:
@z

@x
- Docker Hub is the go-to registry for finding trusted content. Docker provides a collection of trusted content, composed of Docker Official Images, Docker Verified Publishers, and Docker Sponsored Open Source Software, to use directly or as bases for your own images.
@y
- Docker Hub is the go-to registry for finding trusted content. Docker provides a collection of trusted content, composed of Docker Official Images, Docker Verified Publishers, and Docker Sponsored Open Source Software, to use directly or as bases for your own images.
@z

@x
- Docker Hub provides a marketplace to distribute your own applications. Anyone can create an account and distribute images. While you are publicly distributing the image you created, private repositories can ensure your images are accessible to only authorized users.
@y
- Docker Hub provides a marketplace to distribute your own applications. Anyone can create an account and distribute images. While you are publicly distributing the image you created, private repositories can ensure your images are accessible to only authorized users.
@z

@x
> **Usage of other registries**
>
> While Docker Hub is the default registry, registries are standardized and made 
> interoperable through the [Open Container Initiative](https://opencontainers.org/). This allows companies and 
> organizations to run their own private registries. Quite often, trusted content 
> is mirrored (or copied) from Docker Hub into these private registries.
>
@y
> **Usage of other registries**
>
> While Docker Hub is the default registry, registries are standardized and made 
> interoperable through the [Open Container Initiative](https://opencontainers.org/). This allows companies and 
> organizations to run their own private registries. Quite often, trusted content 
> is mirrored (or copied) from Docker Hub into these private registries.
>
@z

@x
## Next steps
@y
## Next steps
@z

@x
Now that you’ve built an image, it's time to discuss why you as a developer should learn more about Docker and how it will help you in your day-to-day tasks.
@y
Now that you’ve built an image, it's time to discuss why you as a developer should learn more about Docker and how it will help you in your day-to-day tasks.
@z

@x
{{< button text="What's Next" url="whats-next" >}}
@y
{{< button text="What's Next" url="whats-next" >}}
@z
