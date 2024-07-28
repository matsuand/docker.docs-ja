%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Customize Compose Bridge 
description: Learn about the Compose Bridge templates syntax
keywords: compose, bridge, templates
---
@y
---
title: Customize Compose Bridge 
description: Learn about the Compose Bridge templates syntax
keywords: compose, bridge, templates
---
@z

@x
{{< include "compose-bridge-early-access.md" >}}
@y
{{< include "compose-bridge-early-access.md" >}}
@z

@x
This page explains how Compose Bridge utilizes templating to efficiently translate Docker Compose files into Kubernetes manifests. It also explain how you can customize these templates for your specific requirements and needs, or how you can build your own transformation. 
@y
This page explains how Compose Bridge utilizes templating to efficiently translate Docker Compose files into Kubernetes manifests. It also explain how you can customize these templates for your specific requirements and needs, or how you can build your own transformation. 
@z

@x
## How it works 
@y
## How it works 
@z

@x
Compose bridge uses transformations to let you convert a Compose model into another form. 
@y
Compose bridge uses transformations to let you convert a Compose model into another form. 
@z

@x
A transformation is packaged as a Docker image that receives the fully-resolved Compose model as `/in/compose.yaml` and can produce any target format file under `/out`.
@y
A transformation is packaged as a Docker image that receives the fully-resolved Compose model as `/in/compose.yaml` and can produce any target format file under `/out`.
@z

@x
Compose Bridge provides its transformation for Kubernetes using Go templates, so that it is easy to extend for customization by just replacing or appending your own templates.
@y
Compose Bridge provides its transformation for Kubernetes using Go templates, so that it is easy to extend for customization by just replacing or appending your own templates.
@z

@x
### Syntax
@y
### Syntax
@z

@x
Compose Bridge make use of templates to transform a Compose configuration file into Kubernetes manifests. Templates are plain text files that use the [Go templating syntax](https://pkg.go.dev/text/template). This enables the insertion of logic and data, making the templates dynamic and adaptable according to the Compose model.
@y
Compose Bridge make use of templates to transform a Compose configuration file into Kubernetes manifests. Templates are plain text files that use the [Go templating syntax](https://pkg.go.dev/text/template). This enables the insertion of logic and data, making the templates dynamic and adaptable according to the Compose model.
@z

@x
When a template is executed, it must produce a YAML file which is the standard format for Kubernetes manifests. Multiple files can be generated as long as they are separated by `---`
@y
When a template is executed, it must produce a YAML file which is the standard format for Kubernetes manifests. Multiple files can be generated as long as they are separated by `---`
@z

@x
Each YAML output file begins with custom header notation, for example:
@y
Each YAML output file begins with custom header notation, for example:
@z

@x
```yaml
#! manifest.yaml
```
@y
```yaml
#! manifest.yaml
```
@z

@x
In the following example, a template iterates over services defined in a `compose.yaml` file. For each service, a dedicated Kubernetes manifest file is generated, named according to the service and containing specified configurations.
@y
In the following example, a template iterates over services defined in a `compose.yaml` file. For each service, a dedicated Kubernetes manifest file is generated, named according to the service and containing specified configurations.
@z

@x
```yaml
{{ range $name, $service := .services }}
---
#! {{ $name }}-manifest.yaml
# Generated code, do not edit
key: value
## ...
{{ end }}
```
@y
```yaml
{{ range $name, $service := .services }}
---
#! {{ $name }}-manifest.yaml
# Generated code, do not edit
key: value
## ...
{{ end }}
```
@z

@x
### Input
@y
### Input
@z

@x
The input Compose model is the canonical YAML model you can get by running  `docker compose config`. Within the templates, data from the `compose.yaml` is accessed using dot notation, allowing you to navigate through nested data structures. For example, to access the deployment mode of a service, you would use `service.deploy.mode`:
@y
The input Compose model is the canonical YAML model you can get by running  `docker compose config`. Within the templates, data from the `compose.yaml` is accessed using dot notation, allowing you to navigate through nested data structures. For example, to access the deployment mode of a service, you would use `service.deploy.mode`:
@z

@x
 ```yaml
# iterate over a yaml sequence
{{ range $name, $service := .services }}
  # access a nested attribute using dot notation
  {{ if eq $service.deploy.mode "global" }}
kind: DaemonSet
  {{ end }}
{{ end }}
```
@y
 ```yaml
# iterate over a yaml sequence
{{ range $name, $service := .services }}
  # access a nested attribute using dot notation
  {{ if eq $service.deploy.mode "global" }}
kind: DaemonSet
  {{ end }}
{{ end }}
```
@z

@x
You can check the [Compose Specification JSON schema](https://github.com/compose-spec/compose-go/blob/main/schema/compose-spec.json) to have a full overview of the Compose model. This schema outlines all possible configurations and their data types in the Compose model. 
@y
You can check the [Compose Specification JSON schema](https://github.com/compose-spec/compose-go/blob/main/schema/compose-spec.json) to have a full overview of the Compose model. This schema outlines all possible configurations and their data types in the Compose model. 
@z

@x
### Helpers
@y
### Helpers
@z

@x
As part of the Go templating syntax, Compose Bridge offers a set of YAML helper functions designed to manipulate data within the templates efficiently:
@y
As part of the Go templating syntax, Compose Bridge offers a set of YAML helper functions designed to manipulate data within the templates efficiently:
@z

@x
- `seconds`: Converts a [duration](https://github.com/compose-spec/compose-spec/blob/master/11-extension.md#specifying-durations) into an integer
- `uppercase`: Converts a string into upper case characters
- `title`: Converts a string by capitalizing the first letter of each word
- `safe`: Converts a string into a safe identifier, replacing all characters (except lowercase a-z) with `-`
- `truncate`: Removes the N first elements from a list
- `join`: Groups elements from a list into a single string, using a separator
- `base64`: Encodes a string as base64 used in Kubernetes for encoding secrets
- `map`: Transforms a value according to mappings expressed as `"value -> newValue"` strings 
- `indent`: Writes string content indented by N spaces
- `helmValue`: Writes the string content as a template value in the final file
@y
- `seconds`: Converts a [duration](https://github.com/compose-spec/compose-spec/blob/master/11-extension.md#specifying-durations) into an integer
- `uppercase`: Converts a string into upper case characters
- `title`: Converts a string by capitalizing the first letter of each word
- `safe`: Converts a string into a safe identifier, replacing all characters (except lowercase a-z) with `-`
- `truncate`: Removes the N first elements from a list
- `join`: Groups elements from a list into a single string, using a separator
- `base64`: Encodes a string as base64 used in Kubernetes for encoding secrets
- `map`: Transforms a value according to mappings expressed as `"value -> newValue"` strings 
- `indent`: Writes string content indented by N spaces
- `helmValue`: Writes the string content as a template value in the final file
@z

@x
In the following example, the template checks if a healthcheck interval is specified for a service, applies the `seconds` function to convert this interval into seconds and assigns the value to the `periodSeconds` attribute.
@y
In the following example, the template checks if a healthcheck interval is specified for a service, applies the `seconds` function to convert this interval into seconds and assigns the value to the `periodSeconds` attribute.
@z

@x
```yaml
{{ if $service.healthcheck.interval }}
            periodSeconds: {{ $service.healthcheck.interval | seconds }}{{ end }}
{{ end }}
```
@y
```yaml
{{ if $service.healthcheck.interval }}
            periodSeconds: {{ $service.healthcheck.interval | seconds }}{{ end }}
{{ end }}
```
@z

@x
## Customization
@y
## Customization
@z

@x
As Kubernetes is a versatile platform, there are many ways
to map Compose concepts into Kubernetes resource definitions. Compose
Bridge lets you customize the transformation to match your own infrastructure
decisions and preferences, with various level of flexibility and effort.
@y
As Kubernetes is a versatile platform, there are many ways
to map Compose concepts into Kubernetes resource definitions. Compose
Bridge lets you customize the transformation to match your own infrastructure
decisions and preferences, with various level of flexibility and effort.
@z

@x
### Modify the default templates
@y
### Modify the default templates
@z

@x
You can extract templates used by the default transformation `docker/compose-bridge-kubernetes`,
by running `compose-bridge transformations create --from docker/compose-bridge-kubernetes my-template` 
and adjusting the templates to match your needs.
@y
You can extract templates used by the default transformation `docker/compose-bridge-kubernetes`,
by running `compose-bridge transformations create --from docker/compose-bridge-kubernetes my-template` 
and adjusting the templates to match your needs.
@z

@x
The templates are extracted into a directory named after your template name, in this case `my-template`.  
It includes a Dockerfile that lets you create your own image to distribute your template, as well as a directory containing the templating files.  
You are free to edit the existing files, delete them, or [add new ones](#add-your-own-templates) to subsequently generate Kubernetes manifests that meet your needs.  
You can then use the generated Dockerfile to package your changes into a new transformation image, which you can then use with Compose Bridge:
@y
The templates are extracted into a directory named after your template name, in this case `my-template`.  
It includes a Dockerfile that lets you create your own image to distribute your template, as well as a directory containing the templating files.  
You are free to edit the existing files, delete them, or [add new ones](#add-your-own-templates) to subsequently generate Kubernetes manifests that meet your needs.  
You can then use the generated Dockerfile to package your changes into a new transformation image, which you can then use with Compose Bridge:
@z

@x
```console
$ docker build --tag mycompany/transform --push .
```
@y
```console
$ docker build --tag mycompany/transform --push .
```
@z

@x
You can then use your transformation as a replacement:
@y
You can then use your transformation as a replacement:
@z

@x
```console
$ compose-bridge convert --transformations mycompany/transform 
```
@y
```console
$ compose-bridge convert --transformations mycompany/transform 
```
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
then rely on Compose custom extensions to better describe the
application, and offer an agnostic transformation.
@y
For resources that are not managed by Compose Bridge's default transformation, 
you can build your own templates. The `compose.yaml` model may not offer all 
the configuration attributes required to populate the target manifest. If this is the case, you can
then rely on Compose custom extensions to better describe the
application, and offer an agnostic transformation.
@z

@x
For example, if you add `x-virtual-host` metadata
to service definitions in the `compose.yaml` file, you can use the following custom attribute
to produce Ingress rules:
@y
For example, if you add `x-virtual-host` metadata
to service definitions in the `compose.yaml` file, you can use the following custom attribute
to produce Ingress rules:
@z

@x
```yaml
{{ $project := .name }}
#! {{ $name }}-ingress.yaml
# Generated code, do not edit
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: virtual-host-ingress
  namespace: {{ $project }}
spec:
  rules:  
{{ range $name, $service := .services }}
{{ if $service.x-virtual-host }}
  - host: ${{ $service.x-virtual-host }}
    http:
      paths:
      - path: "/"
        backend:
          service:
            name: ${{ name }}
            port:
              number: 80  
{{ end }}
{{ end }}
```
@y
```yaml
{{ $project := .name }}
#! {{ $name }}-ingress.yaml
# Generated code, do not edit
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: virtual-host-ingress
  namespace: {{ $project }}
spec:
  rules:  
{{ range $name, $service := .services }}
{{ if $service.x-virtual-host }}
  - host: ${{ $service.x-virtual-host }}
    http:
      paths:
      - path: "/"
        backend:
          service:
            name: ${{ name }}
            port:
              number: 80  
{{ end }}
{{ end }}
```
@z

@x
Once packaged into a Docker image, you can use this custom template
when transforming Compose models into Kubernetes in addition to other
transformations:
@y
Once packaged into a Docker image, you can use this custom template
when transforming Compose models into Kubernetes in addition to other
transformations:
@z

@x
```console
$ compose-bridge convert \
    --transformation docker/compose-bridge-kubernetes \
    --transformation mycompany/transform 
```
@y
```console
$ compose-bridge convert \
    --transformation docker/compose-bridge-kubernetes \
    --transformation mycompany/transform 
```
@z

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
contract makes it easy to bundle an alternate transformation using 
[Kompose](https://kompose.io/):
@y
A Compose Bridge transformation is a Docker image that is designed to get a Compose model
from `/in/compose.yaml` and produce platform manifests under `/out`. This simple 
contract makes it easy to bundle an alternate transformation using 
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
## What's next?
@y
## What's next?
@z

@x
- [Explore the advanced integration](advanced-integration.md)
@y
- [Explore the advanced integration](advanced-integration.md)
@z
