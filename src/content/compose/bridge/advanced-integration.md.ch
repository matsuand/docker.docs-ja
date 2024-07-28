%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Advanced integration
description: Learn about how Compose Bridge can function a kubectl plugin
keywords: kubernetes, compose, compose bridge, plugin, advanced
---
@y
---
title: Advanced integration
description: Learn about how Compose Bridge can function a kubectl plugin
keywords: kubernetes, compose, compose bridge, plugin, advanced
---
@z

@x
{{< include "compose-bridge-early-access.md" >}}
@y
{{< include "compose-bridge-early-access.md" >}}
@z

@x
Compose Bridge can also function as a `kubectl` plugin, allowing you to integrate its capabilities directly into your Kubernetes command-line operations. This integration simplifies the process of converting and deploying applications from Docker Compose to Kubernetes.
@y
Compose Bridge can also function as a `kubectl` plugin, allowing you to integrate its capabilities directly into your Kubernetes command-line operations. This integration simplifies the process of converting and deploying applications from Docker Compose to Kubernetes.
@z

@x
## Use `compose-bridge` as a `kubectl` plugin
@y
## Use `compose-bridge` as a `kubectl` plugin
@z

@x
To use the `compose-bridge` binary as a `kubectl` plugin, you need to make sure that the binary is available in your PATH and the name of the binary is prefixed with `kubectl-`. 
@y
To use the `compose-bridge` binary as a `kubectl` plugin, you need to make sure that the binary is available in your PATH and the name of the binary is prefixed with `kubectl-`. 
@z

@x
1. Rename or copy the `compose-bridge` binary to `kubectl-compose_bridge`:
@y
1. Rename or copy the `compose-bridge` binary to `kubectl-compose_bridge`:
@z

@x
    ```console
    $ mv /path/to/compose-bridge /usr/local/bin/kubectl-compose_bridge
    ```
@y
    ```console
    $ mv /path/to/compose-bridge /usr/local/bin/kubectl-compose_bridge
    ```
@z

@x
2. Ensure that the binary is executable:
@y
2. Ensure that the binary is executable:
@z

@x
    ```console
    $ chmod +x /usr/local/bin/kubectl-compose_bridge
    ```
@y
    ```console
    $ chmod +x /usr/local/bin/kubectl-compose_bridge
    ```
@z

@x
3. Verify that the plugin is recognized by `kubectl`:
@y
3. Verify that the plugin is recognized by `kubectl`:
@z

@x
    ```console
    $ kubectl plugin list
    ```
@y
    ```console
    $ kubectl plugin list
    ```
@z

@x
    In the output, you should see `kubectl-compose_bridge`.
@y
    In the output, you should see `kubectl-compose_bridge`.
@z

@x
4. Now you can use `compose-bridge` as a `kubectl` plugin:
@y
4. Now you can use `compose-bridge` as a `kubectl` plugin:
@z

@x
    ```console
   $ kubectl compose-bridge [command]
    ```
@y
    ```console
   $ kubectl compose-bridge [command]
    ```
@z

@x
Replace `[command]` with any `compose-bridge` command you want to use.
@y
Replace `[command]` with any `compose-bridge` command you want to use.
@z
