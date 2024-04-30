%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
description: Overview of Docker Compose Bridge
keywords: compose, orchestration, kubernetes, bridge
title: Overview of Docker Compose Bridge
@y
description: Overview of Docker Compose Bridge
keywords: compose, orchestration, kubernetes, bridge
title: Overview of Docker Compose Bridge
@z

% snip include...

@x
## Introduction
@y
## Introduction
@z

@x
Docker Compose makes it easy to define a multi-container application
to be run on a single-node Docker Engine, relying on a `compose.yaml` file to
describe resources with a simple abstraction.
@y
Docker Compose makes it easy to define a multi-container application
to be run on a single-node Docker Engine, relying on a `compose.yaml` file to
describe resources with a simple abstraction.
@z

@x
Compose Bridge lets you reuse this exact same `compose.yaml` file but
translate it into another platform's definition format, with a primary
focus on Kubernetes. This transformation can be customized to match
specific needs and requirements.
@y
Compose Bridge lets you reuse this exact same `compose.yaml` file but
translate it into another platform's definition format, with a primary
focus on Kubernetes. This transformation can be customized to match
specific needs and requirements.
@z

@x
## Usage
@y
## Usage
@z

@x
Compose Bridge is a command line tool that consumes a `compose.yaml` file  
and runs a transformation to produce resource definitions for another platform.
[By default](transformation.md), it produces Kubernetes manifests and a Kustomize overlay for Docker Desktop. For example: 
@y
Compose Bridge is a command line tool that consumes a `compose.yaml` file  
and runs a transformation to produce resource definitions for another platform.
[By default](transformation.md), it produces Kubernetes manifests and a Kustomize overlay for Docker Desktop. For example: 
@z

% snip command...

@x
Such manifests can then be used to run the application on Kubernetes using
the standard deployment command `kubectl apply -k out/overlays/desktop/`.
@y
Such manifests can then be used to run the application on Kubernetes using
the standard deployment command `kubectl apply -k out/overlays/desktop/`.
@z

@x
## Customization
@y
## Customization
@z

@x
The Kubernetes manifests produced by Compose Bridge 
are designed to allow deployment on Docker Desktop with Kubernetes enabled. 
@y
The Kubernetes manifests produced by Compose Bridge 
are designed to allow deployment on Docker Desktop with Kubernetes enabled. 
@z

@x
Kubernetes is such a versatile platform that there are many ways
to map Compose concepts into a Kubernetes resource definitions. Compose
Bridge lets you customize the transformation to match your own infrastructure
decisions and preferences, with various level of flexibility / investment.
@y
Kubernetes is such a versatile platform that there are many ways
to map Compose concepts into a Kubernetes resource definitions. Compose
Bridge lets you customize the transformation to match your own infrastructure
decisions and preferences, with various level of flexibility / investment.
@z

@x
### Modify the default templates
@y
### Modify the default templates
@z

@x
You can extract templates used by default transformation `docker/compose-bridge-kubernetes`
by running `compose-bridge transformations create my-template --from docker/compose-bridge-kubernetes` 
and adjusting those to match your needs.
@y
You can extract templates used by default transformation `docker/compose-bridge-kubernetes`
by running `compose-bridge transformations create my-template --from docker/compose-bridge-kubernetes` 
and adjusting those to match your needs.
@z

@x
The templates will be extracted into a directory named after your template name (ie `my-template`).  
Inside, you will find a Dockerfile that allows you to create your own image to distribute your template, as well as a directory containing the templating files.  
You are free to edit the existing files, delete them, or [add new ones](#add-your-own-templates) to subsequently generate Kubernetes manifests that meet your needs.  
You can then use the generated Dockerfile to package your changes into a new Transformer image, which you can then use with Compose Bridge:
@y
The templates will be extracted into a directory named after your template name (ie `my-template`).  
Inside, you will find a Dockerfile that allows you to create your own image to distribute your template, as well as a directory containing the templating files.  
You are free to edit the existing files, delete them, or [add new ones](#add-your-own-templates) to subsequently generate Kubernetes manifests that meet your needs.  
You can then use the generated Dockerfile to package your changes into a new Transformer image, which you can then use with Compose Bridge:
@z

% snip command...

@x
You can then use your transformation as a replacement:
@y
You can then use your transformation as a replacement:
@z

% snip command...

@x
For more information, see [Templates](./templates.md).
@y
For more information, see [Templates](./templates.md).
@z

@x
### Add your own templates
@y
### Add your own templates
@z

@x
For resources that are not managed by Compose Bridge's default transformation, 
you can build your own templates. The `compose.yaml` model may not offer all 
the configuration attributes required to populate the target manifest. If this is the case, you can
then rely on Compose custom extensions to let developers better describe the
application, and offer an agnostic transformation.
@y
For resources that are not managed by Compose Bridge's default transformation, 
you can build your own templates. The `compose.yaml` model may not offer all 
the configuration attributes required to populate the target manifest. If this is the case, you can
then rely on Compose custom extensions to let developers better describe the
application, and offer an agnostic transformation.
@z

@x
As an illustration, if developers add `x-virtual-host` metadata
to service definitions in the `compose.yaml` file, you can use the following custom attribute
to produce Ingress rules:
@y
As an illustration, if developers add `x-virtual-host` metadata
to service definitions in the `compose.yaml` file, you can use the following custom attribute
to produce Ingress rules:
@z

% snip code...

@x
Once packaged into a Docker image, you can use this custom template
when transforming Compose models into Kubernetes in addition to other
transformations:
@y
Once packaged into a Docker image, you can use this custom template
when transforming Compose models into Kubernetes in addition to other
transformations:
@z

% snip command...

@x
### Build your own transformation
@y
### Build your own transformation
@z

@x
While Compose Bridge templates make it easy to customize with minimal changes,
you may want to make significant changes, or rely on an existing conversion tool.
@y
While Compose Bridge templates make it easy to customize with minimal changes,
you may want to make significant changes, or rely on an existing conversion tool.
@z

@x
A Compose Bridge transformation is a Docker image that is designed to get a Compose model
from `/in/compose.yaml` and produce platform manifests under `/out`. This simple 
contract makes it easy to bundle an alternate transformation, as illustrated below using 
[Kompose](https://kompose.io/):
@y
A Compose Bridge transformation is a Docker image that is designed to get a Compose model
from `/in/compose.yaml` and produce platform manifests under `/out`. This simple 
contract makes it easy to bundle an alternate transformation, as illustrated below using 
[Kompose](https://kompose.io/):
@z

@x
```Dockerfile
FROM alpine
@y
```Dockerfile
FROM alpine
@z

@x
# Get kompose from github release page
RUN apk add --no-cache curl
ARG VERSION=1.32.0
RUN ARCH=$(uname -m | sed 's/armv7l/arm/g' | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g') && \
    curl -fsL \
    "https://github.com/kubernetes/kompose/releases/download/v${VERSION}/kompose-linux-${ARCH}" \
    -o /usr/bin/kompose
RUN chmod +x /usr/bin/kompose
@y
# Get kompose from github release page
RUN apk add --no-cache curl
ARG VERSION=1.32.0
RUN ARCH=$(uname -m | sed 's/armv7l/arm/g' | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g') && \
    curl -fsL \
    "https://github.com/kubernetes/kompose/releases/download/v${VERSION}/kompose-linux-${ARCH}" \
    -o /usr/bin/kompose
RUN chmod +x /usr/bin/kompose
@z

@x
CMD ["/usr/bin/kompose", "convert", "-f", "/in/compose.yaml", "--out", "/out"]
```
@y
CMD ["/usr/bin/kompose", "convert", "-f", "/in/compose.yaml", "--out", "/out"]
```
@z

@x
This Dockerfile bundles Kompose and defines the command to run this tool according
to the Compose Bridge transformation contract.
@y
This Dockerfile bundles Kompose and defines the command to run this tool according
to the Compose Bridge transformation contract.
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
