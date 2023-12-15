%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Find the answers to common Docker Desktop settings FAQs
keywords: Docker, Docker Hub, Docker Desktop secuirty FAQs, secuirty, platform
title: Settings Management FAQs
---
@y
---
description: Find the answers to common Docker Desktop settings FAQs
keywords: Docker, Docker Hub, Docker Desktop secuirty FAQs, secuirty, platform
title: Settings Management FAQs
---
@z

@x
### Can I prevent our developers from running privileged containers?
@y
### Can I prevent our developers from running privileged containers?
@z

@x
Yes, by enabling [Enhanced Container Isolation](../../desktop/hardened-desktop/enhanced-container-isolation/_index.md) and locking that setting with [Settings Management](../../desktop/hardened-desktop/settings-management/_index.md). This is only available for Docker Business customers.
@y
Yes, by enabling [Enhanced Container Isolation](../../desktop/hardened-desktop/enhanced-container-isolation/_index.md) and locking that setting with [Settings Management](../../desktop/hardened-desktop/settings-management/_index.md). This is only available for Docker Business customers.
@z

@x
### How can I restrict access to certain settings so users cannot change things (e.g. enabling Kubernetes service, turning on send usage statistics, turning on experimental features etc.)? 
@y
### How can I restrict access to certain settings so users cannot change things (e.g. enabling Kubernetes service, turning on send usage statistics, turning on experimental features etc.)? 
@z

@x
Yes, you can do that with [Settings Management](../../desktop/hardened-desktop/settings-management/_index.md).
@y
Yes, you can do that with [Settings Management](../../desktop/hardened-desktop/settings-management/_index.md).
@z

@x
### Can I prevent a developer from enabling the unsafe “Expose daemon on tcp://localhost:2375 without TLS” option on Windows?
@y
### Can I prevent a developer from enabling the unsafe “Expose daemon on tcp://localhost:2375 without TLS” option on Windows?
@z

@x
Yes, you can do that with [Settings Management](../../desktop/hardened-desktop/settings-management/_index.md).
@y
Yes, you can do that with [Settings Management](../../desktop/hardened-desktop/settings-management/_index.md).
@z

@x
### Can I restrict the write access to `settings.json` to prevent modification by our developers?  
@y
### Can I restrict the write access to `settings.json` to prevent modification by our developers?  
@z

@x
This would crash the application. For Docker Business customers however administrators can lock the Docker Desktop settings through the Settings Management feature by deploying an `admin-settings.json` file.
@y
This would crash the application. For Docker Business customers however administrators can lock the Docker Desktop settings through the Settings Management feature by deploying an `admin-settings.json` file.
@z
