%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to use Docker Compose's include top-level element
keywords: compose, docker, include, compose file
title: Include
---
@y
---
description: How to use Docker Compose's include top-level element
keywords: compose, docker, include, compose file
title: Include
---
@z

@x
> **Note**
>
> `include` is available in Docker Compose version 2.20 and later, and Docker Desktop version 4.22 and later. 
@y
> **Note**
>
> `include` is available in Docker Compose version 2.20 and later, and Docker Desktop version 4.22 and later. 
@z

@x
With the [`include` top-level element](../compose-file/14-include.md), you can include a separate Compose file directly in your local Compose file. This solves the relative path problem that [`extends`](extends.md) and [merge](merge.md) present. 
@y
With the [`include` top-level element](../compose-file/14-include.md), you can include a separate Compose file directly in your local Compose file. This solves the relative path problem that [`extends`](extends.md) and [merge](merge.md) present. 
@z

@x
`include` makes it easier to modularize complex applications into sub-Compose files. This allows application configurations to be made simpler and more explicit. This also helps to reflect in the config file organization the engineering team responsible for the code.
@y
`include` makes it easier to modularize complex applications into sub-Compose files. This allows application configurations to be made simpler and more explicit. This also helps to reflect in the config file organization the engineering team responsible for the code.
@z

@x
Each path listed in the `include` section loads as an individual Compose application model, with its own project directory, in order to resolve relative paths.
@y
Each path listed in the `include` section loads as an individual Compose application model, with its own project directory, in order to resolve relative paths.
@z

@x
Once the included Compose application loads, all resources are copied into the current Compose application model.
@y
Once the included Compose application loads, all resources are copied into the current Compose application model.
@z

@x
> **Note**
>
> `include` applies recursively so an included Compose file which declares its own `include` section, results in those other files being included as well.
@y
> **Note**
>
> `include` applies recursively so an included Compose file which declares its own `include` section, results in those other files being included as well.
@z

@x
## Example
@y
## Example
@z

@x
```yaml
include:
  - my-compose-include.yaml  #with serviceB declared
services:
  serviceA:
    build: .
    depends_on:
      - serviceB #use serviceB directly as if it was declared in this Compose file
```
@y
```yaml
include:
  - my-compose-include.yaml  #with serviceB declared
services:
  serviceA:
    build: .
    depends_on:
      - serviceB #use serviceB directly as if it was declared in this Compose file
```
@z

@x
`my-compose-include.yaml` manages `serviceB` which details some replicas, web UI to inspect data, isolated networks, volumes for data persistence, etc. The application relying on `serviceB` doesn’t need to know about the infrastructure details, and consumes the Compose file as a building block it can rely on. 
@y
`my-compose-include.yaml` manages `serviceB` which details some replicas, web UI to inspect data, isolated networks, volumes for data persistence, etc. The application relying on `serviceB` doesn’t need to know about the infrastructure details, and consumes the Compose file as a building block it can rely on. 
@z

@x
This means the team managing `serviceB` can refactor its own database component to introduce additional services without impacting any dependent teams. It also means that the dependent teams don't need to include additional flags on each Compose command they run.
@y
This means the team managing `serviceB` can refactor its own database component to introduce additional services without impacting any dependent teams. It also means that the dependent teams don't need to include additional flags on each Compose command they run.
@z

@x
## Include and overrides
@y
## Include and overrides
@z

@x
Compose reports an error if any resource from `include` conflicts with resources from the included Compose file. This rule prevents
unexpected conflicts with resources defined by the included compose file author. However, there may be some circumstances where you might want to tweak the
included model. This can be achieved by adding an override file to the include directive:
```yaml
include:
  - path : 
      - third-party/compose.yaml
      - override.yaml  # local override for third-party model
```
@y
Compose reports an error if any resource from `include` conflicts with resources from the included Compose file. This rule prevents
unexpected conflicts with resources defined by the included compose file author. However, there may be some circumstances where you might want to tweak the
included model. This can be achieved by adding an override file to the include directive:
```yaml
include:
  - path : 
      - third-party/compose.yaml
      - override.yaml  # local override for third-party model
```
@z

@x
The main limitation with this approach is that you need to maintain a dedicated override file per include. For complex projects with multiple
includes this would result into many Compose files.
@y
The main limitation with this approach is that you need to maintain a dedicated override file per include. For complex projects with multiple
includes this would result into many Compose files.
@z

@x
The other option is to use a `compose.override.yaml` file. While conflicts will be rejected from the file using `include` when same
resource is declared, a global Compose override file can override the resulting merged model, as demonstrated in following example:
@y
The other option is to use a `compose.override.yaml` file. While conflicts will be rejected from the file using `include` when same
resource is declared, a global Compose override file can override the resulting merged model, as demonstrated in following example:
@z

@x
Main `compose.yaml` file:
```yaml
include:
  - team-1/compose.yaml # declare service-1
  - team-2/compose.yaml # declare service-2
```
@y
Main `compose.yaml` file:
```yaml
include:
  - team-1/compose.yaml # declare service-1
  - team-2/compose.yaml # declare service-2
```
@z

@x
Override `compose.override.yaml` file:
```yaml
services:
  service-1:
    # override included service-1 to enable debugger port
    ports:
      - 2345:2345
@y
Override `compose.override.yaml` file:
```yaml
services:
  service-1:
    # override included service-1 to enable debugger port
    ports:
      - 2345:2345
@z

@x
  service-2:
    # override included service-2 to use local data folder containing test data
    volumes:
      - ./data:/data
```
@y
  service-2:
    # override included service-2 to use local data folder containing test data
    volumes:
      - ./data:/data
```
@z

@x
Combined together, this allows you to benefit from third-party reusable components, and adjust the Compose model for your needs.
@y
Combined together, this allows you to benefit from third-party reusable components, and adjust the Compose model for your needs.
@z

@x
## Reference information
@y
## Reference information
@z

@x
[`include` top-level element](../compose-file/14-include.md)
@y
[`include` top-level element](../compose-file/14-include.md)
@z
