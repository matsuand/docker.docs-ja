%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: What is a container?
keywords: get started, quick start, intro, concepts
description: Learn what a container is by seeing and inspecting a running container.
aliases:
- /get-started/what-is-a-container/
---
@y
---
title: コンテナーとは何か
keywords: get started, quick start, intro, concepts
description: Learn what a container is by seeing and inspecting a running container.
aliases:
- /get-started/what-is-a-container/
---
@z

@x
A container is an isolated environment for your code. This means that a
container has no knowledge of your operating system, or your files. It runs on
the environment provided to you by Docker Desktop. Containers have everything
that your code needs in order to run, down to a base operating system. You can
use Docker Desktop to manage and explore your containers.
@y
コンテナーとは、開発コードに対しての独立した環境のことです。
これが何を意味するかと言えば、コンテナーにとってオペレーティングシステムやファイルなどは、何も知らないということです。
コンテナーは Docker Desktop を通じて、その環境が実行されます。
コンテナーには、コードから基本オペレーティングシステムに至るまでの、実行に必要なものがすべて含まれます。
Docker Desktop を使えば、コンテナーの管理や操作がすべて可能です。
@z

@x
In this walkthrough, you'll view and explore an actual container in Docker
Desktop.
@y
このウォークスルーでは、Docker Desktop 内に実際にコンテナーを作って、それを見ていくことにしましょう。
@z

@x
{{< include "guides-get-docker.md" >}}
@y
{{< include "guides-get-docker.md" >}}
@z

@x
## Step 1: Set up the walkthrough
@y
## 手順 1: ウォークスルーの準備 {#step-1-set-up-the-walkthrough }
@z

@x
The first thing you need is a running container. Use the following instructions to run a container.
@y
The first thing you need is a running container. Use the following instructions to run a container.
@z

@x
1. Open Docker Desktop and select the search.
2. Specify `docker/welcome-to-docker` in the search and then select **Run**.
3. Expand the **Optional settings**.
4. In **Container name**, specify `welcome-to-docker`.
5. In **Host port**, specify `8088`.
   ![Specifying host port 8088](images/getting-started-setup.webp?w=500&border=true)
6. Select **Run**.
@y
1. Open Docker Desktop and select the search.
2. Specify `docker/welcome-to-docker` in the search and then select **Run**.
3. Expand the **Optional settings**.
4. In **Container name**, specify `welcome-to-docker`.
5. In **Host port**, specify `8088`.
   ![Specifying host port 8088](images/getting-started-setup.webp?w=500&border=true)
6. Select **Run**.
@z

@x
## Step 2: View containers on Docker Desktop
@y
## 手順 2: Docker Desktop 上でのコンテナー参照 {#step-2-view-containers-on-docker-desktop}
@z

@x
You just ran a container! You can view it in the **Containers** tab of Docker
Desktop. This container runs a simple web server that displays a simple website.
When working with more complex projects, you'll run different parts in different
containers. For example, a different container for the frontend, backend, and
database. In this walkthrough, you only have a simple frontend container.
@y
You just ran a container! You can view it in the **Containers** tab of Docker
Desktop. This container runs a simple web server that displays a simple website.
When working with more complex projects, you'll run different parts in different
containers. For example, a different container for the frontend, backend, and
database. In this walkthrough, you only have a simple frontend container.
@z

@x
## Step 3: View the frontend
@y
## Step 3: View the frontend
@z

@x
The frontend is accessible on port 8088 of your local host. Select the link in
the **Port(s)** column of your container, or visit
[http://localhost:8088](http://localhost:8088) in your browser to view it.
@y
The frontend is accessible on port 8088 of your local host. Select the link in
the **Port(s)** column of your container, or visit
[http://localhost:8088](http://localhost:8088) in your browser to view it.
@z

@x
![Accessing container frontend from Docker Desktop](images/getting-started-frontend.webp?border=true)
@y
![Accessing container frontend from Docker Desktop](images/getting-started-frontend.webp?border=true)
@z

@x
## Step 4: Explore your container
@y
## Step 4: Explore your container
@z

@x
Docker Desktop lets you easily view and interact with different aspects of your
container. Try it out yourself. Select your container and then select **Files**
to explore your container's isolated file system.
@y
Docker Desktop lets you easily view and interact with different aspects of your
container. Try it out yourself. Select your container and then select **Files**
to explore your container's isolated file system.
@z

@x
![Viewing container details in Docker Desktop](images/getting-started-explore-container.webp?border=true)
@y
![Viewing container details in Docker Desktop](images/getting-started-explore-container.webp?border=true)
@z

@x
## Step 5: Stop your container
@y
## 手順 5: コンテナーの停止 {#step-5-stop-your-container}
@z

@x
The `welcome-to-docker` container continues to run until you stop it. To stop
the container in Docker Desktop, go to the **Containers** tab and select the
**Stop** icon in the **Actions** column of your container.
@y
The `welcome-to-docker` container continues to run until you stop it. To stop
the container in Docker Desktop, go to the **Containers** tab and select the
**Stop** icon in the **Actions** column of your container.
@z

@x
![Stopping a container in Docker Desktop](images/getting-started-stop.webp?border=true)
@y
![Stopping a container in Docker Desktop](images/getting-started-stop.webp?border=true)
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this walkthrough, you ran a pre-made image and explored a container. In addition to running pre-made images, you can build and run your own application as container.
@y
In this walkthrough, you ran a pre-made image and explored a container. In addition to running pre-made images, you can build and run your own application as container.
@z

@x
Related information:
@y
関連情報
@z

@x
- Read more about containers in [Use containers to Build, Share and Run your applications](https://www.docker.com/resources/what-container/)
- Deep dive in Liz Rice's [Containers from Scratch](https://www.youtube.com/watch?v=8fi7uSYlOdc&t=1s) video presentation
@y
- Read more about containers in [Use containers to Build, Share and Run your applications](https://www.docker.com/resources/what-container/)
- Deep dive in Liz Rice's [Containers from Scratch](https://www.youtube.com/watch?v=8fi7uSYlOdc&t=1s) video presentation
@z

@x
## Next steps
@y
## 次のステップ {#next-step}
@z

@x
Continue to the next walkthrough to learn what you need to create your own image
and run it as container.
@y
Continue to the next walkthrough to learn what you need to create your own image
and run it as container.
@z

@x
{{< button url="./run-a-container.md" text="How do I run a container?" >}}
@y
{{< button url="./run-a-container.md" text="コンテナーの起動方法" >}}
@z
