%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Containerize a generative AI application
linkTitle: Containerize your app
@y
title: 生成 AI アプリケーションのコンテナー化
linkTitle: Containerize your app
@z

@x
keywords: python, generative ai, genai, llm, neo4j, ollama, containerize, intitialize, langchain, openai
description: Learn how to containerize a generative AI (GenAI) application.
@y
keywords: python, generative ai, genai, llm, neo4j, ollama, containerize, intitialize, langchain, openai
description: Learn how to containerize a generative AI (GenAI) application.
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
> [!NOTE]
>
> GenAI applications can often benefit from GPU acceleration. Currently Docker Desktop supports GPU acceleration only on [Windows with the WSL2 backend](/manuals/desktop/gpu.md#using-nvidia-gpus-with-wsl2). Linux users can also access GPU acceleration using a native installation of the [Docker Engine](/manuals/engine/install/_index.md).
@y
> [!NOTE]
>
> GenAI applications can often benefit from GPU acceleration. Currently Docker Desktop supports GPU acceleration only on [Windows with the WSL2 backend](manuals/desktop/gpu.md#using-nvidia-gpus-with-wsl2). Linux users can also access GPU acceleration using a native installation of the [Docker Engine](manuals/engine/install/_index.md).
@z

@x
- You have installed the latest version of [Docker Desktop](/get-started/get-docker.md) or, if you are a Linux user and are planning to use GPU acceleration, [Docker Engine](/manuals/engine/install/_index.md). Docker adds new features regularly and some parts of this guide may work only with the latest version of Docker Desktop.
- You have a [git client](https://git-scm.com/downloads). The examples in this section use a command-line based git client, but you can use any client.
@y
- [Docker Desktop](get-started/get-docker.md) の最新版をインストールしていること。
  そして Linux ユーザーの場合、GPU アクセラレーションを利用する予定であること。
  Docker は常に新たな機能を追加してきているため、本ガイドは最新の Docker Desktop でしか動作しない場合があります。
- [git クライアント](https://git-scm.com/downloads) が利用可能であること。
  本節の利用例ではコマンドラインベースの git クライアントを用いていきますが、別のクライアントを用いてもかまいません。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
This section walks you through containerizing a generative AI (GenAI) application using Docker Desktop.
@y
本節では Docker Desktop を使って、生成 AI (generative AI; GenAI) アプリケーションをコンテナー化して実行する手順を示していきます。
@z

@x
> [!NOTE]
>
> You can see more samples of containerized GenAI applications in the [GenAI Stack](https://github.com/docker/genai-stack) demo applications.
@y
> [!NOTE]
>
> コンテナー化した GenAI アプリケーションのより詳細なサンプルについては、[GenAI スタック](https://github.com/docker/genai-stack) のデモアプリケーションにおいて見ることができます。
@z

@x
## Get the sample application
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
The sample application used in this guide is a modified version of the PDF Reader application from the [GenAI Stack](https://github.com/docker/genai-stack) demo applications. The application is a full stack Python application that lets you ask questions about a PDF file.
@y
本ガイドで利用するサンプルアプリケーションは、[GenAI スタック](https://github.com/docker/genai-stack) のデモアプリケーションにある PDF リーダーアプリケーションを修正したものです。
このアプリケーションは Python によるフルスタックのアプリケーションであり、PDF ファイルに対する問い合わせを行うことができます。
@z

@x
The application uses [LangChain](https://www.langchain.com/) for orchestration, [Streamlit](https://streamlit.io/) for the UI, [Ollama](https://ollama.ai/) to run the LLM, and [Neo4j](https://neo4j.com/) to store vectors.
@y
このアプリケーションでは、オーケストレーションに [LangChain](https://www.langchain.com/)、UI に [Streamlit](https://streamlit.io/) を用いています。
また LLM 実行のために [Ollama](https://ollama.ai/)、ベクター保存に [Neo4j](https://neo4j.com/) を用いています。
@z

@x
Clone the sample application. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@y
サンプルアプリケーションをクローンします。
端末画面を開いて、作業を行うディレクトリに移動します。
そして以下のコマンドを実行してリポジトリをクローンします。
@z

@x
```console
$ git clone https://github.com/craig-osterhout/docker-genai-sample
```
@y
```console
$ git clone https://github.com/craig-osterhout/docker-genai-sample
```
@z

@x
You should now have the following files in your `docker-genai-sample` directory.
@y
上の結果として `docker-genai-sample` ディレクトリには以下のようなファイルがあるはずです。
@z

@x
```text
├── docker-genai-sample/
│ ├── .gitignore
│ ├── app.py
│ ├── chains.py
│ ├── env.example
│ ├── requirements.txt
│ ├── util.py
│ ├── LICENSE
│ └── README.md
```
@y
```text
├── docker-genai-sample/
│ ├── .gitignore
│ ├── app.py
│ ├── chains.py
│ ├── env.example
│ ├── requirements.txt
│ ├── util.py
│ ├── LICENSE
│ └── README.md
```
@z

@x
## Initialize Docker assets
@y
## Docker アセットの初期化 {#initialize-docker-assets}
@z

@x
Now that you have an application, you can use `docker init` to create the necessary Docker assets to containerize your application. Inside the `docker-genai-sample` directory, run the `docker init` command. `docker init` provides some default configuration, but you'll need to answer a few questions about your application. For example, this application uses Streamlit to run. Refer to the following `docker init` example and use the same answers for your prompts.
@y
アプリケーションの入手はできました。
次に `docker init` を実行して、アプリケーションのコンテナー化に必要となる Docker アセットを生成します。
端末画面内の `docker-genai-sample` ディレクトリにおいて `docker init` コマンドを実行します。
`docker init` はデフォルトの設定をいくつか行いますが、アプリケーション内容についていくつか質問が行われるので、それに答えます。
たとえばこのアプリケーションを実行するにあたっては Streamlit を利用しています。
以下の `docker init` の例を参考にして、同様の入力を行ってください。
@z

@x
```console
$ docker init
Welcome to the Docker Init CLI!
@y
```console
$ docker init
Welcome to the Docker Init CLI!
@z

@x
This utility will walk you through creating the following files with sensible defaults for your project:
  - .dockerignore
  - Dockerfile
  - compose.yaml
  - README.Docker.md
@y
This utility will walk you through creating the following files with sensible defaults for your project:
  - .dockerignore
  - Dockerfile
  - compose.yaml
  - README.Docker.md
@z

@x
Let's get started!
@y
Let's get started!
@z

@x
? What application platform does your project use? Python
? What version of Python do you want to use? 3.11.4
? What port do you want your app to listen on? 8000
? What is the command to run your app? streamlit run app.py --server.address=0.0.0.0 --server.port=8000
```
@y
? What application platform does your project use? Python
? What version of Python do you want to use? 3.11.4
? What port do you want your app to listen on? 8000
? What is the command to run your app? streamlit run app.py --server.address=0.0.0.0 --server.port=8000
```
@z

@x
You should now have the following contents in your `docker-genai-sample`
directory.
@y
上により `docker-genai-sample` ディレクトリ内は以下の構成となるはずです。
@z

@x
```text
├── docker-genai-sample/
│ ├── .dockerignore
│ ├── .gitignore
│ ├── app.py
│ ├── chains.py
│ ├── compose.yaml
│ ├── env.example
│ ├── requirements.txt
│ ├── util.py
│ ├── Dockerfile
│ ├── LICENSE
│ ├── README.Docker.md
│ └── README.md
```
@y
```text
├── docker-genai-sample/
│ ├── .dockerignore
│ ├── .gitignore
│ ├── app.py
│ ├── chains.py
│ ├── compose.yaml
│ ├── env.example
│ ├── requirements.txt
│ ├── util.py
│ ├── Dockerfile
│ ├── LICENSE
│ ├── README.Docker.md
│ └── README.md
```
@z

@x
To learn more about the files that `docker init` added, see the following:
@y
`docker init` が追加したファイルについての詳細は、以下を参照してください。
@z

@x
- [Dockerfile](../../../reference/dockerfile.md)
- [.dockerignore](../../../reference/dockerfile.md#dockerignore-file)
- [compose.yaml](/reference/compose-file/_index.md)
@y
- [Dockerfile](../../../reference/dockerfile.md)
- [.dockerignore](../../../reference/dockerfile.md#dockerignore-file)
- [compose.yaml](reference/compose-file/_index.md)
@z

@x
## Run the application
@y
## アプリケーションの実行 {#run-the-application}
@z

@x
Inside the `docker-genai-sample` directory, run the following command in a
terminal.
@y
端末画面内の `docker-genai-sample` ディレクトリから以下のコマンドを実行します。
@z

@x
```console
$ docker compose up --build
```
@y
```console
$ docker compose up --build
```
@z

@x
Docker builds and runs your application. Depending on your network connection, it may take several minutes to download all the dependencies. You'll see a message like the following in the terminal when the application is running.
@y
Docker がアプリケーションをビルドして実行します。
ネットワークの状況に依存しますが、依存パッケージのダウンロードには数分程度かかります。
アプリケーションが起動する際には、端末画面に以下のようなメッセージが表示されます。
@z

@x
```console
server-1  |   You can now view your Streamlit app in your browser.
server-1  |
server-1  |   URL: http://0.0.0.0:8000
server-1  |
```
@y
```console
server-1  |   You can now view your Streamlit app in your browser.
server-1  |
server-1  |   URL: http://0.0.0.0:8000
server-1  |
```
@z

@x
Open a browser and view the application at [http://localhost:8000](http://localhost:8000). You should see a simple Streamlit application. The application may take a few minutes to download the embedding model. While the download is in progress, **Running** appears in the top-right corner.
@y
ブラウザーを開いて [http://localhost:3000](http://localhost:3000) にアクセスし、アプリケーションを確認します。
シンプルな Streamlit アプリケーションが表示されたはずです。
このアプリケーションでは埋め込みモデルのダウンロードに数分かかります。
ダウンロードが行われている間は、右上隅に **Running** (実行中) と表示されます。
@z

@x
The application requires a Neo4j database service and an LLM service to
function. If you have access to services that you ran outside of Docker, specify
the connection information and try it out. If you don't have the services
running, continue with this guide to learn how you can run some or all of these
services with Docker.
@y
このアプリケーションは Neo4j データベースサービスと LLM サービス機能を必要とします。
Docker の外部からサービスへのアクセスを行う場合は、接続情報を指定して試してみてください。
サービスを実行しない場合は、引き続き本ガイドに従って、Docker を使ってそれらのサービスをいくつか、あるいはすべて実行する方法について学びます。
@z

@x
In the terminal, press `ctrl`+`c` to stop the application.
@y
端末画面から `ctrl`+`c` を押下してアプリケーションを停止します。
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how you can containerize and run your GenAI
application using Docker.
@y
本節においては Docker を使って、既存の GenAI アプリケーションをコンテナー化して実行する方法について学びました。
@z

@x
Related information:
@y
関連情報
@z

@x
- [docker init CLI reference](../../../reference/cli/docker/init.md)
@y
- [docker init CLI reference](../../../reference/cli/docker/init.md)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
In the next section, you'll learn how you can run your application, database, and LLM service all locally using Docker.
@y
次の節では、Docker を使って、アプリケーション、データベース、LLM サービスをすべてローカル内で実行する方法について学びます。
@z
