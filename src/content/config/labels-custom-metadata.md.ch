%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn about labels, a tool to manage metadata on Docker objects.
keywords: labels, metadata, docker, annotations
title: Docker object labels
aliases:
  - /engine/userguide/labels-custom-metadata/
---
@y
---
description: Learn about labels, a tool to manage metadata on Docker objects.
keywords: labels, metadata, docker, annotations
title: Docker object labels
aliases:
  - /engine/userguide/labels-custom-metadata/
---
@z

@x
Labels are a mechanism for applying metadata to Docker objects, including:
@y
Labels are a mechanism for applying metadata to Docker objects, including:
@z

@x
- Images
- Containers
- Local daemons
- Volumes
- Networks
- Swarm nodes
- Swarm services
@y
- Images
- Containers
- Local daemons
- Volumes
- Networks
- Swarm nodes
- Swarm services
@z

@x
You can use labels to organize your images, record licensing information, annotate
relationships between containers, volumes, and networks, or in any way that makes
sense for your business or application.
@y
You can use labels to organize your images, record licensing information, annotate
relationships between containers, volumes, and networks, or in any way that makes
sense for your business or application.
@z

@x
## Label keys and values
@y
## Label keys and values
@z

@x
A label is a key-value pair, stored as a string. You can specify multiple labels
for an object, but each key must be unique within an object. If the
same key is given multiple values, the most-recently-written value overwrites
all previous values.
@y
A label is a key-value pair, stored as a string. You can specify multiple labels
for an object, but each key must be unique within an object. If the
same key is given multiple values, the most-recently-written value overwrites
all previous values.
@z

@x
### Key format recommendations
@y
### Key format recommendations
@z

@x
A label key is the left-hand side of the key-value pair. Keys are alphanumeric
strings which may contain periods (`.`) and hyphens (`-`). Most Docker users use
images created by other organizations, and the following guidelines help to
prevent inadvertent duplication of labels across objects, especially if you plan
to use labels as a mechanism for automation.
@y
A label key is the left-hand side of the key-value pair. Keys are alphanumeric
strings which may contain periods (`.`) and hyphens (`-`). Most Docker users use
images created by other organizations, and the following guidelines help to
prevent inadvertent duplication of labels across objects, especially if you plan
to use labels as a mechanism for automation.
@z

@x
- Authors of third-party tools should prefix each label key with the
  reverse DNS notation of a domain they own, such as `com.example.some-label`.
@y
- Authors of third-party tools should prefix each label key with the
  reverse DNS notation of a domain they own, such as `com.example.some-label`.
@z

@x
- Don't use a domain in your label key without the domain owner's permission.
@y
- Don't use a domain in your label key without the domain owner's permission.
@z

@x
- The `com.docker.*`, `io.docker.*`, and `org.dockerproject.*` namespaces are
  reserved by Docker for internal use.
@y
- The `com.docker.*`, `io.docker.*`, and `org.dockerproject.*` namespaces are
  reserved by Docker for internal use.
@z

@x
- Label keys should begin and end with a lower-case letter and should only
  contain lower-case alphanumeric characters, the period character (`.`), and
  the hyphen character (`-`). Consecutive periods or hyphens aren't allowed.
@y
- Label keys should begin and end with a lower-case letter and should only
  contain lower-case alphanumeric characters, the period character (`.`), and
  the hyphen character (`-`). Consecutive periods or hyphens aren't allowed.
@z

@x
- The period character (`.`) separates namespace "fields". Label keys without
  namespaces are reserved for CLI use, allowing users of the CLI to interactively
  label Docker objects using shorter typing-friendly strings.
@y
- The period character (`.`) separates namespace "fields". Label keys without
  namespaces are reserved for CLI use, allowing users of the CLI to interactively
  label Docker objects using shorter typing-friendly strings.
@z

@x
These guidelines aren't currently enforced and additional guidelines may apply
to specific use cases.
@y
These guidelines aren't currently enforced and additional guidelines may apply
to specific use cases.
@z

@x
### Value guidelines
@y
### Value guidelines
@z

@x
Label values can contain any data type that can be represented as a string,
including (but not limited to) JSON, XML, CSV, or YAML. The only requirement is
that the value be serialized to a string first, using a mechanism specific to
the type of structure. For instance, to serialize JSON into a string, you might
use the `JSON.stringify()` JavaScript method.
@y
Label values can contain any data type that can be represented as a string,
including (but not limited to) JSON, XML, CSV, or YAML. The only requirement is
that the value be serialized to a string first, using a mechanism specific to
the type of structure. For instance, to serialize JSON into a string, you might
use the `JSON.stringify()` JavaScript method.
@z

@x
Since Docker doesn't deserialize the value, you can't treat a JSON or XML
document as a nested structure when querying or filtering by label value unless
you build this functionality into third-party tooling.
@y
Since Docker doesn't deserialize the value, you can't treat a JSON or XML
document as a nested structure when querying or filtering by label value unless
you build this functionality into third-party tooling.
@z

@x
## Manage labels on objects
@y
## Manage labels on objects
@z

@x
Each type of object with support for labels has mechanisms for adding and
managing them and using them as they relate to that type of object. These links
provide a good place to start learning about how you can use labels in your
Docker deployments.
@y
Each type of object with support for labels has mechanisms for adding and
managing them and using them as they relate to that type of object. These links
provide a good place to start learning about how you can use labels in your
Docker deployments.
@z

@x
Labels on images, containers, local daemons, volumes, and networks are static for
the lifetime of the object. To change these labels you must recreate the object.
Labels on Swarm nodes and services can be updated dynamically.
@y
Labels on images, containers, local daemons, volumes, and networks are static for
the lifetime of the object. To change these labels you must recreate the object.
Labels on Swarm nodes and services can be updated dynamically.
@z

@x
- Images and containers
@y
- Images and containers
@z

@x
  - [Adding labels to images](../engine/reference/builder.md#label)
  - [Overriding a container's labels at runtime](../engine/reference/commandline/container_run.md#label)
  - [Inspecting labels on images or containers](../engine/reference/commandline/inspect.md)
  - [Filtering images by label](../engine/reference/commandline/image_ls.md#filter)
  - [Filtering containers by label](../engine/reference/commandline/container_ls.md#filter)
@y
  - [Adding labels to images](../engine/reference/builder.md#label)
  - [Overriding a container's labels at runtime](../engine/reference/commandline/container_run.md#label)
  - [Inspecting labels on images or containers](../engine/reference/commandline/inspect.md)
  - [Filtering images by label](../engine/reference/commandline/image_ls.md#filter)
  - [Filtering containers by label](../engine/reference/commandline/container_ls.md#filter)
@z

@x
- Local Docker daemons
@y
- Local Docker daemons
@z

@x
  - [Adding labels to a Docker daemon at runtime](../engine/reference/commandline/dockerd.md)
  - [Inspecting a Docker daemon's labels](../engine/reference/commandline/system_info.md)
@y
  - [Adding labels to a Docker daemon at runtime](../engine/reference/commandline/dockerd.md)
  - [Inspecting a Docker daemon's labels](../engine/reference/commandline/system_info.md)
@z

@x
- Volumes
@y
- Volumes
@z

@x
  - [Adding labels to volumes](../engine/reference/commandline/volume_create.md)
  - [Inspecting a volume's labels](../engine/reference/commandline/volume_inspect.md)
  - [Filtering volumes by label](../engine/reference/commandline/volume_ls.md#filter)
@y
  - [Adding labels to volumes](../engine/reference/commandline/volume_create.md)
  - [Inspecting a volume's labels](../engine/reference/commandline/volume_inspect.md)
  - [Filtering volumes by label](../engine/reference/commandline/volume_ls.md#filter)
@z

@x
- Networks
@y
- Networks
@z

@x
  - [Adding labels to a network](../engine/reference/commandline/network_create.md)
  - [Inspecting a network's labels](../engine/reference/commandline/network_inspect.md)
  - [Filtering networks by label](../engine/reference/commandline/network_ls.md#filter)
@y
  - [Adding labels to a network](../engine/reference/commandline/network_create.md)
  - [Inspecting a network's labels](../engine/reference/commandline/network_inspect.md)
  - [Filtering networks by label](../engine/reference/commandline/network_ls.md#filter)
@z

@x
- Swarm nodes
@y
- Swarm nodes
@z

@x
  - [Adding or updating a Swarm node's labels](../engine/reference/commandline/node_update.md#label-add)
  - [Inspecting a Swarm node's labels](../engine/reference/commandline/node_inspect.md)
  - [Filtering Swarm nodes by label](../engine/reference/commandline/node_ls.md#filter)
@y
  - [Adding or updating a Swarm node's labels](../engine/reference/commandline/node_update.md#label-add)
  - [Inspecting a Swarm node's labels](../engine/reference/commandline/node_inspect.md)
  - [Filtering Swarm nodes by label](../engine/reference/commandline/node_ls.md#filter)
@z

@x
- Swarm services
  - [Adding labels when creating a Swarm service](../engine/reference/commandline/service_create.md#label)
  - [Updating a Swarm service's labels](../engine/reference/commandline/service_update.md)
  - [Inspecting a Swarm service's labels](../engine/reference/commandline/service_inspect.md)
  - [Filtering Swarm services by label](../engine/reference/commandline/service_ls.md#filter)
@y
- Swarm services
  - [Adding labels when creating a Swarm service](../engine/reference/commandline/service_create.md#label)
  - [Updating a Swarm service's labels](../engine/reference/commandline/service_update.md)
  - [Inspecting a Swarm service's labels](../engine/reference/commandline/service_inspect.md)
  - [Filtering Swarm services by label](../engine/reference/commandline/service_ls.md#filter)
@z
