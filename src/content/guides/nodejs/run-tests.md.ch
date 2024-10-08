%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Run Node.js tests in a container
linkTitle: Run your tests
@y
title: コンテナーでの Node.js テストの実行
linkTitle: テストの実行
@z

@x
keywords: node.js, node, test
description: Learn how to run your Node.js tests in a container.
@y
keywords: node.js, node, test
description: コンテナー内の Node.js テストを実行する方法を学びます。
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
開発チームによって、テストが意味するところはさまざまです。
ユニットテストがあり、インテグレーションテストがあり、エンドツーエンドテストがあります。
本ガイドでは Docker による開発およびビルド時におけるユニットテストの実行方法について見ていくことにします。
@z

@x
## Run tests when developing locally
@y
## ローカルでの開発時におけるテスト実行 {#run-tests-when-developing-locally}
@z

@x
The sample application already has the Jest package for running tests and has tests inside the `spec` directory. When developing locally, you can use Compose to run your tests.
@y
サンプルアプリケーションには、テストを実行するための Jest パッケージが既に含まれていて、`spec` ディレクトリにテスト関連のファイルがあります。
ローカルにおいて開発を行っているときには Compose を使ってテストを実行することができます。
@z

@x
Run the following command to run the test script from the `package.json` file inside a container.
@y
コンテナー内部には `package.json` ファイルがあります。
その中のテストスクリプトを実行するために以下のコマンドを実行します。
@z

% snip command...

@x
To learn more about the command, see [docker compose run](/reference/cli/docker/compose/run/).
@y
上のコマンドの詳細については [docker compose run](__SUBDIR__/reference/cli/docker/compose/run/) を参照してください。
@z

@x
You should see output like the following.
@y
上のコマンドの出力は以下のようになるはずです。
@z

% snip output...

@x
## Run tests when building
@y
## ビルド時におけるテスト実行 {#run-tests-when-building}
@z

@x
To run your tests when building, you need to update your Dockerfile to add a new test stage.
@y
ビルド時にテストを実行するには、Dockerfile を修正してテストステージを新たに付け加える必要があります。
@z

@x
The following is the updated Dockerfile.
@y
以下がその修正を行った Dockerfile です。
@z

% snip code...

@x
Instead of using `CMD` in the test stage, use `RUN` to run the tests. The reason is that the `CMD` instruction runs when the container runs, and the `RUN` instruction runs when the image is being built and the build will fail if the tests fail.
@y
テストステージにおいては `CMD` の代わりに `RUN` を使ってテストを実行します。
こうする理由は、`CMD` 命令がコンテナーの実行時に起動されるものですが、`RUN` 明理恵はイメージのビルド時に実行されるものであるからです。
しかもテストに失敗した場合はビルドも失敗することになります。
@z

@x
Run the following command to build a new image using the test stage as the target and view the test results. Include `--progress=plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target test` to target the test stage.
@y
以下のようなコマンドを実行することで、テストステージをターゲットとした新たなイメージをビルドします。
テスト結果をそこから確認します。
`--progress=plain` をつけるのは、ビルド出力を確認するものです。
また `--no-cache` はテストが必ず実行されるようにするものであり、`--target test` はテストステージをターゲットとするものです。
@z

% snip command...

@x
You should see output containing the following.
@y
上のコマンドの出力は以下のようになるはずです。
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
本節では、ローカル環境での開発時に Compose を使ってテスト実行する方法について、またイメージビルド時にテスト実行する方法について学びました。
@z

@x
Related information:
@y
関連情報
@z

@x
- [docker compose run](/reference/cli/docker/compose/run/)
@y
- [docker compose run](__SUBDIR__/reference/cli/docker/compose/run/)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Next, you’ll learn how to set up a CI/CD pipeline using GitHub Actions.
@y
次は GitHub アクションを使った CI/CD パイプラインの設定方法について学びます。
@z
