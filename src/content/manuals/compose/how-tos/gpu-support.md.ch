%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
description: Learn how to configure Docker Compose to use NVIDIA GPUs with CUDA-based containers
keywords: documentation, docs, docker, compose, GPU access, NVIDIA, samples
title: Run Docker Compose services with GPU access 
linkTitle: Enable GPU support
@y
description: Learn how to configure Docker Compose to use NVIDIA GPUs with CUDA-based containers
keywords: documentation, docs, docker, compose, GPU access, NVIDIA, samples
title: Run Docker Compose services with GPU access 
linkTitle: Enable GPU support
@z

@x
Compose services can define GPU device reservations if the Docker host contains such devices and the Docker Daemon is set accordingly. For this, make sure you install the [prerequisites](/manuals/engine/containers/resource_constraints.md#gpu) if you haven't already done so.
@y
Compose services can define GPU device reservations if the Docker host contains such devices and the Docker Daemon is set accordingly. For this, make sure you install the [prerequisites](manuals/engine/containers/resource_constraints.md#gpu) if you haven't already done so.
@z

@x
The examples in the following sections focus specifically on providing service containers access to GPU devices with Docker Compose. 
You can use either `docker-compose` or `docker compose` commands. For more information, see [Migrate to Compose V2](/manuals/compose/releases/migrate.md).
@y
The examples in the following sections focus specifically on providing service containers access to GPU devices with Docker Compose. 
You can use either `docker-compose` or `docker compose` commands. For more information, see [Migrate to Compose V2](manuals/compose/releases/migrate.md).
@z

@x
## Enabling GPU access to service containers
@y
## Enabling GPU access to service containers
@z

@x
GPUs are referenced in a `compose.yaml` file using the [device](/reference/compose-file/deploy.md#devices) attribute from the Compose Deploy specification, within your services that need them.
@y
GPUs are referenced in a `compose.yaml` file using the [device](reference/compose-file/deploy.md#devices) attribute from the Compose Deploy specification, within your services that need them.
@z

@x
This provides more granular control over a GPU reservation as custom values can be set for the following device properties: 
@y
This provides more granular control over a GPU reservation as custom values can be set for the following device properties: 
@z

@x
- `capabilities`. This value is specified as a list of strings. For example, `capabilities: [gpu]`. You must set this field in the Compose file. Otherwise, it returns an error on service deployment.
- `count`. Specified as an integer or the value `all`, represents the number of GPU devices that should be reserved (providing the host holds that number of GPUs). If `count` is set to `all` or not specified, all GPUs available on the host are used by default.
- `device_ids`. This value, specified as a list of strings, represents GPU device IDs from the host. You can find the device ID in the output of `nvidia-smi` on the host. If no `device_ids` are set, all GPUs available on the host are used by default.
- `driver`. Specified as a string, for example `driver: 'nvidia'`
- `options`. Key-value pairs representing driver specific options.
@y
- `capabilities`. This value is specified as a list of strings. For example, `capabilities: [gpu]`. You must set this field in the Compose file. Otherwise, it returns an error on service deployment.
- `count`. Specified as an integer or the value `all`, represents the number of GPU devices that should be reserved (providing the host holds that number of GPUs). If `count` is set to `all` or not specified, all GPUs available on the host are used by default.
- `device_ids`. This value, specified as a list of strings, represents GPU device IDs from the host. You can find the device ID in the output of `nvidia-smi` on the host. If no `device_ids` are set, all GPUs available on the host are used by default.
- `driver`. Specified as a string, for example `driver: 'nvidia'`
- `options`. Key-value pairs representing driver specific options.
@z

@x
> [!IMPORTANT]
>
> You must set the `capabilities` field. Otherwise, it returns an error on service deployment.
@y
> [!IMPORTANT]
>
> You must set the `capabilities` field. Otherwise, it returns an error on service deployment.
@z

@x
> [!NOTE]
>
> `count` and `device_ids` are mutually exclusive. You must only define one field at a time.
@y
> [!NOTE]
>
> `count` and `device_ids` are mutually exclusive. You must only define one field at a time.
@z

@x
For more information on these properties, see the [Compose Deploy Specification](/reference/compose-file/deploy.md#devices).
@y
For more information on these properties, see the [Compose Deploy Specification](reference/compose-file/deploy.md#devices).
@z

@x
### Example of a Compose file for running a service with access to 1 GPU device
@y
### Example of a Compose file for running a service with access to 1 GPU device
@z

% snip code...

@x
Run with Docker Compose:
@y
Run with Docker Compose:
@z

% snip command...

@x
On machines hosting multiple GPUs, the `device_ids` field can be set to target specific GPU devices and `count` can be used to limit the number of GPU devices assigned to a service container. 
@y
On machines hosting multiple GPUs, the `device_ids` field can be set to target specific GPU devices and `count` can be used to limit the number of GPU devices assigned to a service container. 
@z

@x
You can use `count` or `device_ids` in each of your service definitions. An error is returned if you try to combine both, specify an invalid device ID, or use a value of count that’s higher than the number of GPUs in your system.
@y
You can use `count` or `device_ids` in each of your service definitions. An error is returned if you try to combine both, specify an invalid device ID, or use a value of count that’s higher than the number of GPUs in your system.
@z

% snip command...

@x
## Access specific devices
@y
## Access specific devices
@z

@x
To allow access only to GPU-0 and GPU-3 devices:
@y
To allow access only to GPU-0 and GPU-3 devices:
@z

% snip code...
