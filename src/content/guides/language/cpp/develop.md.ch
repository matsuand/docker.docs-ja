%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Use containers for C++ development
linkTitle: Develop your app
@y
title: コンテナーを利用した C++ 開発
linkTitle: アプリの開発
@z

@x
keywords: C++, local, development
description: Learn how to develop your C++ application locally.
@y
keywords: C++, local, development
description: Learn how to develop your C++ application locally.
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Complete [Containerize a C++ application](containerize.md).
@y
[C++ アプリケーションのコンテナー化](containerize.md) を完了していること。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
@y
本節ではコンテナー化したアプリケーションに対する開発環境の構築方法を学びます。
ここでは以下を行います。
@z

@x
- Configuring Compose to automatically update your running Compose services as you edit and save your code
@y
- Compose の設定を通じて、コード編集および保存とともに、実行中の Compose サービスが自動的に更新されるようにします。
@z

@x
## Get the sample application
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
Clone the sample application to use with this guide. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@y
本ガイドで利用するサンプルアプリケーションをクローンします。
端末を開いて、作業場所としたいディレクトリに移動します。
そして以下のコマンドを実行してリポジトリをクローンします。
@z

% snip command...

@x
## Automatically update services
@y
## サービスの自動更新 {#automatically-update-services}
@z

@x
Use Compose Watch to automatically update your running Compose services as you
edit and save your code. For more details about Compose Watch, see [Use Compose
Watch](/manuals/compose/file-watch.md).
@y
Compose Watch を利用すると、自分が作成して実行している Compose サービスを自動的に更新できるようになります。
Compose Watch に関する詳細は [Use Compose Watch](manuals/compose/file-watch.md) を参照してください。
@z

@x
Open your `compose.yml` file in an IDE or text editor and then add the Compose Watch instructions. The following example shows how to add Compose Watch to your `compose.yml` file.
@y
IDE またはテキストエディターを使って `compose.yaml` ファイルを開きます。
そして Compose Watch 命令を追加します。
以下は `compose.yaml` ファイルに Compose Watch を追加する場所を示しています。
@z

% snip code...

@x
Run the following command to run your application with Compose Watch.
@y
以下のコマンドを実行することで、Compose Watch を利用したアプリケーションを実行します。
@z

% snip command...

@x
Now, if you modify your `ok_api.cpp` you will see the changes in real time without re-building the image.
@y
こうしておくことで `ok_api.cpp` を修正したときには、その変更をリアルタイムで確認できます。
イメージをわざわざ再ビルドする必要はありません。
@z

@x
To test it out, open the `ok_api.cpp` file in your favorite text editor and change the message from `{"Status" : "OK"}` to `{"Status" : "Updated"}`. Save the file and refresh your browser at [http://localhost:8080](http://localhost:8080). You should see the updated message.
@y
このことを確認するため、お好みのテキストエディターを使って `ok_api.cpp` ファイルを開きます。
そして出力メッセージを `{"Status" : "OK"}` から `{"Status" : "Updated"}` に変更します。
ファイルを保存し、[http://localhost:8080](http://localhost:8080) にアクセスしているブラウザーの表示更新を行います。
変更したメッセージが表示されるはずです。
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
端末画面から `ctrl`+`c` を押下してアプリケーションを停止します。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you also learned how to use Compose Watch to automatically rebuild and run your container when you update your code.
@y
本節では Compose Watch を使って、ソースコードの更新後に、イメージの自動的な再ビルドと実行の方法について学びました。
@z

@x
Related information:
 - [Compose file reference](/reference/compose-file/)
 - [Compose file watch](/manuals/compose/file-watch.md)
 - [Multi-stage builds](/manuals/build/building/multi-stage.md)
@y
関連情報
 - [Compose ファイルリファレンス](__SUBDIR__/reference/compose-file/)
 - [Compose file watch](manuals/compose/file-watch.md)
 - [マルチステージビルド](manuals/build/building/multi-stage.md)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
In the next section, you'll take a look at how to set up a CI/CD pipeline using GitHub Actions.
@y
次の節では、GitHub アクションを利用した CI/CD パイプラインの設定方法について見ていきます。
@z

@x
{{< button text="Configure CI/CD" url="configure-ci-cd.md" >}}
@y
{{< button text="CI/CD の設定" url="configure-ci-cd.md" >}}
@z
