%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Build Cloud FAQ
description: Frequently asked questions about Docker Build Cloud
keywords: build, cloud build, faq, troubleshooting 
aliases:
  - /hydrobuild/faq/
---
@y
---
title: Docker Build Cloud FAQ
description: Frequently asked questions about Docker Build Cloud
keywords: build, cloud build, faq, troubleshooting 
aliases:
  - /hydrobuild/faq/
---
@z

@x
### How do I remove Docker Build Cloud from my system?
@y
### How do I remove Docker Build Cloud from my system?
@z

@x
If you want to stop using Docker Build Cloud, remove the cloud builder using
the `docker buildx rm` command.
@y
If you want to stop using Docker Build Cloud, remove the cloud builder using
the `docker buildx rm` command.
@z

@x
```console
$ docker buildx rm cloud-<ORG>-default
```
@y
```console
$ docker buildx rm cloud-<ORG>-default
```
@z

@x
This doesn't deprovision the builder backend, it only removes the builder from
your local Docker client.
@y
This doesn't deprovision the builder backend, it only removes the builder from
your local Docker client.
@z

@x
### Are builders shared between organizations?
@y
### Are builders shared between organizations?
@z

@x
No. Each cloud builder provisioned to an organization is completely
isolated to a single Amazon EC2 instance, with a dedicated EBS volume for build
cache, and end-to-end encryption. That means there are no shared processes or
data between cloud builders.
@y
No. Each cloud builder provisioned to an organization is completely
isolated to a single Amazon EC2 instance, with a dedicated EBS volume for build
cache, and end-to-end encryption. That means there are no shared processes or
data between cloud builders.
@z

@x
### Do I need to add my secrets to the builder to access private resources?
@y
### Do I need to add my secrets to the builder to access private resources?
@z

@x
No. Your interface to Docker Build Cloud is Buildx, and you can use the existing
`--secret` and `--ssh` CLI flags for managing build secrets.
@y
No. Your interface to Docker Build Cloud is Buildx, and you can use the existing
`--secret` and `--ssh` CLI flags for managing build secrets.
@z

@x
For more information, refer to:
@y
For more information, refer to:
@z

@x
- [`docker buildx build --secret`](/engine/reference/commandline/buildx_build/#secret)
- [`docker buildx build --ssh`](/engine/reference/commandline/buildx_build/#ssh)
@y
- [`docker buildx build --secret`](/engine/reference/commandline/buildx_build/#secret)
- [`docker buildx build --ssh`](/engine/reference/commandline/buildx_build/#ssh)
@z

@x
### How do I unset Docker Build Cloud as the default builder?
@y
### How do I unset Docker Build Cloud as the default builder?
@z

@x
If you've set a cloud builder as the default builder and want to revert to using the
default `docker` builder, run the following command:
@y
If you've set a cloud builder as the default builder and want to revert to using the
default `docker` builder, run the following command:
@z

@x
```console
$ docker context use default
```
@y
```console
$ docker context use default
```
@z

@x
### How do I manage the build cache with Docker Build Cloud?
@y
### How do I manage the build cache with Docker Build Cloud?
@z

@x
You don't need to manage the builder's cache manually. The system manages it
for you through [garbage collection](/build/cache/garbage-collection/).
@y
You don't need to manage the builder's cache manually. The system manages it
for you through [garbage collection](/build/cache/garbage-collection/).
@z

@x
Old cache is automatically removed if you hit your storage limit. You can check
your current cache state using the
[`docker buildx du` command](/engine/reference/commandline/buildx_du/).
@y
Old cache is automatically removed if you hit your storage limit. You can check
your current cache state using the
[`docker buildx du` command](/engine/reference/commandline/buildx_du/).
@z

@x
To clear the builder's cache manually, you can use the
[`docker buildx prune` command](/engine/reference/commandline/buildx_prune/)
command. This works like pruning the cache for any other builder.
@y
To clear the builder's cache manually, you can use the
[`docker buildx prune` command](/engine/reference/commandline/buildx_prune/)
command. This works like pruning the cache for any other builder.
@z

@x
> **Note**
>
> Pruning a cloud builder's cache also removes the cache for other team members
> using the same builder.
@y
> **Note**
>
> Pruning a cloud builder's cache also removes the cache for other team members
> using the same builder.
@z
