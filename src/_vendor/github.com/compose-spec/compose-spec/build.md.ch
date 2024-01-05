%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# Compose Build Specification
@y
# Compose Build Specification
@z

@x
> **Note:** 
>
> Build is an optional part of the Compose Specification
@y
> **Note:** 
>
> Build is an optional part of the Compose Specification
@z

@x
A Compose implementation which focuses on running an application on a local machine needs to also support (re)building the application from source. The Compose Build Specification lets you define the build process within a Compose file
in a portable way.
@y
A Compose implementation which focuses on running an application on a local machine needs to also support (re)building the application from source. The Compose Build Specification lets you define the build process within a Compose file
in a portable way.
@z

@x
## Definitions
@y
## Definitions
@z

@x
Only a subset of Compose file services can be defined under a `build`
subsection, others may make use of the `image` attribute. When a `build` subsection is present for a service, Compose ignores the `image` attribute for the corresponding service, as Compose
can build an image from source.
@y
Only a subset of Compose file services can be defined under a `build`
subsection, others may make use of the `image` attribute. When a `build` subsection is present for a service, Compose ignores the `image` attribute for the corresponding service, as Compose
can build an image from source.
@z

@x
`build` can be either specified as a single string defining a context path, or as a detailed build definition.
@y
`build` can be either specified as a single string defining a context path, or as a detailed build definition.
@z

@x
In the former case, the whole path is used as a Docker context to execute a Docker build, looking for a canonical
`Dockerfile` at the root of the directory. The path can be absolute or relative. If it is relative, it is resolved
from the Compose file's parent folder. If it is absolute, the path prevents the Compose file from being portable so Compose displays a warning. 
@y
In the former case, the whole path is used as a Docker context to execute a Docker build, looking for a canonical
`Dockerfile` at the root of the directory. The path can be absolute or relative. If it is relative, it is resolved
from the Compose file's parent folder. If it is absolute, the path prevents the Compose file from being portable so Compose displays a warning. 
@z

@x
In the later case, build arguments can be specified, including an alternate `Dockerfile` location. The path can be absolute or relative. If it is relative, it is resolved
from the Compose file's parent folder. If it is absolute, the path prevents the Compose file from being portable so Compose displays a warning..
@y
In the later case, build arguments can be specified, including an alternate `Dockerfile` location. The path can be absolute or relative. If it is relative, it is resolved
from the Compose file's parent folder. If it is absolute, the path prevents the Compose file from being portable so Compose displays a warning..
@z

@x
## Consistency with `image`
@y
## Consistency with `image`
@z

@x
When a service definition includes both the `image` attribute and a `build` section, Compose can't
guarantee a pulled image is strictly equivalent to building the same image from source. Without any explicit
user directives, Compose with `build` support first tries to pull the image, then builds from source
if the image is not found on registry. Compose may offer options to customize this behaviour by user
request.
@y
When a service definition includes both the `image` attribute and a `build` section, Compose can't
guarantee a pulled image is strictly equivalent to building the same image from source. Without any explicit
user directives, Compose with `build` support first tries to pull the image, then builds from source
if the image is not found on registry. Compose may offer options to customize this behaviour by user
request.
@z

@x
## Publishing built images
@y
## Publishing built images
@z

@x
Compose with `build` support offers an option to push built images to a registry. When doing so, it doesn't try to push service images without an `image` attribute. Compose warns you about the missing `image` attribute which prevents images being pushed.
@y
Compose with `build` support offers an option to push built images to a registry. When doing so, it doesn't try to push service images without an `image` attribute. Compose warns you about the missing `image` attribute which prevents images being pushed.
@z

@x
A Compose implementation may offer a mechanism to compute an `image` attribute for services when not explicitly
declared in a yaml file. In such cases, the resulting Compose configuration is considered to have a valid `image`
attribute, whenever the actual raw yaml file doesn't explicitly declare one.
@y
A Compose implementation may offer a mechanism to compute an `image` attribute for services when not explicitly
declared in a yaml file. In such cases, the resulting Compose configuration is considered to have a valid `image`
attribute, whenever the actual raw yaml file doesn't explicitly declare one.
@z

@x
## Illustrative example
@y
## Illustrative example
@z

@x
The following example illustrates Compose Build Specification concepts with a concrete sample application. The sample is non-normative.
@y
The following example illustrates Compose Build Specification concepts with a concrete sample application. The sample is non-normative.
@z

@x
```yaml
services:
  frontend:
    image: example/webapp
    build: ./webapp
@y
```yaml
services:
  frontend:
    image: example/webapp
    build: ./webapp
@z

@x
  backend:
    image: example/database
    build:
      context: backend
      dockerfile: ../backend.Dockerfile
@y
  backend:
    image: example/database
    build:
      context: backend
      dockerfile: ../backend.Dockerfile
@z

@x
  custom:
    build: ~/custom
```
@y
  custom:
    build: ~/custom
```
@z

@x
When used to build service images from source, the Compose file creates three Docker images:
@y
When used to build service images from source, the Compose file creates three Docker images:
@z

@x
* `example/webapp`: A Docker image is built using `webapp` sub-directory, within the Compose file's parent folder, as the Docker build context. Lack of a `Dockerfile` within this folder throws an error.
* `example/database`: A Docker image is built using `backend` sub-directory within the Compose file parent folder. `backend.Dockerfile` file is used to define build steps, this file is searched relative to the context path, which means `..` resolves to the Compose file parent folder, so `backend.Dockerfile` is a sibling file.
* A Docker image is built using the `custom` directory with the user's HOME as the Docker context. Compose displays a warning about the non-portable path used to build image.
@y
* `example/webapp`: A Docker image is built using `webapp` sub-directory, within the Compose file's parent folder, as the Docker build context. Lack of a `Dockerfile` within this folder throws an error.
* `example/database`: A Docker image is built using `backend` sub-directory within the Compose file parent folder. `backend.Dockerfile` file is used to define build steps, this file is searched relative to the context path, which means `..` resolves to the Compose file parent folder, so `backend.Dockerfile` is a sibling file.
* A Docker image is built using the `custom` directory with the user's HOME as the Docker context. Compose displays a warning about the non-portable path used to build image.
@z

@x
On push, both `example/webapp` and `example/database` Docker images are pushed to the default registry. The `custom` service image is skipped as no `image` attribute is set and Compose displays a warning about this missing attribute.
@y
On push, both `example/webapp` and `example/database` Docker images are pushed to the default registry. The `custom` service image is skipped as no `image` attribute is set and Compose displays a warning about this missing attribute.
@z

@x
## Attributes
@y
## Attributes
@z

@x
The `build` subsection defines configuration options that are applied by Compose to build Docker images from source.
`build` can be specified either as a string containing a path to the build context or as a detailed structure:
@y
The `build` subsection defines configuration options that are applied by Compose to build Docker images from source.
`build` can be specified either as a string containing a path to the build context or as a detailed structure:
@z

@x
Using the string syntax, only the build context can be configured as either:
- A relative path to the Compose file's parent folder. This path must be a directory and must contain a `Dockerfile`
@y
Using the string syntax, only the build context can be configured as either:
- A relative path to the Compose file's parent folder. This path must be a directory and must contain a `Dockerfile`
@z

@x
  ```yml
  services:
    webapp:
      build: ./dir
  ```
@y
  ```yml
  services:
    webapp:
      build: ./dir
  ```
@z

@x
- A git repository URL. Git URLs accept context configuration in their fragment section, separated by a colon (`:`).
The first part represents the reference that Git checks out, and can be either a branch, a tag, or a remote reference.
The second part represents a subdirectory inside the repository that is used as a build context.
@y
- A git repository URL. Git URLs accept context configuration in their fragment section, separated by a colon (`:`).
The first part represents the reference that Git checks out, and can be either a branch, a tag, or a remote reference.
The second part represents a subdirectory inside the repository that is used as a build context.
@z

@x
  ```yml
  services:
    webapp:
      build: https://github.com/mycompany/example.git#branch_or_tag:subdirectory
  ```
@y
  ```yml
  services:
    webapp:
      build: https://github.com/mycompany/example.git#branch_or_tag:subdirectory
  ```
@z

@x
Alternatively `build` can be an object with fields defined as follows:
@y
Alternatively `build` can be an object with fields defined as follows:
@z

@x
### context
@y
### context
@z

@x
`context` defines either a path to a directory containing a Dockerfile, or a URL to a git repository.
@y
`context` defines either a path to a directory containing a Dockerfile, or a URL to a git repository.
@z

@x
When the value supplied is a relative path, it is interpreted as relative to the location of the Compose file.
Compose warns you about the absolute path used to define the build context as those prevent the Compose file
from being portable.
@y
When the value supplied is a relative path, it is interpreted as relative to the location of the Compose file.
Compose warns you about the absolute path used to define the build context as those prevent the Compose file
from being portable.
@z

@x
```yml
build:
  context: ./dir
```
@y
```yml
build:
  context: ./dir
```
@z

@x
```yml
services:
  webapp:
    build: https://github.com/mycompany/webapp.git
```
@y
```yml
services:
  webapp:
    build: https://github.com/mycompany/webapp.git
```
@z

@x
If not set explicitly, `context` defaults to project directory (`.`). 
@y
If not set explicitly, `context` defaults to project directory (`.`). 
@z

@x
### dockerfile
@y
### dockerfile
@z

@x
`dockerfile` sets an alternate Dockerfile. A relative path is resolved from the build context.
Compose warns you about the absolute path used to define the Dockerfile as it prevents Compose files
from being portable.
@y
`dockerfile` sets an alternate Dockerfile. A relative path is resolved from the build context.
Compose warns you about the absolute path used to define the Dockerfile as it prevents Compose files
from being portable.
@z

@x
When set, `dockerfile_inline` attribute is not allowed and Compose
rejects any Compose file having both set.
@y
When set, `dockerfile_inline` attribute is not allowed and Compose
rejects any Compose file having both set.
@z

@x
```yml
build:
  context: .
  dockerfile: webapp.Dockerfile
```
@y
```yml
build:
  context: .
  dockerfile: webapp.Dockerfile
```
@z

@x
### dockerfile_inline
@y
### dockerfile_inline
@z

@x
`dockerfile_inline` defines the Dockerfile content as an inlined string in a Compose file. When set, the `dockerfile`
attribute is not allowed and Compose rejects any Compose file having both set.
@y
`dockerfile_inline` defines the Dockerfile content as an inlined string in a Compose file. When set, the `dockerfile`
attribute is not allowed and Compose rejects any Compose file having both set.
@z

@x
Use of YAML multi-line string syntax is recommended to define the Dockerfile content:
@y
Use of YAML multi-line string syntax is recommended to define the Dockerfile content:
@z

@x
```yml
build:
  context: .
  dockerfile_inline: |
    FROM baseimage
    RUN some command
```
@y
```yml
build:
  context: .
  dockerfile_inline: |
    FROM baseimage
    RUN some command
```
@z

@x
### args
@y
### args
@z

@x
`args` define build arguments, i.e. Dockerfile `ARG` values.
@y
`args` define build arguments, i.e. Dockerfile `ARG` values.
@z

@x
Using the following Dockerfile as an example:
@y
Using the following Dockerfile as an example:
@z

@x
```Dockerfile
ARG GIT_COMMIT
RUN echo "Based on commit: $GIT_COMMIT"
```
@y
```Dockerfile
ARG GIT_COMMIT
RUN echo "Based on commit: $GIT_COMMIT"
```
@z

@x
`args` can be set in the Compose file under the `build` key to define `GIT_COMMIT`. `args` can be set as a mapping or a list:
@y
`args` can be set in the Compose file under the `build` key to define `GIT_COMMIT`. `args` can be set as a mapping or a list:
@z

@x
```yml
build:
  context: .
  args:
    GIT_COMMIT: cdc3b19
```
@y
```yml
build:
  context: .
  args:
    GIT_COMMIT: cdc3b19
```
@z

@x
```yml
build:
  context: .
  args:
    - GIT_COMMIT=cdc3b19
```
@y
```yml
build:
  context: .
  args:
    - GIT_COMMIT=cdc3b19
```
@z

@x
Values can be omitted when specifying a build argument, in which case its value at build time must be obtained by user interaction,
otherwise the build arg won't be set when building the Docker image.
@y
Values can be omitted when specifying a build argument, in which case its value at build time must be obtained by user interaction,
otherwise the build arg won't be set when building the Docker image.
@z

@x
```yml
args:
  - GIT_COMMIT
```
@y
```yml
args:
  - GIT_COMMIT
```
@z

@x
### ssh
@y
### ssh
@z

@x
`ssh` defines SSH authentications that the image builder should use during image build (e.g., cloning private repository).
@y
`ssh` defines SSH authentications that the image builder should use during image build (e.g., cloning private repository).
@z

@x
`ssh` property syntax can be either:
* `default`: Let the builder connect to the ssh-agent.
* `ID=path`: A key/value definition of an ID and the associated path. It can be either a [PEM](https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail) file, or path to ssh-agent socket.
@y
`ssh` property syntax can be either:
* `default`: Let the builder connect to the ssh-agent.
* `ID=path`: A key/value definition of an ID and the associated path. It can be either a [PEM](https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail) file, or path to ssh-agent socket.
@z

@x
```yaml
build:
  context: .
  ssh:
    - default   # mount the default ssh agent
```
or
```yaml
build:
  context: .
  ssh: ["default"]   # mount the default ssh agent
```
@y
```yaml
build:
  context: .
  ssh:
    - default   # mount the default ssh agent
```
or
```yaml
build:
  context: .
  ssh: ["default"]   # mount the default ssh agent
```
@z

@x
Using a custom id `myproject` with path to a local SSH key:
```yaml
build:
  context: .
  ssh:
    - myproject=~/.ssh/myproject.pem
```
The image builder can then rely on this to mount the SSH key during build.
For illustration, [BuildKit extended syntax](https://github.com/compose-spec/compose-spec/pull/234/%5Bmoby/buildkit@master/frontend/dockerfile/docs/syntax.md#run---mounttypessh%5D(https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/syntax.md#run---mounttypessh)) can be used to mount the SSH key set by ID and access a secured resource:
@y
Using a custom id `myproject` with path to a local SSH key:
```yaml
build:
  context: .
  ssh:
    - myproject=~/.ssh/myproject.pem
```
The image builder can then rely on this to mount the SSH key during build.
For illustration, [BuildKit extended syntax](https://github.com/compose-spec/compose-spec/pull/234/%5Bmoby/buildkit@master/frontend/dockerfile/docs/syntax.md#run---mounttypessh%5D(https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/syntax.md#run---mounttypessh)) can be used to mount the SSH key set by ID and access a secured resource:
@z

@x
`RUN --mount=type=ssh,id=myproject git clone ...`
@y
`RUN --mount=type=ssh,id=myproject git clone ...`
@z

@x
### cache_from
@y
### cache_from
@z

@x
`cache_from` defines a list of sources the image builder should use for cache resolution.
@y
`cache_from` defines a list of sources the image builder should use for cache resolution.
@z

@x
Cache location syntax follows the global format `[NAME|type=TYPE[,KEY=VALUE]]`. Simple `NAME` is actually a shortcut notation for `type=registry,ref=NAME`.
@y
Cache location syntax follows the global format `[NAME|type=TYPE[,KEY=VALUE]]`. Simple `NAME` is actually a shortcut notation for `type=registry,ref=NAME`.
@z

@x
Compose Build implementations may support custom types, the Compose Specification defines canonical types which must be supported:
@y
Compose Build implementations may support custom types, the Compose Specification defines canonical types which must be supported:
@z

@x
- `registry` to retrieve build cache from an OCI image set by key `ref`
@y
- `registry` to retrieve build cache from an OCI image set by key `ref`
@z

@x
```yml
build:
  context: .
  cache_from:
    - alpine:latest
    - type=local,src=path/to/cache
    - type=gha
```
@y
```yml
build:
  context: .
  cache_from:
    - alpine:latest
    - type=local,src=path/to/cache
    - type=gha
```
@z

@x
Unsupported caches are ignored and don't prevent you from building images.
@y
Unsupported caches are ignored and don't prevent you from building images.
@z

@x
### cache_to
@y
### cache_to
@z

@x
`cache_to` defines a list of export locations to be used to share build cache with future builds.
@y
`cache_to` defines a list of export locations to be used to share build cache with future builds.
@z

@x
```yml
build:
  context: .
  cache_to:
   - user/app:cache
   - type=local,dest=path/to/cache
```
@y
```yml
build:
  context: .
  cache_to:
   - user/app:cache
   - type=local,dest=path/to/cache
```
@z

@x
Cache target is defined using the same `type=TYPE[,KEY=VALUE]` syntax defined by [`cache_from`](#cache_from).
@y
Cache target is defined using the same `type=TYPE[,KEY=VALUE]` syntax defined by [`cache_from`](#cache_from).
@z

@x
Unsupported caches are ignored and don't prevent you from building images.
@y
Unsupported caches are ignored and don't prevent you from building images.
@z

@x
### additional_contexts
@y
### additional_contexts
@z

@x
`additional_contexts` defines a list of named contexts the image builder should use during image build.
@y
`additional_contexts` defines a list of named contexts the image builder should use during image build.
@z

@x
`additional_contexts` can be a mapping or a list:
@y
`additional_contexts` can be a mapping or a list:
@z

@x
```yml
build:
  context: .
  additional_contexts:
    - resources=/path/to/resources
    - app=docker-image://my-app:latest
    - source=https://github.com/myuser/project.git
```
@y
```yml
build:
  context: .
  additional_contexts:
    - resources=/path/to/resources
    - app=docker-image://my-app:latest
    - source=https://github.com/myuser/project.git
```
@z

@x
```yml
build:
  context: .
  additional_contexts:
    resources: /path/to/resources
    app: docker-image://my-app:latest
    source: https://github.com/myuser/project.git
```
@y
```yml
build:
  context: .
  additional_contexts:
    resources: /path/to/resources
    app: docker-image://my-app:latest
    source: https://github.com/myuser/project.git
```
@z

@x
When used as a list, the syntax follows the `NAME=VALUE` format, where `VALUE` is a string. Validation beyond that
is the responsibility of the image builder (and is builder specific). Compose supports at least
absolute and relative paths to a directory AND Git repository URLs, like [context](#context) does. Other context flavours
must be prefixed to avoid ambiguity with a `type://` prefix.
@y
When used as a list, the syntax follows the `NAME=VALUE` format, where `VALUE` is a string. Validation beyond that
is the responsibility of the image builder (and is builder specific). Compose supports at least
absolute and relative paths to a directory AND Git repository URLs, like [context](#context) does. Other context flavours
must be prefixed to avoid ambiguity with a `type://` prefix.
@z

@x
Compose warns you if the image builder does not support additional contexts and may list
the unused contexts.
@y
Compose warns you if the image builder does not support additional contexts and may list
the unused contexts.
@z

@x
Illustrative examples of how this is used in Buildx can be found
[here](https://github.com/docker/buildx/blob/master/docs/reference/buildx_build.md#-additional-build-contexts---build-context).
@y
Illustrative examples of how this is used in Buildx can be found
[here](https://github.com/docker/buildx/blob/master/docs/reference/buildx_build.md#-additional-build-contexts---build-context).
@z

@x
### extra_hosts
@y
### extra_hosts
@z

@x
`extra_hosts` adds hostname mappings at build-time. Use the same syntax as [extra_hosts](05-services.md#extra_hosts).
@y
`extra_hosts` adds hostname mappings at build-time. Use the same syntax as [extra_hosts](05-services.md#extra_hosts).
@z

@x
```yml
extra_hosts:
  - "somehost:162.242.195.82"
  - "otherhost:50.31.209.229"
```
@y
```yml
extra_hosts:
  - "somehost:162.242.195.82"
  - "otherhost:50.31.209.229"
```
@z

@x
Compose creates matching entry with the IP address and hostname in the container's network
configuration, which means for Linux `/etc/hosts` will get extra lines:
@y
Compose creates matching entry with the IP address and hostname in the container's network
configuration, which means for Linux `/etc/hosts` will get extra lines:
@z

@x
```
162.242.195.82  somehost
50.31.209.229   otherhost
```
@y
```
162.242.195.82  somehost
50.31.209.229   otherhost
```
@z

@x
### isolation
@y
### isolation
@z

@x
`isolation` specifies a build’s container isolation technology. Like [isolation](05-services.md#isolation), supported values
are platform specific.
@y
`isolation` specifies a build’s container isolation technology. Like [isolation](05-services.md#isolation), supported values
are platform specific.
@z

@x
### privileged
@y
### privileged
@z

@x
`privileged` configures the service image to build with elevated privileges. Support and actual impacts are platform specific.
@y
`privileged` configures the service image to build with elevated privileges. Support and actual impacts are platform specific.
@z

@x
```yml
build:
  context: .
  privileged: true
```
@y
```yml
build:
  context: .
  privileged: true
```
@z

@x
### labels
@y
### labels
@z

@x
`labels` add metadata to the resulting image. `labels` can be set either as an array or a map.
@y
`labels` add metadata to the resulting image. `labels` can be set either as an array or a map.
@z

@x
It's recommended that you use reverse-DNS notation to prevent your labels from conflicting with other software.
@y
It's recommended that you use reverse-DNS notation to prevent your labels from conflicting with other software.
@z

@x
```yml
build:
  context: .
  labels:
    com.example.description: "Accounting webapp"
    com.example.department: "Finance"
    com.example.label-with-empty-value: ""
```
@y
```yml
build:
  context: .
  labels:
    com.example.description: "Accounting webapp"
    com.example.department: "Finance"
    com.example.label-with-empty-value: ""
```
@z

@x
```yml
build:
  context: .
  labels:
    - "com.example.description=Accounting webapp"
    - "com.example.department=Finance"
    - "com.example.label-with-empty-value"
```
@y
```yml
build:
  context: .
  labels:
    - "com.example.description=Accounting webapp"
    - "com.example.department=Finance"
    - "com.example.label-with-empty-value"
```
@z

@x
### no_cache
@y
### no_cache
@z

@x
`no_cache` disables image builder cache and enforces a full rebuild from source for all image layers. This only
applies to layers declared in the Dockerfile, referenced images COULD be retrieved from local image store whenever tag
has been updated on registry (see [pull](#pull)).
@y
`no_cache` disables image builder cache and enforces a full rebuild from source for all image layers. This only
applies to layers declared in the Dockerfile, referenced images COULD be retrieved from local image store whenever tag
has been updated on registry (see [pull](#pull)).
@z

@x
### pull
@y
### pull
@z

@x
`pull` requires the image builder to pull referenced images (`FROM` Dockerfile directive), even if those are already
available in the local image store.
@y
`pull` requires the image builder to pull referenced images (`FROM` Dockerfile directive), even if those are already
available in the local image store.
@z

@x
### network
@y
### network
@z

@x
Set the network containers connect to for the `RUN` instructions during build.
@y
Set the network containers connect to for the `RUN` instructions during build.
@z

@x
```yaml
build:
  context: .
  network: host
```  
@y
```yaml
build:
  context: .
  network: host
```  
@z

@x
```yaml
build:
  context: .
  network: custom_network_1
```
@y
```yaml
build:
  context: .
  network: custom_network_1
```
@z

@x
Use `none` to disable networking during build:
@y
Use `none` to disable networking during build:
@z

@x
```yaml
build:
  context: .
  network: none
```
@y
```yaml
build:
  context: .
  network: none
```
@z

@x
### shm_size
@y
### shm_size
@z

@x
`shm_size` sets the size of the shared memory (`/dev/shm` partition on Linux) allocated for building Docker images. Specify
as an integer value representing the number of bytes or as a string expressing a [byte value](11-extension.md#specifying-byte-values).
@y
`shm_size` sets the size of the shared memory (`/dev/shm` partition on Linux) allocated for building Docker images. Specify
as an integer value representing the number of bytes or as a string expressing a [byte value](11-extension.md#specifying-byte-values).
@z

@x
```yml
build:
  context: .
  shm_size: '2gb'
```
@y
```yml
build:
  context: .
  shm_size: '2gb'
```
@z

@x
```yaml
build:
  context: .
  shm_size: 10000000
```
@y
```yaml
build:
  context: .
  shm_size: 10000000
```
@z

@x
### target
@y
### target
@z

@x
`target` defines the stage to build as defined inside a multi-stage `Dockerfile`.
@y
`target` defines the stage to build as defined inside a multi-stage `Dockerfile`.
@z

@x
```yml
build:
  context: .
  target: prod
```
@y
```yml
build:
  context: .
  target: prod
```
@z

@x
### secrets
`secrets` grants access to sensitive data defined by [secrets](05-services.md#secrets) on a per-service build basis. Two
different syntax variants are supported: the short syntax and the long syntax.
@y
### secrets
`secrets` grants access to sensitive data defined by [secrets](05-services.md#secrets) on a per-service build basis. Two
different syntax variants are supported: the short syntax and the long syntax.
@z

@x
Compose reports an error if the secret isn't defined in the
[`secrets`](09-secrets.md) section of this Compose file.
@y
Compose reports an error if the secret isn't defined in the
[`secrets`](09-secrets.md) section of this Compose file.
@z

@x
#### Short syntax
@y
#### Short syntax
@z

@x
The short syntax variant only specifies the secret name. This grants the
container access to the secret and mounts it as read-only to `/run/secrets/<secret_name>`
within the container. The source name and destination mountpoint are both set
to the secret name.
@y
The short syntax variant only specifies the secret name. This grants the
container access to the secret and mounts it as read-only to `/run/secrets/<secret_name>`
within the container. The source name and destination mountpoint are both set
to the secret name.
@z

@x
The following example uses the short syntax to grant the build of the `frontend` service
access to the `server-certificate` secret. The value of `server-certificate` is set
to the contents of the file `./server.cert`.
@y
The following example uses the short syntax to grant the build of the `frontend` service
access to the `server-certificate` secret. The value of `server-certificate` is set
to the contents of the file `./server.cert`.
@z

@x
```yml
services:
  frontend:
    build:
      context: .
      secrets:
        - server-certificate
secrets:
  server-certificate:
    file: ./server.cert
```
@y
```yml
services:
  frontend:
    build:
      context: .
      secrets:
        - server-certificate
secrets:
  server-certificate:
    file: ./server.cert
```
@z

@x
#### Long syntax
@y
#### Long syntax
@z

@x
The long syntax provides more granularity in how the secret is created within
the service's containers.
@y
The long syntax provides more granularity in how the secret is created within
the service's containers.
@z

@x
- `source`: The name of the secret as it exists on the platform.
- `target`: The name of the file to be mounted in `/run/secrets/` in the
  service's task containers. Defaults to `source` if not specified.
- `uid` and `gid`: The numeric UID or GID that owns the file within
  `/run/secrets/` in the service's task containers. Default value is USER running container.
- `mode`: The [permissions](https://wintelguy.com/permissions-calc.pl) for the file to be mounted in `/run/secrets/`
  in the service's task containers, in octal notation.
  Default value is world-readable permissions (mode `0444`).
  The writable bit must be ignored if set. The executable bit may be set.
@y
- `source`: The name of the secret as it exists on the platform.
- `target`: The name of the file to be mounted in `/run/secrets/` in the
  service's task containers. Defaults to `source` if not specified.
- `uid` and `gid`: The numeric UID or GID that owns the file within
  `/run/secrets/` in the service's task containers. Default value is USER running container.
- `mode`: The [permissions](https://wintelguy.com/permissions-calc.pl) for the file to be mounted in `/run/secrets/`
  in the service's task containers, in octal notation.
  Default value is world-readable permissions (mode `0444`).
  The writable bit must be ignored if set. The executable bit may be set.
@z

@x
The following example sets the name of the `server-certificate` secret file to `server.crt`
within the container, sets the mode to `0440` (group-readable) and sets the user and group
to `103`. The value of `server-certificate` secret is provided by the platform through a lookup and
the secret lifecycle not directly managed by Compose.
@y
The following example sets the name of the `server-certificate` secret file to `server.crt`
within the container, sets the mode to `0440` (group-readable) and sets the user and group
to `103`. The value of `server-certificate` secret is provided by the platform through a lookup and
the secret lifecycle not directly managed by Compose.
@z

@x
```yml
services:
  frontend:
    build:
      context: .
      secrets:
        - source: server-certificate
          target: server.cert
          uid: "103"
          gid: "103"
          mode: 0440
secrets:
  server-certificate:
    external: true
```
@y
```yml
services:
  frontend:
    build:
      context: .
      secrets:
        - source: server-certificate
          target: server.cert
          uid: "103"
          gid: "103"
          mode: 0440
secrets:
  server-certificate:
    external: true
```
@z

@x
Service builds may be granted access to multiple secrets. Long and short syntax for secrets may be used in the
same Compose file. Defining a secret in the top-level `secrets` must not imply granting any service build access to it.
Such grant must be explicit within service specification as [secrets](05-services.md#secrets) service element.
@y
Service builds may be granted access to multiple secrets. Long and short syntax for secrets may be used in the
same Compose file. Defining a secret in the top-level `secrets` must not imply granting any service build access to it.
Such grant must be explicit within service specification as [secrets](05-services.md#secrets) service element.
@z

@x
### tags
@y
### tags
@z

@x
`tags` defines a list of tag mappings that must be associated to the build image. This list comes in addition to
the `image` [property defined in the service section](05-services.md#image)
@y
`tags` defines a list of tag mappings that must be associated to the build image. This list comes in addition to
the `image` [property defined in the service section](05-services.md#image)
@z

@x
```yml
tags:
  - "myimage:mytag"
  - "registry/username/myrepos:my-other-tag"
```
@y
```yml
tags:
  - "myimage:mytag"
  - "registry/username/myrepos:my-other-tag"
```
@z

@x
### ulimits
@y
### ulimits
@z

@x
`ulimits` overrides the default ulimits for a container. It's specified either as an integer for a single limit
or as mapping for soft/hard limits.
@y
`ulimits` overrides the default ulimits for a container. It's specified either as an integer for a single limit
or as mapping for soft/hard limits.
@z

@x
```yml
services:
  frontend:
    build:
      context: .
      ulimits:
        nproc: 65535
        nofile:
          soft: 20000
          hard: 40000
```
@y
```yml
services:
  frontend:
    build:
      context: .
      ulimits:
        nproc: 65535
        nofile:
          soft: 20000
          hard: 40000
```
@z

@x
### platforms
@y
### platforms
@z

@x
`platforms` defines a list of target [platforms](05-services.md#platform).
@y
`platforms` defines a list of target [platforms](05-services.md#platform).
@z

@x
```yml
build:
  context: "."
  platforms:
    - "linux/amd64"
    - "linux/arm64"
```
@y
```yml
build:
  context: "."
  platforms:
    - "linux/amd64"
    - "linux/arm64"
```
@z

@x
When the `platforms` attribute is omitted, Compose includes the service's platform
in the list of the default build target platforms.
@y
When the `platforms` attribute is omitted, Compose includes the service's platform
in the list of the default build target platforms.
@z

@x
When the `platforms` attribute is defined, Compose includes the service's
platform, otherwise users won't be able to run images they built.
@y
When the `platforms` attribute is defined, Compose includes the service's
platform, otherwise users won't be able to run images they built.
@z

@x
Composes reports an error in the following cases:
* When the list contains multiple platforms but the implementation is incapable of storing multi-platform images.
* When the list contains an unsupported platform.
@y
Composes reports an error in the following cases:
* When the list contains multiple platforms but the implementation is incapable of storing multi-platform images.
* When the list contains an unsupported platform.
@z

@x
  ```yml
  build:
    context: "."
    platforms:
      - "linux/amd64"
      - "unsupported/unsupported"
  ```
* When the list is non-empty and does not contain the service's platform
@y
  ```yml
  build:
    context: "."
    platforms:
      - "linux/amd64"
      - "unsupported/unsupported"
  ```
* When the list is non-empty and does not contain the service's platform
@z

@x
  ```yml
  services:
    frontend:
      platform: "linux/amd64"
      build:
        context: "."
        platforms:
          - "linux/arm64"
  ```
@y
  ```yml
  services:
    frontend:
      platform: "linux/amd64"
      build:
        context: "."
        platforms:
          - "linux/arm64"
  ```
@z
