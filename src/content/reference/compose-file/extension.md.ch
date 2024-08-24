%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Extensions
description: Understand how to use extensions
keywords: compose, compose specification, extensions, compose file reference
aliases: 
 - /compose/compose-file/11-extension/
---
@y
---
title: Extensions
description: Understand how to use extensions
keywords: compose, compose specification, extensions, compose file reference
aliases: 
 - /compose/compose-file/11-extension/
---
@z

@x
{{< include "compose/extension.md" >}}
@y
{{< include "compose/extension.md" >}}
@z

@x
Extensions can also be used with [anchors and aliases](fragments.md).
@y
Extensions can also be used with [anchors and aliases](fragments.md).
@z

@x
They also can be used within any structure in a Compose file where user-defined keys are not expected. 
Compose uses those to enable experimental features, the same way browsers add support for [custom CSS features](https://www.w3.org/TR/2011/REC-CSS2-20110607/syndata.html#vendor-keywords)
@y
They also can be used within any structure in a Compose file where user-defined keys are not expected. 
Compose uses those to enable experimental features, the same way browsers add support for [custom CSS features](https://www.w3.org/TR/2011/REC-CSS2-20110607/syndata.html#vendor-keywords)
@z

@x
## Example 1
@y
## Example 1
@z

@x
```yml
x-custom:
  foo:
    - bar
    - zot
@y
```yml
x-custom:
  foo:
    - bar
    - zot
@z

@x
services:
  webapp:
    image: example/webapp
    x-foo: bar
```
@y
services:
  webapp:
    image: example/webapp
    x-foo: bar
```
@z

@x
```yml
service:
  backend:
    deploy:
      placement:
        x-aws-role: "arn:aws:iam::XXXXXXXXXXXX:role/foo"
        x-aws-region: "eu-west-3"
        x-azure-region: "france-central"
```
@y
```yml
service:
  backend:
    deploy:
      placement:
        x-aws-role: "arn:aws:iam::XXXXXXXXXXXX:role/foo"
        x-aws-region: "eu-west-3"
        x-azure-region: "france-central"
```
@z

@x
## Example 2
@y
## Example 2
@z

@x
```yml
x-env: &env
  environment:
    - CONFIG_KEY
    - EXAMPLE_KEY
@y
```yml
x-env: &env
  environment:
    - CONFIG_KEY
    - EXAMPLE_KEY
@z

@x
services:
  first:
    <<: *env
    image: my-image:latest
  second:
    <<: *env
    image: another-image:latest
```
@y
services:
  first:
    <<: *env
    image: my-image:latest
  second:
    <<: *env
    image: another-image:latest
```
@z

@x
In this example, the environment variables do not belong to either of the services. They’ve been lifted out completely into the `x-env` extension field.
This defines a new node which contains the environment field. The `&env` YAML anchor is used so both services can reference the extension field’s value as `*env`.
@y
In this example, the environment variables do not belong to either of the services. They’ve been lifted out completely into the `x-env` extension field.
This defines a new node which contains the environment field. The `&env` YAML anchor is used so both services can reference the extension field’s value as `*env`.
@z

@x
## Example 3
@y
## Example 3
@z

@x
```yml
x-function: &function
 labels:
   function: "true"
 depends_on:
   - gateway
 networks:
   - functions
 deploy:
   placement:
     constraints:
       - 'node.platform.os == linux'
services:
 # Node.js gives OS info about the node (Host)
 nodeinfo:
   <<: *function
   image: functions/nodeinfo:latest
   environment:
     no_proxy: "gateway"
     https_proxy: $https_proxy
 # Uses `cat` to echo back response, fastest function to execute.
 echoit:
   <<: *function
   image: functions/alpine:health
   environment:
     fprocess: "cat"
     no_proxy: "gateway"
     https_proxy: $https_proxy
```
@y
```yml
x-function: &function
 labels:
   function: "true"
 depends_on:
   - gateway
 networks:
   - functions
 deploy:
   placement:
     constraints:
       - 'node.platform.os == linux'
services:
 # Node.js gives OS info about the node (Host)
 nodeinfo:
   <<: *function
   image: functions/nodeinfo:latest
   environment:
     no_proxy: "gateway"
     https_proxy: $https_proxy
 # Uses `cat` to echo back response, fastest function to execute.
 echoit:
   <<: *function
   image: functions/alpine:health
   environment:
     fprocess: "cat"
     no_proxy: "gateway"
     https_proxy: $https_proxy
```
@z

@x
The `nodeinfo` and `echoit` services both include the `x-function` extension via the `&function` anchor, then set their specific image and environment. 
@y
The `nodeinfo` and `echoit` services both include the `x-function` extension via the `&function` anchor, then set their specific image and environment. 
@z

@x
## Example 4 
@y
## Example 4 
@z

@x
Using [YAML merge](https://yaml.org/type/merge.html) it is also possible to use multiple extensions and share
and override additional attributes for specific needs:
@y
Using [YAML merge](https://yaml.org/type/merge.html) it is also possible to use multiple extensions and share
and override additional attributes for specific needs:
@z

@x
```yml
x-environment: &default-environment
  FOO: BAR
  ZOT: QUIX
x-keys: &keys
  KEY: VALUE
services:
  frontend:
    image: example/webapp
    environment: 
      << : [*default-environment, *keys]
      YET_ANOTHER: VARIABLE
```
@y
```yml
x-environment: &default-environment
  FOO: BAR
  ZOT: QUIX
x-keys: &keys
  KEY: VALUE
services:
  frontend:
    image: example/webapp
    environment: 
      << : [*default-environment, *keys]
      YET_ANOTHER: VARIABLE
```
@z

@x
> [!NOTE]
>
> [YAML merge](https://yaml.org/type/merge.html) only applies to mappings, and can't be used with sequences. 
>
> In the example above, the environment variables are declared using the `FOO: BAR` mapping syntax, while the sequence syntax `- FOO=BAR` is only valid when no fragments are involved.
@y
> [!NOTE]
>
> [YAML merge](https://yaml.org/type/merge.html) only applies to mappings, and can't be used with sequences. 
>
> In the example above, the environment variables are declared using the `FOO: BAR` mapping syntax, while the sequence syntax `- FOO=BAR` is only valid when no fragments are involved.
@z

@x
## Informative Historical Notes
@y
## Informative Historical Notes
@z

@x
This section is informative. At the time of writing, the following prefixes are known to exist:
@y
This section is informative. At the time of writing, the following prefixes are known to exist:
@z

@x
| Prefix     | Vendor/Organization |
| ---------- | ------------------- |
| docker     | Docker              |
| kubernetes | Kubernetes          |
@y
| Prefix     | Vendor/Organization |
| ---------- | ------------------- |
| docker     | Docker              |
| kubernetes | Kubernetes          |
@z

@x
## Specifying byte values
@y
## Specifying byte values
@z

@x
Values express a byte value as a string in `{amount}{byte unit}` format:
The supported units are `b` (bytes), `k` or `kb` (kilo bytes), `m` or `mb` (mega bytes) and `g` or `gb` (giga bytes).
@y
Values express a byte value as a string in `{amount}{byte unit}` format:
The supported units are `b` (bytes), `k` or `kb` (kilo bytes), `m` or `mb` (mega bytes) and `g` or `gb` (giga bytes).
@z

@x
```text
    2b
    1024kb
    2048k
    300m
    1gb
```
@y
```text
    2b
    1024kb
    2048k
    300m
    1gb
```
@z

@x
## Specifying durations
@y
## Specifying durations
@z

@x
Values express a duration as a string in the form of `{value}{unit}`.
The supported units are `us` (microseconds), `ms` (milliseconds), `s` (seconds), `m` (minutes) and `h` (hours).
Values can combine multiple values without separator.
@y
Values express a duration as a string in the form of `{value}{unit}`.
The supported units are `us` (microseconds), `ms` (milliseconds), `s` (seconds), `m` (minutes) and `h` (hours).
Values can combine multiple values without separator.
@z

@x
```text
  10ms
  40s
  1m30s
  1h5m30s20ms
```
@y
```text
  10ms
  40s
  1m30s
  1h5m30s20ms
```
@z
