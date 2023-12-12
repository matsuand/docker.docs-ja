%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Breaking changes
keywords: docker, documentation, about, technology, breaking, incompatibilities
title: Breaking changes and incompatibilities
aliases:
- /engine/misc/breaking/
---
@y
---
description: Breaking changes
keywords: docker, documentation, about, technology, breaking, incompatibilities
title: Breaking changes and incompatibilities
aliases:
- /engine/misc/breaking/
---
@z

@x
Every Engine release strives to be backward compatible with its predecessors,
and interface stability is always a priority at Docker.
@y
Every Engine release strives to be backward compatible with its predecessors,
and interface stability is always a priority at Docker.
@z

@x
In all cases, feature removal is communicated three releases
in advance and documented as part of the [deprecated features](/engine/deprecated/)
page.
@y
In all cases, feature removal is communicated three releases
in advance and documented as part of the [deprecated features](/engine/deprecated/)
page.
@z

@x
The following list compiles any updates to Docker Engine that created
backwards-incompatibility for old versions of Docker tools.
@y
The following list compiles any updates to Docker Engine that created
backwards-incompatibility for old versions of Docker tools.
@z

@x
> **Note**: In the case of your local environment, you should be updating your
  Docker Engine using [Docker Desktop](../desktop/index.md). That way all your tools stay
  in sync with Docker Engine.
@y
> **Note**: In the case of your local environment, you should be updating your
  Docker Engine using [Docker Desktop](../desktop/index.md). That way all your tools stay
  in sync with Docker Engine.
@z

@x
## Engine 1.10
@y
## Engine 1.10
@z

@x
There were two breaking changes in the 1.10 release that affected
Registry and Docker Content Trust:
@y
There were two breaking changes in the 1.10 release that affected
Registry and Docker Content Trust:
@z

@x
**Registry**
@y
**Registry**
@z

@x
Registry 2.3 includes improvements to the image manifest that caused a
breaking change. Images pushed by Engine 1.10 to a Registry 2.3 cannot be
pulled by digest by older Engine versions. A `docker pull` that encounters this
situation returns the following error:
@y
Registry 2.3 includes improvements to the image manifest that caused a
breaking change. Images pushed by Engine 1.10 to a Registry 2.3 cannot be
pulled by digest by older Engine versions. A `docker pull` that encounters this
situation returns the following error:
@z

@x
```none
 Error response from daemon: unsupported schema version 2 for tag TAGNAME
```
@y
```none
 Error response from daemon: unsupported schema version 2 for tag TAGNAME
```
@z

@x
Docker Content Trust heavily relies on pull by digest. As a result, images
pushed from the Engine 1.10 CLI to a 2.3 Registry cannot be pulled by older
Engine CLIs (< 1.10) with Docker Content Trust enabled.
@y
Docker Content Trust heavily relies on pull by digest. As a result, images
pushed from the Engine 1.10 CLI to a 2.3 Registry cannot be pulled by older
Engine CLIs (< 1.10) with Docker Content Trust enabled.
@z

@x
If you are using an older Registry version (< 2.3), this problem does not occur
with any version of the Engine CLI; push, pull, with and without content trust
work as you would expect.
@y
If you are using an older Registry version (< 2.3), this problem does not occur
with any version of the Engine CLI; push, pull, with and without content trust
work as you would expect.
@z

@x
**Docker Content Trust**
@y
**Docker Content Trust**
@z

@x
Engine older than the current 1.10 cannot pull images from repositories that
have enabled key delegation. Key delegation is a feature which requires a
manual action to enable.
@y
Engine older than the current 1.10 cannot pull images from repositories that
have enabled key delegation. Key delegation is a feature which requires a
manual action to enable.
@z
