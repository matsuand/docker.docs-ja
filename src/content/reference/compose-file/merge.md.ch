%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Merge
description: Learn about merging rules
keywords: compose, compose specification, merge, compose file reference
@y
title: Merge
description: マージのルールについて学びます。
keywords: compose, compose specification, merge, compose file reference
@z

% snip include...

@x
These rules are outlined below. 
@y
These rules are outlined below. 
@z

@x
## Mapping
@y
## mapping
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

% snip code...

@x
Results in a Compose application model equivalent to the YAML tree:
@y
Results in a Compose application model equivalent to the YAML tree:
@z

% snip code...

@x
## Sequence
@y
## sequence
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

% snip code...

@x
Results in a Compose application model equivalent to the YAML tree:
@y
Results in a Compose application model equivalent to the YAML tree:
@z

% snip code...

@x
## Exceptions
@y
## Exceptions
@z

@x
### Shell commands
@y
### シェルコマンド {#shell-commands}
@z

@x
When merging Compose files that use the services attributes [command](services.md#command), [entrypoint](services.md#entrypoint) and [healthcheck: `test`](services.md#healthcheck), the value is overridden by the latest Compose file, and not appended.
@y
When merging Compose files that use the services attributes [command](services.md#command), [entrypoint](services.md#entrypoint) and [healthcheck: `test`](services.md#healthcheck), the value is overridden by the latest Compose file, and not appended.
@z

@x
Merging the following example YAML trees:
@y
Merging the following example YAML trees:
@z

% snip code...

@x
Results in a Compose application model equivalent to the YAML tree:
@y
Results in a Compose application model equivalent to the YAML tree:
@z

% snip code...

@x
### Unique resources
@y
### Unique resources
@z

@x
Applies to the [ports](services.md#ports), [volumes](services.md#volumes), [secrets](services.md#secrets) and [configs](services.md#configs) services attributes.
While these types are modeled in a Compose file as a sequence, they have special uniqueness requirements:
@y
Applies to the [ports](services.md#ports), [volumes](services.md#volumes), [secrets](services.md#secrets) and [configs](services.md#configs) services attributes.
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

% snip code...

@x
Results in a Compose application model equivalent to the YAML tree:
@y
Results in a Compose application model equivalent to the YAML tree:
@z

% snip code...

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

% snip code...

@x
And an `compose.override.yaml` file:
@y
And an `compose.override.yaml` file:
@z

% snip code...

@x
Results in:
@y
Results in:
@z

% snip code...

@x
### Replace value
@y
### Replace value
@z

@x
{{< introduced compose 2.24.4 "/manuals/compose/releases/release-notes.md#2244" >}}
@y
{{< introduced compose 2.24.4 "/manuals/compose/releases/release-notes.md#2244" >}}
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

% snip code...

@x
To remove the original port, but expose a new one, the following override file is used:
@y
To remove the original port, but expose a new one, the following override file is used:
@z

% snip code...

@x
This results in: 
@y
This results in: 
@z

% snip code...

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
For more information on how merge can be used to create a composite Compose file, see [Working with multiple Compose files](/manuals/compose/how-tos/multiple-compose-files/_index.md)
@y
For more information on how merge can be used to create a composite Compose file, see [Working with multiple Compose files](manuals/compose/how-tos/multiple-compose-files/_index.md)
@z
