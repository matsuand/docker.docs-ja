%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Use WSL
description: How to develop with Docker and WSL 2 and understand GPU support for WSL
keywords: wsl, wsl 2, gpu support, develop, docker desktop, windows
---
@y
---
title: Use WSL
description: How to develop with Docker and WSL 2 and understand GPU support for WSL
keywords: wsl, wsl 2, gpu support, develop, docker desktop, windows
---
@z

@x
## Develop with Docker and WSL 2
@y
## Develop with Docker and WSL 2
@z

@x
The following section describes how to start developing your applications using Docker and WSL 2. We recommend that you have your code in your default Linux distribution for the best development experience using Docker and WSL 2. After you have turned on the WSL 2 feature on Docker Desktop, you can start working with your code inside the Linux distro and ideally with your IDE still in Windows. This workflow is straightforward if you are using [VS Code](https://code.visualstudio.com/download).
@y
The following section describes how to start developing your applications using Docker and WSL 2. We recommend that you have your code in your default Linux distribution for the best development experience using Docker and WSL 2. After you have turned on the WSL 2 feature on Docker Desktop, you can start working with your code inside the Linux distro and ideally with your IDE still in Windows. This workflow is straightforward if you are using [VS Code](https://code.visualstudio.com/download).
@z

@x
1. Open VS Code and install the [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) extension. This extension lets you to work with a remote server in the Linux distro and your IDE client still on Windows.
2. Start working in VS Code remotely. To do this, open your terminal and type:
@y
1. Open VS Code and install the [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) extension. This extension lets you to work with a remote server in the Linux distro and your IDE client still on Windows.
2. Start working in VS Code remotely. To do this, open your terminal and type:
@z

@x
    ```console
    $ wsl
    ```
@y
    ```console
    $ wsl
    ```
@z

@x
    ```console
    $ code .
    ```
@y
    ```console
    $ code .
    ```
@z

@x
    This opens a new VS Code window connected remotely to your default Linux distro which you can check in the bottom corner of the screen.
@y
    This opens a new VS Code window connected remotely to your default Linux distro which you can check in the bottom corner of the screen.
@z

@x
    Alternatively, you can type the name of your default Linux distro in your Start menu, open it, and then run `code` .
3. When you are in VS Code, you can use the terminal in VS Code to pull your code and start working natively from your Windows machine.
@y
    Alternatively, you can type the name of your default Linux distro in your Start menu, open it, and then run `code` .
3. When you are in VS Code, you can use the terminal in VS Code to pull your code and start working natively from your Windows machine.
@z

@x
## GPU support
@y
## GPU support
@z

@x
> **Note**
>
> GPU support is only available in Docker Desktop for Windows with the WSL2 backend.
@y
> **Note**
>
> GPU support is only available in Docker Desktop for Windows with the WSL2 backend.
@z

@x
With Docker Desktop version 3.1.0 and later,  WSL 2 GPU Paravirtualization (GPU-PV) on NVIDIA GPUs is supported. To enable WSL 2 GPU Paravirtualization, you need:
@y
With Docker Desktop version 3.1.0 and later,  WSL 2 GPU Paravirtualization (GPU-PV) on NVIDIA GPUs is supported. To enable WSL 2 GPU Paravirtualization, you need:
@z

@x
- A machine with an NVIDIA GPU
- The latest Windows Insider version from the Dev Preview ring
- [Beta drivers](https://developer.nvidia.com/cuda/wsl) from NVIDIA supporting WSL 2 GPU Paravirtualization
- Update WSL 2 Linux kernel to the latest version using `wsl --update` from an elevated command prompt
- Make sure the WSL 2 backend is turned on in Docker Desktop
@y
- A machine with an NVIDIA GPU
- The latest Windows Insider version from the Dev Preview ring
- [Beta drivers](https://developer.nvidia.com/cuda/wsl) from NVIDIA supporting WSL 2 GPU Paravirtualization
- Update WSL 2 Linux kernel to the latest version using `wsl --update` from an elevated command prompt
- Make sure the WSL 2 backend is turned on in Docker Desktop
@z

@x
To validate that everything works as expected, run the following command to run a short benchmark on your GPU:
@y
To validate that everything works as expected, run the following command to run a short benchmark on your GPU:
@z

@x
```console
$ docker run --rm -it --gpus=all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark
```
The following displays:
@y
```console
$ docker run --rm -it --gpus=all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark
```
The following displays:
@z

@x
```console
Run "nbody -benchmark [-numbodies=<numBodies>]" to measure performance.
        -fullscreen       (run n-body simulation in fullscreen mode)
        -fp64             (use double precision floating point values for simulation)
        -hostmem          (stores simulation data in host memory)
        -benchmark        (run benchmark to measure performance)
        -numbodies=<N>    (number of bodies (>= 1) to run in simulation)
        -device=<d>       (where d=0,1,2.... for the CUDA device to use)
        -numdevices=<i>   (where i=(number of CUDA devices > 0) to use for simulation)
        -compare          (compares simulation results running once on the default GPU and once on the CPU)
        -cpu              (run n-body simulation on the CPU)
        -tipsy=<file.bin> (load a tipsy model file for simulation)
@y
```console
Run "nbody -benchmark [-numbodies=<numBodies>]" to measure performance.
        -fullscreen       (run n-body simulation in fullscreen mode)
        -fp64             (use double precision floating point values for simulation)
        -hostmem          (stores simulation data in host memory)
        -benchmark        (run benchmark to measure performance)
        -numbodies=<N>    (number of bodies (>= 1) to run in simulation)
        -device=<d>       (where d=0,1,2.... for the CUDA device to use)
        -numdevices=<i>   (where i=(number of CUDA devices > 0) to use for simulation)
        -compare          (compares simulation results running once on the default GPU and once on the CPU)
        -cpu              (run n-body simulation on the CPU)
        -tipsy=<file.bin> (load a tipsy model file for simulation)
@z

@x
> NOTE: The CUDA Samples are not meant for performance measurements. Results may vary when GPU Boost is enabled.
@y
> NOTE: The CUDA Samples are not meant for performance measurements. Results may vary when GPU Boost is enabled.
@z

@x
> Windowed mode
> Simulation data stored in video memory
> Single precision floating point simulation
> 1 Devices used for simulation
MapSMtoCores for SM 7.5 is undefined.  Default to use 64 Cores/SM
GPU Device 0: "GeForce RTX 2060 with Max-Q Design" with compute capability 7.5
@y
> Windowed mode
> Simulation data stored in video memory
> Single precision floating point simulation
> 1 Devices used for simulation
MapSMtoCores for SM 7.5 is undefined.  Default to use 64 Cores/SM
GPU Device 0: "GeForce RTX 2060 with Max-Q Design" with compute capability 7.5
@z

@x
> Compute 7.5 CUDA device: [GeForce RTX 2060 with Max-Q Design]
30720 bodies, total time for 10 iterations: 69.280 ms
= 136.219 billion interactions per second
= 2724.379 single-precision GFLOP/s at 20 flops per interaction
```
@y
> Compute 7.5 CUDA device: [GeForce RTX 2060 with Max-Q Design]
30720 bodies, total time for 10 iterations: 69.280 ms
= 136.219 billion interactions per second
= 2724.379 single-precision GFLOP/s at 20 flops per interaction
```
@z
