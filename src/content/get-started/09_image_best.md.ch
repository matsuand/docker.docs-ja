%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Image-building best practices
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Tips for building images for your application
@y
title: イメージビルドのベストプラクティス
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop
description: Tips for building images for your application
@z

@x
## Image layering
@y
## イメージのレイヤー構成 {#image-layering}
@z

@x
Using the `docker image history` command, you can see the command that was used
to create each layer within an image.
@y
`docker image history` コマンドを実行すると、イメージ内の各レイヤーを生成するために実行されたコマンドを確認できます。
@z

@x
1. Use the `docker image history` command to see the layers in the `getting-started` image you
   created.
@y
1. `docker image history` コマンドを実行して、ここまでに生成した `getting-started` イメージの各レイヤーを確認します。
@z

% snip command...

@x
    You should get output that looks something like the following.
@y
    以下に示すような出力が得られるはずです。
@z

% snip output...

@x
    Each of the lines represents a layer in the image. The display here shows the base at the bottom with
    the newest layer at the top. Using this, you can also quickly see the size of each layer, helping 
    diagnose large images.
@y
    各行はイメージ内のレイヤーを表しています。
    上の表示例において、ベースレイヤーが最下段に、また最後に生成されたレイヤーが最上段に示されています。
    このコマンド出力を見れば、各レイヤーのサイズがすぐにわかるため、大規模なイメージを診断する際に役立てることができます。
@z

@x
2. You'll notice that several of the lines are truncated. If you add the `--no-trunc` flag, you'll get the
   full output.
@y
2. 上を見てわかるように、何行かは後ろが省略表示されています。
   `--no-trunc` フラグをつければ、すべてを表示した出力を得ることができます。
@z

% snip command...

@x
## Layer caching
@y
## レイヤーのキャッシュ処理 {#layer-caching}
@z

@x
Now that you've seen the layering in action, there's an important lesson to learn to help decrease build
times for your container images. Once a layer changes, all downstream layers have to be recreated as well.
@y
レイヤーが構成されている様子を実際に確認したので、そこからさらに重要な知識として、コンテナーイメージのビルド時間が短縮される処理について学びます。
レイヤーへの変更が行われると、それにともなって構成されているレイヤーの再生成が行われます。
@z

@x
Look at the following Dockerfile you created for the getting started app.
@y
「はじめよう」のところで生成したアプリの Dockerfile を確認してみます。
@z

% snip code...

@x
Going back to the image history output, you see that each command in the Dockerfile becomes a new layer in the image.
You might remember that when you made a change to the image, the yarn dependencies had to be reinstalled. It doesn't make much sense to ship around the same dependencies every time you build.
@y
イメージ履歴の出力に戻って確認してみると、Dockerfile 内の各コマンドが、イメージ内のより新しいレイヤーとして生成されていることがわかります。
以前の処理を覚えていると思いますが、イメージに対しての修正を行ったら、yarn による依存パッケージの再インストールが必要になっていました。
ただしビルドのたびに同じ依存パッケージをインストールしなければならないのは、どうにも無意味なことです。
@z

@x
To fix it, you need to restructure your Dockerfile to help support the caching
of the dependencies. For Node-based applications, those dependencies are defined
in the `package.json` file. You can copy only that file in first, install the
dependencies, and then copy in everything else. Then, you only recreate the yarn
dependencies if there was a change to the `package.json`.
@y
To fix it, you need to restructure your Dockerfile to help support the caching
of the dependencies. For Node-based applications, those dependencies are defined
in the `package.json` file. You can copy only that file in first, install the
dependencies, and then copy in everything else. Then, you only recreate the yarn
dependencies if there was a change to the `package.json`.
@z

@x
1. Update the Dockerfile to copy in the `package.json` first, install dependencies, and then copy everything else in.
@y
1. Update the Dockerfile to copy in the `package.json` first, install dependencies, and then copy everything else in.
@z

% snip code...

@x
2. Create a file named `.dockerignore` in the same folder as the Dockerfile with the following contents.
@y
2. Create a file named `.dockerignore` in the same folder as the Dockerfile with the following contents.
@z

% snip code...

@x
    `.dockerignore` files are an easy way to selectively copy only image relevant files.
    You can read more about this
    [here](../build/building/context.md#dockerignore-files).
    In this case, the `node_modules` folder should be omitted in the second `COPY` step because otherwise,
    it would possibly overwrite files which were created by the command in the `RUN` step.
@y
    `.dockerignore` files are an easy way to selectively copy only image relevant files.
    You can read more about this
    [here](../build/building/context.md#dockerignore-files).
    In this case, the `node_modules` folder should be omitted in the second `COPY` step because otherwise,
    it would possibly overwrite files which were created by the command in the `RUN` step.
@z

@x
3. Build a new image using `docker build`.
@y
3. Build a new image using `docker build`.
@z

% snip command...

@x
    You should see output like the following.
@y
    You should see output like the following.
@z

% snip output...

@x
4. Now, make a change to the `src/static/index.html` file. For example, change the `<title>` to "The Awesome Todo App".
@y
4. Now, make a change to the `src/static/index.html` file. For example, change the `<title>` to "The Awesome Todo App".
@z

@x
5. Build the Docker image now using `docker build -t getting-started .` again. This time, your output should look a little different.
@y
5. Build the Docker image now using `docker build -t getting-started .` again. This time, your output should look a little different.
@z

% snip output...

@x
    First off, you should notice that the build was much faster. And, you'll see
    that several steps are using previously cached layers. Pushing and pulling
    this image and updates to it will be much faster as well. 
@y
    First off, you should notice that the build was much faster. And, you'll see
    that several steps are using previously cached layers. Pushing and pulling
    this image and updates to it will be much faster as well. 
@z

@x
## Multi-stage builds
@y
## Multi-stage builds
@z

@x
Multi-stage builds are an incredibly powerful
tool to help use multiple stages to create an image. There are several advantages for them:
@y
Multi-stage builds are an incredibly powerful
tool to help use multiple stages to create an image. There are several advantages for them:
@z

@x
- Separate build-time dependencies from runtime dependencies
- Reduce overall image size by shipping only what your app needs to run
@y
- Separate build-time dependencies from runtime dependencies
- Reduce overall image size by shipping only what your app needs to run
@z

@x
### Maven/Tomcat example
@y
### Maven/Tomcat example
@z

@x
When building Java-based applications, you need a JDK to compile the source code to Java bytecode. However,
that JDK isn't needed in production. Also, you might be using tools like Maven or Gradle to help build the app.
Those also aren't needed in your final image. Multi-stage builds help.
@y
When building Java-based applications, you need a JDK to compile the source code to Java bytecode. However,
that JDK isn't needed in production. Also, you might be using tools like Maven or Gradle to help build the app.
Those also aren't needed in your final image. Multi-stage builds help.
@z

% snip code...

@x
In this example, you use one stage (called `build`) to perform the actual Java build using Maven. In the second
stage (starting at `FROM tomcat`), you copy in files from the `build` stage. The final image is only the last stage
being created, which can be overridden using the `--target` flag.
@y
In this example, you use one stage (called `build`) to perform the actual Java build using Maven. In the second
stage (starting at `FROM tomcat`), you copy in files from the `build` stage. The final image is only the last stage
being created, which can be overridden using the `--target` flag.
@z

@x
### React example
@y
### React example
@z

@x
When building React applications, you need a Node environment to compile the JS code (typically JSX), SASS stylesheets,
and more into static HTML, JS, and CSS. If you aren't doing server-side rendering, you don't even need a Node environment
for your production build. You can ship the static resources in a static nginx container.
@y
When building React applications, you need a Node environment to compile the JS code (typically JSX), SASS stylesheets,
and more into static HTML, JS, and CSS. If you aren't doing server-side rendering, you don't even need a Node environment
for your production build. You can ship the static resources in a static nginx container.
@z

% snip code...

@x
In the previous Dockerfile example, it uses the `node:18` image to perform the build (maximizing layer caching) and then copies the output
into an nginx container.
@y
In the previous Dockerfile example, it uses the `node:18` image to perform the build (maximizing layer caching) and then copies the output
into an nginx container.
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned a few image building best practices, including layer caching and multi-stage builds.
@y
In this section, you learned a few image building best practices, including layer caching and multi-stage builds.
@z

@x
Related information:
 - [.dockerignore](../build/building/context.md#dockerignore-files)
 - [Dockerfile reference](../reference/dockerfile.md)
 - [Build with Docker guide](../build/guide/index.md)
 - [Dockerfile best practices](../develop/develop-images/dockerfile_best-practices.md)
@y
関連情報
 - [.dockerignore](../build/building/context.md#dockerignore-files)
 - [Dockerfile リファレンス](../reference/dockerfile.md)
 - [Docker を使ったビルドガイド](../build/guide/index.md)
 - [Dockerfile ベストプラクティス](../develop/develop-images/dockerfile_best-practices.md)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
In the next section, you'll learn about additional resources you can use to continue learning about containers.
@y
In the next section, you'll learn about additional resources you can use to continue learning about containers.
@z

@x
{{< button text="What next" url="11_what_next.md" >}}
@y
{{< button text="次は何？" url="11_what_next.md" >}}
@z
