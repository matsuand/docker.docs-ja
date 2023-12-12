%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
datafolder: engine-cli
datafile: docker_info
title: docker info
aliases:
- /edge/engine/reference/commandline/info/
layout: cli
---
@y
---
datafolder: engine-cli
datafile: docker_info
title: docker info
aliases:
- /edge/engine/reference/commandline/info/
layout: cli
---
@z

@x
<!--
This page is automatically generated from Docker's source code. If you want to
suggest a change to the text that appears here, open a ticket or pull request
in the source repository on GitHub:
@y
<!--
This page is automatically generated from Docker's source code. If you want to
suggest a change to the text that appears here, open a ticket or pull request
in the source repository on GitHub:
@z

@x
https://github.com/docker/cli
-->
@y
https://github.com/docker/cli
-->
@z

@x
## Warnings about kernel support
@y
## Warnings about kernel support
@z

@x
If your operating system does not enable certain capabilities, you may see
warnings such as one of the following, when you run `docker info`:
@y
If your operating system does not enable certain capabilities, you may see
warnings such as one of the following, when you run `docker info`:
@z

@x
```none
WARNING: Your kernel does not support swap limit capabilities. Limitation discarded.
```
@y
```none
WARNING: Your kernel does not support swap limit capabilities. Limitation discarded.
```
@z

@x
```none
WARNING: No swap limit support
```
@y
```none
WARNING: No swap limit support
```
@z

@x
You can ignore these warnings unless you actually need the ability to
[limit these resources](../../../config/containers/resource_constraints.md), in which case you
should consult your operating system's documentation for enabling them.
@y
You can ignore these warnings unless you actually need the ability to
[limit these resources](../../../config/containers/resource_constraints.md), in which case you
should consult your operating system's documentation for enabling them.
@z
