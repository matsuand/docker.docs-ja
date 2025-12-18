%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Local models with Docker Model Runner
linkTitle: Local models
description: Run AI models locally using Docker Model Runner - no API keys required
keywords: [cagent, docker model runner, dmr, local models, embeddings, offline]
@y
title: Local models with Docker Model Runner
linkTitle: Local models
description: Run AI models locally using Docker Model Runner - no API keys required
keywords: [cagent, docker model runner, dmr, local models, embeddings, offline]
@z

@x
Docker Model Runner lets you run AI models locally on your machine. No API
keys, no recurring costs, and your data stays private.
@y
Docker Model Runner lets you run AI models locally on your machine. No API
keys, no recurring costs, and your data stays private.
@z

@x
## Why use local models
@y
## Why use local models
@z

@x
Docker Model Runner lets you run models locally without API keys or recurring
costs. Your data stays on your machine, and you can work offline once models
are downloaded. This is an alternative to [cloud model
providers](model-providers.md).
@y
Docker Model Runner lets you run models locally without API keys or recurring
costs. Your data stays on your machine, and you can work offline once models
are downloaded. This is an alternative to [cloud model
providers](model-providers.md).
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
You need Docker Model Runner installed and running:
@y
You need Docker Model Runner installed and running:
@z

@x
- Docker Desktop (macOS/Windows) - Enable Docker Model Runner in
  **Settings > AI > Enable Docker Model Runner**. See [Get started with
  DMR](/manuals/ai/model-runner/get-started.md#enable-docker-model-runner) for
  detailed instructions.
- Docker Engine (Linux) - Install with `sudo apt-get install
docker-model-plugin` or `sudo dnf install docker-model-plugin`. See [Get
  started with DMR](/manuals/ai/model-runner/get-started.md#docker-engine).
@y
- Docker Desktop (macOS/Windows) - Enable Docker Model Runner in
  **Settings > AI > Enable Docker Model Runner**. See [Get started with
  DMR](manuals/ai/model-runner/get-started.md#enable-docker-model-runner) for
  detailed instructions.
- Docker Engine (Linux) - Install with `sudo apt-get install
docker-model-plugin` or `sudo dnf install docker-model-plugin`. See [Get
  started with DMR](manuals/ai/model-runner/get-started.md#docker-engine).
@z

@x
Verify Docker Model Runner is available:
@y
Verify Docker Model Runner is available:
@z

@x
```console
$ docker model version
```
@y
```console
$ docker model version
```
@z

@x
If the command returns version information, you're ready to use local models.
@y
If the command returns version information, you're ready to use local models.
@z

@x
## Using models with DMR
@y
## Using models with DMR
@z

@x
Docker Model Runner can run any compatible model. Models can come from:
@y
Docker Model Runner can run any compatible model. Models can come from:
@z

@x
- Docker Hub repositories (`docker.io/namespace/model-name`)
- Your own OCI artifacts packaged and pushed to any registry
- HuggingFace models directly (`hf.co/org/model-name`)
- The Docker Model catalog in Docker Desktop
@y
- Docker Hub repositories (`docker.io/namespace/model-name`)
- Your own OCI artifacts packaged and pushed to any registry
- HuggingFace models directly (`hf.co/org/model-name`)
- The Docker Model catalog in Docker Desktop
@z

@x
To see models available through the Docker catalog, run:
@y
To see models available through the Docker catalog, run:
@z

@x
```console
$ docker model list --available
```
@y
```console
$ docker model list --available
```
@z

@x
To use a model, reference it in your configuration. DMR automatically pulls
models on first use if they're not already local.
@y
To use a model, reference it in your configuration. DMR automatically pulls
models on first use if they're not already local.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Configure your agent to use Docker Model Runner with the `dmr` provider:
@y
Configure your agent to use Docker Model Runner with the `dmr` provider:
@z

@x
```yaml
agents:
  root:
    model: dmr/ai/qwen3
    instruction: You are a helpful assistant
    toolsets:
      - type: filesystem
```
@y
```yaml
agents:
  root:
    model: dmr/ai/qwen3
    instruction: You are a helpful assistant
    toolsets:
      - type: filesystem
```
@z

@x
When you first run your agent, cagent prompts you to pull the model if it's
not already available locally:
@y
When you first run your agent, cagent prompts you to pull the model if it's
not already available locally:
@z

@x
```console
$ cagent run agent.yaml
Model not found locally. Do you want to pull it now? ([y]es/[n]o)
```
@y
```console
$ cagent run agent.yaml
Model not found locally. Do you want to pull it now? ([y]es/[n]o)
```
@z

@x
## How it works
@y
## How it works
@z

@x
When you configure an agent to use DMR, cagent automatically connects to your
local Docker Model Runner and routes inference requests to it. If a model isn't
available locally, cagent prompts you to pull it on first use. No API keys or
authentication are required.
@y
When you configure an agent to use DMR, cagent automatically connects to your
local Docker Model Runner and routes inference requests to it. If a model isn't
available locally, cagent prompts you to pull it on first use. No API keys or
authentication are required.
@z

@x
## Advanced configuration
@y
## Advanced configuration
@z

@x
For more control over model behavior, define a model configuration:
@y
For more control over model behavior, define a model configuration:
@z

@x
```yaml
models:
  local-qwen:
    provider: dmr
    model: ai/qwen3:14B
    temperature: 0.7
    max_tokens: 8192
@y
```yaml
models:
  local-qwen:
    provider: dmr
    model: ai/qwen3:14B
    temperature: 0.7
    max_tokens: 8192
@z

@x
agents:
  root:
    model: local-qwen
    instruction: You are a helpful coding assistant
```
@y
agents:
  root:
    model: local-qwen
    instruction: You are a helpful coding assistant
```
@z

@x
### Faster inference with speculative decoding
@y
### Faster inference with speculative decoding
@z

@x
Speed up model responses using speculative decoding with a smaller draft model:
@y
Speed up model responses using speculative decoding with a smaller draft model:
@z

@x
```yaml
models:
  fast-qwen:
    provider: dmr
    model: ai/qwen3:14B
    provider_opts:
      speculative_draft_model: ai/qwen3:0.6B-Q4_K_M
      speculative_num_tokens: 16
      speculative_acceptance_rate: 0.8
```
@y
```yaml
models:
  fast-qwen:
    provider: dmr
    model: ai/qwen3:14B
    provider_opts:
      speculative_draft_model: ai/qwen3:0.6B-Q4_K_M
      speculative_num_tokens: 16
      speculative_acceptance_rate: 0.8
```
@z

@x
The draft model generates token candidates, and the main model validates them.
This can significantly improve throughput for longer responses.
@y
The draft model generates token candidates, and the main model validates them.
This can significantly improve throughput for longer responses.
@z

@x
### Runtime flags
@y
### Runtime flags
@z

@x
Pass engine-specific flags to optimize performance:
@y
Pass engine-specific flags to optimize performance:
@z

@x
```yaml
models:
  optimized-qwen:
    provider: dmr
    model: ai/qwen3
    provider_opts:
      runtime_flags: ["--ngl=33", "--threads=8"]
```
@y
```yaml
models:
  optimized-qwen:
    provider: dmr
    model: ai/qwen3
    provider_opts:
      runtime_flags: ["--ngl=33", "--threads=8"]
```
@z

@x
Common flags:
@y
Common flags:
@z

@x
- `--ngl` - Number of GPU layers
- `--threads` - CPU thread count
- `--repeat-penalty` - Repetition penalty
@y
- `--ngl` - Number of GPU layers
- `--threads` - CPU thread count
- `--repeat-penalty` - Repetition penalty
@z

@x
## Using DMR for RAG
@y
## Using DMR for RAG
@z

@x
Docker Model Runner supports both embeddings and reranking for RAG workflows.
@y
Docker Model Runner supports both embeddings and reranking for RAG workflows.
@z

@x
### Embedding with DMR
@y
### Embedding with DMR
@z

@x
Use local embeddings for indexing your knowledge base:
@y
Use local embeddings for indexing your knowledge base:
@z

@x
```yaml
rag:
  codebase:
    docs: [./src]
    strategies:
      - type: chunked-embeddings
        embedding_model: dmr/ai/embeddinggemma
        database: ./code.db
```
@y
```yaml
rag:
  codebase:
    docs: [./src]
    strategies:
      - type: chunked-embeddings
        embedding_model: dmr/ai/embeddinggemma
        database: ./code.db
```
@z

@x
### Reranking with DMR
@y
### Reranking with DMR
@z

@x
DMR provides native reranking for improved RAG results:
@y
DMR provides native reranking for improved RAG results:
@z

@x
```yaml
models:
  reranker:
    provider: dmr
    model: hf.co/ggml-org/qwen3-reranker-0.6b-q8_0-gguf
@y
```yaml
models:
  reranker:
    provider: dmr
    model: hf.co/ggml-org/qwen3-reranker-0.6b-q8_0-gguf
@z

@x
rag:
  docs:
    docs: [./documentation]
    strategies:
      - type: chunked-embeddings
        embedding_model: dmr/ai/embeddinggemma
        limit: 20
    results:
      reranking:
        model: reranker
        threshold: 0.5
      limit: 5
```
@y
rag:
  docs:
    docs: [./documentation]
    strategies:
      - type: chunked-embeddings
        embedding_model: dmr/ai/embeddinggemma
        limit: 20
    results:
      reranking:
        model: reranker
        threshold: 0.5
      limit: 5
```
@z

@x
Native DMR reranking is the fastest option for reranking RAG results.
@y
Native DMR reranking is the fastest option for reranking RAG results.
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
If cagent can't find Docker Model Runner:
@y
If cagent can't find Docker Model Runner:
@z

@x
1. Verify Docker Model Runner status:
@y
1. Verify Docker Model Runner status:
@z

@x
   ```console
   $ docker model status
   ```
@y
   ```console
   $ docker model status
   ```
@z

@x
2. Check available models:
@y
2. Check available models:
@z

@x
   ```console
   $ docker model list
   ```
@y
   ```console
   $ docker model list
   ```
@z

@x
3. Check model logs for errors:
@y
3. Check model logs for errors:
@z

@x
   ```console
   $ docker model logs
   ```
@y
   ```console
   $ docker model logs
   ```
@z

@x
4. Ensure Docker Desktop has Model Runner enabled in settings (macOS/Windows)
@y
4. Ensure Docker Desktop has Model Runner enabled in settings (macOS/Windows)
@z

@x
## What's next
@y
## What's next
@z

@x
- Follow the [tutorial](tutorial.md) to build your first agent with local
  models
- Learn about [RAG](rag.md) to give your agents access to codebases and
  documentation
- See the [configuration reference](reference/config.md#docker-model-runner-dmr)
  for all DMR options
@y
- Follow the [tutorial](tutorial.md) to build your first agent with local
  models
- Learn about [RAG](rag.md) to give your agents access to codebases and
  documentation
- See the [configuration reference](reference/config.md#docker-model-runner-dmr)
  for all DMR options
@z
