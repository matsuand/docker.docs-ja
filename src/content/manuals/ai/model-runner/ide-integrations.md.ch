%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: IDE and tool integrations
description: Configure popular AI coding assistants and tools to use Docker Model Runner as their backend.
@y
title: IDE and tool integrations
description: Configure popular AI coding assistants and tools to use Docker Model Runner as their backend.
@z

@x
keywords: Docker, ai, model runner, cline, continue, cursor, vscode, ide, integration, openai, ollama
@y
keywords: Docker, ai, model runner, cline, continue, cursor, vscode, ide, integration, openai, ollama
@z

@x
Docker Model Runner can serve as a local backend for popular AI coding assistants
and development tools. This guide shows how to configure common tools to use
models running in DMR.
@y
Docker Model Runner can serve as a local backend for popular AI coding assistants
and development tools. This guide shows how to configure common tools to use
models running in DMR.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before configuring any tool:
@y
Before configuring any tool:
@z

@x
1. [Enable Docker Model Runner](get-started.md#enable-docker-model-runner) in Docker Desktop or Docker Engine.
2. Enable TCP host access:
   - Docker Desktop: Enable **host-side TCP support** in Settings > AI, or run:
     ```console
     $ docker desktop enable model-runner --tcp 12434
     ```
   - Docker Engine: TCP is enabled by default on port 12434.
3. Pull a model:
   ```console
   $ docker model pull ai/qwen2.5-coder
   ```
@y
1. [Enable Docker Model Runner](get-started.md#enable-docker-model-runner) in Docker Desktop or Docker Engine.
2. Enable TCP host access:
   - Docker Desktop: Enable **host-side TCP support** in Settings > AI, or run:
     ```console
     $ docker desktop enable model-runner --tcp 12434
     ```
   - Docker Engine: TCP is enabled by default on port 12434.
3. Pull a model:
   ```console
   $ docker model pull ai/qwen2.5-coder
   ```
@z

@x
## Cline (VS Code)
@y
## Cline (VS Code)
@z

@x
[Cline](https://github.com/cline/cline) is an AI coding assistant for VS Code.
@y
[Cline](https://github.com/cline/cline) is an AI coding assistant for VS Code.
@z

@x
### Configuration
@y
### Configuration
@z

@x
1. Open VS Code and go to the Cline extension settings.
2. Select **OpenAI Compatible** as the API provider.
3. Configure the following settings:
@y
1. Open VS Code and go to the Cline extension settings.
2. Select **OpenAI Compatible** as the API provider.
3. Configure the following settings:
@z

@x
| Setting | Value |
|---------|-------|
| Base URL | `http://localhost:12434/engines/v1` |
| API Key | `not-needed` (or any placeholder value) |
| Model ID | `ai/qwen2.5-coder` (or your preferred model) |
@y
| Setting | Value |
|---------|-------|
| Base URL | `http://localhost:12434/engines/v1` |
| API Key | `not-needed` (or any placeholder value) |
| Model ID | `ai/qwen2.5-coder` (or your preferred model) |
@z

@x
> [!IMPORTANT]
> The base URL must include `/engines/v1` at the end. Do not include a trailing slash.
@y
> [!IMPORTANT]
> The base URL must include `/engines/v1` at the end. Do not include a trailing slash.
@z

@x
### Troubleshooting Cline
@y
### Troubleshooting Cline
@z

@x
If Cline fails to connect:
@y
If Cline fails to connect:
@z

@x
1. Verify DMR is running:
   ```console
   $ docker model status
   ```
@y
1. Verify DMR is running:
   ```console
   $ docker model status
   ```
@z

@x
2. Test the endpoint directly:
   ```console
   $ curl http://localhost:12434/engines/v1/models
   ```
@y
2. Test the endpoint directly:
   ```console
   $ curl http://localhost:12434/engines/v1/models
   ```
@z

@x
3. Check that CORS is configured if running a web-based version:
   - In Docker Desktop Settings > AI, add your origin to **CORS Allowed Origins**
@y
3. Check that CORS is configured if running a web-based version:
   - In Docker Desktop Settings > AI, add your origin to **CORS Allowed Origins**
@z

@x
## Continue (VS Code / JetBrains)
@y
## Continue (VS Code / JetBrains)
@z

@x
[Continue](https://continue.dev) is an open-source AI code assistant that works with VS Code and JetBrains IDEs.
@y
[Continue](https://continue.dev) is an open-source AI code assistant that works with VS Code and JetBrains IDEs.
@z

@x
### Configuration
@y
### Configuration
@z

@x
Edit your Continue configuration file (`~/.continue/config.json`):
@y
Edit your Continue configuration file (`~/.continue/config.json`):
@z

@x
```json
{
  "models": [
    {
      "title": "Docker Model Runner",
      "provider": "openai",
      "model": "ai/qwen2.5-coder",
      "apiBase": "http://localhost:12434/engines/v1",
      "apiKey": "not-needed"
    }
  ]
}
```
@y
```json
{
  "models": [
    {
      "title": "Docker Model Runner",
      "provider": "openai",
      "model": "ai/qwen2.5-coder",
      "apiBase": "http://localhost:12434/engines/v1",
      "apiKey": "not-needed"
    }
  ]
}
```
@z

@x
### Using Ollama provider
@y
### Using Ollama provider
@z

@x
Continue also supports the Ollama provider, which works with DMR:
@y
Continue also supports the Ollama provider, which works with DMR:
@z

@x
```json
{
  "models": [
    {
      "title": "Docker Model Runner (Ollama)",
      "provider": "ollama",
      "model": "ai/qwen2.5-coder",
      "apiBase": "http://localhost:12434"
    }
  ]
}
```
@y
```json
{
  "models": [
    {
      "title": "Docker Model Runner (Ollama)",
      "provider": "ollama",
      "model": "ai/qwen2.5-coder",
      "apiBase": "http://localhost:12434"
    }
  ]
}
```
@z

@x
## Cursor
@y
## Cursor
@z

@x
[Cursor](https://cursor.sh) is an AI-powered code editor.
@y
[Cursor](https://cursor.sh) is an AI-powered code editor.
@z

@x
### Configuration
@y
### Configuration
@z

@x
1. Open Cursor Settings (Cmd/Ctrl + ,).
2. Navigate to **Models** > **OpenAI API Key**.
3. Configure:
@y
1. Open Cursor Settings (Cmd/Ctrl + ,).
2. Navigate to **Models** > **OpenAI API Key**.
3. Configure:
@z

@x
   | Setting | Value |
   |---------|-------|
   | OpenAI API Key | `not-needed` |
   | Override OpenAI Base URL | `http://localhost:12434/engines/v1` |
@y
   | Setting | Value |
   |---------|-------|
   | OpenAI API Key | `not-needed` |
   | Override OpenAI Base URL | `http://localhost:12434/engines/v1` |
@z

@x
4. In the model drop-down, enter your model name: `ai/qwen2.5-coder`
@y
4. In the model drop-down, enter your model name: `ai/qwen2.5-coder`
@z

@x
> [!NOTE]
> Some Cursor features may require models with specific capabilities (e.g., function calling).
> Use capable models like `ai/qwen2.5-coder` or `ai/llama3.2` for best results.
@y
> [!NOTE]
> Some Cursor features may require models with specific capabilities (e.g., function calling).
> Use capable models like `ai/qwen2.5-coder` or `ai/llama3.2` for best results.
@z

@x
## Zed
@y
## Zed
@z

@x
[Zed](https://zed.dev) is a high-performance code editor with AI features.
@y
[Zed](https://zed.dev) is a high-performance code editor with AI features.
@z

@x
### Configuration
@y
### Configuration
@z

@x
Edit your Zed settings (`~/.config/zed/settings.json`):
@y
Edit your Zed settings (`~/.config/zed/settings.json`):
@z

@x
```json
{
  "language_models": {
    "openai": {
      "api_url": "http://localhost:12434/engines/v1",
      "available_models": [
        {
          "name": "ai/qwen2.5-coder",
          "display_name": "Qwen 2.5 Coder (DMR)",
          "max_tokens": 8192
        }
      ]
    }
  }
}
```
@y
```json
{
  "language_models": {
    "openai": {
      "api_url": "http://localhost:12434/engines/v1",
      "available_models": [
        {
          "name": "ai/qwen2.5-coder",
          "display_name": "Qwen 2.5 Coder (DMR)",
          "max_tokens": 8192
        }
      ]
    }
  }
}
```
@z

@x
## Open WebUI
@y
## Open WebUI
@z

@x
[Open WebUI](https://github.com/open-webui/open-webui) provides a ChatGPT-like interface for local models.
@y
[Open WebUI](https://github.com/open-webui/open-webui) provides a ChatGPT-like interface for local models.
@z

@x
See [Open WebUI integration](openwebui-integration.md) for detailed setup instructions.
@y
See [Open WebUI integration](openwebui-integration.md) for detailed setup instructions.
@z

@x
## Aider
@y
## Aider
@z

@x
[Aider](https://aider.chat) is an AI pair programming tool for the terminal.
@y
[Aider](https://aider.chat) is an AI pair programming tool for the terminal.
@z

@x
### Configuration
@y
### Configuration
@z

@x
Set environment variables or use command-line flags:
@y
Set environment variables or use command-line flags:
@z

@x
```bash
export OPENAI_API_BASE=http://localhost:12434/engines/v1
export OPENAI_API_KEY=not-needed
@y
```bash
export OPENAI_API_BASE=http://localhost:12434/engines/v1
export OPENAI_API_KEY=not-needed
@z

@x
aider --model openai/ai/qwen2.5-coder
```
@y
aider --model openai/ai/qwen2.5-coder
```
@z

@x
Or in a single command:
@y
Or in a single command:
@z

@x
```console
$ aider --openai-api-base http://localhost:12434/engines/v1 \
        --openai-api-key not-needed \
        --model openai/ai/qwen2.5-coder
```
@y
```console
$ aider --openai-api-base http://localhost:12434/engines/v1 \
        --openai-api-key not-needed \
        --model openai/ai/qwen2.5-coder
```
@z

@x
## LangChain
@y
## LangChain
@z

@x
### Python
@y
### Python
@z

@x
```python
from langchain_openai import ChatOpenAI
@y
```python
from langchain_openai import ChatOpenAI
@z

@x
llm = ChatOpenAI(
    base_url="http://localhost:12434/engines/v1",
    api_key="not-needed",
    model="ai/qwen2.5-coder"
)
@y
llm = ChatOpenAI(
    base_url="http://localhost:12434/engines/v1",
    api_key="not-needed",
    model="ai/qwen2.5-coder"
)
@z

@x
response = llm.invoke("Write a hello world function in Python")
print(response.content)
```
@y
response = llm.invoke("Write a hello world function in Python")
print(response.content)
```
@z

@x
### JavaScript/TypeScript
@y
### JavaScript/TypeScript
@z

@x
```typescript
import { ChatOpenAI } from "@langchain/openai";
@y
```typescript
import { ChatOpenAI } from "@langchain/openai";
@z

@x
const model = new ChatOpenAI({
  configuration: {
    baseURL: "http://localhost:12434/engines/v1",
  },
  apiKey: "not-needed",
  modelName: "ai/qwen2.5-coder",
});
@y
const model = new ChatOpenAI({
  configuration: {
    baseURL: "http://localhost:12434/engines/v1",
  },
  apiKey: "not-needed",
  modelName: "ai/qwen2.5-coder",
});
@z

@x
const response = await model.invoke("Write a hello world function");
console.log(response.content);
```
@y
const response = await model.invoke("Write a hello world function");
console.log(response.content);
```
@z

@x
## LlamaIndex
@y
## LlamaIndex
@z

@x
```python
from llama_index.llms.openai_like import OpenAILike
@y
```python
from llama_index.llms.openai_like import OpenAILike
@z

@x
llm = OpenAILike(
    api_base="http://localhost:12434/engines/v1",
    api_key="not-needed",
    model="ai/qwen2.5-coder"
)
@y
llm = OpenAILike(
    api_base="http://localhost:12434/engines/v1",
    api_key="not-needed",
    model="ai/qwen2.5-coder"
)
@z

@x
response = llm.complete("Write a hello world function")
print(response.text)
```
@y
response = llm.complete("Write a hello world function")
print(response.text)
```
@z

@x
## OpenCode
@y
## OpenCode
@z

@x
[OpenCode](https://opencode.ai/) is an open-source coding assistant designed to integrate directly into developer workflows. It supports multiple model providers and exposes a flexible configuration system that makes it easy to switch between them.
@y
[OpenCode](https://opencode.ai/) is an open-source coding assistant designed to integrate directly into developer workflows. It supports multiple model providers and exposes a flexible configuration system that makes it easy to switch between them.
@z

@x
### Configuration
@y
### Configuration
@z

@x
1. Install OpenCode (see [docs](https://opencode.ai/docs/#install))
2. Reference DMR in your OpenCode configuration, either globally at `~/.config/opencode/opencode.json` or project specific with a `opencode.json` file in the root of your project
@y
1. Install OpenCode (see [docs](https://opencode.ai/docs/#install))
2. Reference DMR in your OpenCode configuration, either globally at `~/.config/opencode/opencode.json` or project specific with a `opencode.json` file in the root of your project
@z

% snip code...

@x
3. Select the model you want in OpenCode
@y
3. Select the model you want in OpenCode
@z

@x
You can find more details in [this Docker Blog post](https://www.docker.com/blog/opencode-docker-model-runner-private-ai-coding/)
@y
You can find more details in [this Docker Blog post](https://www.docker.com/blog/opencode-docker-model-runner-private-ai-coding/)
@z

@x
## Common issues
@y
## Common issues
@z

@x
### "Connection refused" errors
@y
### "Connection refused" errors
@z

@x
1. Ensure Docker Model Runner is enabled and running:
   ```console
   $ docker model status
   ```
@y
1. Ensure Docker Model Runner is enabled and running:
   ```console
   $ docker model status
   ```
@z

@x
2. Verify TCP access is enabled:
   ```console
   $ curl http://localhost:12434/engines/v1/models
   ```
@y
2. Verify TCP access is enabled:
   ```console
   $ curl http://localhost:12434/engines/v1/models
   ```
@z

@x
3. Check if another service is using port 12434.
@y
3. Check if another service is using port 12434.
@z

@x
### "Model not found" errors
@y
### "Model not found" errors
@z

@x
1. Verify the model is pulled:
   ```console
   $ docker model list
   ```
@y
1. Verify the model is pulled:
   ```console
   $ docker model list
   ```
@z

@x
2. Use the full model name including namespace (e.g., `ai/qwen2.5-coder`, not just `qwen2.5-coder`).
@y
2. Use the full model name including namespace (e.g., `ai/qwen2.5-coder`, not just `qwen2.5-coder`).
@z

@x
### Slow responses or timeouts
@y
### Slow responses or timeouts
@z

@x
1. For first requests, models need to load into memory. Subsequent requests are faster.
@y
1. For first requests, models need to load into memory. Subsequent requests are faster.
@z

@x
2. Consider using a smaller model or adjusting the context size:
   ```console
   $ docker model configure --context-size 4096 ai/qwen2.5-coder
   ```
@y
2. Consider using a smaller model or adjusting the context size:
   ```console
   $ docker model configure --context-size 4096 ai/qwen2.5-coder
   ```
@z

@x
3. Check available system resources (RAM, GPU memory).
@y
3. Check available system resources (RAM, GPU memory).
@z

@x
### CORS errors (web-based tools)
@y
### CORS errors (web-based tools)
@z

@x
If using browser-based tools, add the origin to CORS allowed origins:
@y
If using browser-based tools, add the origin to CORS allowed origins:
@z

@x
1. Docker Desktop: Settings > AI > CORS Allowed Origins
2. Add your tool's URL (e.g., `http://localhost:3000`)
@y
1. Docker Desktop: Settings > AI > CORS Allowed Origins
2. Add your tool's URL (e.g., `http://localhost:3000`)
@z

@x
## Recommended models by use case
@y
## Recommended models by use case
@z

@x
| Use case | Recommended model | Notes |
|----------|-------------------|-------|
| Code completion | `ai/qwen2.5-coder` | Optimized for coding tasks |
| General assistant | `ai/llama3.2` | Good balance of capabilities |
| Small/fast | `ai/smollm2` | Low resource usage |
| Embeddings | `ai/all-minilm` | For RAG and semantic search |
@y
| Use case | Recommended model | Notes |
|----------|-------------------|-------|
| Code completion | `ai/qwen2.5-coder` | Optimized for coding tasks |
| General assistant | `ai/llama3.2` | Good balance of capabilities |
| Small/fast | `ai/smollm2` | Low resource usage |
| Embeddings | `ai/all-minilm` | For RAG and semantic search |
@z

@x
## What's next
@y
## What's next
@z

@x
- [API reference](api-reference.md) - Full API documentation
- [Configuration options](configuration.md) - Tune model behavior
- [Open WebUI integration](openwebui-integration.md) - Set up a web interface
@y
- [API reference](api-reference.md) - Full API documentation
- [Configuration options](configuration.md) - Tune model behavior
- [Open WebUI integration](openwebui-integration.md) - Set up a web interface
@z
