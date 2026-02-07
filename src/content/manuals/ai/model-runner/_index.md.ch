%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Docker Model Runner
linkTitle: Model Runner
@y
title: Docker Model Runner
linkTitle: Model Runner
@z

@x
description: Learn how to use Docker Model Runner to manage and run AI models.
keywords: Docker, ai, model runner, docker desktop, docker engine, llm, openai, ollama, llama.cpp, vllm, diffusers, cpu, nvidia, cuda, amd, rocm, vulkan, cline, continue, cursor, image generation, stable diffusion
@y
description: Learn how to use Docker Model Runner to manage and run AI models.
keywords: Docker, ai, model runner, docker desktop, docker engine, llm, openai, ollama, llama.cpp, vllm, diffusers, cpu, nvidia, cuda, amd, rocm, vulkan, cline, continue, cursor, image generation, stable diffusion
@z

@x
{{< summary-bar feature_name="Docker Model Runner" >}}
@y
{{< summary-bar feature_name="Docker Model Runner" >}}
@z

@x
Docker Model Runner (DMR) makes it easy to manage, run, and
deploy AI models using Docker. Designed for developers,
Docker Model Runner streamlines the process of pulling, running, and serving
large language models (LLMs) and other AI models directly from Docker Hub,
any OCI-compliant registry, or [Hugging Face](https://huggingface.co/).
@y
Docker Model Runner (DMR) makes it easy to manage, run, and
deploy AI models using Docker. Designed for developers,
Docker Model Runner streamlines the process of pulling, running, and serving
large language models (LLMs) and other AI models directly from Docker Hub,
any OCI-compliant registry, or [Hugging Face](https://huggingface.co/).
@z

@x
With seamless integration into Docker Desktop and Docker
Engine, you can serve models via OpenAI and Ollama-compatible APIs, package GGUF files as
OCI Artifacts, and interact with models from both the command line and graphical
interface.
@y
With seamless integration into Docker Desktop and Docker
Engine, you can serve models via OpenAI and Ollama-compatible APIs, package GGUF files as
OCI Artifacts, and interact with models from both the command line and graphical
interface.
@z

@x
Whether you're building generative AI applications, experimenting with machine
learning workflows, or integrating AI into your software development lifecycle,
Docker Model Runner provides a consistent, secure, and efficient way to work
with AI models locally.
@y
Whether you're building generative AI applications, experimenting with machine
learning workflows, or integrating AI into your software development lifecycle,
Docker Model Runner provides a consistent, secure, and efficient way to work
with AI models locally.
@z

@x
## Key features
@y
## Key features
@z

@x
- [Pull and push models to and from Docker Hub or any OCI-compliant registry](https://hub.docker.com/u/ai)
- [Pull models from Hugging Face](https://huggingface.co/)
- Serve models on [OpenAI and Ollama-compatible APIs](api-reference.md) for easy integration with existing apps
- Support for [llama.cpp, vLLM, and Diffusers inference engines](inference-engines.md) (vLLM and Diffusers on Linux with NVIDIA GPUs)
- [Generate images from text prompts](inference-engines.md#diffusers) using Stable Diffusion models with the Diffusers backend
- Package GGUF and Safetensors files as OCI Artifacts and publish them to any Container Registry
- Run and interact with AI models directly from the command line or from the Docker Desktop GUI
- [Connect to AI coding tools](ide-integrations.md) like Cline, Continue, Cursor, and Aider
- [Configure context size and model parameters](configuration.md) to tune performance
- [Set up Open WebUI](openwebui-integration.md) for a ChatGPT-like web interface
- Manage local models and display logs
- Display prompt and response details
- Conversational context support for multi-turn interactions
@y
- [Pull and push models to and from Docker Hub or any OCI-compliant registry](https://hub.docker.com/u/ai)
- [Pull models from Hugging Face](https://huggingface.co/)
- Serve models on [OpenAI and Ollama-compatible APIs](api-reference.md) for easy integration with existing apps
- Support for [llama.cpp, vLLM, and Diffusers inference engines](inference-engines.md) (vLLM and Diffusers on Linux with NVIDIA GPUs)
- [Generate images from text prompts](inference-engines.md#diffusers) using Stable Diffusion models with the Diffusers backend
- Package GGUF and Safetensors files as OCI Artifacts and publish them to any Container Registry
- Run and interact with AI models directly from the command line or from the Docker Desktop GUI
- [Connect to AI coding tools](ide-integrations.md) like Cline, Continue, Cursor, and Aider
- [Configure context size and model parameters](configuration.md) to tune performance
- [Set up Open WebUI](openwebui-integration.md) for a ChatGPT-like web interface
- Manage local models and display logs
- Display prompt and response details
- Conversational context support for multi-turn interactions
@z

@x
## Requirements
@y
## Requirements
@z

@x
Docker Model Runner is supported on the following platforms:
@y
Docker Model Runner is supported on the following platforms:
@z

@x
{{< tabs >}}
{{< tab name="Windows">}}
@y
{{< tabs >}}
{{< tab name="Windows">}}
@z

@x
Windows(amd64):
-  NVIDIA GPUs
-  NVIDIA drivers 576.57+
@y
Windows(amd64):
-  NVIDIA GPUs
-  NVIDIA drivers 576.57+
@z

@x
Windows(arm64):
- OpenCL for Adreno
- Qualcomm Adreno GPU (6xx series and later)
@y
Windows(arm64):
- OpenCL for Adreno
- Qualcomm Adreno GPU (6xx series and later)
@z

@x
  > [!NOTE]
  > Some llama.cpp features might not be fully supported on the 6xx series.
@y
  > [!NOTE]
  > Some llama.cpp features might not be fully supported on the 6xx series.
@z

@x
{{< /tab >}}
{{< tab name="MacOS">}}
@y
{{< /tab >}}
{{< tab name="MacOS">}}
@z

@x
- Apple Silicon
@y
- Apple Silicon
@z

@x
{{< /tab >}}
{{< tab name="Linux">}}
@y
{{< /tab >}}
{{< tab name="Linux">}}
@z

@x
Docker Engine only:
@y
Docker Engine only:
@z

@x
- Supports CPU, NVIDIA (CUDA), AMD (ROCm), and Vulkan backends
- Requires NVIDIA driver 575.57.08+ when using NVIDIA GPUs
@y
- Supports CPU, NVIDIA (CUDA), AMD (ROCm), and Vulkan backends
- Requires NVIDIA driver 575.57.08+ when using NVIDIA GPUs
@z

@x
{{< /tab >}}
{{</tabs >}}
@y
{{< /tab >}}
{{</tabs >}}
@z

@x
## How Docker Model Runner works
@y
## How Docker Model Runner works
@z

@x
Models are pulled from Docker Hub, an OCI-compliant registry, or
[Hugging Face](https://huggingface.co/) the first time you use them and are
stored locally. They load into memory only at runtime when a request is made,
and unload when not in use to optimize resources. Because models can be large,
the initial pull may take some time. After that, they're cached locally for
faster access. You can interact with the model using
[OpenAI and Ollama-compatible APIs](api-reference.md).
@y
Models are pulled from Docker Hub, an OCI-compliant registry, or
[Hugging Face](https://huggingface.co/) the first time you use them and are
stored locally. They load into memory only at runtime when a request is made,
and unload when not in use to optimize resources. Because models can be large,
the initial pull may take some time. After that, they're cached locally for
faster access. You can interact with the model using
[OpenAI and Ollama-compatible APIs](api-reference.md).
@z

@x
### Inference engines
@y
### Inference engines
@z

@x
Docker Model Runner supports three inference engines:
@y
Docker Model Runner supports three inference engines:
@z

@x
| Engine | Best for | Model format |
|--------|----------|--------------|
| [llama.cpp](inference-engines.md#llamacpp) | Local development, resource efficiency | GGUF (quantized) |
| [vLLM](inference-engines.md#vllm) | Production, high throughput | Safetensors |
| [Diffusers](inference-engines.md#diffusers) | Image generation (Stable Diffusion) | Safetensors |
@y
| Engine | Best for | Model format |
|--------|----------|--------------|
| [llama.cpp](inference-engines.md#llamacpp) | Local development, resource efficiency | GGUF (quantized) |
| [vLLM](inference-engines.md#vllm) | Production, high throughput | Safetensors |
| [Diffusers](inference-engines.md#diffusers) | Image generation (Stable Diffusion) | Safetensors |
@z

@x
llama.cpp is the default engine and works on all platforms. vLLM requires NVIDIA GPUs and is supported on Linux x86_64 and Windows with WSL2. Diffusers enables image generation and requires NVIDIA GPUs on Linux (x86_64 or ARM64). See [Inference engines](inference-engines.md) for detailed comparison and setup.
@y
llama.cpp is the default engine and works on all platforms. vLLM requires NVIDIA GPUs and is supported on Linux x86_64 and Windows with WSL2. Diffusers enables image generation and requires NVIDIA GPUs on Linux (x86_64 or ARM64). See [Inference engines](inference-engines.md) for detailed comparison and setup.
@z

@x
### Context size
@y
### Context size
@z

@x
Models have a configurable context size (context length) that determines how many tokens they can process. The default varies by model but is typically 2,048-8,192 tokens. You can adjust this per-model:
@y
Models have a configurable context size (context length) that determines how many tokens they can process. The default varies by model but is typically 2,048-8,192 tokens. You can adjust this per-model:
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
See [Configuration options](configuration.md) for details on context size and other parameters.
@y
See [Configuration options](configuration.md) for details on context size and other parameters.
@z

@x
> [!TIP]
>
> Using Testcontainers or Docker Compose?
> [Testcontainers for Java](https://java.testcontainers.org/modules/docker_model_runner/)
> and [Go](https://golang.testcontainers.org/modules/dockermodelrunner/), and
> [Docker Compose](/manuals/ai/compose/models-and-compose.md) now support Docker
> Model Runner.
@y
> [!TIP]
>
> Using Testcontainers or Docker Compose?
> [Testcontainers for Java](https://java.testcontainers.org/modules/docker_model_runner/)
> and [Go](https://golang.testcontainers.org/modules/dockermodelrunner/), and
> [Docker Compose](manuals/ai/compose/models-and-compose.md) now support Docker
> Model Runner.
@z

@x
## Known issues
@y
## Known issues
@z

@x
### `docker model` is not recognised
@y
### `docker model` is not recognised
@z

@x
If you run a Docker Model Runner command and see:
@y
If you run a Docker Model Runner command and see:
@z

@x
```text
docker: 'model' is not a docker command
```
@y
```text
docker: 'model' is not a docker command
```
@z

@x
It means Docker can't find the plugin because it's not in the expected CLI plugins directory.
@y
It means Docker can't find the plugin because it's not in the expected CLI plugins directory.
@z

@x
To fix this, create a symlink so Docker can detect it:
@y
To fix this, create a symlink so Docker can detect it:
@z

@x
```console
$ ln -s /Applications/Docker.app/Contents/Resources/cli-plugins/docker-model ~/.docker/cli-plugins/docker-model
```
@y
```console
$ ln -s /Applications/Docker.app/Contents/Resources/cli-plugins/docker-model ~/.docker/cli-plugins/docker-model
```
@z

@x
Once linked, rerun the command.
@y
Once linked, rerun the command.
@z

@x
## Privacy and data collection
@y
## Privacy and data collection
@z

@x
Docker Model Runner respects your privacy settings in Docker Desktop. Data collection is controlled by the **Send usage statistics** setting:
@y
Docker Model Runner respects your privacy settings in Docker Desktop. Data collection is controlled by the **Send usage statistics** setting:
@z

@x
- **Disabled**: No usage data is collected
- **Enabled**: Only minimal, non-personal data is collected:
  - [Model names](https://github.com/docker/model-runner/blob/eb76b5defb1a598396f99001a500a30bbbb48f01/pkg/metrics/metrics.go#L96) (via HEAD requests to Docker Hub)
  - User agent information
  - Whether requests originate from the host or containers
@y
- **Disabled**: No usage data is collected
- **Enabled**: Only minimal, non-personal data is collected:
  - [Model names](https://github.com/docker/model-runner/blob/eb76b5defb1a598396f99001a500a30bbbb48f01/pkg/metrics/metrics.go#L96) (via HEAD requests to Docker Hub)
  - User agent information
  - Whether requests originate from the host or containers
@z

@x
When using Docker Model Runner with Docker Engine, HEAD requests to Docker Hub are made to track model names, regardless of any settings.
@y
When using Docker Model Runner with Docker Engine, HEAD requests to Docker Hub are made to track model names, regardless of any settings.
@z

@x
No prompt content, responses, or personally identifiable information is ever collected.
@y
No prompt content, responses, or personally identifiable information is ever collected.
@z

@x
## Share feedback
@y
## Share feedback
@z

@x
Thanks for trying out Docker Model Runner. To report bugs or request features, [open an issue on GitHub](https://github.com/docker/model-runner/issues). You can also give feedback through the **Give feedback** link next to the **Enable Docker Model Runner** setting.
@y
Thanks for trying out Docker Model Runner. To report bugs or request features, [open an issue on GitHub](https://github.com/docker/model-runner/issues). You can also give feedback through the **Give feedback** link next to the **Enable Docker Model Runner** setting.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Get started with DMR](get-started.md) - Enable DMR and run your first model
- [API reference](api-reference.md) - OpenAI and Ollama-compatible API documentation
- [Configuration options](configuration.md) - Context size and runtime parameters
- [Inference engines](inference-engines.md) - llama.cpp, vLLM, and Diffusers details
- [IDE integrations](ide-integrations.md) - Connect Cline, Continue, Cursor, and more
- [Open WebUI integration](openwebui-integration.md) - Set up a web chat interface
@y
- [Get started with DMR](get-started.md) - Enable DMR and run your first model
- [API reference](api-reference.md) - OpenAI and Ollama-compatible API documentation
- [Configuration options](configuration.md) - Context size and runtime parameters
- [Inference engines](inference-engines.md) - llama.cpp, vLLM, and Diffusers details
- [IDE integrations](ide-integrations.md) - Connect Cline, Continue, Cursor, and more
- [Open WebUI integration](openwebui-integration.md) - Set up a web chat interface
@z
