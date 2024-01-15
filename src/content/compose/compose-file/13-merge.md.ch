%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Merge
description: Learn about merging rules
keywords: compose, compose specification, merge, compose file reference
---
@y
---
title: Merge
description: Learn about merging rules
keywords: compose, compose specification, merge, compose file reference
---
@z

@x
Compose lets you define a Compose application model through [multiple Compose files](https://docs.docker.com/compose/multiple-compose-files/). 
When doing so, Compose follows the rules declared in this section to merge Compose files.
@y
Compose lets you define a Compose application model through [multiple Compose files](https://docs.docker.com/compose/multiple-compose-files/). 
When doing so, Compose follows the rules declared in this section to merge Compose files.
@z

@x
## Mapping
@y
## Mapping
@z

@x
A YAML `mapping` gets merged by adding missing entries and merging the conflicting ones.
@y
A YAML `mapping` gets merged by adding missing entries and merging the conflicting ones.
@z

@x
Merging the following example YAML trees:
@y
Merging the following example YAML trees:
@z

@x
```yaml
services:
  foo:
    key1: value1
    key2: value2
```
@y
```yaml
services:
  foo:
    key1: value1
    key2: value2
```
@z

@x
```yaml
services:
  foo:
    key2: VALUE
    key3: value3
```
@y
```yaml
services:
  foo:
    key2: VALUE
    key3: value3
```
@z

@x
Results in a Compose application model equivalent to the YAML tree:
@y
Results in a Compose application model equivalent to the YAML tree:
@z

@x
```yaml
services:
  foo:
    key1: value1
    key2: VALUE
    key3: value3
```
@y
```yaml
services:
  foo:
    key1: value1
    key2: VALUE
    key3: value3
```
@z

@x
## Sequence
@y
## Sequence
@z

@x
A YAML `sequence` is merged by appending values from the overriding Compose file to the previous one.
@y
A YAML `sequence` is merged by appending values from the overriding Compose file to the previous one.
@z

@x
Merging the following example YAML trees:
@y
Merging the following example YAML trees:
@z

@x
```yaml
services:
  foo:
    DNS:
      - 1.1.1.1
```
@y
```yaml
services:
  foo:
    DNS:
      - 1.1.1.1
```
@z

@x
```yaml
services:
  foo:
    DNS: 
      - 8.8.8.8
```
@y
```yaml
services:
  foo:
    DNS: 
      - 8.8.8.8
```
@z

@x
Results in a Compose application model equivalent to the YAML tree:
@y
Results in a Compose application model equivalent to the YAML tree:
@z

@x
```yaml
services:
  foo:
    DNS:
      - 1.1.1.1
      - 8.8.8.8
```
@y
```yaml
services:
  foo:
    DNS:
      - 1.1.1.1
      - 8.8.8.8
```
@z

@x
## Exceptions
@y
## Exceptions
@z

@x
### Shell commands
@y
### Shell commands
@z

@x
When merging Compose files that use the services attributes [command](05-services.md#command), [entrypoint](05-services.md#entrypoint) and [healthcheck: `test`](05-services.md#healthcheck), the value is overridden by the latest Compose file, and not appended.
@y
When merging Compose files that use the services attributes [command](05-services.md#command), [entrypoint](05-services.md#entrypoint) and [healthcheck: `test`](05-services.md#healthcheck), the value is overridden by the latest Compose file, and not appended.
@z

@x
Merging the following example YAML trees:
@y
Merging the following example YAML trees:
@z

@x
```yaml
services:
  foo:
    command: ["echo", "foo"]
```
@y
```yaml
services:
  foo:
    command: ["echo", "foo"]
```
@z

@x
```yaml
services:
  foo:
    command: ["echo", "bar"]
```
@y
```yaml
services:
  foo:
    command: ["echo", "bar"]
```
@z

@x
Results in a Compose application model equivalent to the YAML tree:
@y
Results in a Compose application model equivalent to the YAML tree:
@z

@x
```yaml
services:
  foo:
    command: ["echo", "bar"]
```
@y
```yaml
services:
  foo:
    command: ["echo", "bar"]
```
@z

@x
### Unique resources
@y
### Unique resources
@z

@x
Applies to the [ports](05-services.md#ports), [volumes](05-services.md#volumes), [secrets](05-services.md#secrets) and [configs](05-services.md#configs) services attributes.
While these types are modeled in a Compose file as a sequence, they have special uniqueness requirements:
@y
Applies to the [ports](05-services.md#ports), [volumes](05-services.md#volumes), [secrets](05-services.md#secrets) and [configs](05-services.md#configs) services attributes.
While these types are modeled in a Compose file as a sequence, they have special uniqueness requirements:
@z

@x
| Attribute   | Unique key               |
|-------------|--------------------------|
| volumes     |  target                  |
| secrets     |  source                  |
| configs     |  source                  |
| ports       |  {ip, target, published, protocol}   |
@y
| Attribute   | Unique key               |
|-------------|--------------------------|
| volumes     |  target                  |
| secrets     |  source                  |
| configs     |  source                  |
| ports       |  {ip, target, published, protocol}   |
@z

@x
When merging Compose files, Compose appends new entries that do not violate a uniqueness constraint and merge entries that share a unique key.
@y
When merging Compose files, Compose appends new entries that do not violate a uniqueness constraint and merge entries that share a unique key.
@z

@x
Merging the following example YAML trees:
@y
Merging the following example YAML trees:
@z

@x
```yaml
services:
  foo:
    volumes:
      - foo:/work
```
@y
```yaml
services:
  foo:
    volumes:
      - foo:/work
```
@z

@x
```yaml
services:
  foo:
    volumes:
      - bar:/work
```
@y
```yaml
services:
  foo:
    volumes:
      - bar:/work
```
@z

@x
Results in a Compose application model equivalent to the YAML tree:
@y
Results in a Compose application model equivalent to the YAML tree:
@z

@x
```yaml
services:
  foo:
    volumes:
      - bar:/work
```
@y
```yaml
services:
  foo:
    volumes:
      - bar:/work
```
@z

@x
### Reset value
@y
### Reset value
@z

@x
In addition to the previously described mechanism, an override Compose file can also be used to remove elements from your application model.
For this purpose, the custom [YAML tag](https://yaml.org/spec/1.2.2/#24-tags) `!reset` can be set to
override a value set by the overriden Compose file. A valid value for attribute must be provided,
but will be ignored and target attribute will be set with type's default value or `null`. 
@y
In addition to the previously described mechanism, an override Compose file can also be used to remove elements from your application model.
For this purpose, the custom [YAML tag](https://yaml.org/spec/1.2.2/#24-tags) `!reset` can be set to
override a value set by the overriden Compose file. A valid value for attribute must be provided,
but will be ignored and target attribute will be set with type's default value or `null`. 
@z

@x
For readability, it is recommended to explicitly set the attribute value to the null (`null`) or empty
array `[]` (with `!reset null` or `!reset []`) so that it is clear that resulting attribute will be
cleared.
@y
For readability, it is recommended to explicitly set the attribute value to the null (`null`) or empty
array `[]` (with `!reset null` or `!reset []`) so that it is clear that resulting attribute will be
cleared.
@z

@x
Merging the following example YAML trees:
@y
Merging the following example YAML trees:
@z

@x
```yaml
services:
  foo:
    build: 
      dockerfile: foo.Dockerfile
    read_only: true
    environment:
      FOO: BAR
    ports:
      - "8080:80"            
```
@y
```yaml
services:
  foo:
    build: 
      dockerfile: foo.Dockerfile
    read_only: true
    environment:
      FOO: BAR
    ports:
      - "8080:80"            
```
@z

@x
```yaml
services:
  foo:
    image: foo
    build: !reset null
    read_only: !reset false
    environment:
      FOO: !reset null
    ports: !reset []
```
@y
```yaml
services:
  foo:
    image: foo
    build: !reset null
    read_only: !reset false
    environment:
      FOO: !reset null
    ports: !reset []
```
@z

@x
Result in a Compose application model equivalent to the YAML tree:
@y
Result in a Compose application model equivalent to the YAML tree:
@z

@x
```yaml
services:
  foo:
    image: foo
    build: null
    read_only: false
    environment: {}
    ports: []
```
@y
```yaml
services:
  foo:
    image: foo
    build: null
    read_only: false
    environment: {}
    ports: []
```
@z
