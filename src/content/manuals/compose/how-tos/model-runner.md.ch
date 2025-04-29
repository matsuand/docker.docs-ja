%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Use Docker Model Runner
description: Learn how to integrate Docker Model Runner with Docker Compose to build AI-powered applications
keywords: compose, docker compose, model runner, ai, llm, artificial intelligence, machine learning
@y
title: Use Docker Model Runner
description: Learn how to integrate Docker Model Runner with Docker Compose to build AI-powered applications
keywords: compose, docker compose, model runner, ai, llm, artificial intelligence, machine learning
@z

@x
{{< summary-bar feature_name="Compose model runner" >}}
@y
{{< summary-bar feature_name="Compose model runner" >}}
@z

@x
Docker Model Runner can be integrated with Docker Compose to run AI models as part of your multi-container applications.  
This lets you define and run AI-powered applications alongside your other services.
@y
Docker Model Runner can be integrated with Docker Compose to run AI models as part of your multi-container applications.  
This lets you define and run AI-powered applications alongside your other services.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Docker Compose v2.35 or later
- Docker Desktop 4.41 or later 
- Docker Desktop for Mac with Apple Silicon or Docker Desktop for Windows with NVIDIA GPU
- [Docker Model Runner enabled in Docker Desktop](/manuals/desktop/features/model-runner.md#enable-docker-model-runner)
@y
- Docker Compose v2.35 or later
- Docker Desktop 4.41 or later 
- Docker Desktop for Mac with Apple Silicon or Docker Desktop for Windows with NVIDIA GPU
- [Docker Model Runner enabled in Docker Desktop](manuals/desktop/features/model-runner.md#enable-docker-model-runner)
@z

@x
## Provider services
@y
## Provider services
@z

@x
Compose introduces a new service type called `provider` that allows you to declare platform capabilities required by your application. For AI models, you can use the `model` type to declare model dependencies.
@y
Compose introduces a new service type called `provider` that allows you to declare platform capabilities required by your application. For AI models, you can use the `model` type to declare model dependencies.
@z

@x
Here's an example of how to define a model provider:
@y
Here's an example of how to define a model provider:
@z

@x
```yaml
services:
  chat:
    image: my-chat-app
    depends_on:
      - ai-runner
@y
```yaml
services:
  chat:
    image: my-chat-app
    depends_on:
      - ai-runner
@z

@x
  ai-runner:
    provider:
      type: model
      options:
        model: ai/smollm2
```
@y
  ai-runner:
    provider:
      type: model
      options:
        model: ai/smollm2
```
@z

@x
Notice the dedicated `provider` attribute in the `ai-runner` service.   
This attribute specifies that the service is a model provider and lets you define options such as the name of the model to be used.
@y
Notice the dedicated `provider` attribute in the `ai-runner` service.   
This attribute specifies that the service is a model provider and lets you define options such as the name of the model to be used.
@z

@x
There is also a `depends_on` attribute in the `chat` service.  
This attribute specifies that the `chat` service depends on the `ai-runner` service.  
This means that the `ai-runner` service will be started before the `chat` service to allow injection of model information to the `chat` service.
@y
There is also a `depends_on` attribute in the `chat` service.  
This attribute specifies that the `chat` service depends on the `ai-runner` service.  
This means that the `ai-runner` service will be started before the `chat` service to allow injection of model information to the `chat` service.
@z

@x
## How it works
@y
## How it works
@z

@x
During the `docker compose up` process, Docker Model Runner automatically pulls and runs the specified model.  
It also sends Compose the model tag name and the URL to access the model runner.
@y
During the `docker compose up` process, Docker Model Runner automatically pulls and runs the specified model.  
It also sends Compose the model tag name and the URL to access the model runner.
@z

@x
This information is then passed to services which declare a dependency on the model provider.  
In the example above, the `chat` service receives 2 environment variables prefixed by the service name:
 - `AI-RUNNER_URL` with the URL to access the model runner
 - `AI-RUNNER_MODEL` with the model name which could be passed with the URL to request the model.
@y
This information is then passed to services which declare a dependency on the model provider.  
In the example above, the `chat` service receives 2 environment variables prefixed by the service name:
 - `AI-RUNNER_URL` with the URL to access the model runner
 - `AI-RUNNER_MODEL` with the model name which could be passed with the URL to request the model.
@z

@x
This lets the `chat` service to interact with the model and use it for its own purposes.
@y
This lets the `chat` service to interact with the model and use it for its own purposes.
@z

@x
## Reference
@y
## Reference
@z

@x
- [Docker Model Runner documentation](/manuals/desktop/features/model-runner.md)
@y
- [Docker Model Runner documentation](manuals/desktop/features/model-runner.md)
@z
