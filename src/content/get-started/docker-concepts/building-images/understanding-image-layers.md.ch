%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Understanding the image layers
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you about the layers of container image.
@y
title: イメージレイヤーの理解
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you about the layers of container image.
@z

% snip youtube...

@x
## Explanation
@y
## 内容説明 {#explanation}
@z

@x
As you learned in [What is an image?](../the-basics/what-is-an-image/), container images are composed of layers. And each of these layers, once created, are immutable. But, what does that actually mean? And how are those layers used to create the filesystem a container can use?
@y
[コンテナーとは?](../the-basics/what-is-an-image/) において学んだように、コンテナーイメージは数々のレイヤーから構成されます。
ひとたびレイヤーが作り出されると、それ以降は不変です。
さてこれは実際には何を意味するのでしょう？
このレイヤーは、どのようにしてコンテナーが利用するファイルシステムを作り出すのでしょう？
@z

@x
### Image layers
@y
### イメージレイヤー {#image-layers}
@z

@x
Each layer in an image contains a set of filesystem changes - additions, deletions, or modifications. Let’s look at a theoretical image:
@y
イメージ内にある各レイヤーには、ファイルシステムへの変更、つまり追加、削除、修正といった内容が含まれています。
では理論的にイメージを考えていきます。
@z

@x
1. The first layer adds basic commands and a package manager, such as apt.
2. The second layer installs a Python runtime and pip for dependency management.
3. The third layer copies in an application’s specific requirements.txt file.
4. The fourth layer installs that application’s specific dependencies.
5. The fifth layer copies in the actual source code of the application.
@y
1. 1 つめのレイヤーでは、基本コマンドと apt のようなパッケージマネージャーを追加します。
2. 2 つめのレイヤーでは、Python ランタイムと依存パッケージ管理を行う pip をインストールします。
3. 3 つめのレイヤーでは、アプリケーションに固有の requirements.txt ファイルをコピーします。
4. 4 つめのレイヤーでは、アプリケーションの依存パッケージをインストールします。
5. 5 つめのレイヤーでは、そのアプリケーションのソースコードをコピーします。
@z

@x
This example might look like:
@y
この例は以下のようになります。
@z

@x
![screenshot of the flowchart showing the concept of the image layers](images/container_image_layers.webp?border=true)
@y
![イメージレイヤーの考え方を示すフローチャートのスクリーンショット](images/container_image_layers.webp?border=true)
@z

@x
This is beneficial because it allows layers to be reused between images. For example, imagine you wanted to create another Python application. Due to layering, you can leverage the same Python base. This will make builds faster and reduce the amount of storage and bandwidth required to distribute the images. The image layering might look similar to the following:
@y
この形はイメージ間においてレイヤーを再利用できるものとして優れています。
たとえば別の Python アプリケーションを生成することを考えてみればわかります。
レイヤーに分けているからこそ、Python のベース部分を共有できます。
こうすればビルド時間はより早くなり、イメージを配布する際のストレージ容量や帯域幅を減らすことができます。
イメージレイヤーの様子は、以下のように示すこともできます。
@z

@x
![screenshot of the flowchart showing the benefits of the image layering](images/container_image_layer_reuse.webp?border=true)
@y
![イメージレイヤーの優位性を示すフローチャートのスクリーンショット](images/container_image_layer_reuse.webp?border=true)
@z

@x
Layers let you extend images of others by reusing their base layers, allowing you to add only the data that your application needs.
@y
レイヤーに分けているので、ベースとなっているレイヤーを再利用したイメージの拡張が可能です。
この場合は、アプリケーションが必要としているデータを追加するだけです。
@z

@x
### Stacking the layers
@y
### 積み上がったレイヤーの様子 {#stacking-the-layers}
@z

@x
Layering is made possible by content-addressable storage and union filesystems. While this will get technical, here’s how it works:
@y
レイヤー化は、コンテンツのアドレス指定可能なストレージとユニオンファイルシステムを用いることで実現されます。
これは少々技術的な話になりますが、どのように機能しているのかをここに説明します。
@z

@x
1. After each layer is downloaded, it is extracted into its own directory on the host filesystem. 
2. When you run a container from an image, a union filesystem is created where layers are stacked on top of each other, creating a new and unified view.
3. When the container starts, its root directory is set to the location of this unified directory, using `chroot`.
@y
1. 各レイヤーがダウンロードされると、ホストのファイルシステム上の所定のディレクトリごとに展開されます。
2. イメージからコンテナーを実行すると、各レイヤーが積み重なったその上部に、ユニオンファイルシステムが生成され、新たにそれらが統合されたディレクトリビューが生成されます。
3. コンテナーが実行されると、ルートディレクトリは `chroot` を用いてその統合されたディレクトリに設定されます。
@z

@x
When the union filesystem is created, in addition to the image layers, a directory is created specifically for the running container. This allows the container to make filesystem changes while allowing the original image layers to remain untouched. This enables you to run multiple containers from the same underlying image.
@y
ユニオンファイルシステムが生成されると、イメージレイヤーとは別に、コンテナー実行用としてのディレクトリが生成されます。
このディレクトリを使うことで、コンテナーからのファイルシステムの変更が可能になります。
その場合に、オリジナルのイメージレイヤーは不変のままです。
この仕組みを使えば、同一のイメージから作り出されたコンテナーを複数実行することが可能になります。
@z

@x
## Try it out
@y
## やってみよう {#Try-it-out}
@z

@x
In this hands-on guide, you will create new image layers manually using the [`docker container commit`](https://docs.docker.com/reference/cli/docker/container/commit/) command. Note that you’ll rarely create images this way, as you’ll normally [use a Dockerfile](./writing-a-dockerfile.md). But, it makes it easier to understand how it’s all working.
@y
このハンズオンガイドでは [`docker container commit`](https://docs.docker.com/reference/cli/docker/container/commit/) コマンドを使って、新たなイメージレイヤーを手動で生成します。
なおこのようにしてイメージを生成することは、まずありません。
普通なら [Dockerfile](./writing-a-dockerfile.md) を利用します。
これを行う目的は、どのように動作しているのかを簡単に理解できるようにするためです。
@z

@x
### Create a base image
@y
### ベースイメージの生成 {#create-a-base-image}
@z

@x
In this first step, you will create your own base image that you will then use for the following steps.
@y
はじめのステップとして、ここからの作業に利用するベースイメージの生成を行います。
@z

@x
1. [Download and install](https://www.docker.com/products/docker-desktop/) Docker Desktop.
@y
1. Docker Desktop を [ダウンロードおよびインストール](https://www.docker.com/products/docker-desktop/) します。
@z

@x
2. In a terminal, run the following command to start a new container:
@y
2. 端末画面から以下のコマンドを実行して新たなコンテナーを起動します。
@z

% snip command...

@x
    Once the image has been downloaded and the container has started, you should see a new shell prompt. This is running inside your container. It will look similar to the following (the container ID will vary):
@y
    対応するイメージがダウンロードされコンテナーが起動すると、新たなシェルプロンプトが表示されるはずです。
    これはコンテナー内部です。
    以下のような表示になっているでしょう (コンテナー ID は異なっているはずです)。
@z

% snip command...

@x
3. Inside the container, run the following command to install Node.js:
@y
3. コンテナーの中において以下のコマンドを実行して Node.js をインストールします。
@z

% snip command...

@x
    When this command runs, it downloads and installs Node inside the container. In the context of the union filesystem, these filesystem changes occur within the directory unique to this container. 
@y
    このコマンドが実行されると Node のダウンロードとインストールがコンテナー内部において行われます。
    ユニオンファイルシステムの中での変更は、このコンテナーに固有に割り当てられたディレクトリに対して行われます。
@z

@x
4. Validate if Node is installed by running the following command:
@y
4. Node がインストールされたことを確認するために以下を実行します。
@z

% snip command...

@x
    You should then see a “Hello world!” appear in the console.
@y
    端末画面に “Hello world!”が表示されたはずです。
@z

@x
5. Now that you have Node installed, you’re ready to save the changes you’ve made as a new image layer, from which you can start new containers or build new images. To do so, you will use the [`docker container commit`](https://docs.docker.com/reference/cli/docker/container/commit/) command. Run the following command in a new terminal:
@y
5. Now that you have Node installed, you’re ready to save the changes you’ve made as a new image layer, from which you can start new containers or build new images. To do so, you will use the [`docker container commit`](https://docs.docker.com/reference/cli/docker/container/commit/) command. Run the following command in a new terminal:
@z

% snip command...

@x
6. View the layers of your image using the `docker image history` command:
@y
6. View the layers of your image using the `docker image history` command:
@z

% snip command...

@x
    You will see output similar to the following:
@y
    You will see output similar to the following:
@z

% snip output...

@x
    Note the “Add node” comment on the top line. This layer contains the Node.js install you just made.
@y
    Note the “Add node” comment on the top line. This layer contains the Node.js install you just made.
@z

@x
7. To prove your image has Node installed, you can start a new container using this new image:
@y
7. To prove your image has Node installed, you can start a new container using this new image:
@z

% snip command...

@x
    With that, you should get a “Hello again” output in the terminal, showing Node was installed and working.
@y
    With that, you should get a “Hello again” output in the terminal, showing Node was installed and working.
@z

@x
8. Now that you’re done creating your base image, you can remove that container:
@y
8. Now that you’re done creating your base image, you can remove that container:
@z

% snip command...

@x
> **Base image definition**
>
> A base image is a foundation for building other images. It's possible to use any images as a base image. However, some images are intentionally created as building blocks, providing a foundation or starting point for an application.
>
> In this example, you probably won’t deploy this `node-base` image, as it doesn’t actually do anything yet. But it’s a base you can use for other builds.
@y
> **Base image definition**
>
> A base image is a foundation for building other images. It's possible to use any images as a base image. However, some images are intentionally created as building blocks, providing a foundation or starting point for an application.
>
> In this example, you probably won’t deploy this `node-base` image, as it doesn’t actually do anything yet. But it’s a base you can use for other builds.
@z

@x
### Build an app image
@y
### アプリイメージのビルド {#build-an-app-image}
@z

@x
Now that you have a base image, you can extend that image to build additional images.
@y
Now that you have a base image, you can extend that image to build additional images.
@z

@x
1. Start a new container using the newly created node-base image:
@y
1. Start a new container using the newly created node-base image:
@z

% snip command...

@x
2. Inside of this container, run the following command to create a Node program:
@y
2. Inside of this container, run the following command to create a Node program:
@z

% snip command...

@x
    To run this Node program, you can use the following command and see the message printed on the screen:
@y
    To run this Node program, you can use the following command and see the message printed on the screen:
@z

% snip command...

@x
3. In another terminal, run the following command to save this container’s changes as a new image:
@y
3. In another terminal, run the following command to save this container’s changes as a new image:
@z

% snip command...

@x
    This command not only creates a new image named `sample-app`, but also adds additional configuration to the image to set the default command when starting a container. In this case, you are setting it to automatically run `node app.js`.
@y
    This command not only creates a new image named `sample-app`, but also adds additional configuration to the image to set the default command when starting a container. In this case, you are setting it to automatically run `node app.js`.
@z

@x
4. In a terminal outside of the container, run the following command to view the updated layers:
@y
4. In a terminal outside of the container, run the following command to view the updated layers:
@z

% snip command...

@x
    You’ll then see output that looks like the following. Note the top layer comment has “Add app” and the next layer has “Add node”:
@y
    You’ll then see output that looks like the following. Note the top layer comment has “Add app” and the next layer has “Add node”:
@z

% snip output...

@x
5. Finally, start a new container using the brand new image. Since you specified the default command, you can use the following command:
@y
5. Finally, start a new container using the brand new image. Since you specified the default command, you can use the following command:
@z

% snip command...

@x
    You should see your greeting appear in the terminal, coming from your Node program.
@y
    You should see your greeting appear in the terminal, coming from your Node program.
@z

@x
6. Now that you’re done with your containers, you can remove them using the following command:
@y
6. Now that you’re done with your containers, you can remove them using the following command:
@z

% snip command...

@x
## Additional resources
@y
## さらなる情報 {#additional-resources}
@z

@x
If you’d like to dive deeper into the things you learned, check out the following resources:
@y
If you’d like to dive deeper into the things you learned, check out the following resources:
@z

@x
* [`docker image history`](/reference/cli/docker/image/history/)
* [`docker container commit`](/reference/cli/docker/container/commit/)
@y
* [`docker image history`](__SUBDIR__/reference/cli/docker/image/history/)
* [`docker container commit`](__SUBDIR__/reference/cli/docker/container/commit/)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
As hinted earlier, most image builds don’t use `docker container commit`. Instead, you’ll use a Dockerfile which automates these steps for you.
@y
As hinted earlier, most image builds don’t use `docker container commit`. Instead, you’ll use a Dockerfile which automates these steps for you.
@z

@x
{{< button text="Writing a Dockerfile" url="writing-a-dockerfile" >}}
@y
{{< button text="Dockerfile の書き方" url="writing-a-dockerfile" >}}
@z
