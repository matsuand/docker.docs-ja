%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
@x
---
description: Learn how to use Docker Compose to define and run multi-container applications
  with this detailed introduction to the tool.
keywords: docker compose, docker-compose, docker compose command, docker compose files,
  docker compose documentation, using docker compose, compose container, docker compose
  service
title: Docker Compose overview
grid:
- title: Install Compose
  description: Follow the instructions on how to install Docker Compose.
  icon: download
  link: /compose/install
- title: Try Compose
  description: Learn the key concepts of Docker Compose whilst building a simple Python
    web application.
  icon: explore
  link: /compose/gettingstarted
- title: View the release notes
  description: Find out about the latest enhancements and bug fixes.
  icon: note_add
  link: /compose/release-notes
- title: Understand key features of Compose
  description: Understand its key features and explore common use cases.
  icon: category
  link: /compose/features-uses/
- title: Explore the Compose file reference
  description: Find information on defining services, networks, and volumes for a
    Docker application.
  icon: feature_search
  link: /compose/compose-file
- title: Browse common FAQs
  description: Explore general FAQs and find out how to give feedback.
  icon: help
  link: /compose/faq
aliases:
- /compose/cli-command/
- /compose/networking/swarm/
- /compose/overview/
- /compose/swarm/
- /compose/completion/
---
@y
---
description: Learn how to use Docker Compose to define and run multi-container applications
  with this detailed introduction to the tool.
keywords: docker compose, docker-compose, docker compose command, docker compose files,
  docker compose documentation, using docker compose, compose container, docker compose
  service
title: Docker Compose overview
grid:
- title: Install Compose
  description: Follow the instructions on how to install Docker Compose.
  icon: download
  link: __SUBDIR__/compose/install
- title: Try Compose
  description: Learn the key concepts of Docker Compose whilst building a simple Python
    web application.
  icon: explore
  link: __SUBDIR__/compose/gettingstarted
- title: View the release notes
  description: Find out about the latest enhancements and bug fixes.
  icon: note_add
  link: __SUBDIR__/compose/release-notes
- title: Understand key features of Compose
  description: Understand its key features and explore common use cases.
  icon: category
  link: __SUBDIR__/compose/features-uses/
- title: Explore the Compose file reference
  description: Find information on defining services, networks, and volumes for a
    Docker application.
  icon: feature_search
  link: __SUBDIR__/compose/compose-file
- title: Browse common FAQs
  description: Explore general FAQs and find out how to give feedback.
  icon: help
  link: __SUBDIR__/compose/faq
aliases:
- /compose/cli-command/
- /compose/networking/swarm/
- /compose/overview/
- /compose/swarm/
- /compose/completion/
---
@z

@x
{{< include "compose-eol.md" >}}
@y
{{< include "compose-eol.md" >}}
@z

@x
Compose is a tool for defining and running multi-container Docker applications.
With Compose, you use a YAML file to configure your application's services.
Then, with a single command, you create and start all the services
from your configuration.
@y
Compose is a tool for defining and running multi-container Docker applications.
With Compose, you use a YAML file to configure your application's services.
Then, with a single command, you create and start all the services
from your configuration.
@z

@x
Compose works in all environments; production, staging, development, testing, as
well as CI workflows. It also has commands for managing the whole lifecycle of your application:
@y
Compose works in all environments; production, staging, development, testing, as
well as CI workflows. It also has commands for managing the whole lifecycle of your application:
@z

@x
 * Start, stop, and rebuild services
 * View the status of running services
 * Stream the log output of running services
 * Run a one-off command on a service
@y
 * Start, stop, and rebuild services
 * View the status of running services
 * Stream the log output of running services
 * Run a one-off command on a service
@z

@x
The key features of Compose that make it effective are:
@y
The key features of Compose that make it effective are:
@z

@x
* [Have multiple isolated environments on a single host](features-uses.md#have-multiple-isolated-environments-on-a-single-host)
* [Preserve volume data when containers are created](features-uses.md#preserves-volume-data-when-containers-are-created)
* [Only recreate containers that have changed](features-uses.md#only-recreate-containers-that-have-changed)
* [Support variables and moving a composition between environments](features-uses.md#supports-variables-and-moving-a-composition-between-environments)
@y
* [Have multiple isolated environments on a single host](features-uses.md#have-multiple-isolated-environments-on-a-single-host)
* [Preserve volume data when containers are created](features-uses.md#preserves-volume-data-when-containers-are-created)
* [Only recreate containers that have changed](features-uses.md#only-recreate-containers-that-have-changed)
* [Support variables and moving a composition between environments](features-uses.md#supports-variables-and-moving-a-composition-between-environments)
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
