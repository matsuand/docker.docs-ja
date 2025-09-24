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
keywords: Docker, ai, model runner, docker desktop, docker engine, llm
@y
description: Learn how to use Docker Model Runner to manage and run AI models.
keywords: Docker, ai, model runner, docker desktop, docker engine, llm
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
large language models (LLMs) and other AI models directly from Docker Hub or any
OCI-compliant registry.
@y
Docker Model Runner (DMR) makes it easy to manage, run, and
deploy AI models using Docker. Designed for developers,
Docker Model Runner streamlines the process of pulling, running, and serving
large language models (LLMs) and other AI models directly from Docker Hub or any
OCI-compliant registry.
@z

@x
With seamless integration into Docker Desktop and Docker
Engine, you can serve models via OpenAI-compatible APIs, package GGUF files as
OCI Artifacts, and interact with models from both the command line and graphical
interface.
@y
With seamless integration into Docker Desktop and Docker
Engine, you can serve models via OpenAI-compatible APIs, package GGUF files as
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
- [Pull and push models to and from Docker Hub](https://hub.docker.com/u/ai)
- Serve models on OpenAI-compatible APIs for easy integration with existing apps
- Package GGUF files as OCI Artifacts and publish them to any Container Registry
- Run and interact with AI models directly from the command line or from the Docker Desktop GUI
- Manage local models and display logs
- Display prompt and response details
@y
- [Pull and push models to and from Docker Hub](https://hub.docker.com/u/ai)
- Serve models on OpenAI-compatible APIs for easy integration with existing apps
- Package GGUF files as OCI Artifacts and publish them to any Container Registry
- Run and interact with AI models directly from the command line or from the Docker Desktop GUI
- Manage local models and display logs
- Display prompt and response details
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
- Linux CPU & Linux NVIDIA
- NVIDIA drivers 575.57.08+
@y
- Linux CPU & Linux NVIDIA
- NVIDIA drivers 575.57.08+
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
Models are pulled from Docker Hub the first time you use them and are stored
locally. They load into memory only at runtime when a request is made, and
unload when not in use to optimize resources. Because models can be large, the
initial pull may take some time. After that, they're cached locally for faster
access. You can interact with the model using
[OpenAI-compatible APIs](api-reference.md).
@y
Models are pulled from Docker Hub the first time you use them and are stored
locally. They load into memory only at runtime when a request is made, and
unload when not in use to optimize resources. Because models can be large, the
initial pull may take some time. After that, they're cached locally for faster
access. You can interact with the model using
[OpenAI-compatible APIs](api-reference.md).
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
### No consistent digest support in Model CLI
@y
### No consistent digest support in Model CLI
@z

@x
The Docker Model CLI currently lacks consistent support for specifying models by image digest. As a temporary workaround, you should refer to models by name instead of digest.
@y
The Docker Model CLI currently lacks consistent support for specifying models by image digest. As a temporary workaround, you should refer to models by name instead of digest.
@z

@x
## Share feedback
@y
## Share feedback
@z

@x
Thanks for trying out Docker Model Runner. Give feedback or report any bugs
you may find through the **Give feedback** link next to the **Enable Docker Model Runner** setting.
@y
Thanks for trying out Docker Model Runner. Give feedback or report any bugs
you may find through the **Give feedback** link next to the **Enable Docker Model Runner** setting.
@z

@x
## Next steps
@y
## Next steps
@z

@x
[Get started with DMR](get-started.md)
@y
[Get started with DMR](get-started.md)
@z
