%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Configuration options
description: Configure context size, runtime parameters, and model behavior in Docker Model Runner.
@y
title: Configuration options
description: Configure context size, runtime parameters, and model behavior in Docker Model Runner.
@z

@x
keywords: Docker, ai, model runner, configuration, context size, context length, tokens, llama.cpp, parameters
@y
keywords: Docker, ai, model runner, configuration, context size, context length, tokens, llama.cpp, parameters
@z

@x
Docker Model Runner provides several configuration options to tune model behavior,
memory usage, and inference performance. This guide covers the key settings and
how to apply them.
@y
Docker Model Runner provides several configuration options to tune model behavior,
memory usage, and inference performance. This guide covers the key settings and
how to apply them.
@z

@x
## Context size (context length)
@y
## Context size (context length)
@z

@x
The context size determines the maximum number of tokens a model can process in
a single request, including both the input prompt and generated output. This is
one of the most important settings affecting memory usage and model capabilities.
@y
The context size determines the maximum number of tokens a model can process in
a single request, including both the input prompt and generated output. This is
one of the most important settings affecting memory usage and model capabilities.
@z

@x
### Default context size
@y
### Default context size
@z

@x
By default, Docker Model Runner uses a context size that balances capability with
resource efficiency:
@y
By default, Docker Model Runner uses a context size that balances capability with
resource efficiency:
@z

@x
| Engine | Default behavior |
|--------|------------------|
| llama.cpp | 4096 tokens |
| vLLM | Uses the model's maximum trained context size |
@y
| Engine | Default behavior |
|--------|------------------|
| llama.cpp | 4096 tokens |
| vLLM | Uses the model's maximum trained context size |
@z

@x
> [!NOTE]
> The actual default varies by model. Most models support between 2,048 and 8,192
> tokens by default. Some newer models support 32K, 128K, or even larger contexts.
@y
> [!NOTE]
> The actual default varies by model. Most models support between 2,048 and 8,192
> tokens by default. Some newer models support 32K, 128K, or even larger contexts.
@z

@x
### Configure context size
@y
### Configure context size
@z

@x
You can adjust context size per model using the `docker model configure` command:
@y
You can adjust context size per model using the `docker model configure` command:
@z

@x
```console
$ docker model configure --context-size 8192 ai/qwen2.5-coder
```
@y
```console
$ docker model configure --context-size 8192 ai/qwen2.5-coder
```
@z

@x
Or in a Compose file:
@y
Or in a Compose file:
@z

@x
```yaml
models:
  llm:
    model: ai/qwen2.5-coder
    context_size: 8192
```
@y
```yaml
models:
  llm:
    model: ai/qwen2.5-coder
    context_size: 8192
```
@z

@x
### Context size guidelines
@y
### Context size guidelines
@z

@x
| Context size | Typical use case | Memory impact |
|--------------|------------------|---------------|
| 2,048 | Simple queries, short code snippets | Low |
| 4,096 | Standard conversations, medium code files | Moderate |
| 8,192 | Long conversations, larger code files | Higher |
| 16,384+ | Extended documents, multi-file context | High |
@y
| Context size | Typical use case | Memory impact |
|--------------|------------------|---------------|
| 2,048 | Simple queries, short code snippets | Low |
| 4,096 | Standard conversations, medium code files | Moderate |
| 8,192 | Long conversations, larger code files | Higher |
| 16,384+ | Extended documents, multi-file context | High |
@z

@x
> [!IMPORTANT]
> Larger context sizes require more memory (RAM/VRAM). If you experience out-of-memory
> errors, reduce the context size. As a rough guide, each additional 1,000 tokens
> requires approximately 100-500 MB of additional memory, depending on the model size.
@y
> [!IMPORTANT]
> Larger context sizes require more memory (RAM/VRAM). If you experience out-of-memory
> errors, reduce the context size. As a rough guide, each additional 1,000 tokens
> requires approximately 100-500 MB of additional memory, depending on the model size.
@z

@x
### Check a model's maximum context
@y
### Check a model's maximum context
@z

@x
To see a model's configuration including context size:
@y
To see a model's configuration including context size:
@z

@x
```console
$ docker model inspect ai/qwen2.5-coder
```
@y
```console
$ docker model inspect ai/qwen2.5-coder
```
@z

@x
> [!NOTE]
> The `docker model inspect` command shows the model's maximum supported context length
> (e.g., `gemma3.context_length`), not the configured context size. The configured context
> size is what you set with `docker model configure --context-size` and represents the
> actual limit used during inference, which should be less than or equal to the model's
> maximum supported context length.
@y
> [!NOTE]
> The `docker model inspect` command shows the model's maximum supported context length
> (e.g., `gemma3.context_length`), not the configured context size. The configured context
> size is what you set with `docker model configure --context-size` and represents the
> actual limit used during inference, which should be less than or equal to the model's
> maximum supported context length.
@z

@x
## Runtime flags
@y
## Runtime flags
@z

@x
Runtime flags let you pass parameters directly to the underlying inference engine.
This provides fine-grained control over model behavior.
@y
Runtime flags let you pass parameters directly to the underlying inference engine.
This provides fine-grained control over model behavior.
@z

@x
### Using runtime flags
@y
### Using runtime flags
@z

@x
Runtime flags can be provided through multiple mechanisms:
@y
Runtime flags can be provided through multiple mechanisms:
@z

@x
#### Using Docker Compose
@y
#### Using Docker Compose
@z

@x
In a Compose file:
@y
In a Compose file:
@z

@x
```yaml
models:
  llm:
    model: ai/qwen2.5-coder
    context_size: 4096
    runtime_flags:
      - "--temp"
      - "0.7"
      - "--top-p"
      - "0.9"
```
@y
```yaml
models:
  llm:
    model: ai/qwen2.5-coder
    context_size: 4096
    runtime_flags:
      - "--temp"
      - "0.7"
      - "--top-p"
      - "0.9"
```
@z

@x
#### Using Command Line
@y
#### Using Command Line
@z

@x
With the `docker model configure` command:
@y
With the `docker model configure` command:
@z

@x
```console
$ docker model configure --runtime-flag "--temp" --runtime-flag "0.7" --runtime-flag "--top-p" --runtime-flag "0.9" ai/qwen2.5-coder
```
@y
```console
$ docker model configure --runtime-flag "--temp" --runtime-flag "0.7" --runtime-flag "--top-p" --runtime-flag "0.9" ai/qwen2.5-coder
```
@z

@x
### Common llama.cpp parameters
@y
### Common llama.cpp parameters
@z

@x
These are the most commonly used llama.cpp parameters. You don't need to look up
the llama.cpp documentation for typical use cases.
@y
These are the most commonly used llama.cpp parameters. You don't need to look up
the llama.cpp documentation for typical use cases.
@z

@x
#### Sampling parameters
@y
#### Sampling parameters
@z

@x
| Flag | Description | Default | Range |
|------|-------------|---------|-------|
| `--temp` | Temperature for sampling. Lower = more deterministic, higher = more creative | 0.8 | 0.0-2.0 |
| `--top-k` | Limit sampling to top K tokens. Lower = more focused | 40 | 1-100 |
| `--top-p` | Nucleus sampling threshold. Lower = more focused | 0.9 | 0.0-1.0 |
| `--min-p` | Minimum probability threshold | 0.05 | 0.0-1.0 |
| `--repeat-penalty` | Penalty for repeating tokens | 1.1 | 1.0-2.0 |
@y
| Flag | Description | Default | Range |
|------|-------------|---------|-------|
| `--temp` | Temperature for sampling. Lower = more deterministic, higher = more creative | 0.8 | 0.0-2.0 |
| `--top-k` | Limit sampling to top K tokens. Lower = more focused | 40 | 1-100 |
| `--top-p` | Nucleus sampling threshold. Lower = more focused | 0.9 | 0.0-1.0 |
| `--min-p` | Minimum probability threshold | 0.05 | 0.0-1.0 |
| `--repeat-penalty` | Penalty for repeating tokens | 1.1 | 1.0-2.0 |
@z

@x
**Example: Deterministic output (for code generation)**
@y
**Example: Deterministic output (for code generation)**
@z

@x
```yaml
runtime_flags:
  - "--temp"
  - "0"
  - "--top-k"
  - "1"
```
@y
```yaml
runtime_flags:
  - "--temp"
  - "0"
  - "--top-k"
  - "1"
```
@z

@x
**Example: Creative output (for storytelling)**
@y
**Example: Creative output (for storytelling)**
@z

@x
```yaml
runtime_flags:
  - "--temp"
  - "1.2"
  - "--top-p"
  - "0.95"
```
@y
```yaml
runtime_flags:
  - "--temp"
  - "1.2"
  - "--top-p"
  - "0.95"
```
@z

@x
#### Performance parameters
@y
#### Performance parameters
@z

@x
| Flag | Description | Default | Notes |
|------|-------------|---------|-------|
| `--threads` | CPU threads for generation | Auto | Set to number of performance cores |
| `--threads-batch` | CPU threads for batch processing | Auto | Usually same as `--threads` |
| `--batch-size` | Batch size for prompt processing | 512 | Higher = faster prompt processing |
| `--mlock` | Lock model in memory | Off | Prevents swapping, requires sufficient RAM |
| `--no-mmap` | Disable memory mapping | Off | May improve performance on some systems |
@y
| Flag | Description | Default | Notes |
|------|-------------|---------|-------|
| `--threads` | CPU threads for generation | Auto | Set to number of performance cores |
| `--threads-batch` | CPU threads for batch processing | Auto | Usually same as `--threads` |
| `--batch-size` | Batch size for prompt processing | 512 | Higher = faster prompt processing |
| `--mlock` | Lock model in memory | Off | Prevents swapping, requires sufficient RAM |
| `--no-mmap` | Disable memory mapping | Off | May improve performance on some systems |
@z

@x
**Example: Optimized for multi-core CPU**
@y
**Example: Optimized for multi-core CPU**
@z

@x
```yaml
runtime_flags:
  - "--threads"
  - "8"
  - "--batch-size"
  - "1024"
```
@y
```yaml
runtime_flags:
  - "--threads"
  - "8"
  - "--batch-size"
  - "1024"
```
@z

@x
#### GPU parameters
@y
#### GPU parameters
@z

@x
| Flag | Description | Default | Notes |
|------|-------------|---------|-------|
| `--n-gpu-layers` | Layers to offload to GPU | All (if GPU available) | Reduce if running out of VRAM |
| `--main-gpu` | GPU to use for computation | 0 | For multi-GPU systems |
| `--split-mode` | How to split across GPUs | layer | Options: `none`, `layer`, `row` |
@y
| Flag | Description | Default | Notes |
|------|-------------|---------|-------|
| `--n-gpu-layers` | Layers to offload to GPU | All (if GPU available) | Reduce if running out of VRAM |
| `--main-gpu` | GPU to use for computation | 0 | For multi-GPU systems |
| `--split-mode` | How to split across GPUs | layer | Options: `none`, `layer`, `row` |
@z

@x
**Example: Partial GPU offload (limited VRAM)**
@y
**Example: Partial GPU offload (limited VRAM)**
@z

@x
```yaml
runtime_flags:
  - "--n-gpu-layers"
  - "20"
```
@y
```yaml
runtime_flags:
  - "--n-gpu-layers"
  - "20"
```
@z

@x
#### Advanced parameters
@y
#### Advanced parameters
@z

@x
| Flag | Description | Default |
|------|-------------|---------|
| `--rope-scaling` | RoPE scaling method | Auto |
| `--rope-freq-base` | RoPE base frequency | Model default |
| `--rope-freq-scale` | RoPE frequency scale | Model default |
| `--no-prefill-assistant` | Disable assistant pre-fill | Off |
| `--reasoning-budget` | Token budget for reasoning models | 0 (disabled) |
@y
| Flag | Description | Default |
|------|-------------|---------|
| `--rope-scaling` | RoPE scaling method | Auto |
| `--rope-freq-base` | RoPE base frequency | Model default |
| `--rope-freq-scale` | RoPE frequency scale | Model default |
| `--no-prefill-assistant` | Disable assistant pre-fill | Off |
| `--reasoning-budget` | Token budget for reasoning models | 0 (disabled) |
@z

@x
### vLLM parameters
@y
### vLLM parameters
@z

@x
When using the vLLM backend, different parameters are available.
@y
When using the vLLM backend, different parameters are available.
@z

@x
Use `--hf_overrides` to pass HuggingFace model config overrides as JSON:
@y
Use `--hf_overrides` to pass HuggingFace model config overrides as JSON:
@z

@x
```console
$ docker model configure --hf_overrides '{"rope_scaling": {"type": "dynamic", "factor": 2.0}}' ai/model-vllm
```
@y
```console
$ docker model configure --hf_overrides '{"rope_scaling": {"type": "dynamic", "factor": 2.0}}' ai/model-vllm
```
@z

@x
## Configuration presets
@y
## Configuration presets
@z

@x
Here are complete configuration examples for common use cases.
@y
Here are complete configuration examples for common use cases.
@z

@x
### Code completion (fast, deterministic)
@y
### Code completion (fast, deterministic)
@z

@x
```yaml
models:
  coder:
    model: ai/qwen2.5-coder
    context_size: 4096
    runtime_flags:
      - "--temp"
      - "0.1"
      - "--top-k"
      - "1"
      - "--batch-size"
      - "1024"
```
@y
```yaml
models:
  coder:
    model: ai/qwen2.5-coder
    context_size: 4096
    runtime_flags:
      - "--temp"
      - "0.1"
      - "--top-k"
      - "1"
      - "--batch-size"
      - "1024"
```
@z

@x
### Chat assistant (balanced)
@y
### Chat assistant (balanced)
@z

@x
```yaml
models:
  assistant:
    model: ai/llama3.2
    context_size: 8192
    runtime_flags:
      - "--temp"
      - "0.7"
      - "--top-p"
      - "0.9"
      - "--repeat-penalty"
      - "1.1"
```
@y
```yaml
models:
  assistant:
    model: ai/llama3.2
    context_size: 8192
    runtime_flags:
      - "--temp"
      - "0.7"
      - "--top-p"
      - "0.9"
      - "--repeat-penalty"
      - "1.1"
```
@z

@x
### Creative writing (high temperature)
@y
### Creative writing (high temperature)
@z

@x
```yaml
models:
  writer:
    model: ai/llama3.2
    context_size: 8192
    runtime_flags:
      - "--temp"
      - "1.2"
      - "--top-p"
      - "0.95"
      - "--repeat-penalty"
      - "1.0"
```
@y
```yaml
models:
  writer:
    model: ai/llama3.2
    context_size: 8192
    runtime_flags:
      - "--temp"
      - "1.2"
      - "--top-p"
      - "0.95"
      - "--repeat-penalty"
      - "1.0"
```
@z

@x
### Long document analysis (large context)
@y
### Long document analysis (large context)
@z

@x
```yaml
models:
  analyzer:
    model: ai/qwen2.5-coder:14B
    context_size: 32768
    runtime_flags:
      - "--mlock"
      - "--batch-size"
      - "2048"
```
@y
```yaml
models:
  analyzer:
    model: ai/qwen2.5-coder:14B
    context_size: 32768
    runtime_flags:
      - "--mlock"
      - "--batch-size"
      - "2048"
```
@z

@x
### Low memory system
@y
### Low memory system
@z

@x
```yaml
models:
  efficient:
    model: ai/smollm2:360M-Q4_K_M
    context_size: 2048
    runtime_flags:
      - "--threads"
      - "4"
```
@y
```yaml
models:
  efficient:
    model: ai/smollm2:360M-Q4_K_M
    context_size: 2048
    runtime_flags:
      - "--threads"
      - "4"
```
@z

@x
## Environment-based configuration
@y
## Environment-based configuration
@z

@x
You can also configure models via environment variables in containers:
@y
You can also configure models via environment variables in containers:
@z

@x
| Variable | Description |
|----------|-------------|
| `LLM_URL` | Auto-injected URL of the model endpoint |
| `LLM_MODEL` | Auto-injected model identifier |
@y
| Variable | Description |
|----------|-------------|
| `LLM_URL` | Auto-injected URL of the model endpoint |
| `LLM_MODEL` | Auto-injected model identifier |
@z

@x
See [Models and Compose](/manuals/ai/compose/models-and-compose.md) for details on how these are populated.
@y
See [Models and Compose](manuals/ai/compose/models-and-compose.md) for details on how these are populated.
@z

@x
## Reset configuration
@y
## Reset configuration
@z

@x
Configuration set via `docker model configure` persists until the model is removed.
To reset configuration:
@y
Configuration set via `docker model configure` persists until the model is removed.
To reset configuration:
@z

@x
```console
$ docker model configure --context-size -1 ai/qwen2.5-coder
```
@y
```console
$ docker model configure --context-size -1 ai/qwen2.5-coder
```
@z

@x
Using `-1` resets to the default value.
@y
Using `-1` resets to the default value.
@z

@x
## What's next
@y
## What's next
@z

@x
- [Inference engines](inference-engines.md) - Learn about llama.cpp and vLLM
- [API reference](api-reference.md) - API parameters for per-request configuration
- [Models and Compose](/manuals/ai/compose/models-and-compose.md) - Configure models in Compose applications
@y
- [Inference engines](inference-engines.md) - Learn about llama.cpp and vLLM
- [API reference](api-reference.md) - API parameters for per-request configuration
- [Models and Compose](manuals/ai/compose/models-and-compose.md) - Configure models in Compose applications
@z
