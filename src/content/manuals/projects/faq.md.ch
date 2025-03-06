%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Docker Projects FAQs
linkTitle: FAQs
description: Find common FAQs for Docker Projects
keywords: faqs, docker projects, local, remote
@y
title: Docker Projects FAQs
linkTitle: FAQs
description: Find common FAQs for Docker Projects
keywords: faqs, docker projects, local, remote
@z

@x
## Why is a Compose file required?
@y
## Why is a Compose file required?
@z

@x
A Compose file (`compose.yml`) defines how your application's containers should run together, including:
@y
A Compose file (`compose.yml`) defines how your application's containers should run together, including:
@z

@x
 - Services (e.g., web, database, API)
 - Networks for inter-container communication
 - Volumes for persistent data storage
 - Environment variables and configurations
@y
 - Services (e.g., web, database, API)
 - Networks for inter-container communication
 - Volumes for persistent data storage
 - Environment variables and configurations
@z

@x
Without a Compose file, Docker Projects doesn't have a way to understand how your application should be structured or executed.
@y
Without a Compose file, Docker Projects doesn't have a way to understand how your application should be structured or executed.
@z

@x
## What if my project doesn’t have a Compose file?
@y
## What if my project doesn’t have a Compose file?
@z

@x
If your project doesn't include a `compose.yml` file, you need to create one before opening it in Docker Projects. 
@y
If your project doesn't include a `compose.yml` file, you need to create one before opening it in Docker Projects. 
@z
