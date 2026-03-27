%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: GPU access
@y
title: GPU access
@z

@x
description: How to access NVIDIA GPUs from a container
keywords: docker, GPU, NVIDIA, cuda, nvidia-smi, device, container toolkit
@y
description: How to access NVIDIA GPUs from a container
keywords: docker, GPU, NVIDIA, cuda, nvidia-smi, device, container toolkit
@z

@x
## Access an NVIDIA GPU
@y
## Access an NVIDIA GPU
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Visit the official [NVIDIA drivers page](https://www.nvidia.com/Download/index.aspx)
to download and install the proper drivers. Reboot your system once you have
done so.
@y
Visit the official [NVIDIA drivers page](https://www.nvidia.com/Download/index.aspx)
to download and install the proper drivers. Reboot your system once you have
done so.
@z

@x
Verify that your GPU is running and accessible.
@y
Verify that your GPU is running and accessible.
@z

@x
### Install NVIDIA Container Toolkit
@y
### Install NVIDIA Container Toolkit
@z

@x
Follow the official NVIDIA Container Toolkit [installation instructions](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html).
@y
Follow the official NVIDIA Container Toolkit [installation instructions](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html).
@z

@x
### Expose GPUs for use
@y
### Expose GPUs for use
@z

@x
Include the `--gpus` flag when you start a container to access GPU resources.
@y
Include the `--gpus` flag when you start a container to access GPU resources.
@z

@x
To expose all available GPUs:
@y
To expose all available GPUs:
@z

@x
```console
$ docker run -it --rm --gpus all ubuntu nvidia-smi
```
@y
```console
$ docker run -it --rm --gpus all ubuntu nvidia-smi
```
@z

@x
The output looks like the following:
@y
The output looks like the following:
@z

@x
```text
+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 535.288.01             Driver Version: 535.288.01   CUDA Version: 12.2     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  NVIDIA L4                      Off | 00000000:31:00.0 Off |                    0 |
| N/A   40C    P0              27W /  72W |      0MiB / 23034MiB |      4%      Default |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+
@y
```text
+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 535.288.01             Driver Version: 535.288.01   CUDA Version: 12.2     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  NVIDIA L4                      Off | 00000000:31:00.0 Off |                    0 |
| N/A   40C    P0              27W /  72W |      0MiB / 23034MiB |      4%      Default |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+
@z

@x
+---------------------------------------------------------------------------------------+
| Processes:                                                                            |
|  GPU   GI   CI        PID   Type   Process name                            GPU Memory |
|        ID   ID                                                             Usage      |
|=======================================================================================|
|  No running processes found                                                           |
+---------------------------------------------------------------------------------------+
```
@y
+---------------------------------------------------------------------------------------+
| Processes:                                                                            |
|  GPU   GI   CI        PID   Type   Process name                            GPU Memory |
|        ID   ID                                                             Usage      |
|=======================================================================================|
|  No running processes found                                                           |
+---------------------------------------------------------------------------------------+
```
@z

@x
The leftmost column in the GPU table shows the index of each GPU (`0` for the
NVIDIA L4 in the previous example). Use these index numbers to target specific GPUs
with the `device` option.
@y
The leftmost column in the GPU table shows the index of each GPU (`0` for the
NVIDIA L4 in the previous example). Use these index numbers to target specific GPUs
with the `device` option.
@z

@x
To expose a single GPU by index:
@y
To expose a single GPU by index:
@z

@x
```console
$ docker run -it --rm --gpus device=0 ubuntu nvidia-smi
```
@y
```console
$ docker run -it --rm --gpus device=0 ubuntu nvidia-smi
```
@z

@x
To expose a GPU by its UUID, first list UUIDs with `nvidia-smi -L`:
@y
To expose a GPU by its UUID, first list UUIDs with `nvidia-smi -L`:
@z

@x
```console
$ nvidia-smi -L
GPU 0: NVIDIA L4 (UUID: GPU-3a23c669-1f69-c64e-cf85-44e9b07e7a2a)
```
@y
```console
$ nvidia-smi -L
GPU 0: NVIDIA L4 (UUID: GPU-3a23c669-1f69-c64e-cf85-44e9b07e7a2a)
```
@z

@x
Then pass the UUID to `--gpus`:
@y
Then pass the UUID to `--gpus`:
@z

@x
```console
$ docker run -it --rm --gpus device=GPU-3a23c669-1f69-c64e-cf85-44e9b07e7a2a ubuntu nvidia-smi
```
@y
```console
$ docker run -it --rm --gpus device=GPU-3a23c669-1f69-c64e-cf85-44e9b07e7a2a ubuntu nvidia-smi
```
@z

@x
On systems with multiple GPUs, you can expose several by index. The `device`
value must be quoted because it contains a comma:
@y
On systems with multiple GPUs, you can expose several by index. The `device`
value must be quoted because it contains a comma:
@z

@x
```console
$ docker run -it --rm --gpus '"device=0,2"' ubuntu nvidia-smi
```
@y
```console
$ docker run -it --rm --gpus '"device=0,2"' ubuntu nvidia-smi
```
@z

@x
This exposes the GPUs at index `0` and `2` — the first and third GPUs listed in
`nvidia-smi` output.
@y
This exposes the GPUs at index `0` and `2` — the first and third GPUs listed in
`nvidia-smi` output.
@z

@x
> [!NOTE]
>
> NVIDIA GPUs can only be accessed by systems running a single engine.
@y
> [!NOTE]
>
> NVIDIA GPUs can only be accessed by systems running a single engine.
@z

@x
### Set NVIDIA capabilities
@y
### Set NVIDIA capabilities
@z

@x
You can set capabilities manually. For example, on Ubuntu you can run the
following:
@y
You can set capabilities manually. For example, on Ubuntu you can run the
following:
@z

@x
```console
$ docker run --gpus 'all,capabilities=utility' --rm ubuntu nvidia-smi
```
@y
```console
$ docker run --gpus 'all,capabilities=utility' --rm ubuntu nvidia-smi
```
@z

@x
This enables the `utility` driver capability which adds the `nvidia-smi` tool to
the container.
@y
This enables the `utility` driver capability which adds the `nvidia-smi` tool to
the container.
@z

@x
Capabilities and other configurations can be set in images via environment
variables. For valid variables, see the
[nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/docker-specialized.html)
documentation. These variables can be set in a Dockerfile.
@y
Capabilities and other configurations can be set in images via environment
variables. For valid variables, see the
[nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/docker-specialized.html)
documentation. These variables can be set in a Dockerfile.
@z

@x
You can also use CUDA images, which set these variables automatically. See the
official [CUDA images](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/cuda)
NGC catalog page.
@y
You can also use CUDA images, which set these variables automatically. See the
official [CUDA images](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/cuda)
NGC catalog page.
@z
