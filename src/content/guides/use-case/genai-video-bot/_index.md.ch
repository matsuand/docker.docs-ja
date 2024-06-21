%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Explore a generative AI video analysis app that uses Docker, OpenAI, and Pinecone.
keywords:  python, generative ai, genai, llm, whisper, pinecone, openai, whisper
title: GenAI video transcription and chat
---
@y
---
description: Explore a generative AI video analysis app that uses Docker, OpenAI, and Pinecone.
keywords:  python, generative ai, genai, llm, whisper, pinecone, openai, whisper
title: GenAI video transcription and chat
---
@z

@x
## Overview
@y
## Overview
@z

@x
This guide presents a project on video transcription and analysis using a set of
technologies related to the
[GenAI Stack](https://www.docker.com/blog/introducing-a-new-genai-stack/).
@y
This guide presents a project on video transcription and analysis using a set of
technologies related to the
[GenAI Stack](https://www.docker.com/blog/introducing-a-new-genai-stack/).
@z

@x
The project showcases the following technologies:
- [Docker and Docker Compose](#docker-and-docker-compose)
- [OpenAI](#openai-api)
- [Whisper](#whisper)
- [Embeddings](#embeddings)
- [Chat completions](#chat-completions)
- [Pinecone](#pinecone)
- [Retrieval-Augmented Generation](#retrieval-augmented-generation)
@y
The project showcases the following technologies:
- [Docker and Docker Compose](#docker-and-docker-compose)
- [OpenAI](#openai-api)
- [Whisper](#whisper)
- [Embeddings](#embeddings)
- [Chat completions](#chat-completions)
- [Pinecone](#pinecone)
- [Retrieval-Augmented Generation](#retrieval-augmented-generation)
@z

@x
> **Acknowledgment**
>
> This guide is a community contribution. Docker would like to thank
> [David Cardozo](https://www.davidcardozo.com/) for his contribution
> to this guide.
@y
> **Acknowledgment**
>
> This guide is a community contribution. Docker would like to thank
> [David Cardozo](https://www.davidcardozo.com/) for his contribution
> to this guide.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- You have an [OpenAI API Key](https://platform.openai.com/api-keys).
@y
- You have an [OpenAI API Key](https://platform.openai.com/api-keys).
@z

@x
  > **Note**
  >
  > OpenAI is a third-party hosted service and [charges](https://openai.com/pricing) may apply.
@y
  > **Note**
  >
  > OpenAI is a third-party hosted service and [charges](https://openai.com/pricing) may apply.
@z

@x
- You have a [Pinecone API Key](https://app.pinecone.io/).
- You have installed the latest version of [Docker Desktop](../../../get-docker.md). Docker adds new features regularly and some parts of this guide may work only with the latest version of Docker Desktop.
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@y
- You have a [Pinecone API Key](https://app.pinecone.io/).
- You have installed the latest version of [Docker Desktop](../../../get-docker.md). Docker adds new features regularly and some parts of this guide may work only with the latest version of Docker Desktop.
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@z

@x
## About the application
@y
## About the application
@z

@x
The application is a chatbot that can answer questions from a video. In
addition, it provides timestamps from the video that can help you find the sources used to answer your question.
@y
The application is a chatbot that can answer questions from a video. In
addition, it provides timestamps from the video that can help you find the sources used to answer your question.
@z

@x
## Get and run the application
@y
## Get and run the application
@z

@x
1. Clone the sample application's repository. In a terminal, run the following
   command.
   ```console
   $ git clone https://github.com/Davidnet/docker-genai.git
   ```
   The project contains the following directories and files:
   ```text
   ├── docker-genai/
   │ ├── docker-bot/
   │ ├── yt-whisper/
   │ ├── .env.example
   │ ├── .gitignore
   │ ├── LICENSE
   │ ├── README.md
   │ └── docker-compose.yaml
   ```
@y
1. Clone the sample application's repository. In a terminal, run the following
   command.
   ```console
   $ git clone https://github.com/Davidnet/docker-genai.git
   ```
   The project contains the following directories and files:
   ```text
   ├── docker-genai/
   │ ├── docker-bot/
   │ ├── yt-whisper/
   │ ├── .env.example
   │ ├── .gitignore
   │ ├── LICENSE
   │ ├── README.md
   │ └── docker-compose.yaml
   ```
@z

@x
2. Specify your API keys. In the `docker-genai` directory, create a text file
   called `.env` and specify your API keys inside. The following is the contents of the `.env.example` file that you can refer to as an example.
@y
2. Specify your API keys. In the `docker-genai` directory, create a text file
   called `.env` and specify your API keys inside. The following is the contents of the `.env.example` file that you can refer to as an example.
@z

@x
   ```text
   #----------------------------------------------------------------------------
   # OpenAI
   #----------------------------------------------------------------------------
   OPENAI_TOKEN=your-api-key # Replace your-api-key with your personal API key
@y
   ```text
   #----------------------------------------------------------------------------
   # OpenAI
   #----------------------------------------------------------------------------
   OPENAI_TOKEN=your-api-key # Replace your-api-key with your personal API key
@z

@x
   #----------------------------------------------------------------------------
   # Pinecone
   #----------------------------------------------------------------------------
   PINECONE_TOKEN=your-api-key # Replace your-api-key with your personal API key
   ```
@y
   #----------------------------------------------------------------------------
   # Pinecone
   #----------------------------------------------------------------------------
   PINECONE_TOKEN=your-api-key # Replace your-api-key with your personal API key
   ```
@z

@x
3. Build and run the application. In a terminal, change directory to your
   `docker-genai` directory and run the following command.
   ```console
   $ docker compose up --build
   ```
   Docker Compose builds and runs the application based on the services defined
   in the `docker-compose.yaml` file. When the application is running, you'll
   see the logs of 2 services in the terminal.
@y
3. Build and run the application. In a terminal, change directory to your
   `docker-genai` directory and run the following command.
   ```console
   $ docker compose up --build
   ```
   Docker Compose builds and runs the application based on the services defined
   in the `docker-compose.yaml` file. When the application is running, you'll
   see the logs of 2 services in the terminal.
@z

@x
   In the logs, you'll see the services are exposed on ports `8503` and `8504`.
   The two services are complimentary to each other.
@y
   In the logs, you'll see the services are exposed on ports `8503` and `8504`.
   The two services are complimentary to each other.
@z

@x
   The `yt-whisper` service is running on port `8503`. This service feeds the
   Pinecone database with videos that you want to archive in your knowledge
   database. The following section explores this service.
@y
   The `yt-whisper` service is running on port `8503`. This service feeds the
   Pinecone database with videos that you want to archive in your knowledge
   database. The following section explores this service.
@z

@x
## Using the yt-whisper service
@y
## Using the yt-whisper service
@z

@x
The yt-whisper service is a YouTube video processing service that uses the OpenAI
Whisper model to generate transcriptions of videos and stores them in a Pinecone
database. The following steps show how to use the service.
@y
The yt-whisper service is a YouTube video processing service that uses the OpenAI
Whisper model to generate transcriptions of videos and stores them in a Pinecone
database. The following steps show how to use the service.
@z

@x
1. Open a browser and access the yt-whisper service at [http://localhost:8503](http://localhost:8503).
2. Once the application appears, in the **Youtube URL** field specify a Youtube video URL
   and select **Submit**. The following example uses
   [https://www.youtube.com/watch?v=yaQZFhrW0fU](https://www.youtube.com/watch?v=yaQZFhrW0fU).
@y
1. Open a browser and access the yt-whisper service at [http://localhost:8503](http://localhost:8503).
2. Once the application appears, in the **Youtube URL** field specify a Youtube video URL
   and select **Submit**. The following example uses
   [https://www.youtube.com/watch?v=yaQZFhrW0fU](https://www.youtube.com/watch?v=yaQZFhrW0fU).
@z

@x
   ![Submitting a video in the yt-whisper service](images/yt-whisper.webp)
@y
   ![Submitting a video in the yt-whisper service](images/yt-whisper.webp)
@z

@x
   The yt-whisper service downloads the audio of the video, uses Whisper to
   transcribe it into a WebVTT (`*.vtt`) format (which you can download), then
   uses the text-embedding-3-small model to create embeddings, and finally
   uploads those embeddings in to the Pinecone database.
@y
   The yt-whisper service downloads the audio of the video, uses Whisper to
   transcribe it into a WebVTT (`*.vtt`) format (which you can download), then
   uses the text-embedding-3-small model to create embeddings, and finally
   uploads those embeddings in to the Pinecone database.
@z

@x
   After processing the video, a video list appears in the web app that informs
   you which videos have been indexed in Pinecone. It also provides a button to
   download the transcript.
@y
   After processing the video, a video list appears in the web app that informs
   you which videos have been indexed in Pinecone. It also provides a button to
   download the transcript.
@z

@x
   ![A processed video in the yt-whisper service](images/yt-whisper-2.webp)
@y
   ![A processed video in the yt-whisper service](images/yt-whisper-2.webp)
@z

@x
   You can now access the dockerbot service on port `8504` and ask questions
   about the videos.
@y
   You can now access the dockerbot service on port `8504` and ask questions
   about the videos.
@z

@x
## Using the dockerbot service
@y
## Using the dockerbot service
@z

@x
The dockerbot service is a question-answering service that leverages both the
Pinecone database and an AI model to provide responses. The following steps show
how to use the service.
@y
The dockerbot service is a question-answering service that leverages both the
Pinecone database and an AI model to provide responses. The following steps show
how to use the service.
@z

@x
> **Note**
>
> You must process at least one video via the
> [yt-whisper service](#using-the-yt-whisper-service) before using
> the dockerbot service.
@y
> **Note**
>
> You must process at least one video via the
> [yt-whisper service](#using-the-yt-whisper-service) before using
> the dockerbot service.
@z

@x
1. Open a browser and access the service at
   [http://localhost:8504](http://localhost:8504).
@y
1. Open a browser and access the service at
   [http://localhost:8504](http://localhost:8504).
@z

@x
2. In the **What do you want to know about your videos?** text box, ask the
   Dockerbot a question about a video that was processed by the yt-whisper
   service. The following example asks the question, "What is a sugar cookie?".
   The answer to that question exists in the video processed in the previous
   example,
   [https://www.youtube.com/watch?v=yaQZFhrW0fU](https://www.youtube.com/watch?v=yaQZFhrW0fU).
@y
2. In the **What do you want to know about your videos?** text box, ask the
   Dockerbot a question about a video that was processed by the yt-whisper
   service. The following example asks the question, "What is a sugar cookie?".
   The answer to that question exists in the video processed in the previous
   example,
   [https://www.youtube.com/watch?v=yaQZFhrW0fU](https://www.youtube.com/watch?v=yaQZFhrW0fU).
@z

@x
   ![Asking a question to the Dockerbot](images/bot.webp)
@y
   ![Asking a question to the Dockerbot](images/bot.webp)
@z

@x
   In this example, the Dockerbot answers the question and
   provides links to the video with timestamps, which may contain more
   information about the answer.
@y
   In this example, the Dockerbot answers the question and
   provides links to the video with timestamps, which may contain more
   information about the answer.
@z

@x
   The dockerbot service takes the question, turns it into an embedding using
   the text-embedding-3-small model, queries the Pinecone database to find
   similar embeddings, and then passes that context into the gpt-4-turbo-preview
   to generate an answer.
@y
   The dockerbot service takes the question, turns it into an embedding using
   the text-embedding-3-small model, queries the Pinecone database to find
   similar embeddings, and then passes that context into the gpt-4-turbo-preview
   to generate an answer.
@z

@x
3. Select the first link to see what information it provides. Based on the
   previous example, select
   [https://www.youtube.com/watch?v=yaQZFhrW0fU&t=553s](https://www.youtube.com/watch?v=yaQZFhrW0fU&t=553s).
@y
3. Select the first link to see what information it provides. Based on the
   previous example, select
   [https://www.youtube.com/watch?v=yaQZFhrW0fU&t=553s](https://www.youtube.com/watch?v=yaQZFhrW0fU&t=553s).
@z

@x
   In the example link, you can see that the section of video perfectly answers
   the question, "What is a sugar cookie?".
@y
   In the example link, you can see that the section of video perfectly answers
   the question, "What is a sugar cookie?".
@z

@x
## Explore the application architecture
@y
## Explore the application architecture
@z

@x
The following image shows the application's high-level service architecture, which includes:
- yt-whisper: A local service, ran by Docker Compose, that interacts with the
  remote OpenAI and Pinecone services.
- dockerbot: A local service, ran by Docker Compose, that interacts with the
  remote OpenAI and Pinecone services.
- OpenAI: A remote third-party service.
- Pinecone: A remote third-party service.
@y
The following image shows the application's high-level service architecture, which includes:
- yt-whisper: A local service, ran by Docker Compose, that interacts with the
  remote OpenAI and Pinecone services.
- dockerbot: A local service, ran by Docker Compose, that interacts with the
  remote OpenAI and Pinecone services.
- OpenAI: A remote third-party service.
- Pinecone: A remote third-party service.
@z

@x
![Application architecture diagram](images/architecture.webp)
@y
![Application architecture diagram](images/architecture.webp)
@z

@x
## Explore the technologies used and their role
@y
## Explore the technologies used and their role
@z

@x
### Docker and Docker Compose
@y
### Docker and Docker Compose
@z

@x
The application uses Docker to run the application in containers, providing a
consistent and isolated environment for running it. This means the application
will operate as intended within its Docker containers, regardless of the
underlying system differences. To learn more about Docker, see the [Getting started overview](../../getting-started/_index.md).
@y
The application uses Docker to run the application in containers, providing a
consistent and isolated environment for running it. This means the application
will operate as intended within its Docker containers, regardless of the
underlying system differences. To learn more about Docker, see the [Getting started overview](../../getting-started/_index.md).
@z

@x
Docker Compose is a tool for defining and running multi-container applications.
Compose makes it easy to run this application with a single command, `docker
compose up`. For more details, see the [Compose overview](../../../compose/_index.md).
@y
Docker Compose is a tool for defining and running multi-container applications.
Compose makes it easy to run this application with a single command, `docker
compose up`. For more details, see the [Compose overview](../../../compose/_index.md).
@z

@x
### OpenAI API
@y
### OpenAI API
@z

@x
The OpenAI API provides an LLM service that's known for its cutting-edge AI and
machine learning technologies. In this application, OpenAI's technology is used
to generate transcriptions from audio (using the Whisper model) and to create
embeddings for text data, as well as to generate responses to user queries
(using GPT and chat completions). For more details, see
[openai.com](https://openai.com/product).
@y
The OpenAI API provides an LLM service that's known for its cutting-edge AI and
machine learning technologies. In this application, OpenAI's technology is used
to generate transcriptions from audio (using the Whisper model) and to create
embeddings for text data, as well as to generate responses to user queries
(using GPT and chat completions). For more details, see
[openai.com](https://openai.com/product).
@z

@x
### Whisper
@y
### Whisper
@z

@x
Whisper is an automatic speech recognition system developed by OpenAI, designed
to transcribe spoken language into text. In this application, Whisper is used to
transcribe the audio from YouTube videos into text, enabling further processing
and analysis of the video content. For more details, see [Introducing Whisper](https://openai.com/research/whisper).
@y
Whisper is an automatic speech recognition system developed by OpenAI, designed
to transcribe spoken language into text. In this application, Whisper is used to
transcribe the audio from YouTube videos into text, enabling further processing
and analysis of the video content. For more details, see [Introducing Whisper](https://openai.com/research/whisper).
@z

@x
### Embeddings
@y
### Embeddings
@z

@x
Embeddings are numerical representations of text or other data types, which
capture their meaning in a way that can be processed by machine learning
algorithms. In this application, embeddings are used to convert video
transcriptions into a vector format that can be queried and analyzed for
relevance to user input, facilitating efficient search and response generation
in the application. For more details, see OpenAI's
[Embeddings](https://platform.openai.com/docs/guides/embeddings) documentation.
@y
Embeddings are numerical representations of text or other data types, which
capture their meaning in a way that can be processed by machine learning
algorithms. In this application, embeddings are used to convert video
transcriptions into a vector format that can be queried and analyzed for
relevance to user input, facilitating efficient search and response generation
in the application. For more details, see OpenAI's
[Embeddings](https://platform.openai.com/docs/guides/embeddings) documentation.
@z

@x
![Embedding diagram](images/embeddings.webp)
@y
![Embedding diagram](images/embeddings.webp)
@z

@x
### Chat completions
@y
### Chat completions
@z

@x
Chat completion, as utilized in this application through OpenAI's API, refers to
the generation of conversational responses based on a given context or prompt.
In the application, it is used to provide intelligent, context-aware answers to
user queries by processing and integrating information from video transcriptions
and other inputs, enhancing the chatbot's interactive capabilities. For more
details, see OpenAI's
[Chat Completions API](https://platform.openai.com/docs/guides/text-generation) documentation.
@y
Chat completion, as utilized in this application through OpenAI's API, refers to
the generation of conversational responses based on a given context or prompt.
In the application, it is used to provide intelligent, context-aware answers to
user queries by processing and integrating information from video transcriptions
and other inputs, enhancing the chatbot's interactive capabilities. For more
details, see OpenAI's
[Chat Completions API](https://platform.openai.com/docs/guides/text-generation) documentation.
@z

@x
### Pinecone
@y
### Pinecone
@z

@x
Pinecone is a vector database service optimized for similarity search, used for
building and deploying large-scale vector search applications. In this
application, Pinecone is employed to store and retrieve the embeddings of video
transcriptions, enabling efficient and relevant search functionality within the
application based on user queries. For more details, see
[pincone.io](https://www.pinecone.io/).
@y
Pinecone is a vector database service optimized for similarity search, used for
building and deploying large-scale vector search applications. In this
application, Pinecone is employed to store and retrieve the embeddings of video
transcriptions, enabling efficient and relevant search functionality within the
application based on user queries. For more details, see
[pincone.io](https://www.pinecone.io/).
@z

@x
### Retrieval-Augmented Generation
@y
### Retrieval-Augmented Generation
@z

@x
Retrieval-Augmented Generation (RAG) is a technique that combines information
retrieval with a language model to generate responses based on retrieved
documents or data. In RAG, the system retrieves relevant information (in this
case, via embeddings from video transcriptions) and then uses a language model
to generate responses based on this retrieved data. For more details, see
OpenAI's cookbook for
[Retrieval Augmented Generative Question Answering with Pinecone](https://cookbook.openai.com/examples/vector_databases/pinecone/gen_qa).
@y
Retrieval-Augmented Generation (RAG) is a technique that combines information
retrieval with a language model to generate responses based on retrieved
documents or data. In RAG, the system retrieves relevant information (in this
case, via embeddings from video transcriptions) and then uses a language model
to generate responses based on this retrieved data. For more details, see
OpenAI's cookbook for
[Retrieval Augmented Generative Question Answering with Pinecone](https://cookbook.openai.com/examples/vector_databases/pinecone/gen_qa).
@z

@x
## Next steps
@y
## Next steps
@z

@x
Explore how to [create a PDF bot application](../genai-pdf-bot/_index.md) using
generative AI, or view more GenAI samples in the
[GenAI Stack](https://github.com/docker/genai-stack) repository.
@y
Explore how to [create a PDF bot application](../genai-pdf-bot/_index.md) using
generative AI, or view more GenAI samples in the
[GenAI Stack](https://github.com/docker/genai-stack) repository.
@z
