%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
description: Build images for services with shared definition
keywords: compose, build
title: Build dependent images
@y
description: Build images for services with shared definition
keywords: compose, build
title: Build dependent images
@z

@x
{{< summary-bar feature_name="Compose dependent images" >}}
@y
{{< summary-bar feature_name="Compose dependent images" >}}
@z

@x
To reduce push/pull time and image weight, a common practice for Compose applications is to have services
share base layers as much as possible. You typically select the same operating system base image for
all services. But you can also get one step further by sharing image layers when your images share the same
system packages. The challenge to address is then to avoid repeating the exact same Dockerfile instruction 
in all services.
@y
To reduce push/pull time and image weight, a common practice for Compose applications is to have services
share base layers as much as possible. You typically select the same operating system base image for
all services. But you can also get one step further by sharing image layers when your images share the same
system packages. The challenge to address is then to avoid repeating the exact same Dockerfile instruction 
in all services.
@z

@x
For illustration, this page assumes you want all your services to be built with an `alpine` base
image and install the system package `openssl`.
@y
For illustration, this page assumes you want all your services to be built with an `alpine` base
image and install the system package `openssl`.
@z

@x
## Multi-stage Dockerfile
@y
## Multi-stage Dockerfile
@z

@x
The recommended approach is to group the shared declaration in a single Dockerfile, and use multi-stage features
so that service images are built from this shared declaration.
@y
The recommended approach is to group the shared declaration in a single Dockerfile, and use multi-stage features
so that service images are built from this shared declaration.
@z

@x
Dockerfile:
@y
Dockerfile:
@z

@x within code
# build service a
@y
# サービス a のビルド
@z

@x
# build service b
@y
# サービス b のビルド
@z

@x
Compose file:
@y
Compose file:
@z

% snip code...

@x
## Use another service's image as the base image
@y
## Use another service's image as the base image
@z

@x
A popular pattern is to reuse a service image as a base image in another service.
As Compose does not parse the Dockerfile, it can't automatically detect this dependency 
between services to correctly order the build execution.
@y
A popular pattern is to reuse a service image as a base image in another service.
As Compose does not parse the Dockerfile, it can't automatically detect this dependency 
between services to correctly order the build execution.
@z

@x
a.Dockerfile:
@y
a.Dockerfile:
@z

% snip code...

@x
b.Dockerfile:
@y
b.Dockerfile:
@z

@x
# build service b
@y
# サービス b のビルド
@z

@x
Compose file:
@y
Compose file:
@z

% snip code...

@x
Legacy Docker Compose v1 used to build images sequentially, which made this pattern usable
out of the box. Compose v2 uses BuildKit to optimise builds and build images in parallel 
and requires an explicit declaration.
@y
Legacy Docker Compose v1 used to build images sequentially, which made this pattern usable
out of the box. Compose v2 uses BuildKit to optimise builds and build images in parallel 
and requires an explicit declaration.
@z

@x
The recommended approach is to declare the dependent base image as an additional build context:
@y
The recommended approach is to declare the dependent base image as an additional build context:
@z

@x
Compose file:
@y
Compose file:
@z

% snip code...

@x
## Build with Bake
@y
## Build with Bake
@z

@x
Using [Bake](/manuals/build/bake/_index.md) let you pass the complete build definition for all services
and to orchestrate build execution in the most efficient way. 
@y
Using [Bake](manuals/build/bake/_index.md) let you pass the complete build definition for all services
and to orchestrate build execution in the most efficient way. 
@z

@x
To enable this feature, run Compose with the `COMPOSE_BAKE=true` variable set in your environment.
@y
To enable this feature, run Compose with the `COMPOSE_BAKE=true` variable set in your environment.
@z

% snip output...

@x
Bake can also be selected as the default builder by editing your `$HOME/.docker/config.json` config file:
@y
Bake can also be selected as the default builder by editing your `$HOME/.docker/config.json` config file:
@z

% snip output...
