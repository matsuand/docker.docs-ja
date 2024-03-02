%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。

@x
title: Run Node.js tests in a container
keywords: node.js, node, test
description: Learn how to run your Node.js tests in a container.
@y
title: コンテナーでの Node.js テストの実行
keywords: node.js, node, test
description: Learn how to run your Node.js tests in a container.
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Complete all the previous sections of this guide, starting with [Containerize a Node.js application](containerize.md).
@y
本ガイドの [Node.js アプリケーションのコンテナー化](containerize.md) から始まる前節までを完了していること。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
Testing is an essential part of modern software development. Testing can mean a
lot of things to different development teams. There are unit tests, integration
tests and end-to-end testing. In this guide you take a look at running your unit
tests in Docker when developing and when building.
@y
テストというものは、現代のソフトウェア開発においては重要な工程です。
Testing can mean a
lot of things to different development teams. There are unit tests, integration
tests and end-to-end testing. In this guide you take a look at running your unit
tests in Docker when developing and when building.
@z

@x
## Run tests when developing locally
@y
## Run tests when developing locally
@z

@x
The sample application already has the Jest package for running tests and has tests inside the `spec` directory. When developing locally, you can use Compose to run your tests.
@y
The sample application already has the Jest package for running tests and has tests inside the `spec` directory. When developing locally, you can use Compose to run your tests.
@z

@x
Run the following command to run the test script from the `package.json` file inside a container.
@y
Run the following command to run the test script from the `package.json` file inside a container.
@z

% snip command...

@x
To learn more about the command, see [docker compose run](/reference/cli/docker/compose/run/).
@y
To learn more about the command, see [docker compose run](__SUBDIR__/reference/cli/docker/compose/run/).
@z

@x
You should see output like the following.
@y
You should see output like the following.
@z

% snip output...

@x
## Run tests when building
@y
## Run tests when building
@z

@x
To run your tests when building, you need to update your Dockerfile to add a new test stage.
@y
To run your tests when building, you need to update your Dockerfile to add a new test stage.
@z

@x
The following is the updated Dockerfile.
@y
The following is the updated Dockerfile.
@z

% snip code...

@x
Instead of using `CMD` in the test stage, use `RUN` to run the tests. The reason is that the `CMD` instruction runs when the container runs, and the `RUN` instruction runs when the image is being built and the build will fail if the tests fail.
@y
Instead of using `CMD` in the test stage, use `RUN` to run the tests. The reason is that the `CMD` instruction runs when the container runs, and the `RUN` instruction runs when the image is being built and the build will fail if the tests fail.
@z

@x
Run the following command to build a new image using the test stage as the target and view the test results. Include `--progress=plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target test` to target the test stage.
@y
Run the following command to build a new image using the test stage as the target and view the test results. Include `--progress=plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target test` to target the test stage.
@z

% snip command...

@x
To learn more about building and running tests, see the [Build with Docker guide](../../build/guide/_index.md).
@y
To learn more about building and running tests, see the [Build with Docker guide](../../build/guide/_index.md).
@z

@x
You should see output containing the following.
@y
You should see output containing the following.
@z

% snip output...

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how to run tests when developing locally using Compose and how to run tests when building your image.
@y
In this section, you learned how to run tests when developing locally using Compose and how to run tests when building your image.
@z

@x
Related information:
 - [docker compose run](/reference/cli/docker/compose/run/)
 - [Build with Docker guide](../../build/guide/index.md)
@y
関連情報
 - [docker compose run](__SUBDIR__/reference/cli/docker/compose/run/)
 - [Build with Docker guide](../../build/guide/index.md)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Next, you’ll learn how to set up a CI/CD pipeline using GitHub Actions.
@y
Next, you’ll learn how to set up a CI/CD pipeline using GitHub Actions.
@z

@x
{{< button text="Configure CI/CD" url="configure-ci-cd.md" >}}
@y
{{< button text="CI/CD の設定" url="configure-ci-cd.md" >}}
@z
