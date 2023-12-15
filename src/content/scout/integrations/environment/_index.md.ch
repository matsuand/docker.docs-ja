%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description:
  Docker Scout can integrate with runtime environments to give you real-time
  insights about your software supply chain.
keywords: supply chain, security, streams, environments, workloads, deployments
title: Integrating Docker Scout with environments
---
@y
---
description:
  Docker Scout can integrate with runtime environments to give you real-time
  insights about your software supply chain.
keywords: supply chain, security, streams, environments, workloads, deployments
title: Integrating Docker Scout with environments
---
@z

@x
You can integrate Docker Scout with your runtime environments, and get insights
for your running workloads. This gives you a real-time view of your security
status for your deployed artifacts.
@y
You can integrate Docker Scout with your runtime environments, and get insights
for your running workloads. This gives you a real-time view of your security
status for your deployed artifacts.
@z

@x
Docker Scout lets you define multiple environments, and assign images to
different environments. This gives you a complete overview of your software
supply chain, and lets you view and compare deltas between environments, for
example staging and production.
@y
Docker Scout lets you define multiple environments, and assign images to
different environments. This gives you a complete overview of your software
supply chain, and lets you view and compare deltas between environments, for
example staging and production.
@z

@x
How you define and name your environments is up to you. You can use patterns
that are meaningful to you and that matches how you ship your applications.
@y
How you define and name your environments is up to you. You can use patterns
that are meaningful to you and that matches how you ship your applications.
@z

@x
## Assign to environments
@y
## Assign to environments
@z

@x
Each environment contains references to a number of images. These references
represent containers currently running in that particular environment.
@y
Each environment contains references to a number of images. These references
represent containers currently running in that particular environment.
@z

@x
For example, say you're running `myorg/webapp:3.1` in production, you can
assign that tag to your `production` environment. You might be running a
different version of the same image in staging, in which case you can assign
that version of the image to the `staging` environment.
@y
For example, say you're running `myorg/webapp:3.1` in production, you can
assign that tag to your `production` environment. You might be running a
different version of the same image in staging, in which case you can assign
that version of the image to the `staging` environment.
@z

@x
To add environments to Docker Scout, you can:
@y
To add environments to Docker Scout, you can:
@z

@x
- Use the `docker scout env <environment> <image>` CLI command to record images to environments manually
- Enable a runtime integration to automatically detect images in your environments.
@y
- Use the `docker scout env <environment> <image>` CLI command to record images to environments manually
- Enable a runtime integration to automatically detect images in your environments.
@z

@x
Docker Scout supports the following runtime integrations:
@y
Docker Scout supports the following runtime integrations:
@z

@x
- [Docker Scout GitHub Action](https://github.com/marketplace/actions/docker-scout#record-an-image-deployed-to-a-stream-environment)
- [CLI client](./cli.md)
- [Sysdig integration](./sysdig.md)
@y
- [Docker Scout GitHub Action](https://github.com/marketplace/actions/docker-scout#record-an-image-deployed-to-a-stream-environment)
- [CLI client](./cli.md)
- [Sysdig integration](./sysdig.md)
@z

@x
> **Note**
>
> Only organization owners can create new environments and set up integrations.
> Additionally, Docker Scout only assigns an image to an environment if the
> image [has been analyzed](../../image-analysis.md), either manually or
> through a [registry integration](../_index.md#container-registries).
@y
> **Note**
>
> Only organization owners can create new environments and set up integrations.
> Additionally, Docker Scout only assigns an image to an environment if the
> image [has been analyzed](../../image-analysis.md), either manually or
> through a [registry integration](../_index.md#container-registries).
@z

@x
## List environments
@y
## List environments
@z

@x
To see all of the available environments for an organization, you can use the
`docker scout env` command.
@y
To see all of the available environments for an organization, you can use the
`docker scout env` command.
@z

@x
```console
$ docker scout env
```
@y
```console
$ docker scout env
```
@z

@x
By default, this prints all environments for your personal Docker organization.
To list environments for another organization that you're a part of, use the
`--org` flag.
@y
By default, this prints all environments for your personal Docker organization.
To list environments for another organization that you're a part of, use the
`--org` flag.
@z

@x
```console
$ docker scout env --org <org>
```
@y
```console
$ docker scout env --org <org>
```
@z

@x
You can use the `docker scout config` command to change the default
organization. This changes the default organization for all `docker scout`
commands, not just `env`.
@y
You can use the `docker scout config` command to change the default
organization. This changes the default organization for all `docker scout`
commands, not just `env`.
@z

@x
```console
$ docker scout config organization <org>
```
@y
```console
$ docker scout config organization <org>
```
@z

@x
## Comparing between environments
@y
## Comparing between environments
@z

@x
Assigning images to environments lets you make comparisons with and between
environments. This is useful for things like GitHub pull requests, for
comparing the image built from the code in the PR to the corresponding image in
staging or production.
@y
Assigning images to environments lets you make comparisons with and between
environments. This is useful for things like GitHub pull requests, for
comparing the image built from the code in the PR to the corresponding image in
staging or production.
@z

@x
You can also compare with streams using the `--to-env` flag on the
[`docker scout compare`](../../../engine/reference/commandline/scout_compare.md)
CLI command:
@y
You can also compare with streams using the `--to-env` flag on the
[`docker scout compare`](../../../engine/reference/commandline/scout_compare.md)
CLI command:
@z

@x
```console
$ docker scout compare --to-env production myorg/webapp:latest
```
@y
```console
$ docker scout compare --to-env production myorg/webapp:latest
```
@z

@x
## View images for an environment
@y
## View images for an environment
@z

@x
To view the images for an environment:
@y
To view the images for an environment:
@z

@x
1. Go to the [Docker Scout Dashboard](https://scout.docker.com/).
2. Select the **Images** tab.
3. Open the **Environments** drop-down menu.
4. Select the environment that you want to view.
@y
1. Go to the [Docker Scout Dashboard](https://scout.docker.com/).
2. Select the **Images** tab.
3. Open the **Environments** drop-down menu.
4. Select the environment that you want to view.
@z

@x
The list displays all images that have been assigned to the selected
environment. If you've deployed multiple versions of the same image in an
environment, all versions of the image appear in the list.
@y
The list displays all images that have been assigned to the selected
environment. If you've deployed multiple versions of the same image in an
environment, all versions of the image appear in the list.
@z

@x
Alternatively, you can use the `docker scout env` command to view the images from the terminal.
@y
Alternatively, you can use the `docker scout env` command to view the images from the terminal.
@z

@x
```console
$ docker scout env production
docker/scout-demo-service:main@sha256:ef08dca54c4f371e7ea090914f503982e890ec81d22fd29aa3b012351a44e1bc
```
@y
```console
$ docker scout env production
docker/scout-demo-service:main@sha256:ef08dca54c4f371e7ea090914f503982e890ec81d22fd29aa3b012351a44e1bc
```
@z

@x
### Mismatching image tags
@y
### Mismatching image tags
@z

@x
When you've selected an environment on the **Images** tab, tags in the list
represent the tag that was used to deploy the image. Tags are mutable, meaning
that you can change the image digest that a tag refers to. If Docker Scout
detects that a tag refers to an outdated digest, a warning icon displays next
to the image name.
@y
When you've selected an environment on the **Images** tab, tags in the list
represent the tag that was used to deploy the image. Tags are mutable, meaning
that you can change the image digest that a tag refers to. If Docker Scout
detects that a tag refers to an outdated digest, a warning icon displays next
to the image name.
@z
