%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Local Models (Ollama, vLLM, LocalAI)"
description: "Run Docker Agent with locally hosted models for privacy, offline use, or cost savings."
keywords: docker agent, ai agents, model providers, llm, local models, ollama, vllm, localai, offline models
linkTitle: "Local Models"
@y
title: "Local Models (Ollama, vLLM, LocalAI)"
description: "Run Docker Agent with locally hosted models for privacy, offline use, or cost savings."
keywords: docker agent, ai agents, model providers, llm, local models, ollama, vllm, localai, offline models
linkTitle: "Local Models"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/providers/local/
@y
canonical: __SUBDIR__/ai/docker-agent/providers/local/
@z

@x
_Run Docker Agent with locally hosted models for privacy, offline use, or cost savings._
@y
_Run Docker Agent with locally hosted models for privacy, offline use, or cost savings._
@z

@x
## Overview
@y
## Overview
@z

@x
Docker Agent can connect to any OpenAI-compatible local model server. This guide covers the most popular options:
@y
Docker Agent can connect to any OpenAI-compatible local model server. This guide covers the most popular options:
@z

@x
- **Ollama** — Easy-to-use local model runner
- **vLLM** — High-performance inference server
- **LocalAI** — OpenAI-compatible API for various backends
@y
- **Ollama** — Easy-to-use local model runner
- **vLLM** — High-performance inference server
- **LocalAI** — OpenAI-compatible API for various backends
@z

@x
> [!TIP]
> **Docker Model Runner**
>
> For the easiest local model experience, consider [Docker Model Runner](../dmr/index.md) which is built into Docker Desktop and requires no additional setup.
@y
> [!TIP]
> **Docker Model Runner**
>
> For the easiest local model experience, consider [Docker Model Runner](../dmr/index.md) which is built into Docker Desktop and requires no additional setup.
@z

@x
## Ollama
@y
## Ollama
@z

@x
Ollama is a popular tool for running LLMs locally. Docker Agent includes a built-in `ollama` alias for easy configuration.
@y
Ollama is a popular tool for running LLMs locally. Docker Agent includes a built-in `ollama` alias for easy configuration.
@z

@x
### Setup
@y
### Setup
@z

@x
1. Install Ollama from [ollama.ai](https://ollama.ai/)
2. Pull a model:
@y
1. Install Ollama from [ollama.ai](https://ollama.ai/)
2. Pull a model:
@z

@x
   ```bash
   ollama pull llama3.2
   ollama pull qwen2.5-coder
   ```
@y
   ```bash
   ollama pull llama3.2
   ollama pull qwen2.5-coder
   ```
@z

@x
3. Start the Ollama server (usually runs automatically):
@y
3. Start the Ollama server (usually runs automatically):
@z

@x
   ```bash
   ollama serve
   ```
@y
   ```bash
   ollama serve
   ```
@z

@x
### Configuration
@y
### Configuration
@z

@x
Use the built-in `ollama` alias:
@y
Use the built-in `ollama` alias:
@z

@x
```yaml
agents:
  root:
    model: ollama/llama3.2
    description: Local assistant
    instruction: You are a helpful assistant.
```
@y
```yaml
agents:
  root:
    model: ollama/llama3.2
    description: Local assistant
    instruction: You are a helpful assistant.
```
@z

@x
The `ollama` alias automatically uses:
@y
The `ollama` alias automatically uses:
@z

@x
- **Base URL:** `http://localhost:11434/v1`
- **API Type:** OpenAI-compatible
- **No API key required**
@y
- **Base URL:** `http://localhost:11434/v1`
- **API Type:** OpenAI-compatible
- **No API key required**
@z

@x
### Custom Port or Host
@y
### Custom Port or Host
@z

@x
If Ollama runs on a different host or port:
@y
If Ollama runs on a different host or port:
@z

@x
```yaml
models:
  my_ollama:
    provider: ollama
    model: llama3.2
    base_url: http://192.168.1.100:11434/v1
@y
```yaml
models:
  my_ollama:
    provider: ollama
    model: llama3.2
    base_url: http://192.168.1.100:11434/v1
@z

@x
agents:
  root:
    model: my_ollama
    description: Remote Ollama assistant
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: my_ollama
    description: Remote Ollama assistant
    instruction: You are a helpful assistant.
```
@z

@x
### Popular Ollama Models
@y
### Popular Ollama Models
@z

@x
| Model            | Size | Best For              |
| ---------------- | ---- | --------------------- |
| `llama3.2`       | 3B   | General purpose, fast |
| `llama3.1`       | 8B   | Better reasoning      |
| `qwen2.5-coder`  | 7B   | Code generation       |
| `mistral`        | 7B   | General purpose       |
| `codellama`      | 7B   | Code tasks            |
| `deepseek-coder` | 6.7B | Code generation       |
@y
| Model            | Size | Best For              |
| ---------------- | ---- | --------------------- |
| `llama3.2`       | 3B   | General purpose, fast |
| `llama3.1`       | 8B   | Better reasoning      |
| `qwen2.5-coder`  | 7B   | Code generation       |
| `mistral`        | 7B   | General purpose       |
| `codellama`      | 7B   | Code tasks            |
| `deepseek-coder` | 6.7B | Code generation       |
@z

@x
## vLLM
@y
## vLLM
@z

@x
vLLM is a high-performance inference server optimized for throughput.
@y
vLLM is a high-performance inference server optimized for throughput.
@z

@x
### Setup
@y
### Setup
@z

@x
```bash
# Install vLLM
pip install vllm
@y
```bash
# Install vLLM
pip install vllm
@z

@x
# Start the server
python -m vllm.entrypoints.openai.api_server \
  --model meta-llama/Llama-3.2-3B-Instruct \
  --port 8000
```
@y
# Start the server
python -m vllm.entrypoints.openai.api_server \
  --model meta-llama/Llama-3.2-3B-Instruct \
  --port 8000
```
@z

@x
### Configuration
@y
### Configuration
@z

@x
```yaml
providers:
  vllm:
    api_type: openai_chatcompletions
    base_url: http://localhost:8000/v1
@y
```yaml
providers:
  vllm:
    api_type: openai_chatcompletions
    base_url: http://localhost:8000/v1
@z

@x
agents:
  root:
    model: vllm/meta-llama/Llama-3.2-3B-Instruct
    description: vLLM-powered assistant
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: vllm/meta-llama/Llama-3.2-3B-Instruct
    description: vLLM-powered assistant
    instruction: You are a helpful assistant.
```
@z

@x
## LocalAI
@y
## LocalAI
@z

@x
LocalAI provides an OpenAI-compatible API that works with various backends.
@y
LocalAI provides an OpenAI-compatible API that works with various backends.
@z

@x
### Setup
@y
### Setup
@z

@x
```bash
# Run with Docker
docker run -p 8080:8080 --name local-ai \
  -v ./models:/models \
  localai/localai:latest-cpu
```
@y
```bash
# Run with Docker
docker run -p 8080:8080 --name local-ai \
  -v ./models:/models \
  localai/localai:latest-cpu
```
@z

@x
### Configuration
@y
### Configuration
@z

@x
```yaml
providers:
  localai:
    api_type: openai_chatcompletions
    base_url: http://localhost:8080/v1
@y
```yaml
providers:
  localai:
    api_type: openai_chatcompletions
    base_url: http://localhost:8080/v1
@z

@x
agents:
  root:
    model: localai/gpt4all-j
    description: LocalAI assistant
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: localai/gpt4all-j
    description: LocalAI assistant
    instruction: You are a helpful assistant.
```
@z

@x
## Generic Custom Provider
@y
## Generic Custom Provider
@z

@x
For any OpenAI-compatible server:
@y
For any OpenAI-compatible server:
@z

@x
```yaml
providers:
  my_server:
    api_type: openai_chatcompletions
    base_url: http://localhost:8000/v1
    # token_key: MY_API_KEY  # if auth required
@y
```yaml
providers:
  my_server:
    api_type: openai_chatcompletions
    base_url: http://localhost:8000/v1
    # token_key: MY_API_KEY  # if auth required
@z

@x
agents:
  root:
    model: my_server/model-name
    description: Custom server assistant
    instruction: You are a helpful assistant.
```
@y
agents:
  root:
    model: my_server/model-name
    description: Custom server assistant
    instruction: You are a helpful assistant.
```
@z

@x
## Performance Tips
@y
## Performance Tips
@z

@x
> [!NOTE]
> **Local Model Considerations**
>
> - **Memory:** Larger models need more RAM/VRAM. A 7B model typically needs 8-16GB RAM.
> - **GPU:** GPU acceleration dramatically improves speed. Check your server's GPU support.
> - **Context length:** Local models often have smaller context windows than cloud models.
> - **Tool calling:** Not all local models support function/tool calling. Test your model's capabilities.
@y
> [!NOTE]
> **Local Model Considerations**
>
> - **Memory:** Larger models need more RAM/VRAM. A 7B model typically needs 8-16GB RAM.
> - **GPU:** GPU acceleration dramatically improves speed. Check your server's GPU support.
> - **Context length:** Local models often have smaller context windows than cloud models.
> - **Tool calling:** Not all local models support function/tool calling. Test your model's capabilities.
@z

@x
## Example: Offline Development Agent
@y
## Example: Offline Development Agent
@z

@x
```yaml
agents:
  developer:
    model: ollama/qwen2.5-coder
    description: Offline code assistant
    instruction: |
      You are a software developer working offline.
      Focus on code quality and clear explanations.
    max_iterations: 20
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
      - type: todo
```
@y
```yaml
agents:
  developer:
    model: ollama/qwen2.5-coder
    description: Offline code assistant
    instruction: |
      You are a software developer working offline.
      Focus on code quality and clear explanations.
    max_iterations: 20
    toolsets:
      - type: filesystem
      - type: shell
      - type: think
      - type: todo
```
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
### Connection Refused
@y
### Connection Refused
@z

@x
Ensure your model server is running and accessible:
@y
Ensure your model server is running and accessible:
@z

@x
```bash
curl http://localhost:11434/v1/models  # Ollama
curl http://localhost:8000/v1/models   # vLLM
```
@y
```bash
curl http://localhost:11434/v1/models  # Ollama
curl http://localhost:8000/v1/models   # vLLM
```
@z

@x
### Model Not Found
@y
### Model Not Found
@z

@x
Verify the model is downloaded/available:
@y
Verify the model is downloaded/available:
@z

@x
```bash
ollama list  # List available Ollama models
```
@y
```bash
ollama list  # List available Ollama models
```
@z

@x
### Slow Responses
@y
### Slow Responses
@z

@x
- Check if GPU acceleration is enabled
- Try a smaller model
- Reduce `max_tokens` in your config
@y
- Check if GPU acceleration is enabled
- Try a smaller model
- Reduce `max_tokens` in your config
@z
