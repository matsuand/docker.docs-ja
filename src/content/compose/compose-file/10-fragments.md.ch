%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Fragments
description: Understand how to use fragments
keywords: compose, compose specification, fragments, compose file reference
---
@y
---
title: Fragments
description: Understand how to use fragments
keywords: compose, compose specification, fragments, compose file reference
---
@z

@x
{{< include "compose/fragments.md" >}}
@y
{{< include "compose/fragments.md" >}}
@z

@x
Anchors are created using the `&` sign. The sign is followed by an alias name. You can use this alias with the `*` sign later to reference the value following the anchor. Make sure there is no space between the `&` and the `*` characters and the following alias name. 
@y
Anchors are created using the `&` sign. The sign is followed by an alias name. You can use this alias with the `*` sign later to reference the value following the anchor. Make sure there is no space between the `&` and the `*` characters and the following alias name. 
@z

@x
You can use more than one anchor and alias in a single Compose file.
@y
You can use more than one anchor and alias in a single Compose file.
@z

@x
## Example 1
@y
## Example 1
@z

@x
```yml
volumes:
  db-data: &default-volume
    driver: default
  metrics: *default-volume
```
@y
```yml
volumes:
  db-data: &default-volume
    driver: default
  metrics: *default-volume
```
@z

@x
In the example above, a `default-volume` anchor is created based on the `db-data` volume. It is later reused by the alias `*default-volume` to define the `metrics` volume. 
@y
In the example above, a `default-volume` anchor is created based on the `db-data` volume. It is later reused by the alias `*default-volume` to define the `metrics` volume. 
@z

@x
Anchor resolution takes place before [variables interpolation](12-interpolation.md), so variables can't be used to set anchors or aliases.
@y
Anchor resolution takes place before [variables interpolation](12-interpolation.md), so variables can't be used to set anchors or aliases.
@z

@x
## Example 2
@y
## Example 2
@z

@x
```yml
services:
  first:
    image: my-image:latest
    environment: &env
      - CONFIG_KEY
      - EXAMPLE_KEY
      - DEMO_VAR
  second:
    image: another-image:latest
    environment: *env
```
@y
```yml
services:
  first:
    image: my-image:latest
    environment: &env
      - CONFIG_KEY
      - EXAMPLE_KEY
      - DEMO_VAR
  second:
    image: another-image:latest
    environment: *env
```
@z

@x
If you have an anchor that you want to use in more than one service, use it in conjunction with an [extension](11-extension.md) to make your Compose file easier to maintain.
@y
If you have an anchor that you want to use in more than one service, use it in conjunction with an [extension](11-extension.md) to make your Compose file easier to maintain.
@z

@x
## Example 3
@y
## Example 3
@z

@x
You may want to partially override values. Compose follows the rule outlined by [YAML merge type](https://yaml.org/type/merge.html). 
@y
You may want to partially override values. Compose follows the rule outlined by [YAML merge type](https://yaml.org/type/merge.html). 
@z

@x
In the following example, `metrics` volume specification uses alias
to avoid repetition but overrides `name` attribute:
@y
In the following example, `metrics` volume specification uses alias
to avoid repetition but overrides `name` attribute:
@z

@x
```yml
services:
  backend:
    image: example/database
    volumes:
      - db-data
      - metrics
volumes:
  db-data: &default-volume
    driver: default
    name: "data"
  metrics:
    <<: *default-volume
    name: "metrics"
```
@y
```yml
services:
  backend:
    image: example/database
    volumes:
      - db-data
      - metrics
volumes:
  db-data: &default-volume
    driver: default
    name: "data"
  metrics:
    <<: *default-volume
    name: "metrics"
```
@z

@x
## Example 4
@y
## Example 4
@z

@x
You can also extend the anchor to add additional values.
@y
You can also extend the anchor to add additional values.
@z

@x
```yml
services:
  first:
    image: my-image:latest
    environment: &env
      FOO: BAR
      ZOT: QUIX
  second:
    image: another-image:latest
    environment:
      <<: *env
      YET_ANOTHER: VARIABLE
```
@y
```yml
services:
  first:
    image: my-image:latest
    environment: &env
      FOO: BAR
      ZOT: QUIX
  second:
    image: another-image:latest
    environment:
      <<: *env
      YET_ANOTHER: VARIABLE
```
@z

@x
> **Note**
>
> [YAML merge](https://yaml.org/type/merge.html) only applies to mappings, and can't be used with sequences. 
@y
> **Note**
>
> [YAML merge](https://yaml.org/type/merge.html) only applies to mappings, and can't be used with sequences. 
@z

@x
In example above, the environment variables must be declared using the `FOO: BAR` mapping syntax, while the sequence syntax `- FOO=BAR` is only valid when no fragments are involved. 
@y
In example above, the environment variables must be declared using the `FOO: BAR` mapping syntax, while the sequence syntax `- FOO=BAR` is only valid when no fragments are involved. 
@z
