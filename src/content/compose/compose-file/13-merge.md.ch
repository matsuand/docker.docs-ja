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
A base `compose.yaml` file:
@y
A base `compose.yaml` file:
@z

@x
```yaml
services:
  app:
    image: myapp
    ports:
      - "8080:80" 
    environment:
      FOO: BAR           
```
@y
```yaml
services:
  app:
    image: myapp
    ports:
      - "8080:80" 
    environment:
      FOO: BAR           
```
@z

@x
And an `overide.compose.yaml` file:
@y
And an `overide.compose.yaml` file:
@z

@x
```yaml
services:
  app:
    image: myapp
    ports: !reset []
    environment:
      FOO: !reset null
```
@y
```yaml
services:
  app:
    image: myapp
    ports: !reset []
    environment:
      FOO: !reset null
```
@z

@x
Results in:
@y
Results in:
@z

@x
```yaml
services:
  app:
    image: myapp
```
@y
```yaml
services:
  app:
    image: myapp
```
@z

@x
### Replace value
@y
### Replace value
@z

@x
> Available in Docker Compose version 2.24.4 and later
@y
> Available in Docker Compose version 2.24.4 and later
@z

@x
While `!reset` can be used to remove a declaration from a Compose file using an override file, `!override` allows you 
to fully replace an attribute, bypassing the standard merge rules. A typical example is to fully replace a resource definition, to rely on a distinct model but using the same name.
@y
While `!reset` can be used to remove a declaration from a Compose file using an override file, `!override` allows you 
to fully replace an attribute, bypassing the standard merge rules. A typical example is to fully replace a resource definition, to rely on a distinct model but using the same name.
@z

@x
A base `compose.yaml` file:
@y
A base `compose.yaml` file:
@z

@x
```yaml
services:
  app:
    image: myapp
    ports:
      - "8080:80"            
```
@y
```yaml
services:
  app:
    image: myapp
    ports:
      - "8080:80"            
```
@z

@x
To remove the original port, but expose a new one, the following override file is used:
@y
To remove the original port, but expose a new one, the following override file is used:
@z

@x
```yaml
services:
  app:
    ports: !override
      - "8443:443" 
```
@y
```yaml
services:
  app:
    ports: !override
      - "8443:443" 
```
@z

@x
This results in: 
@y
This results in: 
@z

@x
```yaml
services:
  app:
    image: myapp
    ports:
      - "8443:443" 
```
@y
```yaml
services:
  app:
    image: myapp
    ports:
      - "8443:443" 
```
@z

@x
If `!override` had not been used, both `8080:80` and `8443:443` would be exposed as per the [merging rules outlined above](#sequence). 
@y
If `!override` had not been used, both `8080:80` and `8443:443` would be exposed as per the [merging rules outlined above](#sequence). 
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
For more information on how merge can be used to create a composite Compose file, see [Working with multiple Compose files](../multiple-compose-files/_index.md)
@y
For more information on how merge can be used to create a composite Compose file, see [Working with multiple Compose files](../multiple-compose-files/_index.md)
@z
