%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: GPU support in Docker Desktop
description: How to use GPU in Docker Desktop
keywords: gpu, gpu support, nvidia, wsl2, docker desktop, windows
@y
title: Docker Desktop における GPU サポート
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
## Using NVIDIA GPUs with WSL2
@y
## WSL2 のもとでの NVIDIA GPU の利用 {#using-nvidia-gpus-with-wsl2}
@z

@x
Docker Desktop for Windows supports WSL 2 GPU Paravirtualization (GPU-PV) on NVIDIA GPUs. To enable WSL 2 GPU Paravirtualization, you need:
@y
Docker Desktop for Windows supports WSL 2 GPU Paravirtualization (GPU-PV) on NVIDIA GPUs. To enable WSL 2 GPU Paravirtualization, you need:
@z

@x
- A machine with an NVIDIA GPU
- Up to date Windows 10 or Windows 11 installation
- [Up to date drivers](https://developer.nvidia.com/cuda/wsl) from NVIDIA supporting WSL 2 GPU Paravirtualization
- The latest version of the WSL 2 Linux kernel. Use `wsl --update` on the command line
- To make sure the [WSL 2 backend is turned on](wsl/index.md/#turn-on-docker-desktop-wsl-2) in Docker Desktop
@y
- A machine with an NVIDIA GPU
- Up to date Windows 10 or Windows 11 installation
- [Up to date drivers](https://developer.nvidia.com/cuda/wsl) from NVIDIA supporting WSL 2 GPU Paravirtualization
- The latest version of the WSL 2 Linux kernel. Use `wsl --update` on the command line
- To make sure the [WSL 2 backend is turned on](wsl/index.md/#turn-on-docker-desktop-wsl-2) in Docker Desktop
@z

@x
To validate that everything works as expected, execute a `docker run` command with the `--gpus=all` flag. For example, the following will run a short benchmark on your GPU:
@y
To validate that everything works as expected, execute a `docker run` command with the `--gpus=all` flag. For example, the following will run a short benchmark on your GPU:
@z

% snip command...

@x
The output will be similar to:
@y
The output will be similar to:
@z

% snip output...

@x
Or if you wanted to try something more useful you could use the official [Ollama image](https://hub.docker.com/r/ollama/ollama) to run the Llama2 large language model.
@y
Or if you wanted to try something more useful you could use the official [Ollama image](https://hub.docker.com/r/ollama/ollama) to run the Llama2 large language model.
@z

% snip command...
