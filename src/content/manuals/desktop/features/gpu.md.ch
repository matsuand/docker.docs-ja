%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: GPU support in Docker Desktop for Windows
linkTitle: GPU support
@y
title: Docker Desktop for Windows における GPU サポート
linkTitle: GPU support
@z

@x
description: How to use GPU in Docker Desktop
keywords: gpu, gpu support, nvidia, wsl2, docker desktop, windows
@y
description: Docker Desktop における GPU の利用方法。
keywords: gpu, gpu support, nvidia, wsl2, docker desktop, windows
@z

@x
> [!NOTE]
>
> Currently GPU support in Docker Desktop is only available on Windows with the WSL2 backend.
@y
> [!NOTE]
>
> 現時点において Docker Desktop における GPU サポートは、WSL2 バックエンドを使った Windows 上においてのみ利用可能です。
@z

@x
Docker Desktop for Windows supports NVIDIA GPU Paravirtualization (GPU-PV) on NVIDIA GPUs, allowing containers to access GPU resources for compute-intensive workloads like AI, machine learning, or video processing.
@y
Docker Desktop for Windows supports NVIDIA GPU Paravirtualization (GPU-PV) on NVIDIA GPUs, allowing containers to access GPU resources for compute-intensive workloads like AI, machine learning, or video processing.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To enable WSL 2 GPU Paravirtualization, you need:
@y
To enable WSL 2 GPU Paravirtualization, you need:
@z

@x
- A Windows machine with an NVIDIA GPU
- Up to date Windows 10 or Windows 11 installation
- [Up to date drivers](https://developer.nvidia.com/cuda/wsl) from NVIDIA supporting WSL 2 GPU Paravirtualization
- The latest version of the WSL 2 Linux kernel. Use `wsl --update` on the command line
- To make sure the [WSL 2 backend is turned on](wsl/_index.md#turn-on-docker-desktop-wsl-2) in Docker Desktop
@y
- A Windows machine with an NVIDIA GPU
- Up to date Windows 10 or Windows 11 installation
- [Up to date drivers](https://developer.nvidia.com/cuda/wsl) from NVIDIA supporting WSL 2 GPU Paravirtualization
- The latest version of the WSL 2 Linux kernel. Use `wsl --update` on the command line
- To make sure the [WSL 2 backend is turned on](wsl/_index.md#turn-on-docker-desktop-wsl-2) in Docker Desktop
@z

@x
## Validate GPU support
@y
## Validate GPU support
@z

@x
To confirm GPU access is working inside Docker, run the following:
@y
To confirm GPU access is working inside Docker, run the following:
@z

% snip command...

@x
This runs an n-body simulation benchmark on the GPU. The output will be similar to:
@y
This runs an n-body simulation benchmark on the GPU. The output will be similar to:
@z

% snip output...

@x
## Run a real-world model: SmolLM2 with Docker Model Runner
@y
## Run a real-world model: SmolLM2 with Docker Model Runner
@z

@x
> [!NOTE]
>
> Docker Model Runner with vLLM for Windows with WSL2 is available starting with Docker Desktop 4.54.
@y
> [!NOTE]
>
> Docker Model Runner with vLLM for Windows with WSL2 is available starting with Docker Desktop 4.54.
@z

@x
Use Docker Model Runner to run the SmolLM2 LLM with vLLM and GPU acceleration:
@y
Use Docker Model Runner to run the SmolLM2 LLM with vLLM and GPU acceleration:
@z

% snip command...

@x
Check it's correctly installed:
@y
Check it's correctly installed:
@z

% snip command...

@x
Run the model:
@y
Run the model:
@z

% snip command...
