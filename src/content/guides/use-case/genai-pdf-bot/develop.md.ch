%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
title: Use containers for generative AI development
linkTitle: Develop your app
@y
title: コンテナーを利用した生成 AI 開発
linkTitle: Develop your app
@z

@x
keywords: python, local, development, generative ai, genai, llm, neo4j, ollama, langchain, openai
description: Learn how to develop your generative AI (GenAI) application locally.
@y
keywords: python, local, development, generative ai, genai, llm, neo4j, ollama, langchain, openai
description: Learn how to develop your generative AI (GenAI) application locally.
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Complete [Containerize a generative AI application](containerize.md).
@y
[生成 AI アプリケーションのコンテナー化](containerize.md) を完了していること。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
In this section, you'll learn how to set up a development environment to access all the services that your generative AI (GenAI) application needs. This includes:
@y
本節では、GenAI アプリケーションが必要とするサービスに対して、そのすべてにアクセスできる開発環境の構築方法について学びます。
ここでは以下を行います。
@z

@x
- Adding a local database
- Adding a local or remote LLM service
@y
- ローカルデータベースの追加。
- ローカルまたはリモートによる LLM サービスの追加。
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
## Add a local database
@y
## ローカルデータベースの追加 {#add-a-local-database}
@z

@x
You can use containers to set up local services, like a database. In this section, you'll update the `compose.yaml` file to define a database service. In addition, you'll specify an environment variables file to load the database connection information rather than manually entering the information every time.
@y
You can use containers to set up local services, like a database. In this section, you'll update the `compose.yaml` file to define a database service. In addition, you'll specify an environment variables file to load the database connection information rather than manually entering the information every time.
@z

@x
To run the database service:
@y
データベースサービスを起動するには以下を行います。
@z

@x
1. In the cloned repository's directory, rename `env.example` file to `.env`.
   This file contains the environment variables that the containers will use.
2. In the cloned repository's directory, open the `compose.yaml` file in an IDE or text editor.
3. In the `compose.yaml` file, add the following:
   - Add instructions to run a Neo4j database
   - Specify the environment file under the server service in order to pass in the environment variables for the connection
@y
1. クローンを行ったディレクトリにおいて、`env.example` ファイルを `.env` に名称変更します。
   このファイルには、コンテナーが利用する環境変数が定義されています。
2. IDE またはテキストエディターを使って、クローンを行ったディレクトリ内の `compose.yaml` ファイルを開きます。
3. `compose.yaml` ファイル内に以下を追加します。
   - Neo4j データベースを実行する命令を追加します。
   - サーバーサービスにおいて利用する環境変数ファイルを指定します。
     その環境変数を通じて接続を行います。
@z

@x
   The following is the updated `compose.yaml` file. All comments have been removed.
@y
   変更した`compose.yaml` ファイルが以下です。
   コメント化がすべてなくなった状態です。
@z

% snip code...

@x
   > [!NOTE]
   >
   > To learn more about Neo4j, see the [Neo4j Official Docker Image](https://hub.docker.com/_/neo4j).
@y
   > [!NOTE]
   >
   > Neo4j についての詳細は [Neo4j 公式 Docker イメージ](https://hub.docker.com/_/neo4j) を参照してください。
@z

@x
4. Run the application. Inside the `docker-genai-sample` directory,
run the following command in a terminal.
@y
4. アプリケーションを実行します。
   端末画面の `docker-genai-sample` ディレクトリにおいて、以下のコマンドを実行します。
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
5. Access the application. Open a browser and view the application at [http://localhost:8000](http://localhost:8000). You should see a simple Streamlit application. Note that asking questions to a PDF will cause the application to fail because the LLM service specified in the `.env` file isn't running yet.
@y
5. Access the application. Open a browser and view the application at [http://localhost:8000](http://localhost:8000). You should see a simple Streamlit application. Note that asking questions to a PDF will cause the application to fail because the LLM service specified in the `.env` file isn't running yet.
@z

@x
6. Stop the application. In the terminal, press `ctrl`+`c` to stop the application.
@y
6. アプリケーションを停止します。
   端末画面から `ctrl`+`c` を押下してアプリケーションを停止します。
@z

@x
## Add a local or remote LLM service
@y
## ローカルまたはリモートによる LLM サービスの追加 {#add-a-local-or-remote-llm-service}
@z

@x
The sample application supports both [Ollama](https://ollama.ai/) and [OpenAI](https://openai.com/). This guide provides instructions for the following scenarios:
- Run Ollama in a container
- Run Ollama outside of a container
- Use OpenAI
@y
The sample application supports both [Ollama](https://ollama.ai/) and [OpenAI](https://openai.com/). This guide provides instructions for the following scenarios:
- Run Ollama in a container
- Run Ollama outside of a container
- Use OpenAI
@z

@x
While all platforms can use any of the previous scenarios, the performance and
GPU support may vary. You can use the following guidelines to help you choose the appropriate option:
- Run Ollama in a container if you're on Linux, and using a native installation of the Docker Engine, or Windows 10/11, and using Docker Desktop, you
  have a CUDA-supported GPU, and your system has at least 8 GB of RAM.
- Run Ollama outside of a container if you're on an Apple silicon Mac.
- Use OpenAI if the previous two scenarios don't apply to you.
@y
While all platforms can use any of the previous scenarios, the performance and
GPU support may vary. You can use the following guidelines to help you choose the appropriate option:
- Run Ollama in a container if you're on Linux, and using a native installation of the Docker Engine, or Windows 10/11, and using Docker Desktop, you
  have a CUDA-supported GPU, and your system has at least 8 GB of RAM.
- Run Ollama outside of a container if you're on an Apple silicon Mac.
- Use OpenAI if the previous two scenarios don't apply to you.
@z

@x
Choose one of the following options for your LLM service.
@y
Choose one of the following options for your LLM service.
@z

@x
{{< tabs >}}
{{< tab name="Run Ollama in a container" >}}
@y
{{< tabs >}}
{{< tab name="Run Ollama in a container" >}}
@z

@x
When running Ollama in a container, you should have a CUDA-supported GPU. While you can run Ollama in a container without a supported GPU, the performance may not be acceptable. Only Linux and Windows 11 support GPU access to containers.
@y
When running Ollama in a container, you should have a CUDA-supported GPU. While you can run Ollama in a container without a supported GPU, the performance may not be acceptable. Only Linux and Windows 11 support GPU access to containers.
@z

@x
To run Ollama in a container and provide GPU access:
1. Install the prerequisites.
   - For Docker Engine on Linux, install the [NVIDIA Container Toolkilt](https://github.com/NVIDIA/nvidia-container-toolkit).
   - For Docker Desktop on Windows 10/11, install the latest [NVIDIA driver](https://www.nvidia.com/Download/index.aspx) and make sure you are using the [WSL2 backend](/manuals/desktop/wsl/_index.md#turn-on-docker-desktop-wsl-2)
2. Add the Ollama service and a volume in your `compose.yaml`. The following is
   the updated `compose.yaml`:
@y
To run Ollama in a container and provide GPU access:
1. Install the prerequisites.
   - For Docker Engine on Linux, install the [NVIDIA Container Toolkilt](https://github.com/NVIDIA/nvidia-container-toolkit).
   - For Docker Desktop on Windows 10/11, install the latest [NVIDIA driver](https://www.nvidia.com/Download/index.aspx) and make sure you are using the [WSL2 backend](manuals/desktop/wsl/_index.md#turn-on-docker-desktop-wsl-2)
2. Add the Ollama service and a volume in your `compose.yaml`. The following is
   the updated `compose.yaml`:
@z

% snip code...

@x
   > [!NOTE]
   >
   > For more details about the Compose instructions, see [Turn on GPU access with Docker Compose](/manuals/compose/how-tos/gpu-support.md).
@y
   > [!NOTE]
   >
   > For more details about the Compose instructions, see [Turn on GPU access with Docker Compose](manuals/compose/how-tos/gpu-support.md).
@z

@x
3. Add the ollama-pull service to your `compose.yaml` file. This service uses
   the `docker/genai:ollama-pull` image, based on the GenAI Stack's
   [pull_model.Dockerfile](https://github.com/docker/genai-stack/blob/main/pull_model.Dockerfile).
   The service will automatically pull the model for your Ollama
   container. The following is the updated section of the `compose.yaml` file:
@y
3. Add the ollama-pull service to your `compose.yaml` file. This service uses
   the `docker/genai:ollama-pull` image, based on the GenAI Stack's
   [pull_model.Dockerfile](https://github.com/docker/genai-stack/blob/main/pull_model.Dockerfile).
   The service will automatically pull the model for your Ollama
   container. The following is the updated section of the `compose.yaml` file:
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="Run Ollama outside of a container" >}}
@y
{{< /tab >}}
{{< tab name="Run Ollama outside of a container" >}}
@z

@x
To run Ollama outside of a container:
1. [Install](https://github.com/jmorganca/ollama) and run Ollama on your host
   machine.
2. Update the `OLLAMA_BASE_URL` value in your `.env` file to
   `http://host.docker.internal:11434`.
3. Pull the model to Ollama using the following command.
   ```console
   $ ollama pull llama2
   ```
@y
To run Ollama outside of a container:
1. [Install](https://github.com/jmorganca/ollama) and run Ollama on your host
   machine.
2. Update the `OLLAMA_BASE_URL` value in your `.env` file to
   `http://host.docker.internal:11434`.
3. Pull the model to Ollama using the following command.
   ```console
   $ ollama pull llama2
   ```
@z

@x
{{< /tab >}}
{{< tab name="Use OpenAI" >}}
@y
{{< /tab >}}
{{< tab name="Use OpenAI" >}}
@z

@x
> [!IMPORTANT]
>
> Using OpenAI requires an [OpenAI account](https://platform.openai.com/login). OpenAI is a third-party hosted service and charges may apply.
@y
> [!IMPORTANT]
>
> Using OpenAI requires an [OpenAI account](https://platform.openai.com/login). OpenAI is a third-party hosted service and charges may apply.
@z

@x
1. Update the `LLM` value in your `.env` file to
   `gpt-3.5`.
2. Uncomment and update the `OPENAI_API_KEY` value in your `.env` file to
   your [OpenAI API key](https://help.openai.com/en/articles/4936850-where-do-i-find-my-api-key).
@y
1. Update the `LLM` value in your `.env` file to
   `gpt-3.5`.
2. Uncomment and update the `OPENAI_API_KEY` value in your `.env` file to
   your [OpenAI API key](https://help.openai.com/en/articles/4936850-where-do-i-find-my-api-key).
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Run your GenAI application
@y
## Run your GenAI application {#run-your-genai-application}
@z

@x
At this point, you have the following services in your Compose file:
- Server service for your main GenAI application
- Database service to store vectors in a Neo4j database
- (optional) Ollama service to run the LLM
- (optional) Ollama-pull service to automatically pull the model for the Ollama
  service
@y
At this point, you have the following services in your Compose file:
- Server service for your main GenAI application
- Database service to store vectors in a Neo4j database
- (optional) Ollama service to run the LLM
- (optional) Ollama-pull service to automatically pull the model for the Ollama
  service
@z

@x
To run all the services, run the following command in your `docker-genai-sample`
directory:
@y
To run all the services, run the following command in your `docker-genai-sample`
directory:
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
If your Compose file has the ollama-pull service, it may take several minutes for the ollama-pull service to pull the model. The ollama-pull service will continuously update the console with its status. After pulling the model, the ollama-pull service container will stop and you can access the application.
@y
If your Compose file has the ollama-pull service, it may take several minutes for the ollama-pull service to pull the model. The ollama-pull service will continuously update the console with its status. After pulling the model, the ollama-pull service container will stop and you can access the application.
@z

@x
Once the application is running, open a browser and access the application at [http://localhost:8000](http://localhost:8000).
@y
Once the application is running, open a browser and access the application at [http://localhost:8000](http://localhost:8000).
@z

@x
Upload a PDF file, for example the [Docker CLI Cheat Sheet](https://docs.docker.com/get-started/docker_cheatsheet.pdf), and ask a question about the PDF.
@y
Upload a PDF file, for example the [Docker CLI Cheat Sheet](https://docs.docker.com/get-started/docker_cheatsheet.pdf), and ask a question about the PDF.
@z

@x
Depending on your system and the LLM service that you chose, it may take several
minutes to answer. If you are using Ollama and the performance isn't
acceptable, try using OpenAI.
@y
Depending on your system and the LLM service that you chose, it may take several
minutes to answer. If you are using Ollama and the performance isn't
acceptable, try using OpenAI.
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
In this section, you learned how to set up a development environment to provide
access all the services that your GenAI application needs.
@y
In this section, you learned how to set up a development environment to provide
access all the services that your GenAI application needs.
@z

@x
Related information:
 - [Dockerfile reference](../../../reference/dockerfile.md)
 - [Compose file reference](/reference/compose-file/_index.md)
 - [Ollama Docker image](https://hub.docker.com/r/ollama/ollama)
 - [Neo4j Official Docker Image](https://hub.docker.com/_/neo4j)
 - [GenAI Stack demo applications](https://github.com/docker/genai-stack)
@y
Related information:
 - [Dockerfile reference](../../../reference/dockerfile.md)
 - [Compose file reference](reference/compose-file/_index.md)
 - [Ollama Docker image](https://hub.docker.com/r/ollama/ollama)
 - [Neo4j Official Docker Image](https://hub.docker.com/_/neo4j)
 - [GenAI Stack demo applications](https://github.com/docker/genai-stack)
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
See samples of more GenAI applications in the [GenAI Stack demo applications](https://github.com/docker/genai-stack).
@y
See samples of more GenAI applications in the [GenAI Stack demo applications](https://github.com/docker/genai-stack).
@z
