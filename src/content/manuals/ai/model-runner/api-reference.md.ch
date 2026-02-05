%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: DMR REST API
description: Reference documentation for the Docker Model Runner REST API endpoints, including OpenAI, Anthropic, and Ollama compatibility.
@y
title: DMR REST API
description: Reference documentation for the Docker Model Runner REST API endpoints, including OpenAI, Anthropic, and Ollama compatibility.
@z

@x
keywords: Docker, ai, model runner, rest api, openai, anthropic, ollama, endpoints, documentation, cline, continue, cursor
@y
keywords: Docker, ai, model runner, rest api, openai, anthropic, ollama, endpoints, documentation, cline, continue, cursor
@z

@x
Once Model Runner is enabled, new API endpoints are available. You can use
these endpoints to interact with a model programmatically. Docker Model Runner
provides compatibility with OpenAI, Anthropic, and Ollama API formats.
@y
Once Model Runner is enabled, new API endpoints are available. You can use
these endpoints to interact with a model programmatically. Docker Model Runner
provides compatibility with OpenAI, Anthropic, and Ollama API formats.
@z

@x
## Determine the base URL
@y
## Determine the base URL
@z

@x
The base URL to interact with the endpoints depends on how you run Docker and
which API format you're using.
@y
The base URL to interact with the endpoints depends on how you run Docker and
which API format you're using.
@z

@x
{{< tabs >}}
{{< tab name="Docker Desktop">}}
@y
{{< tabs >}}
{{< tab name="Docker Desktop">}}
@z

@x
| Access from | Base URL |
|-------------|----------|
| Containers | `http://model-runner.docker.internal` |
| Host processes (TCP) | `http://localhost:12434` |
@y
| Access from | Base URL |
|-------------|----------|
| Containers | `http://model-runner.docker.internal` |
| Host processes (TCP) | `http://localhost:12434` |
@z

@x
> [!NOTE]
> TCP host access must be enabled. See [Enable Docker Model Runner](get-started.md#enable-docker-model-runner-in-docker-desktop).
@y
> [!NOTE]
> TCP host access must be enabled. See [Enable Docker Model Runner](get-started.md#enable-docker-model-runner-in-docker-desktop).
@z

@x
{{< /tab >}}
{{< tab name="Docker Engine">}}
@y
{{< /tab >}}
{{< tab name="Docker Engine">}}
@z

@x
| Access from | Base URL |
|-------------|----------|
| Containers | `http://172.17.0.1:12434` |
| Host processes | `http://localhost:12434` |
@y
| Access from | Base URL |
|-------------|----------|
| Containers | `http://172.17.0.1:12434` |
| Host processes | `http://localhost:12434` |
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
> Then you can access the Docker Model Runner APIs at `http://model-runner.docker.internal:12434/`
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
> Then you can access the Docker Model Runner APIs at `http://model-runner.docker.internal:12434/`
@z

@x
{{< /tab >}}
{{</tabs >}}
@y
{{< /tab >}}
{{</tabs >}}
@z

@x
### Base URLs for third-party tools
@y
### Base URLs for third-party tools
@z

@x
When configuring third-party tools that expect OpenAI-compatible APIs, use these base URLs:
@y
When configuring third-party tools that expect OpenAI-compatible APIs, use these base URLs:
@z

@x
| Tool type | Base URL format |
|-----------|-----------------|
| OpenAI SDK / clients | `http://localhost:12434/engines/v1` |
| Anthropic SDK / clients | `http://localhost:12434` |
| Ollama-compatible clients | `http://localhost:12434` |
@y
| Tool type | Base URL format |
|-----------|-----------------|
| OpenAI SDK / clients | `http://localhost:12434/engines/v1` |
| Anthropic SDK / clients | `http://localhost:12434` |
| Ollama-compatible clients | `http://localhost:12434` |
@z

@x
See [IDE and tool integrations](ide-integrations.md) for specific configuration examples.
@y
See [IDE and tool integrations](ide-integrations.md) for specific configuration examples.
@z

@x
## Supported APIs
@y
## Supported APIs
@z

@x
Docker Model Runner supports multiple API formats:
@y
Docker Model Runner supports multiple API formats:
@z

@x
| API | Description | Use case |
|-----|-------------|----------|
| [OpenAI API](#openai-compatible-api) | OpenAI-compatible chat completions, embeddings | Most AI frameworks and tools |
| [Anthropic API](#anthropic-compatible-api) | Anthropic-compatible messages endpoint | Tools built for Claude |
| [Ollama API](#ollama-compatible-api) | Ollama-compatible endpoints | Tools built for Ollama |
| [Image Generation API](#image-generation-api-diffusers) | Diffusers-based image generation | Generating images from text prompts |
| [DMR API](#dmr-native-endpoints) | Native Docker Model Runner endpoints | Model management |
@y
| API | Description | Use case |
|-----|-------------|----------|
| [OpenAI API](#openai-compatible-api) | OpenAI-compatible chat completions, embeddings | Most AI frameworks and tools |
| [Anthropic API](#anthropic-compatible-api) | Anthropic-compatible messages endpoint | Tools built for Claude |
| [Ollama API](#ollama-compatible-api) | Ollama-compatible endpoints | Tools built for Ollama |
| [Image Generation API](#image-generation-api-diffusers) | Diffusers-based image generation | Generating images from text prompts |
| [DMR API](#dmr-native-endpoints) | Native Docker Model Runner endpoints | Model management |
@z

@x
## OpenAI-compatible API
@y
## OpenAI-compatible API
@z

@x
DMR implements the OpenAI API specification for maximum compatibility with existing tools and frameworks.
@y
DMR implements the OpenAI API specification for maximum compatibility with existing tools and frameworks.
@z

@x
### Endpoints
@y
### Endpoints
@z

@x
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/engines/v1/models` | GET | [List models](https://platform.openai.com/docs/api-reference/models/list) |
| `/engines/v1/models/{namespace}/{name}` | GET | [Retrieve model](https://platform.openai.com/docs/api-reference/models/retrieve) |
| `/engines/v1/chat/completions` | POST | [Create chat completion](https://platform.openai.com/docs/api-reference/chat/create) |
| `/engines/v1/completions` | POST | [Create completion](https://platform.openai.com/docs/api-reference/completions/create) |
| `/engines/v1/embeddings` | POST | [Create embeddings](https://platform.openai.com/docs/api-reference/embeddings/create) |
@y
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/engines/v1/models` | GET | [List models](https://platform.openai.com/docs/api-reference/models/list) |
| `/engines/v1/models/{namespace}/{name}` | GET | [Retrieve model](https://platform.openai.com/docs/api-reference/models/retrieve) |
| `/engines/v1/chat/completions` | POST | [Create chat completion](https://platform.openai.com/docs/api-reference/chat/create) |
| `/engines/v1/completions` | POST | [Create completion](https://platform.openai.com/docs/api-reference/completions/create) |
| `/engines/v1/embeddings` | POST | [Create embeddings](https://platform.openai.com/docs/api-reference/embeddings/create) |
@z

@x
> [!NOTE]
> You can optionally include the engine name in the path: `/engines/llama.cpp/v1/chat/completions`.
> This is useful when running multiple inference engines.
@y
> [!NOTE]
> You can optionally include the engine name in the path: `/engines/llama.cpp/v1/chat/completions`.
> This is useful when running multiple inference engines.
@z

@x
### Model name format
@y
### Model name format
@z

@x
When specifying a model in API requests, use the full model identifier including the namespace:
@y
When specifying a model in API requests, use the full model identifier including the namespace:
@z

@x
```json
{
  "model": "ai/smollm2",
  "messages": [...]
}
```
@y
```json
{
  "model": "ai/smollm2",
  "messages": [...]
}
```
@z

@x
Common model name formats:
- Docker Hub models: `ai/smollm2`, `ai/llama3.2`, `ai/qwen2.5-coder`
- Tagged versions: `ai/smollm2:360M-Q4_K_M`
- Custom models: `myorg/mymodel`
@y
Common model name formats:
- Docker Hub models: `ai/smollm2`, `ai/llama3.2`, `ai/qwen2.5-coder`
- Tagged versions: `ai/smollm2:360M-Q4_K_M`
- Custom models: `myorg/mymodel`
@z

@x
### Supported parameters
@y
### Supported parameters
@z

@x
The following OpenAI API parameters are supported:
@y
The following OpenAI API parameters are supported:
@z

@x
| Parameter | Type | Description |
|-----------|------|-------------|
| `model` | string | Required. The model identifier. |
| `messages` | array | Required for chat completions. The conversation history. |
| `prompt` | string | Required for completions. The prompt text. |
| `max_tokens` | integer | Maximum tokens to generate. |
| `temperature` | float | Sampling temperature (0.0-2.0). |
| `top_p` | float | Nucleus sampling parameter (0.0-1.0). |
| `stream` | Boolean | Enable streaming responses. |
| `stop` | string/array | Stop sequences. |
| `presence_penalty` | float | Presence penalty (-2.0 to 2.0). |
| `frequency_penalty` | float | Frequency penalty (-2.0 to 2.0). |
@y
| Parameter | Type | Description |
|-----------|------|-------------|
| `model` | string | Required. The model identifier. |
| `messages` | array | Required for chat completions. The conversation history. |
| `prompt` | string | Required for completions. The prompt text. |
| `max_tokens` | integer | Maximum tokens to generate. |
| `temperature` | float | Sampling temperature (0.0-2.0). |
| `top_p` | float | Nucleus sampling parameter (0.0-1.0). |
| `stream` | Boolean | Enable streaming responses. |
| `stop` | string/array | Stop sequences. |
| `presence_penalty` | float | Presence penalty (-2.0 to 2.0). |
| `frequency_penalty` | float | Frequency penalty (-2.0 to 2.0). |
@z

@x
### Limitations and differences from OpenAI
@y
### Limitations and differences from OpenAI
@z

@x
Be aware of these differences when using DMR's OpenAI-compatible API:
@y
Be aware of these differences when using DMR's OpenAI-compatible API:
@z

@x
| Feature | DMR behavior |
|---------|--------------|
| API key | Not required. DMR ignores the `Authorization` header. |
| Function calling | Supported with llama.cpp for compatible models. |
| Vision | Supported for multi-modal models (e.g., LLaVA). |
| JSON mode | Supported via `response_format: {"type": "json_object"}`. |
| Logprobs | Supported. |
| Token counting | Uses the model's native token encoder, which may differ from OpenAI's. |
@y
| Feature | DMR behavior |
|---------|--------------|
| API key | Not required. DMR ignores the `Authorization` header. |
| Function calling | Supported with llama.cpp for compatible models. |
| Vision | Supported for multi-modal models (e.g., LLaVA). |
| JSON mode | Supported via `response_format: {"type": "json_object"}`. |
| Logprobs | Supported. |
| Token counting | Uses the model's native token encoder, which may differ from OpenAI's. |
@z

@x
## Anthropic-compatible API
@y
## Anthropic-compatible API
@z

@x
DMR provides [Anthropic Messages API](https://platform.claude.com/docs/en/api/messages) compatibility for tools and frameworks built for Claude.
@y
DMR provides [Anthropic Messages API](https://platform.claude.com/docs/en/api/messages) compatibility for tools and frameworks built for Claude.
@z

@x
### Endpoints
@y
### Endpoints
@z

@x
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/anthropic/v1/messages` | POST | [Create a message](https://platform.claude.com/docs/en/api/messages/create) |
| `/anthropic/v1/messages/count_tokens` | POST | [Count tokens](https://docs.anthropic.com/en/api/messages-count-tokens) |
@y
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/anthropic/v1/messages` | POST | [Create a message](https://platform.claude.com/docs/en/api/messages/create) |
| `/anthropic/v1/messages/count_tokens` | POST | [Count tokens](https://docs.anthropic.com/en/api/messages-count-tokens) |
@z

@x
### Supported parameters
@y
### Supported parameters
@z

@x
The following Anthropic API parameters are supported:
@y
The following Anthropic API parameters are supported:
@z

@x
| Parameter | Type | Description |
|-----------|------|-------------|
| `model` | string | Required. The model identifier. |
| `messages` | array | Required. The conversation messages. |
| `max_tokens` | integer | Maximum tokens to generate. |
| `temperature` | float | Sampling temperature (0.0-1.0). |
| `top_p` | float | Nucleus sampling parameter. |
| `top_k` | integer | Top-k sampling parameter. |
| `stream` | Boolean | Enable streaming responses. |
| `stop_sequences` | array | Custom stop sequences. |
| `system` | string | System prompt. |
@y
| Parameter | Type | Description |
|-----------|------|-------------|
| `model` | string | Required. The model identifier. |
| `messages` | array | Required. The conversation messages. |
| `max_tokens` | integer | Maximum tokens to generate. |
| `temperature` | float | Sampling temperature (0.0-1.0). |
| `top_p` | float | Nucleus sampling parameter. |
| `top_k` | integer | Top-k sampling parameter. |
| `stream` | Boolean | Enable streaming responses. |
| `stop_sequences` | array | Custom stop sequences. |
| `system` | string | System prompt. |
@z

@x
### Example: Chat with Anthropic API
@y
### Example: Chat with Anthropic API
@z

@x
```bash
curl http://localhost:12434/v1/messages \
  -H "Content-Type: application/json" \
  -d '{
    "model": "ai/smollm2",
    "max_tokens": 1024,
    "messages": [
      {"role": "user", "content": "Hello!"}
    ]
  }'
```
@y
```bash
curl http://localhost:12434/v1/messages \
  -H "Content-Type: application/json" \
  -d '{
    "model": "ai/smollm2",
    "max_tokens": 1024,
    "messages": [
      {"role": "user", "content": "Hello!"}
    ]
  }'
```
@z

@x
### Example: Streaming response
@y
### Example: Streaming response
@z

@x
```bash
curl http://localhost:12434/v1/messages \
  -H "Content-Type: application/json" \
  -d '{
    "model": "ai/smollm2",
    "max_tokens": 1024,
    "stream": true,
    "messages": [
      {"role": "user", "content": "Count from 1 to 10"}
    ]
  }'
```
@y
```bash
curl http://localhost:12434/v1/messages \
  -H "Content-Type: application/json" \
  -d '{
    "model": "ai/smollm2",
    "max_tokens": 1024,
    "stream": true,
    "messages": [
      {"role": "user", "content": "Count from 1 to 10"}
    ]
  }'
```
@z

@x
## Ollama-compatible API
@y
## Ollama-compatible API
@z

@x
DMR also provides Ollama-compatible endpoints for tools and frameworks built for Ollama.
@y
DMR also provides Ollama-compatible endpoints for tools and frameworks built for Ollama.
@z

@x
### Endpoints
@y
### Endpoints
@z

@x
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/tags` | GET | List available models |
| `/api/show` | POST | Show model information |
| `/api/chat` | POST | Generate chat completion |
| `/api/generate` | POST | Generate completion |
| `/api/embeddings` | POST | Generate embeddings |
@y
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/tags` | GET | List available models |
| `/api/show` | POST | Show model information |
| `/api/chat` | POST | Generate chat completion |
| `/api/generate` | POST | Generate completion |
| `/api/embeddings` | POST | Generate embeddings |
@z

@x
### Example: Chat with Ollama API
@y
### Example: Chat with Ollama API
@z

@x
```bash
curl http://localhost:12434/api/chat \
  -H "Content-Type: application/json" \
  -d '{
    "model": "ai/smollm2",
    "messages": [
      {"role": "user", "content": "Hello!"}
    ]
  }'
```
@y
```bash
curl http://localhost:12434/api/chat \
  -H "Content-Type: application/json" \
  -d '{
    "model": "ai/smollm2",
    "messages": [
      {"role": "user", "content": "Hello!"}
    ]
  }'
```
@z

@x
### Example: List models
@y
### Example: List models
@z

@x
```bash
curl http://localhost:12434/api/tags
```
@y
```bash
curl http://localhost:12434/api/tags
```
@z

@x
## Image generation API (Diffusers)
@y
## Image generation API (Diffusers)
@z

@x
DMR supports image generation through the Diffusers backend, enabling you to generate
images from text prompts using models like Stable Diffusion.
@y
DMR supports image generation through the Diffusers backend, enabling you to generate
images from text prompts using models like Stable Diffusion.
@z

@x
> [!NOTE]
> The Diffusers backend requires an NVIDIA GPU with CUDA support and is only
> available on Linux (x86_64 and ARM64). See [Inference engines](inference-engines.md#diffusers)
> for setup instructions.
@y
> [!NOTE]
> The Diffusers backend requires an NVIDIA GPU with CUDA support and is only
> available on Linux (x86_64 and ARM64). See [Inference engines](inference-engines.md#diffusers)
> for setup instructions.
@z

@x
### Endpoint
@y
### Endpoint
@z

@x
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/engines/diffusers/v1/images/generations` | POST | Generate an image from a text prompt |
@y
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/engines/diffusers/v1/images/generations` | POST | Generate an image from a text prompt |
@z

@x
### Supported parameters
@y
### Supported parameters
@z

@x
| Parameter | Type | Description |
|-----------|------|-------------|
| `model` | string | Required. The model identifier (e.g., `stable-diffusion:Q4`). |
| `prompt` | string | Required. The text description of the image to generate. |
| `size` | string | Image dimensions in `WIDTHxHEIGHT` format (e.g., `512x512`). |
@y
| Parameter | Type | Description |
|-----------|------|-------------|
| `model` | string | Required. The model identifier (e.g., `stable-diffusion:Q4`). |
| `prompt` | string | Required. The text description of the image to generate. |
| `size` | string | Image dimensions in `WIDTHxHEIGHT` format (e.g., `512x512`). |
@z

@x
### Response format
@y
### Response format
@z

@x
The API returns a JSON response with the generated image encoded in base64:
@y
The API returns a JSON response with the generated image encoded in base64:
@z

@x
```json
{
  "data": [
    {
      "b64_json": "<base64-encoded-image-data>"
    }
  ]
}
```
@y
```json
{
  "data": [
    {
      "b64_json": "<base64-encoded-image-data>"
    }
  ]
}
```
@z

@x
### Example: Generate an image
@y
### Example: Generate an image
@z

@x
```bash
curl -s -X POST http://localhost:12434/engines/diffusers/v1/images/generations \
  -H "Content-Type: application/json" \
  -d '{
    "model": "stable-diffusion:Q4",
    "prompt": "A picture of a nice cat",
    "size": "512x512"
  }' | jq -r '.data[0].b64_json' | base64 -d > image.png
```
@y
```bash
curl -s -X POST http://localhost:12434/engines/diffusers/v1/images/generations \
  -H "Content-Type: application/json" \
  -d '{
    "model": "stable-diffusion:Q4",
    "prompt": "A picture of a nice cat",
    "size": "512x512"
  }' | jq -r '.data[0].b64_json' | base64 -d > image.png
```
@z

@x
This command:
1. Sends a POST request to the Diffusers image generation endpoint
2. Specifies the model, prompt, and output image size
3. Extracts the base64-encoded image from the response using `jq`
4. Decodes the base64 data and saves it as `image.png`
@y
This command:
1. Sends a POST request to the Diffusers image generation endpoint
2. Specifies the model, prompt, and output image size
3. Extracts the base64-encoded image from the response using `jq`
4. Decodes the base64 data and saves it as `image.png`
@z

@x
## DMR native endpoints
@y
## DMR native endpoints
@z

@x
These endpoints are specific to Docker Model Runner for model management:
@y
These endpoints are specific to Docker Model Runner for model management:
@z

@x
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/models/create` | POST | Pull/create a model |
| `/models` | GET | List local models |
| `/models/{namespace}/{name}` | GET | Get model details |
| `/models/{namespace}/{name}` | DELETE | Delete a local model |
@y
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/models/create` | POST | Pull/create a model |
| `/models` | GET | List local models |
| `/models/{namespace}/{name}` | GET | Get model details |
| `/models/{namespace}/{name}` | DELETE | Delete a local model |
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
curl http://model-runner.docker.internal/engines/v1/chat/completions \
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
curl http://model-runner.docker.internal/engines/v1/chat/completions \
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
curl http://localhost:12434/engines/v1/chat/completions \
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
curl http://localhost:12434/engines/v1/chat/completions \
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
    localhost/exp/vDD4.40/engines/v1/chat/completions \
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
    localhost/exp/vDD4.40/engines/v1/chat/completions \
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
### Streaming responses
@y
### Streaming responses
@z

@x
To receive streaming responses, set `stream: true`:
@y
To receive streaming responses, set `stream: true`:
@z

@x
```bash
curl http://localhost:12434/engines/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
      "model": "ai/smollm2",
      "stream": true,
      "messages": [
          {"role": "user", "content": "Count from 1 to 10"}
      ]
  }'
```
@y
```bash
curl http://localhost:12434/engines/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
      "model": "ai/smollm2",
      "stream": true,
      "messages": [
          {"role": "user", "content": "Count from 1 to 10"}
      ]
  }'
```
@z

@x
## Using with OpenAI SDKs
@y
## Using with OpenAI SDKs
@z

@x
### Python
@y
### Python
@z

@x
```python
from openai import OpenAI
@y
```python
from openai import OpenAI
@z

@x
client = OpenAI(
    base_url="http://localhost:12434/engines/v1",
    api_key="not-needed"  # DMR doesn't require an API key
)
@y
client = OpenAI(
    base_url="http://localhost:12434/engines/v1",
    api_key="not-needed"  # DMR doesn't require an API key
)
@z

@x
response = client.chat.completions.create(
    model="ai/smollm2",
    messages=[
        {"role": "user", "content": "Hello!"}
    ]
)
@y
response = client.chat.completions.create(
    model="ai/smollm2",
    messages=[
        {"role": "user", "content": "Hello!"}
    ]
)
@z

@x
print(response.choices[0].message.content)
```
@y
print(response.choices[0].message.content)
```
@z

@x
### Node.js
@y
### Node.js
@z

@x
```javascript
import OpenAI from 'openai';
@y
```javascript
import OpenAI from 'openai';
@z

@x
const client = new OpenAI({
  baseURL: 'http://localhost:12434/engines/v1',
  apiKey: 'not-needed',
});
@y
const client = new OpenAI({
  baseURL: 'http://localhost:12434/engines/v1',
  apiKey: 'not-needed',
});
@z

@x
const response = await client.chat.completions.create({
  model: 'ai/smollm2',
  messages: [{ role: 'user', content: 'Hello!' }],
});
@y
const response = await client.chat.completions.create({
  model: 'ai/smollm2',
  messages: [{ role: 'user', content: 'Hello!' }],
});
@z

@x
console.log(response.choices[0].message.content);
```
@y
console.log(response.choices[0].message.content);
```
@z

@x
## What's next
@y
## What's next
@z

@x
- [IDE and tool integrations](ide-integrations.md) - Configure Cline, Continue, Cursor, and other tools
- [Configuration options](configuration.md) - Adjust context size and runtime parameters
- [Inference engines](inference-engines.md) - Learn about llama.cpp, vLLM, and Diffusers options
@y
- [IDE and tool integrations](ide-integrations.md) - Configure Cline, Continue, Cursor, and other tools
- [Configuration options](configuration.md) - Adjust context size and runtime parameters
- [Inference engines](inference-engines.md) - Learn about llama.cpp, vLLM, and Diffusers options
@z
