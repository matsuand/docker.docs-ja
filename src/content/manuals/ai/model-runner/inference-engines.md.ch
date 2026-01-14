%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Inference engines
description: Learn about the llama.cpp and vLLM inference engines in Docker Model Runner.
@y
title: Inference engines
description: Learn about the llama.cpp and vLLM inference engines in Docker Model Runner.
@z

@x
keywords: Docker, ai, model runner, llama.cpp, vllm, inference, gguf, safetensors, cuda, gpu
@y
keywords: Docker, ai, model runner, llama.cpp, vllm, inference, gguf, safetensors, cuda, gpu
@z

@x
Docker Model Runner supports two inference engines: **llama.cpp** and **vLLM**.
Each engine has different strengths, supported platforms, and model format
requirements. This guide helps you choose the right engine and configure it for
your use case.
@y
Docker Model Runner supports two inference engines: **llama.cpp** and **vLLM**.
Each engine has different strengths, supported platforms, and model format
requirements. This guide helps you choose the right engine and configure it for
your use case.
@z

@x
## Engine comparison
@y
## Engine comparison
@z

@x
| Feature | llama.cpp | vLLM |
|---------|-----------|------|
| **Model formats** | GGUF | Safetensors, HuggingFace |
| **Platforms** | All (macOS, Windows, Linux) | Linux x86_64 only |
| **GPU support** | NVIDIA, AMD, Apple Silicon, Vulkan | NVIDIA CUDA only |
| **CPU inference** | Yes | No |
| **Quantization** | Built-in (Q4, Q5, Q8, etc.) | Limited |
| **Memory efficiency** | High (with quantization) | Moderate |
| **Throughput** | Good | High (with batching) |
| **Best for** | Local development, resource-constrained environments | Production, high throughput |
@y
| Feature | llama.cpp | vLLM |
|---------|-----------|------|
| **Model formats** | GGUF | Safetensors, HuggingFace |
| **Platforms** | All (macOS, Windows, Linux) | Linux x86_64 only |
| **GPU support** | NVIDIA, AMD, Apple Silicon, Vulkan | NVIDIA CUDA only |
| **CPU inference** | Yes | No |
| **Quantization** | Built-in (Q4, Q5, Q8, etc.) | Limited |
| **Memory efficiency** | High (with quantization) | Moderate |
| **Throughput** | Good | High (with batching) |
| **Best for** | Local development, resource-constrained environments | Production, high throughput |
@z

@x
## llama.cpp
@y
## llama.cpp
@z

@x
[llama.cpp](https://github.com/ggerganov/llama.cpp) is the default inference
engine in Docker Model Runner. It's designed for efficient local inference and
supports a wide range of hardware configurations.
@y
[llama.cpp](https://github.com/ggerganov/llama.cpp) is the default inference
engine in Docker Model Runner. It's designed for efficient local inference and
supports a wide range of hardware configurations.
@z

@x
### Platform support
@y
### Platform support
@z

@x
| Platform | GPU support | Notes |
|----------|-------------|-------|
| macOS (Apple Silicon) | Metal | Automatic GPU acceleration |
| Windows (x64) | NVIDIA CUDA | Requires NVIDIA drivers 576.57+ |
| Windows (ARM64) | Adreno OpenCL | Qualcomm 6xx series and later |
| Linux (x64) | NVIDIA, AMD, Vulkan | Multiple backend options |
| Linux | CPU only | Works on any x64/ARM64 system |
@y
| Platform | GPU support | Notes |
|----------|-------------|-------|
| macOS (Apple Silicon) | Metal | Automatic GPU acceleration |
| Windows (x64) | NVIDIA CUDA | Requires NVIDIA drivers 576.57+ |
| Windows (ARM64) | Adreno OpenCL | Qualcomm 6xx series and later |
| Linux (x64) | NVIDIA, AMD, Vulkan | Multiple backend options |
| Linux | CPU only | Works on any x64/ARM64 system |
@z

@x
### Model format: GGUF
@y
### Model format: GGUF
@z

@x
llama.cpp uses the GGUF format, which supports efficient quantization for reduced
memory usage without significant quality loss.
@y
llama.cpp uses the GGUF format, which supports efficient quantization for reduced
memory usage without significant quality loss.
@z

@x
#### Quantization levels
@y
#### Quantization levels
@z

@x
| Quantization | Bits per weight | Memory usage | Quality |
|--------------|-----------------|--------------|---------|
| Q2_K | ~2.5 | Lowest | Reduced |
| Q3_K_M | ~3.5 | Minimal | Acceptable |
| Q4_K_M | ~4.5 | Low | Good |
| Q5_K_M | ~5.5 | Moderate | Excellent |
| Q6_K | ~6.5 | Higher | Excellent |
| Q8_0 | 8 | High | Near-original |
| F16 | 16 | Highest | Original |
@y
| Quantization | Bits per weight | Memory usage | Quality |
|--------------|-----------------|--------------|---------|
| Q2_K | ~2.5 | Lowest | Reduced |
| Q3_K_M | ~3.5 | Minimal | Acceptable |
| Q4_K_M | ~4.5 | Low | Good |
| Q5_K_M | ~5.5 | Moderate | Excellent |
| Q6_K | ~6.5 | Higher | Excellent |
| Q8_0 | 8 | High | Near-original |
| F16 | 16 | Highest | Original |
@z

@x
**Recommended**: Q4_K_M offers the best balance of quality and memory usage for
most use cases.
@y
**Recommended**: Q4_K_M offers the best balance of quality and memory usage for
most use cases.
@z

@x
#### Pulling quantized models
@y
#### Pulling quantized models
@z

@x
Models on Docker Hub often include quantization in the tag:
@y
Models on Docker Hub often include quantization in the tag:
@z

@x
```console
$ docker model pull ai/llama3.2:3B-Q4_K_M
```
@y
```console
$ docker model pull ai/llama3.2:3B-Q4_K_M
```
@z

@x
### Using llama.cpp
@y
### Using llama.cpp
@z

@x
llama.cpp is the default engine. No special configuration is required:
@y
llama.cpp is the default engine. No special configuration is required:
@z

@x
```console
$ docker model run ai/smollm2
```
@y
```console
$ docker model run ai/smollm2
```
@z

@x
To explicitly specify llama.cpp when running models:
@y
To explicitly specify llama.cpp when running models:
@z

@x
```console
$ docker model run ai/smollm2 --backend llama.cpp
```
@y
```console
$ docker model run ai/smollm2 --backend llama.cpp
```
@z

@x
### llama.cpp API endpoints
@y
### llama.cpp API endpoints
@z

@x
When using llama.cpp, API calls use the llama.cpp engine path:
@y
When using llama.cpp, API calls use the llama.cpp engine path:
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
Or without the engine prefix:
@y
Or without the engine prefix:
@z

@x
```text
POST /engines/v1/chat/completions
```
@y
```text
POST /engines/v1/chat/completions
```
@z

@x
## vLLM
@y
## vLLM
@z

@x
[vLLM](https://github.com/vllm-project/vllm) is a high-performance inference
engine optimized for production workloads with high throughput requirements.
@y
[vLLM](https://github.com/vllm-project/vllm) is a high-performance inference
engine optimized for production workloads with high throughput requirements.
@z

@x
### Platform support
@y
### Platform support
@z

@x
| Platform | GPU | Support status |
|----------|-----|----------------|
| Linux x86_64 | NVIDIA CUDA | Supported |
| Windows with WSL2 | NVIDIA CUDA | Supported (Docker Desktop 4.54+) |
| macOS | - | Not supported |
| Linux ARM64 | - | Not supported |
| AMD GPUs | - | Not supported |
@y
| Platform | GPU | Support status |
|----------|-----|----------------|
| Linux x86_64 | NVIDIA CUDA | Supported |
| Windows with WSL2 | NVIDIA CUDA | Supported (Docker Desktop 4.54+) |
| macOS | - | Not supported |
| Linux ARM64 | - | Not supported |
| AMD GPUs | - | Not supported |
@z

@x
> [!IMPORTANT]
> vLLM requires an NVIDIA GPU with CUDA support. It does not support CPU-only
> inference.
@y
> [!IMPORTANT]
> vLLM requires an NVIDIA GPU with CUDA support. It does not support CPU-only
> inference.
@z

@x
### Model format: Safetensors
@y
### Model format: Safetensors
@z

@x
vLLM works with models in Safetensors format, which is the standard format for
HuggingFace models. These models typically use more memory than quantized GGUF
models but may offer better quality and faster inference on powerful hardware.
@y
vLLM works with models in Safetensors format, which is the standard format for
HuggingFace models. These models typically use more memory than quantized GGUF
models but may offer better quality and faster inference on powerful hardware.
@z

@x
### Setting up vLLM
@y
### Setting up vLLM
@z

@x
#### Docker Engine (Linux)
@y
#### Docker Engine (Linux)
@z

@x
Install the Model Runner with vLLM backend:
@y
Install the Model Runner with vLLM backend:
@z

@x
```console
$ docker model install-runner --backend vllm --gpu cuda
```
@y
```console
$ docker model install-runner --backend vllm --gpu cuda
```
@z

@x
Verify the installation:
@y
Verify the installation:
@z

@x
```console
$ docker model status
Docker Model Runner is running
@y
```console
$ docker model status
Docker Model Runner is running
@z

@x
Status:
llama.cpp: running llama.cpp version: c22473b
vllm: running vllm version: 0.11.0
```
@y
Status:
llama.cpp: running llama.cpp version: c22473b
vllm: running vllm version: 0.11.0
```
@z

@x
#### Docker Desktop (Windows with WSL2)
@y
#### Docker Desktop (Windows with WSL2)
@z

@x
1. Ensure you have:
   - Docker Desktop 4.54 or later
   - NVIDIA GPU with updated drivers
   - WSL2 enabled
@y
1. Ensure you have:
   - Docker Desktop 4.54 or later
   - NVIDIA GPU with updated drivers
   - WSL2 enabled
@z

@x
2. Install vLLM backend:
   ```console
   $ docker model install-runner --backend vllm --gpu cuda
   ```
@y
2. Install vLLM backend:
   ```console
   $ docker model install-runner --backend vllm --gpu cuda
   ```
@z

@x
### Running models with vLLM
@y
### Running models with vLLM
@z

@x
vLLM models are typically tagged with `-vllm` suffix:
@y
vLLM models are typically tagged with `-vllm` suffix:
@z

@x
```console
$ docker model run ai/smollm2-vllm
```
@y
```console
$ docker model run ai/smollm2-vllm
```
@z

@x
To specify the vLLM backend explicitly:
@y
To specify the vLLM backend explicitly:
@z

@x
```console
$ docker model run ai/model --backend vllm
```
@y
```console
$ docker model run ai/model --backend vllm
```
@z

@x
### vLLM API endpoints
@y
### vLLM API endpoints
@z

@x
When using vLLM, specify the engine in the API path:
@y
When using vLLM, specify the engine in the API path:
@z

@x
```text
POST /engines/vllm/v1/chat/completions
```
@y
```text
POST /engines/vllm/v1/chat/completions
```
@z

@x
### vLLM configuration
@y
### vLLM configuration
@z

@x
#### HuggingFace overrides
@y
#### HuggingFace overrides
@z

@x
Use `--hf_overrides` to pass model configuration overrides:
@y
Use `--hf_overrides` to pass model configuration overrides:
@z

@x
```console
$ docker model configure --hf_overrides '{"max_model_len": 8192}' ai/model-vllm
```
@y
```console
$ docker model configure --hf_overrides '{"max_model_len": 8192}' ai/model-vllm
```
@z

@x
#### Common vLLM settings
@y
#### Common vLLM settings
@z

@x
| Setting | Description | Example |
|---------|-------------|---------|
| `max_model_len` | Maximum context length | 8192 |
| `gpu_memory_utilization` | Fraction of GPU memory to use | 0.9 |
| `tensor_parallel_size` | GPUs for tensor parallelism | 2 |
@y
| Setting | Description | Example |
|---------|-------------|---------|
| `max_model_len` | Maximum context length | 8192 |
| `gpu_memory_utilization` | Fraction of GPU memory to use | 0.9 |
| `tensor_parallel_size` | GPUs for tensor parallelism | 2 |
@z

@x
### vLLM and llama.cpp performance comparison
@y
### vLLM and llama.cpp performance comparison
@z

@x
| Scenario | Recommended engine |
|----------|-------------------|
| Single user, local development | llama.cpp |
| Multiple concurrent requests | vLLM |
| Limited GPU memory | llama.cpp (with quantization) |
| Maximum throughput | vLLM |
| CPU-only system | llama.cpp |
| Apple Silicon Mac | llama.cpp |
| Production deployment | vLLM (if hardware supports it) |
@y
| Scenario | Recommended engine |
|----------|-------------------|
| Single user, local development | llama.cpp |
| Multiple concurrent requests | vLLM |
| Limited GPU memory | llama.cpp (with quantization) |
| Maximum throughput | vLLM |
| CPU-only system | llama.cpp |
| Apple Silicon Mac | llama.cpp |
| Production deployment | vLLM (if hardware supports it) |
@z

@x
## Running both engines
@y
## Running both engines
@z

@x
You can run both llama.cpp and vLLM simultaneously. Docker Model Runner routes
requests to the appropriate engine based on the model or explicit engine selection.
@y
You can run both llama.cpp and vLLM simultaneously. Docker Model Runner routes
requests to the appropriate engine based on the model or explicit engine selection.
@z

@x
Check which engines are running:
@y
Check which engines are running:
@z

@x
```console
$ docker model status
Docker Model Runner is running
@y
```console
$ docker model status
Docker Model Runner is running
@z

@x
Status:
llama.cpp: running llama.cpp version: c22473b
vllm: running vllm version: 0.11.0
```
@y
Status:
llama.cpp: running llama.cpp version: c22473b
vllm: running vllm version: 0.11.0
```
@z

@x
### Engine-specific API paths
@y
### Engine-specific API paths
@z

@x
| Engine | API path |
|--------|----------|
| llama.cpp | `/engines/llama.cpp/v1/...` |
| vLLM | `/engines/vllm/v1/...` |
| Auto-select | `/engines/v1/...` |
@y
| Engine | API path |
|--------|----------|
| llama.cpp | `/engines/llama.cpp/v1/...` |
| vLLM | `/engines/vllm/v1/...` |
| Auto-select | `/engines/v1/...` |
@z

@x
## Managing inference engines
@y
## Managing inference engines
@z

@x
### Install an engine
@y
### Install an engine
@z

@x
```console
$ docker model install-runner --backend <engine> [--gpu <type>]
```
@y
```console
$ docker model install-runner --backend <engine> [--gpu <type>]
```
@z

@x
Options:
- `--backend`: `llama.cpp` or `vllm`
- `--gpu`: `cuda`, `rocm`, `vulkan`, or `metal` (depends on platform)
@y
Options:
- `--backend`: `llama.cpp` or `vllm`
- `--gpu`: `cuda`, `rocm`, `vulkan`, or `metal` (depends on platform)
@z

@x
### Reinstall an engine
@y
### Reinstall an engine
@z

@x
```console
$ docker model reinstall-runner --backend <engine>
```
@y
```console
$ docker model reinstall-runner --backend <engine>
```
@z

@x
### Check engine status
@y
### Check engine status
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
### View engine logs
@y
### View engine logs
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
## Packaging models for each engine
@y
## Packaging models for each engine
@z

@x
### Package a GGUF model (llama.cpp)
@y
### Package a GGUF model (llama.cpp)
@z

@x
```console
$ docker model package --gguf ./model.gguf --push myorg/mymodel:Q4_K_M
```
@y
```console
$ docker model package --gguf ./model.gguf --push myorg/mymodel:Q4_K_M
```
@z

@x
### Package a Safetensors model (vLLM)
@y
### Package a Safetensors model (vLLM)
@z

@x
```console
$ docker model package --safetensors ./model/ --push myorg/mymodel-vllm
```
@y
```console
$ docker model package --safetensors ./model/ --push myorg/mymodel-vllm
```
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
### vLLM won't start
@y
### vLLM won't start
@z

@x
1. Verify NVIDIA GPU is available:
   ```console
   $ nvidia-smi
   ```
@y
1. Verify NVIDIA GPU is available:
   ```console
   $ nvidia-smi
   ```
@z

@x
2. Check Docker has GPU access:
   ```console
   $ docker run --rm --gpus all nvidia/cuda:12.0-base nvidia-smi
   ```
@y
2. Check Docker has GPU access:
   ```console
   $ docker run --rm --gpus all nvidia/cuda:12.0-base nvidia-smi
   ```
@z

@x
3. Verify you're on a supported platform (Linux x86_64 or Windows WSL2).
@y
3. Verify you're on a supported platform (Linux x86_64 or Windows WSL2).
@z

@x
### llama.cpp is slow
@y
### llama.cpp is slow
@z

@x
1. Ensure GPU acceleration is working (check logs for Metal/CUDA messages).
@y
1. Ensure GPU acceleration is working (check logs for Metal/CUDA messages).
@z

@x
2. Try a more aggressive quantization:
   ```console
   $ docker model pull ai/model:Q4_K_M
   ```
@y
2. Try a more aggressive quantization:
   ```console
   $ docker model pull ai/model:Q4_K_M
   ```
@z

@x
3. Reduce context size:
   ```console
   $ docker model configure --context-size 2048 ai/model
   ```
@y
3. Reduce context size:
   ```console
   $ docker model configure --context-size 2048 ai/model
   ```
@z

@x
### Out of memory errors
@y
### Out of memory errors
@z

@x
1. Use a smaller quantization (Q4 instead of Q8).
2. Reduce context size.
3. For vLLM, adjust `gpu_memory_utilization`:
   ```console
   $ docker model configure --hf_overrides '{"gpu_memory_utilization": 0.8}' ai/model
   ```
@y
1. Use a smaller quantization (Q4 instead of Q8).
2. Reduce context size.
3. For vLLM, adjust `gpu_memory_utilization`:
   ```console
   $ docker model configure --hf_overrides '{"gpu_memory_utilization": 0.8}' ai/model
   ```
@z

@x
## What's next
@y
## What's next
@z

@x
- [Configuration options](configuration.md) - Detailed parameter reference
- [API reference](api-reference.md) - API documentation
- [GPU support](/manuals/desktop/features/gpu.md) - GPU configuration for Docker Desktop
@y
- [Configuration options](configuration.md) - Detailed parameter reference
- [API reference](api-reference.md) - API documentation
- [GPU support](manuals/desktop/features/gpu.md) - GPU configuration for Docker Desktop
@z
