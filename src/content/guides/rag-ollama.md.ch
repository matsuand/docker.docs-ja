%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Containerize RAG application using Ollama and Docker
keywords: python, generative ai, genai, llm, ollama, rag, qdrant
title: Build a RAG application using Ollama and Docker
linkTitle: RAG Ollama application
summary: |
  This guide demonstrates how to use Docker to deploy Retrieval-Augmented
  Generation (RAG) models with Ollama.
@y
description: Containerize RAG application using Ollama and Docker
keywords: python, generative ai, genai, llm, ollama, rag, qdrant
title: Build a RAG application using Ollama and Docker
linkTitle: RAG Ollama application
summary: |
  This guide demonstrates how to use Docker to deploy Retrieval-Augmented
  Generation (RAG) models with Ollama.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
The Retrieval Augmented Generation (RAG) guide teaches you how to containerize an existing RAG application using Docker. The example application is a RAG that acts like a sommelier, giving you the best pairings between wines and food. In this guide, you’ll learn how to:
@y
The Retrieval Augmented Generation (RAG) guide teaches you how to containerize an existing RAG application using Docker. The example application is a RAG that acts like a sommelier, giving you the best pairings between wines and food. In this guide, you’ll learn how to:
@z

@x
- Containerize and run a RAG application
- Set up a local environment to run the complete RAG stack locally for development
@y
- Containerize and run a RAG application
- Set up a local environment to run the complete RAG stack locally for development
@z

@x
Start by containerizing an existing RAG application.
@y
Start by containerizing an existing RAG application.
@z

@x
## Containerize a RAG application
@y
## Containerize a RAG application
@z

@x
### Overview
@y
### Overview
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
### Get the sample application
@y
### Get the sample application
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
### Containerizing your application: Essentials
@y
### Containerizing your application: Essentials
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
### Run the application
@y
### Run the application
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
### Summary
@y
### Summary
@z

@x
In this section, you learned how you can containerize and run your RAG
application using Docker.
@y
In this section, you learned how you can containerize and run your RAG
application using Docker.
@z

@x
### Next steps
@y
### Next steps
@z

@x
In the next section, you'll learn how to properly configure the application with your preferred LLM model, completely locally, using Docker.
@y
In the next section, you'll learn how to properly configure the application with your preferred LLM model, completely locally, using Docker.
@z

@x
## Use containers for RAG development
@y
## Use containers for RAG development
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete [Containerize a RAG application](#containerize-a-rag-application).
@y
Complete [Containerize a RAG application](#containerize-a-rag-application).
@z

@x
### Overview
@y
### Overview
@z

@x
In this section, you'll learn how to set up a development environment to access all the services that your generative RAG application needs. This includes:
@y
In this section, you'll learn how to set up a development environment to access all the services that your generative RAG application needs. This includes:
@z

@x
- Adding a local database
- Adding a local or remote LLM service
@y
- Adding a local database
- Adding a local or remote LLM service
@z

@x
> [!NOTE]
> You can see more samples of containerized GenAI applications in the [GenAI Stack](https://github.com/docker/genai-stack) demo applications.
@y
> [!NOTE]
> You can see more samples of containerized GenAI applications in the [GenAI Stack](https://github.com/docker/genai-stack) demo applications.
@z

@x
### Add a local database
@y
### Add a local database
@z

@x
You can use containers to set up local services, like a database. In this section, you'll explore the database service in the `docker-compose.yaml` file.
@y
You can use containers to set up local services, like a database. In this section, you'll explore the database service in the `docker-compose.yaml` file.
@z

@x
To run the database service:
@y
To run the database service:
@z

@x
1. In the cloned repository's directory, open the `docker-compose.yaml` file in an IDE or text editor.
@y
1. In the cloned repository's directory, open the `docker-compose.yaml` file in an IDE or text editor.
@z

@x
2. In the `docker-compose.yaml` file, you'll see the following:
@y
2. In the `docker-compose.yaml` file, you'll see the following:
@z

@x
   ```yaml
   services:
     qdrant:
       image: qdrant/qdrant
       container_name: qdrant
       ports:
         - "6333:6333"
       volumes:
         - qdrant_data:/qdrant/storage
   ```
@y
   ```yaml
   services:
     qdrant:
       image: qdrant/qdrant
       container_name: qdrant
       ports:
         - "6333:6333"
       volumes:
         - qdrant_data:/qdrant/storage
   ```
@z

@x
   > [!NOTE]
   > To learn more about Qdrant, see the [Qdrant Official Docker Image](https://hub.docker.com/r/qdrant/qdrant).
@y
   > [!NOTE]
   > To learn more about Qdrant, see the [Qdrant Official Docker Image](https://hub.docker.com/r/qdrant/qdrant).
@z

@x
3. Start the application. Inside the `winy` directory, run the following command in a terminal.
@y
3. Start the application. Inside the `winy` directory, run the following command in a terminal.
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
4. Access the application. Open a browser and view the application at [http://localhost:8501](http://localhost:8501). You should see a simple Streamlit application.
@y
4. Access the application. Open a browser and view the application at [http://localhost:8501](http://localhost:8501). You should see a simple Streamlit application.
@z

@x
5. Stop the application. In the terminal, press `ctrl`+`c` to stop the application.
@y
5. Stop the application. In the terminal, press `ctrl`+`c` to stop the application.
@z

@x
### Add a local or remote LLM service
@y
### Add a local or remote LLM service
@z

@x
The sample application supports both [Ollama](https://ollama.ai/). This guide provides instructions for the following scenarios:
@y
The sample application supports both [Ollama](https://ollama.ai/). This guide provides instructions for the following scenarios:
@z

@x
- Run Ollama in a container
- Run Ollama outside of a container
@y
- Run Ollama in a container
- Run Ollama outside of a container
@z

@x
While all platforms can use any of the previous scenarios, the performance and
GPU support may vary. You can use the following guidelines to help you choose the appropriate option:
@y
While all platforms can use any of the previous scenarios, the performance and
GPU support may vary. You can use the following guidelines to help you choose the appropriate option:
@z

@x
- Run Ollama in a container if you're on Linux, and using a native installation of the Docker Engine, or Windows 10/11, and using Docker Desktop, you
  have a CUDA-supported GPU, and your system has at least 8 GB of RAM.
- Run Ollama outside of a container if running Docker Desktop on a Linux Machine.
@y
- Run Ollama in a container if you're on Linux, and using a native installation of the Docker Engine, or Windows 10/11, and using Docker Desktop, you
  have a CUDA-supported GPU, and your system has at least 8 GB of RAM.
- Run Ollama outside of a container if running Docker Desktop on a Linux Machine.
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
@y
To run Ollama in a container and provide GPU access:
@z

@x
1. Install the prerequisites.
   - For Docker Engine on Linux, install the [NVIDIA Container Toolkilt](https://github.com/NVIDIA/nvidia-container-toolkit).
   - For Docker Desktop on Windows 10/11, install the latest [NVIDIA driver](https://www.nvidia.com/Download/index.aspx) and make sure you are using the [WSL2 backend](/manuals/desktop/features/wsl/_index.md#turn-on-docker-desktop-wsl-2)
2. The `docker-compose.yaml` file already contains the necessary instructions. In your own apps, you'll need to add the Ollama service in your `docker-compose.yaml`. The following is
   the updated `docker-compose.yaml`:
@y
1. Install the prerequisites.
   - For Docker Engine on Linux, install the [NVIDIA Container Toolkilt](https://github.com/NVIDIA/nvidia-container-toolkit).
   - For Docker Desktop on Windows 10/11, install the latest [NVIDIA driver](https://www.nvidia.com/Download/index.aspx) and make sure you are using the [WSL2 backend](manuals/desktop/features/wsl/_index.md#turn-on-docker-desktop-wsl-2)
2. The `docker-compose.yaml` file already contains the necessary instructions. In your own apps, you'll need to add the Ollama service in your `docker-compose.yaml`. The following is
   the updated `docker-compose.yaml`:
@z

@x
   ```yaml
   ollama:
     image: ollama/ollama
     container_name: ollama
     ports:
       - "8000:8000"
     deploy:
       resources:
         reservations:
           devices:
             - driver: nvidia
               count: 1
               capabilities: [gpu]
   ```
@y
   ```yaml
   ollama:
     image: ollama/ollama
     container_name: ollama
     ports:
       - "8000:8000"
     deploy:
       resources:
         reservations:
           devices:
             - driver: nvidia
               count: 1
               capabilities: [gpu]
   ```
@z

@x
   > [!NOTE]
   > For more details about the Compose instructions, see [Turn on GPU access with Docker Compose](/manuals/compose/how-tos/gpu-support.md).
@y
   > [!NOTE]
   > For more details about the Compose instructions, see [Turn on GPU access with Docker Compose](manuals/compose/how-tos/gpu-support.md).
@z

@x
3. Once the Ollama container is up and running it is possible to use the `download_model.sh` inside the `tools` folder with this command:
@y
3. Once the Ollama container is up and running it is possible to use the `download_model.sh` inside the `tools` folder with this command:
@z

@x
   ```console
   . ./download_model.sh <model-name>
   ```
@y
   ```console
   . ./download_model.sh <model-name>
   ```
@z

@x
Pulling an Ollama model can take several minutes.
@y
Pulling an Ollama model can take several minutes.
@z

@x
{{< /tab >}}
{{< tab name="Run Ollama outside of a container" >}}
@y
{{< /tab >}}
{{< tab name="Run Ollama outside of a container" >}}
@z

@x
To run Ollama outside of a container:
@y
To run Ollama outside of a container:
@z

@x
1. [Install](https://github.com/jmorganca/ollama) and run Ollama on your host
   machine.
2. Pull the model to Ollama using the following command.
@y
1. [Install](https://github.com/jmorganca/ollama) and run Ollama on your host
   machine.
2. Pull the model to Ollama using the following command.
@z

@x
   ```console
   $ ollama pull llama2
   ```
@y
   ```console
   $ ollama pull llama2
   ```
@z

@x
3. Remove the `ollama` service from the `docker-compose.yaml` and update properly the connection variables in `winy` service:
@y
3. Remove the `ollama` service from the `docker-compose.yaml` and update properly the connection variables in `winy` service:
@z

@x
   ```diff
   - OLLAMA=http://ollama:11434
   + OLLAMA=<your-url>
   ```
@y
   ```diff
   - OLLAMA=http://ollama:11434
   + OLLAMA=<your-url>
   ```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Run your RAG application
@y
### Run your RAG application
@z

@x
At this point, you have the following services in your Compose file:
@y
At this point, you have the following services in your Compose file:
@z

@x
- Server service for your main RAG application
- Database service to store vectors in a Qdrant database
- (optional) Ollama service to run the LLM
  service
@y
- Server service for your main RAG application
- Database service to store vectors in a Qdrant database
- (optional) Ollama service to run the LLM
  service
@z

@x
Once the application is running, open a browser and access the application at [http://localhost:8501](http://localhost:8501).
@y
Once the application is running, open a browser and access the application at [http://localhost:8501](http://localhost:8501).
@z

@x
Depending on your system and the LLM service that you chose, it may take several
minutes to answer.
@y
Depending on your system and the LLM service that you chose, it may take several
minutes to answer.
@z

@x
### Summary
@y
### Summary
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
@y
Related information:
@z

@x
- [Dockerfile reference](/reference/dockerfile.md)
- [Compose file reference](/reference/compose-file/_index.md)
- [Ollama Docker image](https://hub.docker.com/r/ollama/ollama)
- [GenAI Stack demo applications](https://github.com/docker/genai-stack)
@y
- [Dockerfile reference](reference/dockerfile.md)
- [Compose file reference](reference/compose-file/_index.md)
- [Ollama Docker image](https://hub.docker.com/r/ollama/ollama)
- [GenAI Stack demo applications](https://github.com/docker/genai-stack)
@z

@x
### Next steps
@y
### Next steps
@z

@x
See samples of more GenAI applications in the [GenAI Stack demo applications](https://github.com/docker/genai-stack).
@y
See samples of more GenAI applications in the [GenAI Stack demo applications](https://github.com/docker/genai-stack).
@z
