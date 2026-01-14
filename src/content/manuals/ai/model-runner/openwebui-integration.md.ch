%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Open WebUI integration
description: Set up Open WebUI as a ChatGPT-like interface for Docker Model Runner.
@y
title: Open WebUI integration
description: Set up Open WebUI as a ChatGPT-like interface for Docker Model Runner.
@z

@x
keywords: Docker, ai, model runner, open webui, openwebui, chat interface, ollama, ui
@y
keywords: Docker, ai, model runner, open webui, openwebui, chat interface, ollama, ui
@z

@x
[Open WebUI](https://github.com/open-webui/open-webui) is an open-source,
self-hosted web interface that provides a ChatGPT-like experience for local
AI models. You can connect it to Docker Model Runner to get a polished chat
interface for your models.
@y
[Open WebUI](https://github.com/open-webui/open-webui) is an open-source,
self-hosted web interface that provides a ChatGPT-like experience for local
AI models. You can connect it to Docker Model Runner to get a polished chat
interface for your models.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Docker Model Runner enabled with TCP access
- A model pulled (e.g., `docker model pull ai/llama3.2`)
@y
- Docker Model Runner enabled with TCP access
- A model pulled (e.g., `docker model pull ai/llama3.2`)
@z

@x
## Quick start with Docker Compose
@y
## Quick start with Docker Compose
@z

@x
The easiest way to run Open WebUI with Docker Model Runner is using Docker Compose.
@y
The easiest way to run Open WebUI with Docker Model Runner is using Docker Compose.
@z

@x
Create a `compose.yaml` file:
@y
Create a `compose.yaml` file:
@z

@x
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    ports:
      - "3000:8080"
    environment:
      - OLLAMA_BASE_URL=http://host.docker.internal:12434
      - WEBUI_AUTH=false
    extra_hosts:
      - "host.docker.internal:host-gateway"
    volumes:
      - open-webui:/app/backend/data
@y
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    ports:
      - "3000:8080"
    environment:
      - OLLAMA_BASE_URL=http://host.docker.internal:12434
      - WEBUI_AUTH=false
    extra_hosts:
      - "host.docker.internal:host-gateway"
    volumes:
      - open-webui:/app/backend/data
@z

@x
volumes:
  open-webui:
```
@y
volumes:
  open-webui:
```
@z

@x
Start the services:
@y
Start the services:
@z

@x
```console
$ docker compose up -d
```
@y
```console
$ docker compose up -d
```
@z

@x
Open your browser to [http://localhost:3000](http://localhost:3000).
@y
Open your browser to [http://localhost:3000](http://localhost:3000).
@z

@x
## Configuration options
@y
## Configuration options
@z

@x
### Environment variables
@y
### Environment variables
@z

@x
| Variable | Description | Default |
|----------|-------------|---------|
| `OLLAMA_BASE_URL` | URL of Docker Model Runner | Required |
| `WEBUI_AUTH` | Enable authentication | `true` |
| `OPENAI_API_BASE_URL` | Use OpenAI-compatible API instead | - |
| `OPENAI_API_KEY` | API key (use any value for DMR) | - |
@y
| Variable | Description | Default |
|----------|-------------|---------|
| `OLLAMA_BASE_URL` | URL of Docker Model Runner | Required |
| `WEBUI_AUTH` | Enable authentication | `true` |
| `OPENAI_API_BASE_URL` | Use OpenAI-compatible API instead | - |
| `OPENAI_API_KEY` | API key (use any value for DMR) | - |
@z

@x
### Using OpenAI-compatible API
@y
### Using OpenAI-compatible API
@z

@x
If you prefer to use the OpenAI-compatible API instead of the Ollama API:
@y
If you prefer to use the OpenAI-compatible API instead of the Ollama API:
@z

@x
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    ports:
      - "3000:8080"
    environment:
      - OPENAI_API_BASE_URL=http://host.docker.internal:12434/engines/v1
      - OPENAI_API_KEY=not-needed
      - WEBUI_AUTH=false
    extra_hosts:
      - "host.docker.internal:host-gateway"
    volumes:
      - open-webui:/app/backend/data
@y
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    ports:
      - "3000:8080"
    environment:
      - OPENAI_API_BASE_URL=http://host.docker.internal:12434/engines/v1
      - OPENAI_API_KEY=not-needed
      - WEBUI_AUTH=false
    extra_hosts:
      - "host.docker.internal:host-gateway"
    volumes:
      - open-webui:/app/backend/data
@z

@x
volumes:
  open-webui:
```
@y
volumes:
  open-webui:
```
@z

@x
## Network configuration
@y
## Network configuration
@z

@x
### Docker Desktop
@y
### Docker Desktop
@z

@x
On Docker Desktop, `host.docker.internal` automatically resolves to the host machine.
The previous example works without modification.
@y
On Docker Desktop, `host.docker.internal` automatically resolves to the host machine.
The previous example works without modification.
@z

@x
### Docker Engine (Linux)
@y
### Docker Engine (Linux)
@z

@x
On Docker Engine, you may need to configure the network differently:
@y
On Docker Engine, you may need to configure the network differently:
@z

@x
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    network_mode: host
    environment:
      - OLLAMA_BASE_URL=http://localhost:12434
      - WEBUI_AUTH=false
    volumes:
      - open-webui:/app/backend/data
@y
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    network_mode: host
    environment:
      - OLLAMA_BASE_URL=http://localhost:12434
      - WEBUI_AUTH=false
    volumes:
      - open-webui:/app/backend/data
@z

@x
volumes:
  open-webui:
```
@y
volumes:
  open-webui:
```
@z

@x
Or use the host gateway:
@y
Or use the host gateway:
@z

@x
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    ports:
      - "3000:8080"
    environment:
      - OLLAMA_BASE_URL=http://172.17.0.1:12434
      - WEBUI_AUTH=false
    volumes:
      - open-webui:/app/backend/data
@y
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    ports:
      - "3000:8080"
    environment:
      - OLLAMA_BASE_URL=http://172.17.0.1:12434
      - WEBUI_AUTH=false
    volumes:
      - open-webui:/app/backend/data
@z

@x
volumes:
  open-webui:
```
@y
volumes:
  open-webui:
```
@z

@x
## Using Open WebUI
@y
## Using Open WebUI
@z

@x
### Select a model
@y
### Select a model
@z

@x
1. Open [http://localhost:3000](http://localhost:3000)
2. Select the model drop-down in the top-left
3. Select from your pulled models (they appear with `ai/` prefix)
@y
1. Open [http://localhost:3000](http://localhost:3000)
2. Select the model drop-down in the top-left
3. Select from your pulled models (they appear with `ai/` prefix)
@z

@x
### Pull models through the UI
@y
### Pull models through the UI
@z

@x
Open WebUI can pull models directly:
@y
Open WebUI can pull models directly:
@z

@x
1. Select the model drop-down
2. Enter a model name: `ai/llama3.2`
3. Select the download icon
@y
1. Select the model drop-down
2. Enter a model name: `ai/llama3.2`
3. Select the download icon
@z

@x
### Chat features
@y
### Chat features
@z

@x
Open WebUI provides:
@y
Open WebUI provides:
@z

@x
- Multi-turn conversations with context
- Message editing and regeneration
- Code syntax highlighting
- Markdown rendering
- Conversation history and search
- Export conversations
@y
- Multi-turn conversations with context
- Message editing and regeneration
- Code syntax highlighting
- Markdown rendering
- Conversation history and search
- Export conversations
@z

@x
## Complete example with multiple models
@y
## Complete example with multiple models
@z

@x
This example sets up Open WebUI with Docker Model Runner and pre-pulls several models:
@y
This example sets up Open WebUI with Docker Model Runner and pre-pulls several models:
@z

@x
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    ports:
      - "3000:8080"
    environment:
      - OLLAMA_BASE_URL=http://host.docker.internal:12434
      - WEBUI_AUTH=false
      - DEFAULT_MODELS=ai/llama3.2
    extra_hosts:
      - "host.docker.internal:host-gateway"
    volumes:
      - open-webui:/app/backend/data
    depends_on:
      model-setup:
        condition: service_completed_successfully
@y
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    ports:
      - "3000:8080"
    environment:
      - OLLAMA_BASE_URL=http://host.docker.internal:12434
      - WEBUI_AUTH=false
      - DEFAULT_MODELS=ai/llama3.2
    extra_hosts:
      - "host.docker.internal:host-gateway"
    volumes:
      - open-webui:/app/backend/data
    depends_on:
      model-setup:
        condition: service_completed_successfully
@z

@x
  model-setup:
    image: docker:cli
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    command: >
      sh -c "
        docker model pull ai/llama3.2 &&
        docker model pull ai/qwen2.5-coder &&
        docker model pull ai/smollm2
      "
@y
  model-setup:
    image: docker:cli
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    command: >
      sh -c "
        docker model pull ai/llama3.2 &&
        docker model pull ai/qwen2.5-coder &&
        docker model pull ai/smollm2
      "
@z

@x
volumes:
  open-webui:
```
@y
volumes:
  open-webui:
```
@z

@x
## Enabling authentication
@y
## Enabling authentication
@z

@x
For multi-user setups or security, enable authentication:
@y
For multi-user setups or security, enable authentication:
@z

@x
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    ports:
      - "3000:8080"
    environment:
      - OLLAMA_BASE_URL=http://host.docker.internal:12434
      - WEBUI_AUTH=true
    extra_hosts:
      - "host.docker.internal:host-gateway"
    volumes:
      - open-webui:/app/backend/data
@y
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    ports:
      - "3000:8080"
    environment:
      - OLLAMA_BASE_URL=http://host.docker.internal:12434
      - WEBUI_AUTH=true
    extra_hosts:
      - "host.docker.internal:host-gateway"
    volumes:
      - open-webui:/app/backend/data
@z

@x
volumes:
  open-webui:
```
@y
volumes:
  open-webui:
```
@z

@x
On first visit, you'll create an admin account.
@y
On first visit, you'll create an admin account.
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
### Models don't appear in the drop-down
@y
### Models don't appear in the drop-down
@z

@x
1. Verify Docker Model Runner is accessible:
   ```console
   $ curl http://localhost:12434/api/tags
   ```
@y
1. Verify Docker Model Runner is accessible:
   ```console
   $ curl http://localhost:12434/api/tags
   ```
@z

@x
2. Check that models are pulled:
   ```console
   $ docker model list
   ```
@y
2. Check that models are pulled:
   ```console
   $ docker model list
   ```
@z

@x
3. Verify the `OLLAMA_BASE_URL` is correct and accessible from the container.
@y
3. Verify the `OLLAMA_BASE_URL` is correct and accessible from the container.
@z

@x
### "Connection refused" errors
@y
### "Connection refused" errors
@z

@x
1. Ensure TCP access is enabled for Docker Model Runner.
@y
1. Ensure TCP access is enabled for Docker Model Runner.
@z

@x
2. On Docker Desktop, verify `host.docker.internal` resolves:
   ```console
   $ docker run --rm alpine ping -c 1 host.docker.internal
   ```
@y
2. On Docker Desktop, verify `host.docker.internal` resolves:
   ```console
   $ docker run --rm alpine ping -c 1 host.docker.internal
   ```
@z

@x
3. On Docker Engine, try using `network_mode: host` or the explicit host IP.
@y
3. On Docker Engine, try using `network_mode: host` or the explicit host IP.
@z

@x
### Slow response times
@y
### Slow response times
@z

@x
1. First requests load the model into memory, which takes time.
@y
1. First requests load the model into memory, which takes time.
@z

@x
2. Subsequent requests are much faster.
@y
2. Subsequent requests are much faster.
@z

@x
3. If consistently slow, consider:
   - Using a smaller model
   - Reducing context size
   - Checking GPU acceleration is working
@y
3. If consistently slow, consider:
   - Using a smaller model
   - Reducing context size
   - Checking GPU acceleration is working
@z

@x
### CORS errors
@y
### CORS errors
@z

@x
If running Open WebUI on a different host:
@y
If running Open WebUI on a different host:
@z

@x
1. In Docker Desktop, go to Settings > AI
2. Add the Open WebUI URL to **CORS Allowed Origins**
@y
1. In Docker Desktop, go to Settings > AI
2. Add the Open WebUI URL to **CORS Allowed Origins**
@z

@x
## Customization
@y
## Customization
@z

@x
### Custom system prompts
@y
### Custom system prompts
@z

@x
Open WebUI supports setting system prompts per model. Configure these in the UI under Settings > Models.
@y
Open WebUI supports setting system prompts per model. Configure these in the UI under Settings > Models.
@z

@x
### Model parameters
@y
### Model parameters
@z

@x
Adjust model parameters in the chat interface:
@y
Adjust model parameters in the chat interface:
@z

@x
1. Select the settings icon next to the model name
2. Adjust temperature, top-p, max tokens, etc.
@y
1. Select the settings icon next to the model name
2. Adjust temperature, top-p, max tokens, etc.
@z

@x
These settings are passed through to Docker Model Runner.
@y
These settings are passed through to Docker Model Runner.
@z

@x
## Running on a different port
@y
## Running on a different port
@z

@x
To run Open WebUI on a different port:
@y
To run Open WebUI on a different port:
@z

@x
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    ports:
      - "8080:8080"  # Change first port number
    # ... rest of config
```
@y
```yaml
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    ports:
      - "8080:8080"  # Change first port number
    # ... rest of config
```
@z

@x
## What's next
@y
## What's next
@z

@x
- [API reference](api-reference.md) - Learn about the APIs Open WebUI uses
- [Configuration options](configuration.md) - Tune model behavior
- [IDE integrations](ide-integrations.md) - Connect other tools to DMR
@y
- [API reference](api-reference.md) - Learn about the APIs Open WebUI uses
- [Configuration options](configuration.md) - Tune model behavior
- [IDE integrations](ide-integrations.md) - Connect other tools to DMR
@z
