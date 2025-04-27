%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: A list of domain URLs required for Docker Desktop to function correctly within an organization.
keywords: Docker Desktop, allowlist, allow list, firewall, authentication URLs, analytics
title: Allowlist for Docker Desktop
tags: [admin]
linkTitle: Allowlist
@y
description: A list of domain URLs required for Docker Desktop to function correctly within an organization.
keywords: Docker Desktop, allowlist, allow list, firewall, authentication URLs, analytics
title: Allowlist for Docker Desktop
tags: [admin]
linkTitle: Allowlist
@z

@x
{{< summary-bar feature_name="Allow list" >}}
@y
{{< summary-bar feature_name="Allow list" >}}
@z

@x
This page contains the domain URLs that you need to add to a firewall allowlist to ensure Docker Desktop works properly within your organization.
@y
This page contains the domain URLs that you need to add to a firewall allowlist to ensure Docker Desktop works properly within your organization.
@z

@x
## Domain URLs to allow
@y
## Domain URLs to allow
@z

@x
| Domains                                                                              | Description                                  |
| ------------------------------------------------------------------------------------ | -------------------------------------------- |
| https://api.segment.io                                                               | Analytics                                    |
| https://cdn.segment.com                                                              | Analytics                                    |
| https://notify.bugsnag.com                                                           | Error reports                                |
| https://sessions.bugsnag.com                                                         | Error reports                                |
| https://auth.docker.io                                                               | Authentication                               |
| https://cdn.auth0.com                                                                | Authentication                               |
| https://login.docker.com                                                             | Authentication                               |
| https://desktop.docker.com                                                           | Update                                       |
| https://hub.docker.com                                                               | Docker Hub                                   |
| https://registry-1.docker.io                                                         | Docker Pull/Push                             |
| https://production.cloudflare.docker.com                                             | Docker Pull/Push (Paid plans)                |
| https://docker-images-prod.6aa30f8b08e16409b46e0173d6de2f56.r2.cloudflarestorage.com | Docker Pull/Push (Personal plan / Anonymous) |
| https://docker-pinata-support.s3.amazonaws.com                                       | Troubleshooting                              |
| https://api.dso.docker.com                                                           | Docker Scout service                         |
| https://api.docker.com                                                               | New API                                      |
@y
| Domains                                                                              | Description                                  |
| ------------------------------------------------------------------------------------ | -------------------------------------------- |
| https://api.segment.io                                                               | Analytics                                    |
| https://cdn.segment.com                                                              | Analytics                                    |
| https://notify.bugsnag.com                                                           | Error reports                                |
| https://sessions.bugsnag.com                                                         | Error reports                                |
| https://auth.docker.io                                                               | Authentication                               |
| https://cdn.auth0.com                                                                | Authentication                               |
| https://login.docker.com                                                             | Authentication                               |
| https://desktop.docker.com                                                           | Update                                       |
| https://hub.docker.com                                                               | Docker Hub                                   |
| https://registry-1.docker.io                                                         | Docker Pull/Push                             |
| https://production.cloudflare.docker.com                                             | Docker Pull/Push (Paid plans)                |
| https://docker-images-prod.6aa30f8b08e16409b46e0173d6de2f56.r2.cloudflarestorage.com | Docker Pull/Push (Personal plan / Anonymous) |
| https://docker-pinata-support.s3.amazonaws.com                                       | Troubleshooting                              |
| https://api.dso.docker.com                                                           | Docker Scout service                         |
| https://api.docker.com                                                               | New API                                      |
@z
