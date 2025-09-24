%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: DMR REST API
description: Reference documentation for the Docker Model Runner REST API endpoints and usage examples.
@y
title: DMR REST API
description: Reference documentation for the Docker Model Runner REST API endpoints and usage examples.
@z

@x
keywords: Docker, ai, model runner, rest api, openai, endpoints, documentation
@y
keywords: Docker, ai, model runner, rest api, openai, endpoints, documentation
@z

@x
Once Model Runner is enabled, new API endpoints are available. You can use
these endpoints to interact with a model programmatically.
@y
Once Model Runner is enabled, new API endpoints are available. You can use
these endpoints to interact with a model programmatically.
@z

@x
### Determine the base URL
@y
### Determine the base URL
@z

@x
The base URL to interact with the endpoints depends
on how you run Docker:
@y
The base URL to interact with the endpoints depends
on how you run Docker:
@z

@x
{{< tabs >}}
{{< tab name="Docker Desktop">}}
@y
{{< tabs >}}
{{< tab name="Docker Desktop">}}
@z

@x
- From containers: `http://model-runner.docker.internal/`
- From host processes: `http://localhost:12434/`, assuming TCP host access is
  enabled on the default port (12434).
@y
- From containers: `http://model-runner.docker.internal/`
- From host processes: `http://localhost:12434/`, assuming TCP host access is
  enabled on the default port (12434).
@z

@x
{{< /tab >}}
{{< tab name="Docker Engine">}}
@y
{{< /tab >}}
{{< tab name="Docker Engine">}}
@z

@x
- From containers: `http://172.17.0.1:12434/` (with `172.17.0.1` representing the host gateway address)
- From host processes: `http://localhost:12434/`
@y
- From containers: `http://172.17.0.1:12434/` (with `172.17.0.1` representing the host gateway address)
- From host processes: `http://localhost:12434/`
@z

@x
> [!NOTE]
> The `172.17.0.1` interface may not be available by default to containers
  within a Compose project.
> In this case, add an `extra_hosts` directive to your Compose service YAML:
>
> ```yaml
> extra_hosts:
>   - "model-runner.docker.internal:host-gateway"
> ```
> Then you can access the Docker Model Runner APIs at http://model-runner.docker.internal:12434/
@y
> [!NOTE]
> The `172.17.0.1` interface may not be available by default to containers
  within a Compose project.
> In this case, add an `extra_hosts` directive to your Compose service YAML:
>
> ```yaml
> extra_hosts:
>   - "model-runner.docker.internal:host-gateway"
> ```
> Then you can access the Docker Model Runner APIs at http://model-runner.docker.internal:12434/
@z

@x
{{< /tab >}}
{{</tabs >}}
@y
{{< /tab >}}
{{</tabs >}}
@z

@x
### Available DMR endpoints
@y
### Available DMR endpoints
@z

@x
- Create a model:
@y
- Create a model:
@z

@x
  ```text
  POST /models/create
  ```
@y
  ```text
  POST /models/create
  ```
@z

@x
- List models:
@y
- List models:
@z

@x
  ```text
  GET /models
  ```
@y
  ```text
  GET /models
  ```
@z

@x
- Get a model:
@y
- Get a model:
@z

@x
  ```text
  GET /models/{namespace}/{name}
  ```
@y
  ```text
  GET /models/{namespace}/{name}
  ```
@z

@x
- Delete a local model:
@y
- Delete a local model:
@z

@x
  ```text
  DELETE /models/{namespace}/{name}
  ```
@y
  ```text
  DELETE /models/{namespace}/{name}
  ```
@z

@x
### Available OpenAPI endpoints
@y
### Available OpenAPI endpoints
@z

@x
DMR supports the following OpenAPI endpoints:
@y
DMR supports the following OpenAPI endpoints:
@z

@x
- [List models](https://platform.openai.com/docs/api-reference/models/list):
@y
- [List models](https://platform.openai.com/docs/api-reference/models/list):
@z

@x
  ```text
  GET /engines/llama.cpp/v1/models
  ```
@y
  ```text
  GET /engines/llama.cpp/v1/models
  ```
@z

@x
- [Retrieve model](https://platform.openai.com/docs/api-reference/models/retrieve):
@y
- [Retrieve model](https://platform.openai.com/docs/api-reference/models/retrieve):
@z

@x
  ```text
  GET /engines/llama.cpp/v1/models/{namespace}/{name}
  ```
@y
  ```text
  GET /engines/llama.cpp/v1/models/{namespace}/{name}
  ```
@z

@x
- [List chat completions](https://platform.openai.com/docs/api-reference/chat/list):
@y
- [List chat completions](https://platform.openai.com/docs/api-reference/chat/list):
@z

@x
  ```text
  POST /engines/llama.cpp/v1/chat/completions
  ```
@y
  ```text
  POST /engines/llama.cpp/v1/chat/completions
  ```
@z

@x
- [Create completions](https://platform.openai.com/docs/api-reference/completions/create):
@y
- [Create completions](https://platform.openai.com/docs/api-reference/completions/create):
@z

@x
  ```text
  POST /engines/llama.cpp/v1/completions
  ```
@y
  ```text
  POST /engines/llama.cpp/v1/completions
  ```
@z

@x
- [Create embeddings](https://platform.openai.com/docs/api-reference/embeddings/create):
@y
- [Create embeddings](https://platform.openai.com/docs/api-reference/embeddings/create):
@z

@x
  ```text
  POST /engines/llama.cpp/v1/embeddings
  ```
@y
  ```text
  POST /engines/llama.cpp/v1/embeddings
  ```
@z

@x
To call these endpoints via a Unix socket (`/var/run/docker.sock`), prefix their path
with `/exp/vDD4.40`.
@y
To call these endpoints via a Unix socket (`/var/run/docker.sock`), prefix their path
with `/exp/vDD4.40`.
@z

@x
> [!NOTE]
> You can omit `llama.cpp` from the path. For example: `POST /engines/v1/chat/completions`.
@y
> [!NOTE]
> You can omit `llama.cpp` from the path. For example: `POST /engines/v1/chat/completions`.
@z

@x
## REST API examples
@y
## REST API examples
@z

@x
### Request from within a container
@y
### Request from within a container
@z

@x
To call the `chat/completions` OpenAI endpoint from within another container using `curl`:
@y
To call the `chat/completions` OpenAI endpoint from within another container using `curl`:
@z

@x
```bash
#!/bin/sh
@y
```bash
#!/bin/sh
@z

@x
curl http://model-runner.docker.internal/engines/llama.cpp/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "ai/smollm2",
        "messages": [
            {
                "role": "system",
                "content": "You are a helpful assistant."
            },
            {
                "role": "user",
                "content": "Please write 500 words about the fall of Rome."
            }
        ]
    }'
@y
curl http://model-runner.docker.internal/engines/llama.cpp/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "ai/smollm2",
        "messages": [
            {
                "role": "system",
                "content": "You are a helpful assistant."
            },
            {
                "role": "user",
                "content": "Please write 500 words about the fall of Rome."
            }
        ]
    }'
@z

@x
```
@y
```
@z

@x
### Request from the host using TCP
@y
### Request from the host using TCP
@z

@x
To call the `chat/completions` OpenAI endpoint from the host via TCP:
@y
To call the `chat/completions` OpenAI endpoint from the host via TCP:
@z

@x
1. Enable the host-side TCP support from the Docker Desktop GUI, or via the [Docker Desktop CLI](/manuals/desktop/features/desktop-cli.md).
   For example: `docker desktop enable model-runner --tcp <port>`.
@y
1. Enable the host-side TCP support from the Docker Desktop GUI, or via the [Docker Desktop CLI](manuals/desktop/features/desktop-cli.md).
   For example: `docker desktop enable model-runner --tcp <port>`.
@z

@x
   If you are running on Windows, also enable GPU-backed inference.
   See [Enable Docker Model Runner](get-started.md#enable-docker-model-runner-in-docker-desktop).
@y
   If you are running on Windows, also enable GPU-backed inference.
   See [Enable Docker Model Runner](get-started.md#enable-docker-model-runner-in-docker-desktop).
@z

@x
1. Interact with it as documented in the previous section using `localhost` and the correct port.
@y
1. Interact with it as documented in the previous section using `localhost` and the correct port.
@z

@x
```bash
#!/bin/sh
@y
```bash
#!/bin/sh
@z

@x
  curl http://localhost:12434/engines/llama.cpp/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "ai/smollm2",
        "messages": [
            {
                "role": "system",
                "content": "You are a helpful assistant."
            },
            {
                "role": "user",
                "content": "Please write 500 words about the fall of Rome."
            }
        ]
    }'
```
@y
  curl http://localhost:12434/engines/llama.cpp/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "ai/smollm2",
        "messages": [
            {
                "role": "system",
                "content": "You are a helpful assistant."
            },
            {
                "role": "user",
                "content": "Please write 500 words about the fall of Rome."
            }
        ]
    }'
```
@z

@x
### Request from the host using a Unix socket
@y
### Request from the host using a Unix socket
@z

@x
To call the `chat/completions` OpenAI endpoint through the Docker socket from the host using `curl`:
@y
To call the `chat/completions` OpenAI endpoint through the Docker socket from the host using `curl`:
@z

@x
```bash
#!/bin/sh
@y
```bash
#!/bin/sh
@z

@x
curl --unix-socket $HOME/.docker/run/docker.sock \
    localhost/exp/vDD4.40/engines/llama.cpp/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "ai/smollm2",
        "messages": [
            {
                "role": "system",
                "content": "You are a helpful assistant."
            },
            {
                "role": "user",
                "content": "Please write 500 words about the fall of Rome."
            }
        ]
    }'
```
@y
curl --unix-socket $HOME/.docker/run/docker.sock \
    localhost/exp/vDD4.40/engines/llama.cpp/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "ai/smollm2",
        "messages": [
            {
                "role": "system",
                "content": "You are a helpful assistant."
            },
            {
                "role": "user",
                "content": "Please write 500 words about the fall of Rome."
            }
        ]
    }'
```
@z
