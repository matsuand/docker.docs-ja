%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Run PHP tests in a container
linkTitle: Run your tests
@y
title: コンテナーでの PHP テストの実行
linkTitle: テストの実行
@z

@x
keywords: php, test
description: Learn how to run your PHP tests in a container.
@y
keywords: php, test
description: コンテナー内の PHP テストを実行する方法を学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Complete all the previous sections of this guide, starting with [Containerize a PHP application](containerize.md).
@y
本ガイドの [PHP アプリケーションのコンテナー化](containerize.md) から始まる前節までを完了していること。
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
The sample application already has a PHPUnit test inside the `tests` directory. When developing locally, you can use Compose to run your tests.
@y
サンプルアプリケーションには、テストを実行するための PHPUnit テストが既に含まれていて、`tests` ディレクトリにあります。
ローカルにおいて開発を行っているときには Compose を使ってテストを実行することができます。
@z

@x
Run the following command in the `docker-php-sample` directory to run the tests inside a container.
@y
`docker-php-sample` ディレクトリにおいて以下のコマンドを入力して、コンテナー内部にてテストを実行します。
@z

% snip command...

@x
You should see output that contains the following.
@y
以下のような出力が得られるはずです。
@z

% snip output ...

@x
To learn more about the command, see [docker compose run](/reference/cli/docker/compose/run/).
@y
コマンドの詳細については [docker compose run](__SUBDIR__/reference/cli/docker/compose/run/) を参照してください。
@z

@x
## Run tests when building
@y
## ビルド時のテスト実行 {#run-tests-when-building}
@z

@x
To run your tests when building, you need to update your Dockerfile. Create a new test stage that runs the tests.
@y
ビルド時にテストを実行するには、Dockerfile を修正する必要があります。
テストを実行するためには、新たなテストステージの生成が必要です。
@z

@x
The following is the updated Dockerfile.
@y
修正した Dockerfile ファイルは以下です。
@z

% snip code...

@x
Run the following command to build an image using the test stage as the target and view the test results. Include `--progress plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target test` to target the test stage.
@y
以下のコマンドを実行します。
これは、テスト対象としてまたテスト結果を見るためのステージとしてテストステージを利用し、イメージをビルドするものです。
`--progress=plain` を加えることでビルド結果を確認します。
`--no-cache` は常にテストを実行させるためのものです。
`--target test` はテストステージをターゲットとします。
@z

% snip command...

@x
You should see output containing the following.
@y
以下のような出力が得られます。
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
この節では Compose を使ったローカル開発におけるテスト実行方法について学びました。
そしてイメージビルド時にテストを実行する方法についても学びました。
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
次は GitHub アクションをつかって CI/CD パイプラインを設定する方法について学びます。
@z
