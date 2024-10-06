%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Defining and running multi-container applications with Docker Compose
linkTitle: Docker Compose
summary: Simplify the process of defining, configuring, and running multi-container Docker applications to enable efficient development, testing, and deployment.
description: Learn how to use Docker Compose to define and run multi-container Docker applications.
@y
title: Defining and running multi-container applications with Docker Compose
linkTitle: Docker Compose
summary: Simplify the process of defining, configuring, and running multi-container Docker applications to enable efficient development, testing, and deployment.
description: Learn how to use Docker Compose to define and run multi-container Docker applications.
@z

@x
levels: [beginner]
products: [compose]
@y
levels: [初心者向け]
products: [compose]
@z

% params:
@x
  time: 10 minutes
@y
  time: 10 分
@z

% resource_links:
@x
    - title: Overview of Docker Compose CLI
      url: /compose/reference/
    - title: Overview of Docker Compose
      url: /compose/
    - title: How Compose works
      url: /compose/intro/compose-application-model/
    - title: Using profiles with Compose
      url: /compose/how-tos/profiles/
    - title: Control startup and shutdown order with Compose
      url: /compose/how-tos/startup-order/
    - title: Compose Build Specification
      url: /compose/compose-file/build/
@y
    - title: Docker Compose CLI 概要
      url: __SUBDIR__/compose/reference/
    - title: Docker Compose 概要
      url: __SUBDIR__/compose/
    - title: How Compose works
      url: __SUBDIR__/compose/intro/compose-application-model/
    - title: Using profiles with Compose
      url: __SUBDIR__/compose/how-tos/profiles/
    - title: Control startup and shutdown order with Compose
      url: __SUBDIR__/compose/how-tos/startup-order/
    - title: Compose Build Specification
      url: __SUBDIR__/compose/compose-file/build/
@z

@x
Developers face challenges with multi-container Docker applications, including
complex configuration, dependency management, and maintaining consistent
environments. Networking, resource allocation, data persistence, logging, and
monitoring add to the difficulty. Security concerns and troubleshooting issues
further complicate the process, requiring effective tools and practices for
efficient management.
@y
Developers face challenges with multi-container Docker applications, including
complex configuration, dependency management, and maintaining consistent
environments. Networking, resource allocation, data persistence, logging, and
monitoring add to the difficulty. Security concerns and troubleshooting issues
further complicate the process, requiring effective tools and practices for
efficient management.
@z

@x
Docker Compose solves the problem of managing multi-container Docker
applications by providing a simple way to define, configure, and run all the
containers needed for an application using a single YAML file. This approach
helps developers to easily set up, share, and maintain consistent development,
testing, and production environments, ensuring that complex applications can be
deployed with all their dependencies and services properly configured and
orchestrated.
@y
Docker Compose solves the problem of managing multi-container Docker
applications by providing a simple way to define, configure, and run all the
containers needed for an application using a single YAML file. This approach
helps developers to easily set up, share, and maintain consistent development,
testing, and production environments, ensuring that complex applications can be
deployed with all their dependencies and services properly configured and
orchestrated.
@z

@x
## What you’ll learn
@y
## What you’ll learn
@z

@x
- What Docker Compose is and what it does
- How to define services
- Use cases for Docker Compose
- How things would be different without Docker Compose
@y
- What Docker Compose is and what it does
- How to define services
- Use cases for Docker Compose
- How things would be different without Docker Compose
@z

@x
## Who’s this for?
@y
## Who’s this for?
@z

@x
- Developers and DevOps engineers who need to define, manage, and orchestrate
  multi-container Docker applications efficiently across multiple environments.
- Development teams that want to increase productivity by streamlining
  development workflows and reducing setup time.
@y
- Developers and DevOps engineers who need to define, manage, and orchestrate
  multi-container Docker applications efficiently across multiple environments.
- Development teams that want to increase productivity by streamlining
  development workflows and reducing setup time.
@z

@x
## Tools integration
@y
## Tools integration
@z

@x
Works well with Docker CLI, CI/CD tools, and container orchestration tools.
@y
Works well with Docker CLI, CI/CD tools, and container orchestration tools.
@z

@x
<div id="compose-lp-survey-anchor"></div>
@y
<div id="compose-lp-survey-anchor"></div>
@z
