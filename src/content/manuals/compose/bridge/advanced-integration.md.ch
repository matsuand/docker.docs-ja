%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Advanced integration
linkTitle: Advanced
@y
title: Advanced integration
linkTitle: Advanced
@z

@x
description: Learn about how Compose Bridge can function a kubectl plugin
keywords: kubernetes, compose, compose bridge, plugin, advanced
@y
description: Learn about how Compose Bridge can function a kubectl plugin
keywords: kubernetes, compose, compose bridge, plugin, advanced
@z

@x
{{< summary-bar feature_name="Compose bridge" >}}
@y
{{< summary-bar feature_name="Compose bridge" >}}
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

% snip command...

@x
2. Ensure that the binary is executable:
@y
2. Ensure that the binary is executable:
@z

% snip command...

@x
3. Verify that the plugin is recognized by `kubectl`:
@y
3. Verify that the plugin is recognized by `kubectl`:
@z

% snip command...

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

% snip command...

@x
Replace `[command]` with any `compose-bridge` command you want to use.
@y
Replace `[command]` with any `compose-bridge` command you want to use.
@z
