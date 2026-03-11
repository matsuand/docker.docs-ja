%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Learn about labels, a tool to manage metadata on Docker objects.
keywords: labels, metadata, docker, annotations
title: Docker object labels
@y
description: Learn about labels, a tool to manage metadata on Docker objects.
keywords: labels, metadata, docker, annotations
title: Docker object labels
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
strings which may contain periods (`.`), underscores (`_`), slashes (`/`), and hyphens (`-`). Most Docker users use
images created by other organizations, and the following guidelines help to
prevent inadvertent duplication of labels across objects, especially if you plan
to use labels as a mechanism for automation.
@y
A label key is the left-hand side of the key-value pair. Keys are alphanumeric
strings which may contain periods (`.`), underscores (`_`), slashes (`/`), and hyphens (`-`). Most Docker users use
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
managing them and using them as they relate to that type of object.
@y
Each type of object with support for labels has mechanisms for adding and
managing them and using them as they relate to that type of object.
@z

@x
Labels on images, containers, local daemons, volumes, and networks are static
for the lifetime of the object. To change these labels you must recreate the
object. Labels on Swarm nodes and services can be updated dynamically.
@y
Labels on images, containers, local daemons, volumes, and networks are static
for the lifetime of the object. To change these labels you must recreate the
object. Labels on Swarm nodes and services can be updated dynamically.
@z

@x
### Images
@y
### Images
@z

@x
Add labels to images using the [`LABEL` instruction](/reference/dockerfile.md#label) in a Dockerfile:
@y
Add labels to images using the [`LABEL` instruction](reference/dockerfile.md#label) in a Dockerfile:
@z

@x
```dockerfile
LABEL com.example.version="1.0"
LABEL com.example.description="Web application"
```
@y
```dockerfile
LABEL com.example.version="1.0"
LABEL com.example.description="Web application"
```
@z

@x
You can also set labels at build time with the `--label` flag, without needing
a `LABEL` instruction in the Dockerfile:
@y
You can also set labels at build time with the `--label` flag, without needing
a `LABEL` instruction in the Dockerfile:
@z

@x
```console
$ docker build --label "com.example.version=1.0" -t myapp .
```
@y
```console
$ docker build --label "com.example.version=1.0" -t myapp .
```
@z

@x
Inspect labels on an image using `docker inspect`:
@y
Inspect labels on an image using `docker inspect`:
@z

@x
```console
$ docker inspect --format='{{json .Config.Labels}}' myapp
```
@y
```console
$ docker inspect --format='{{json .Config.Labels}}' myapp
```
@z

@x
Filter images by label with [`docker image ls --filter`](/reference/cli/docker/image/ls/#filter):
@y
Filter images by label with [`docker image ls --filter`](__SUBDIR__/reference/cli/docker/image/ls/#filter):
@z

@x
```console
$ docker image ls --filter "label=com.example.version"
```
@y
```console
$ docker image ls --filter "label=com.example.version"
```
@z

@x
### Containers
@y
### Containers
@z

@x
Override or add labels when starting a container with
[`docker run --label`](/reference/cli/docker/container/run/#label):
@y
Override or add labels when starting a container with
[`docker run --label`](__SUBDIR__/reference/cli/docker/container/run/#label):
@z

@x
```console
$ docker run --label "com.example.env=prod" myapp
```
@y
```console
$ docker run --label "com.example.env=prod" myapp
```
@z

@x
Inspect labels on a container:
@y
Inspect labels on a container:
@z

@x
```console
$ docker inspect --format='{{json .Config.Labels}}' mycontainer
```
@y
```console
$ docker inspect --format='{{json .Config.Labels}}' mycontainer
```
@z

@x
Filter containers by label with [`docker container ls --filter`](/reference/cli/docker/container/ls/#filter):
@y
Filter containers by label with [`docker container ls --filter`](__SUBDIR__/reference/cli/docker/container/ls/#filter):
@z

@x
```console
$ docker container ls --filter "label=com.example.env=prod"
```
@y
```console
$ docker container ls --filter "label=com.example.env=prod"
```
@z

@x
### Local Docker daemons
@y
### Local Docker daemons
@z

@x
Add labels to the Docker daemon by passing `--label` flags when starting
`dockerd`, or by setting `"labels"` in the
[daemon configuration file](/reference/cli/dockerd.md#daemon-configuration-file):
@y
Add labels to the Docker daemon by passing `--label` flags when starting
`dockerd`, or by setting `"labels"` in the
[daemon configuration file](reference/cli/dockerd.md#daemon-configuration-file):
@z

@x
```json
{
  "labels": ["com.example.environment=production"]
}
```
@y
```json
{
  "labels": ["com.example.environment=production"]
}
```
@z

@x
View daemon labels with `docker system info`.
@y
View daemon labels with `docker system info`.
@z

@x
### Volumes
@y
### Volumes
@z

@x
Add labels when [creating a volume](/reference/cli/docker/volume/create/):
@y
Add labels when [creating a volume](__SUBDIR__/reference/cli/docker/volume/create/):
@z

@x
```console
$ docker volume create --label "com.example.purpose=database" myvolume
```
@y
```console
$ docker volume create --label "com.example.purpose=database" myvolume
```
@z

@x
Inspect volume labels:
@y
Inspect volume labels:
@z

@x
```console
$ docker volume inspect myvolume --format='{{json .Labels}}'
```
@y
```console
$ docker volume inspect myvolume --format='{{json .Labels}}'
```
@z

@x
Filter volumes by label with [`docker volume ls --filter`](/reference/cli/docker/volume/ls/#filter):
@y
Filter volumes by label with [`docker volume ls --filter`](__SUBDIR__/reference/cli/docker/volume/ls/#filter):
@z

@x
```console
$ docker volume ls --filter "label=com.example.purpose"
```
@y
```console
$ docker volume ls --filter "label=com.example.purpose"
```
@z

@x
### Networks
@y
### Networks
@z

@x
Add labels when [creating a network](/reference/cli/docker/network/create/):
@y
Add labels when [creating a network](__SUBDIR__/reference/cli/docker/network/create/):
@z

@x
```console
$ docker network create --label "com.example.purpose=frontend" mynetwork
```
@y
```console
$ docker network create --label "com.example.purpose=frontend" mynetwork
```
@z

@x
Inspect network labels:
@y
Inspect network labels:
@z

@x
```console
$ docker network inspect mynetwork --format='{{json .Labels}}'
```
@y
```console
$ docker network inspect mynetwork --format='{{json .Labels}}'
```
@z

@x
Filter networks by label with [`docker network ls --filter`](/reference/cli/docker/network/ls/#filter):
@y
Filter networks by label with [`docker network ls --filter`](__SUBDIR__/reference/cli/docker/network/ls/#filter):
@z

@x
```console
$ docker network ls --filter "label=com.example.purpose"
```
@y
```console
$ docker network ls --filter "label=com.example.purpose"
```
@z

@x
### Swarm nodes
@y
### Swarm nodes
@z

@x
- [Adding or updating a Swarm node's labels](/reference/cli/docker/node/update/#label-add)
- [Filtering Swarm nodes by label](/reference/cli/docker/node/ls/#filter)
@y
- [Adding or updating a Swarm node's labels](__SUBDIR__/reference/cli/docker/node/update/#label-add)
- [Filtering Swarm nodes by label](__SUBDIR__/reference/cli/docker/node/ls/#filter)
@z

@x
### Swarm services
@y
### Swarm services
@z

@x
- [Adding labels when creating a Swarm service](/reference/cli/docker/service/create/#label)
- [Updating a Swarm service's labels](/reference/cli/docker/service/update/)
- [Filtering Swarm services by label](/reference/cli/docker/service/ls/#filter)
@y
- [Adding labels when creating a Swarm service](__SUBDIR__/reference/cli/docker/service/create/#label)
- [Updating a Swarm service's labels](__SUBDIR__/reference/cli/docker/service/update/)
- [Filtering Swarm services by label](__SUBDIR__/reference/cli/docker/service/ls/#filter)
@z
