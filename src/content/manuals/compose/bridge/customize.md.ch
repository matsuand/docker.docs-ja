%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Customize Compose Bridge 
linkTitle: Customize
@y
title: Customize Compose Bridge 
linkTitle: Customize
@z

@x
description: Learn how to customize Compose Bridge transformations using Go templates and Compose extensions
keywords: docker compose bridge, customize compose bridge, compose bridge templates, compose to kubernetes, compose bridge transformation, go templates docker
@y
description: Learn how to customize Compose Bridge transformations using Go templates and Compose extensions
keywords: docker compose bridge, customize compose bridge, compose bridge templates, compose to kubernetes, compose bridge transformation, go templates docker
@z

@x
{{< summary-bar feature_name="Compose bridge" >}}
@y
{{< summary-bar feature_name="Compose bridge" >}}
@z

@x
You can customize how Compose Bridge converts your Docker Compose files into platform-specific formats. 
@y
You can customize how Compose Bridge converts your Docker Compose files into platform-specific formats. 
@z

@x
This page explains how Compose Bridge uses templating to generate Kubernetes manifests and how you can customize these templates for your specific requirements and needs, or how you can build your own transformation.  
@y
This page explains how Compose Bridge uses templating to generate Kubernetes manifests and how you can customize these templates for your specific requirements and needs, or how you can build your own transformation.  
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
Compose Bridge includes a default Kubernetes transformation using Go templates, which you can customize by replacing or extending templates.
@y
Compose Bridge includes a default Kubernetes transformation using Go templates, which you can customize by replacing or extending templates.
@z

@x
### Template syntax
@y
### Template syntax
@z

@x
Compose Bridge makes use of templates to transform a Compose configuration file into Kubernetes manifests. Templates are plain text files that use the [Go templating syntax](https://pkg.go.dev/text/template). This enables the insertion of logic and data, making the templates dynamic and adaptable according to the Compose model.
@y
Compose Bridge makes use of templates to transform a Compose configuration file into Kubernetes manifests. Templates are plain text files that use the [Go templating syntax](https://pkg.go.dev/text/template). This enables the insertion of logic and data, making the templates dynamic and adaptable according to the Compose model.
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

% snip code...

@x
In the following example, a template iterates over services defined in a `compose.yaml` file. For each service, a dedicated Kubernetes manifest file is generated, named according to the service and containing specified configurations.
@y
In the following example, a template iterates over services defined in a `compose.yaml` file. For each service, a dedicated Kubernetes manifest file is generated, named according to the service and containing specified configurations.
@z

@x within code
# Generated code, do not edit
@y
# Generated code, do not edit
@z

@x
### Input model
@y
### Input model
@z

@x
You can generate the input model by running `docker compose config`. 
@y
You can generate the input model by running `docker compose config`. 
@z

@x
This canonical YAML output serves as the input for Compose Bridge transformations. Within the templates, data from the `compose.yaml` is accessed using dot notation, allowing you to navigate through nested data structures. For example, to access the deployment mode of a service, you would use `service.deploy.mode`:
@y
This canonical YAML output serves as the input for Compose Bridge transformations. Within the templates, data from the `compose.yaml` is accessed using dot notation, allowing you to navigate through nested data structures. For example, to access the deployment mode of a service, you would use `service.deploy.mode`:
@z

@x within code
# iterate over a yaml sequence
@y
# iterate over a yaml sequence
@z

@x
You can check the [Compose Specification JSON schema](https://github.com/compose-spec/compose-go/blob/main/schema/compose-spec.json) for a full overview of the Compose model. This schema outlines all possible configurations and their data types in the Compose model. 
@y
You can check the [Compose Specification JSON schema](https://github.com/compose-spec/compose-go/blob/main/schema/compose-spec.json) for a full overview of the Compose model. This schema outlines all possible configurations and their data types in the Compose model. 
@z

@x
### Helper functions
@y
### Helper functions
@z

@x
As part of the Go templating syntax, Compose Bridge offers a set of YAML helper functions designed to manipulate data within the templates efficiently:
@y
As part of the Go templating syntax, Compose Bridge offers a set of YAML helper functions designed to manipulate data within the templates efficiently:
@z

@x
| Function    | Description                                                                                                 |
| ----------- | ----------------------------------------------------------------------------------------------------------- |
| `seconds`   | Converts a [duration](/reference/compose-file/extension.md#specifying-durations) into an integer (seconds). |
| `uppercase` | Converts a string to uppercase.                                                                             |
| `title`     | Capitalizes the first letter of each word.                                                                  |
| `safe`      | Converts a string into a safe identifier (replaces non-lowercase characters with `-`).                      |
| `truncate`  | Removes the first N elements from a list.                                                                   |
| `join`      | Joins list elements into a single string with a separator.                                                  |
| `base64`    | Encodes a string as base64 (used for Kubernetes secrets).                                                   |
| `map`       | Maps values using `“value -> newValue”` syntax.                                                             |
| `indent`    | Indents string content by N spaces.                                                                         |
| `helmValue` | Outputs a Helm-style template value.                                                                        |
@y
| Function    | Description                                                                                                 |
| ----------- | ----------------------------------------------------------------------------------------------------------- |
| `seconds`   | Converts a [duration](reference/compose-file/extension.md#specifying-durations) into an integer (seconds). |
| `uppercase` | Converts a string to uppercase.                                                                             |
| `title`     | Capitalizes the first letter of each word.                                                                  |
| `safe`      | Converts a string into a safe identifier (replaces non-lowercase characters with `-`).                      |
| `truncate`  | Removes the first N elements from a list.                                                                   |
| `join`      | Joins list elements into a single string with a separator.                                                  |
| `base64`    | Encodes a string as base64 (used for Kubernetes secrets).                                                   |
| `map`       | Maps values using `“value -> newValue”` syntax.                                                             |
| `indent`    | Indents string content by N spaces.                                                                         |
| `helmValue` | Outputs a Helm-style template value.                                                                        |
@z

@x
In the following example, the template checks if a healthcheck interval is specified for a service, applies the `seconds` function to convert this interval into seconds and assigns the value to the `periodSeconds` attribute.
@y
In the following example, the template checks if a healthcheck interval is specified for a service, applies the `seconds` function to convert this interval into seconds and assigns the value to the `periodSeconds` attribute.
@z

% snip code...

@x
## Customize the default templates
@y
## Customize the default templates
@z

@x
As Kubernetes is a versatile platform, there are many ways
to map Compose concepts into Kubernetes resource definitions. Compose
Bridge lets you customize the transformation to match your own infrastructure
decisions and preferences, with varying level of flexibility and effort.
@y
As Kubernetes is a versatile platform, there are many ways
to map Compose concepts into Kubernetes resource definitions. Compose
Bridge lets you customize the transformation to match your own infrastructure
decisions and preferences, with varying level of flexibility and effort.
@z

@x
### Modify the default templates
@y
### Modify the default templates
@z

@x
You can extract templates used by the default transformation `docker/compose-bridge-kubernetes`:
@y
You can extract templates used by the default transformation `docker/compose-bridge-kubernetes`:
@z

% snip command...

@x
The templates are extracted into a directory named after your template name, in this case `my-template`. It includes:
@y
The templates are extracted into a directory named after your template name, in this case `my-template`. It includes:
@z

@x
- A Dockerfile that lets you create your own image to distribute your template
- A directory containing the templating files
@y
- A Dockerfile that lets you create your own image to distribute your template
- A directory containing the templating files
@z

@x
Edit, [add](#add-your-own-templates), or remove templates as needed. 
@y
Edit, [add](#add-your-own-templates), or remove templates as needed. 
@z

@x
You can then use the generated Dockerfile to package your changes into a new transformation image, which you can then use with Compose Bridge:
@y
You can then use the generated Dockerfile to package your changes into a new transformation image, which you can then use with Compose Bridge:
@z

% snip command...

@x
Use your transformation as a replacement:
@y
Use your transformation as a replacement:
@z

% snip command...

@x
#### Model Runner templates
@y
#### Model Runner templates
@z

@x
The default transformation also includes templates for applications that use LLMs:
@y
The default transformation also includes templates for applications that use LLMs:
@z

@x
- `model-runner-deployment.tmpl`
- `model-runner-service.tmpl`
- `model-runner-pvc.tmpl`
- `/overlays/model-runner/kustomization.yaml`
- `/overlays/desktop/deployment.tmpl`
@y
- `model-runner-deployment.tmpl`
- `model-runner-service.tmpl`
- `model-runner-pvc.tmpl`
- `/overlays/model-runner/kustomization.yaml`
- `/overlays/desktop/deployment.tmpl`
@z

@x
These templates can be extended or replaced to change how Docker Model Runner is deployed or configured.
@y
These templates can be extended or replaced to change how Docker Model Runner is deployed or configured.
@z

@x
For more details, see [Use Model Runner](use-model-runner.md).
@y
For more details, see [Use Model Runner](use-model-runner.md).
@z

@x
### Add your own templates
@y
### Add your own templates
@z

@x
For resources that are not managed by Compose Bridge's default transformation, 
you can build your own templates. 
@y
For resources that are not managed by Compose Bridge's default transformation, 
you can build your own templates. 
@z

@x
The `compose.yaml` model may not offer all 
the configuration attributes required to populate the target manifest. If this is the case, you can
then rely on Compose custom extensions to better describe the
application, and offer an agnostic transformation.
@y
The `compose.yaml` model may not offer all 
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

@x within code
# Generated code, do not edit
@y
# Generated code, do not edit
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
contract makes it easy to bundle an alternate transformation using 
[Kompose](https://kompose.io/):
@y
A Compose Bridge transformation is a Docker image that is designed to get a Compose model
from `/in/compose.yaml` and produce platform manifests under `/out`. This simple 
contract makes it easy to bundle an alternate transformation using 
[Kompose](https://kompose.io/):
@z

@x within code
# Get kompose from github release page
@y
# Get kompose from github release page
@z

@x
This Dockerfile bundles Kompose and defines the command to run this tool according
to the Compose Bridge transformation contract.
@y
This Dockerfile bundles Kompose and defines the command to run this tool according
to the Compose Bridge transformation contract.
@z
