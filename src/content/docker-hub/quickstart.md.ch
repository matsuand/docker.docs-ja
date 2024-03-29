%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Learn how to get started using Docker Hub
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, accounts,
  organizations, repositories, groups, teams
title: Docker Hub quickstart
@y
description: Learn how to get started using Docker Hub
keywords: Docker, docker, registry, accounts, plans, Dockerfile, Docker Hub, accounts,
  organizations, repositories, groups, teams
title: Docker Hub クィックスタート
@z

@x
The following section contains step-by-step instructions on how to get started with Docker Hub.
@y
以下の節において、Docker Hub をはじめる方法を順に示していきます。
@z

@x
### Step 1: Sign up for a free Docker account
@y
### 手順 1: 無償 Docker アカウントへのサインアップ {#step-1-sign-up-for-a-free-docker-account}
@z

@x
Start by creating a [Docker ID](https://hub.docker.com/signup).
@y
まずは [Docker ID](https://hub.docker.com/signup) を生成するところからはじめます。
@z

@x
A [Docker ID](../docker-id/_index.md) grants you access to Docker Hub repositories and lets you explore available images from the community and verified publishers. You also need a Docker ID to share images on Docker Hub.
@y
[Docker ID](../docker-id/_index.md) は Docker Hub リポジトリへのアクセス権を定めるものであり、コミュニティや認証済み公開者が提供するイメージを参照できるようになります。
また Docker ID は Docker Hub 上においてイメージを共有するために必要となります。
@z

@x
### Step 2: Create your first repository
@y
### 手順 2: リポジトリの新規生成 {#step-2-create-your-first-repository}
@z

@x
To create a repository:
@y
リポジトリ生成の手順は以下です。
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. On the Repositories page, select **Create repository**.
3. Name it **&lt;your-username&gt;/my-private-repo**.
4. Set the visibility to **Private**.
5. Select **Create**.
@y
1. [Docker Hub](https://hub.docker.com) にサインインします。
2. Repositories ページにて **Create repository** (リポジトリ生成) をクリックします。
3. 名称を **&lt;your-username&gt;/my-private-repo** とします。
4. visibility（見せ方）を **Private** に設定します。
5. **Create** (生成) をクリックします。
@z

@x
You've created your first repository.
@y
リポジトリ生成が完了しました。
@z

@x
### Step 3: Download and install Docker Desktop
@y
### 手順 3: Docker Desktop のダウンロードとインストール {#step-3-download-and-install-docker-desktop}
@z

@x
You need to download Docker Desktop to build, push, and pull container images.
@y
コンテナーイメージのビルド、プッシュ、プルを行うには Docker Desktop をダウンロードする必要があります。
@z

@x
1. Download and install [Docker Desktop](../desktop/index.md).
@y
1. [Docker Desktop](../desktop/index.md) をダウンロードしてインストールします。
@z

@x
2. Sign in to Docker Desktop using the Docker ID you created in step one.
@y
2. 手順 1. において生成した Docker ID を使って Docker Desktop にサインインします。
@z

@x
### Step 4: Pull and run a container image from Docker Hub
@y
### Step 4: Docker Hub からコンテナーイメージをプルして実行 {#step-4-pull-and-run-a-container-image-from-docker-hub}
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
1. Start by creating a [Dockerfile](../reference/dockerfile.md) to specify your application as shown below:
@y
1. Start by creating a [Dockerfile](../reference/dockerfile.md) to specify your application as shown below:
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
   ```console
   $ cat > Dockerfile <<EOF
   FROM busybox
   CMD echo "Hello world! This is my first Docker image."
   EOF
   $ docker build -t mobythewhale/my-private-repo .
   [+] Building 1.2s (5/5) FINISHED
   => [internal] load build definition from Dockerfile
   => => transferring dockerfile: 110B
   => [internal] load .dockerignore
   => => transferring context: 2B
   => [internal] load metadata for docker.io/library/busybox:latest
   => CACHED [1/1] FROM docker.io/library/busybox@sha256:a9286defaba7n3a519
   => exporting to image
   => => exporting layers
   => => writing image sha256:dcdb1fd928bf257bfc0122ea47accd911a3a386ce618
   => => naming to docker.io/mobythewhale/my-private-repo
   $ docker run mobythewhale/my-private-repo
   Hello world! This is my first Docker image.
   $ docker push mobythewhale/my-private-repo
   The push refers to repository [docker.io/mobythewhale/my-private-repo]
   d2421964bad1: Layer already exists
   latest: digest: sha256:7604fbf8eeb03d866fd005fa95cdbb802274bf9fa51f7dafba6658294
   efa9baa size: 526
   ```
@y
   ```console
   $ cat > Dockerfile <<EOF
   FROM busybox
   CMD echo "Hello world! This is my first Docker image."
   EOF
   $ docker build -t mobythewhale/my-private-repo .
   [+] Building 1.2s (5/5) FINISHED
   => [internal] load build definition from Dockerfile
   => => transferring dockerfile: 110B
   => [internal] load .dockerignore
   => => transferring context: 2B
   => [internal] load metadata for docker.io/library/busybox:latest
   => CACHED [1/1] FROM docker.io/library/busybox@sha256:a9286defaba7n3a519
   => exporting to image
   => => exporting layers
   => => writing image sha256:dcdb1fd928bf257bfc0122ea47accd911a3a386ce618
   => => naming to docker.io/mobythewhale/my-private-repo
   $ docker run mobythewhale/my-private-repo
   Hello world! This is my first Docker image.
   $ docker push mobythewhale/my-private-repo
   The push refers to repository [docker.io/mobythewhale/my-private-repo]
   d2421964bad1: Layer already exists
   latest: digest: sha256:7604fbf8eeb03d866fd005fa95cdbb802274bf9fa51f7dafba6658294
   efa9baa size: 526
   ```
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
    ![Tag created](images/index-tag.webp)
@y
    ![Tag created](images/index-tag.webp)
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
