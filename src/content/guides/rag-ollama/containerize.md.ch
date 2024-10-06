%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Containerize a RAG application
linkTitle: Containerize your app
weight: 10
keywords: python, generative ai, genai, llm, ollama, containerize, intitialize, qdrant
description: Learn how to containerize a RAG application.
aliases:
  - /guides/use-case/rag-ollama/containerize/
---
@y
---
title: Containerize a RAG application
linkTitle: Containerize your app
weight: 10
keywords: python, generative ai, genai, llm, ollama, containerize, intitialize, qdrant
description: Learn how to containerize a RAG application.
aliases:
  - /guides/use-case/rag-ollama/containerize/
---
@z

@x
## Overview
@y
## Overview
@z

@x
This section walks you through containerizing a RAG application using Docker.
@y
This section walks you through containerizing a RAG application using Docker.
@z

@x
> [!NOTE]
> You can see more samples of containerized GenAI applications in the [GenAI Stack](https://github.com/docker/genai-stack) demo applications.
@y
> [!NOTE]
> You can see more samples of containerized GenAI applications in the [GenAI Stack](https://github.com/docker/genai-stack) demo applications.
@z

@x
## Get the sample application
@y
## Get the sample application
@z

@x
The sample application used in this guide is an example of RAG application, made by three main components, which are the building blocks for every RAG application. A Large Language Model hosted somewhere, in this case it is hosted in a container and served via [Ollama](https://ollama.ai/). A vector database, [Qdrant](https://qdrant.tech/), to store the embeddings of local data, and a web application, using [Streamlit](https://streamlit.io/) to offer the best user experience to the user.
@y
The sample application used in this guide is an example of RAG application, made by three main components, which are the building blocks for every RAG application. A Large Language Model hosted somewhere, in this case it is hosted in a container and served via [Ollama](https://ollama.ai/). A vector database, [Qdrant](https://qdrant.tech/), to store the embeddings of local data, and a web application, using [Streamlit](https://streamlit.io/) to offer the best user experience to the user.
@z

@x
Clone the sample application. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@y
Clone the sample application. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@z

@x
```console
$ git clone https://github.com/mfranzon/winy.git
```
@y
```console
$ git clone https://github.com/mfranzon/winy.git
```
@z

@x
You should now have the following files in your `winy` directory.
@y
You should now have the following files in your `winy` directory.
@z

@x
```text
├── winy/
│ ├── .gitignore
│ ├── app/
│ │ ├── main.py
│ │ ├── Dockerfile
| | └── requirements.txt
│ ├── tools/
│ │ ├── create_db.py
│ │ ├── create_embeddings.py
│ │ ├── requirements.txt
│ │ ├── test.py
| | └── download_model.sh
│ ├── docker-compose.yaml
│ ├── wine_database.db
│ ├── LICENSE
│ └── README.md
```
@y
```text
├── winy/
│ ├── .gitignore
│ ├── app/
│ │ ├── main.py
│ │ ├── Dockerfile
| | └── requirements.txt
│ ├── tools/
│ │ ├── create_db.py
│ │ ├── create_embeddings.py
│ │ ├── requirements.txt
│ │ ├── test.py
| | └── download_model.sh
│ ├── docker-compose.yaml
│ ├── wine_database.db
│ ├── LICENSE
│ └── README.md
```
@z

@x
## Containerizing your application: Essentials
@y
## Containerizing your application: Essentials
@z

@x
Containerizing an application involves packaging it along with its dependencies into a container, which ensures consistency across different environments. Here’s what you need to containerize an app like Winy :
@y
Containerizing an application involves packaging it along with its dependencies into a container, which ensures consistency across different environments. Here’s what you need to containerize an app like Winy :
@z

@x
1. Dockerfile: A Dockerfile that contains instructions on how to build a Docker image for your application. It specifies the base image, dependencies, configuration files, and the command to run your application.
@y
1. Dockerfile: A Dockerfile that contains instructions on how to build a Docker image for your application. It specifies the base image, dependencies, configuration files, and the command to run your application.
@z

@x
2. Docker Compose File: Docker Compose is a tool for defining and running multi-container Docker applications. A Compose file allows you to configure your application's services, networks, and volumes in a single file.
@y
2. Docker Compose File: Docker Compose is a tool for defining and running multi-container Docker applications. A Compose file allows you to configure your application's services, networks, and volumes in a single file.
@z

@x
## Run the application
@y
## Run the application
@z

@x
Inside the `winy` directory, run the following command in a
terminal.
@y
Inside the `winy` directory, run the following command in a
terminal.
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
Docker builds and runs your application. Depending on your network connection, it may take several minutes to download all the dependencies. You'll see a message like the following in the terminal when the application is running.
@z

@x
```console
server-1  |   You can now view your Streamlit app in your browser.
server-1  |
server-1  |   URL: http://0.0.0.0:8501
server-1  |
```
@y
```console
server-1  |   You can now view your Streamlit app in your browser.
server-1  |
server-1  |   URL: http://0.0.0.0:8501
server-1  |
```
@z

@x
Open a browser and view the application at [http://localhost:8501](http://localhost:8501). You should see a simple Streamlit application.
@y
Open a browser and view the application at [http://localhost:8501](http://localhost:8501). You should see a simple Streamlit application.
@z

@x
The application requires a Qdrant database service and an LLM service to work properly. If you have access to services that you ran outside of Docker, specify the connection information in the `docker-compose.yaml`.
@y
The application requires a Qdrant database service and an LLM service to work properly. If you have access to services that you ran outside of Docker, specify the connection information in the `docker-compose.yaml`.
@z

@x
```yaml
winy:
  build:
    context: ./app
    dockerfile: Dockerfile
  environment:
    - QDRANT_CLIENT=http://qdrant:6333 # Specifies the url for the qdrant database
    - OLLAMA=http://ollama:11434 # Specifies the url for the ollama service
  container_name: winy
  ports:
    - "8501:8501"
  depends_on:
    - qdrant
    - ollama
```
@y
```yaml
winy:
  build:
    context: ./app
    dockerfile: Dockerfile
  environment:
    - QDRANT_CLIENT=http://qdrant:6333 # Specifies the url for the qdrant database
    - OLLAMA=http://ollama:11434 # Specifies the url for the ollama service
  container_name: winy
  ports:
    - "8501:8501"
  depends_on:
    - qdrant
    - ollama
```
@z

@x
If you don't have the services running, continue with this guide to learn how you can run some or all of these services with Docker.
Remember that the `ollama` service is empty; it doesn't have any model. For this reason you need to pull a model before starting to use the RAG application. All the instructions are in the following page.
@y
If you don't have the services running, continue with this guide to learn how you can run some or all of these services with Docker.
Remember that the `ollama` service is empty; it doesn't have any model. For this reason you need to pull a model before starting to use the RAG application. All the instructions are in the following page.
@z

@x
In the terminal, press `ctrl`+`c` to stop the application.
@y
In the terminal, press `ctrl`+`c` to stop the application.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how you can containerize and run your RAG
application using Docker.
@y
In this section, you learned how you can containerize and run your RAG
application using Docker.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll learn how to properly configure the application with your preferred LLM model, completely locally, using Docker.
@y
In the next section, you'll learn how to properly configure the application with your preferred LLM model, completely locally, using Docker.
@z

@x
{{< button text="Develop your application" url="develop.md" >}}
@y
{{< button text="Develop your application" url="develop.md" >}}
@z
