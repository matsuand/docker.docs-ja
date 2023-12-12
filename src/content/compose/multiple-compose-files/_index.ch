%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: General overview for the different ways you can work with multiple compose
  files in Docker Compose
keywords: compose, compose file, merge, extends, include, docker compose
title: Overview
---
@y
---
description: General overview for the different ways you can work with multiple compose
  files in Docker Compose
keywords: compose, compose file, merge, extends, include, docker compose
title: Overview
---
@z

@x
{{< include "compose-eol.md" >}}
@y
{{< include "compose-eol.md" >}}
@z

@x
This section contains information on the three key ways you can use multiple Compose files in your Compose application. 
@y
This section contains information on the three key ways you can use multiple Compose files in your Compose application. 
@z

@x
Using multiple Compose files lets you customize a Compose application for different environments or workflows. This is useful for large applications that may use dozens of containers, with ownership distributed across multiple teams. 
@y
Using multiple Compose files lets you customize a Compose application for different environments or workflows. This is useful for large applications that may use dozens of containers, with ownership distributed across multiple teams. 
@z

@x
For example, if your organization or team uses a monorepo, each team may have their own “local” Compose file to run a subset of the application. They then need to rely on other teams to provide a reference Compose file that defines the expected way to run their own subset. Complexity moves from the code in to the infrastructure and the configuration file.
@y
For example, if your organization or team uses a monorepo, each team may have their own “local” Compose file to run a subset of the application. They then need to rely on other teams to provide a reference Compose file that defines the expected way to run their own subset. Complexity moves from the code in to the infrastructure and the configuration file.
@z

@x
Docker Compose provides three ways to manage this complexity when working with multiple Compose files. Depending on your project's needs, you can: 
@y
Docker Compose provides three ways to manage this complexity when working with multiple Compose files. Depending on your project's needs, you can: 
@z

@x
- [Extend a Compose file](extends.md) by referring to another Compose file and selecting the bits you want to use in your own application, with the ability to override some attributes.
- [Merge a set of Compose files](merge.md) together to create a composite Compose file.
- [Include other Compose files](include.md) directly in to your Compose file.
@y
- [Extend a Compose file](extends.md) by referring to another Compose file and selecting the bits you want to use in your own application, with the ability to override some attributes.
- [Merge a set of Compose files](merge.md) together to create a composite Compose file.
- [Include other Compose files](include.md) directly in to your Compose file.
@z
