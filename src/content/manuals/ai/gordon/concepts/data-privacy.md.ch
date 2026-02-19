%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Data privacy and Gordon
linkTitle: Data privacy
description: How Gordon handles your data and what information is collected
@y
title: Data privacy and Gordon
linkTitle: Data privacy
description: How Gordon handles your data and what information is collected
@z

@x
{{< summary-bar feature_name="Gordon" >}}
@y
{{< summary-bar feature_name="Gordon" >}}
@z

@x
This page explains what data Gordon accesses, how it's used, and what privacy
protections are in place.
@y
This page explains what data Gordon accesses, how it's used, and what privacy
protections are in place.
@z

@x
## What data Gordon accesses
@y
## What data Gordon accesses
@z

@x
When you use Gordon, the data it accesses depends on your query and
configuration.
@y
When you use Gordon, the data it accesses depends on your query and
configuration.
@z

@x
### Local files
@y
### Local files
@z

@x
When you use the `docker ai` command, Gordon can access files and directories
on your system. The working directory sets the default context for file
operations.
@y
When you use the `docker ai` command, Gordon can access files and directories
on your system. The working directory sets the default context for file
operations.
@z

@x
In Docker Desktop, if you ask about a specific file or directory in the Gordon
view, you'll be prompted to select the relevant context.
@y
In Docker Desktop, if you ask about a specific file or directory in the Gordon
view, you'll be prompted to select the relevant context.
@z

@x
### Local images
@y
### Local images
@z

@x
Gordon integrates with Docker Desktop and can view all images in your local
image store. This includes images you've built or pulled from a registry.
@y
Gordon integrates with Docker Desktop and can view all images in your local
image store. This includes images you've built or pulled from a registry.
@z

@x
### Docker environment
@y
### Docker environment
@z

@x
Gordon has access to your Docker daemon's state, including:
@y
Gordon has access to your Docker daemon's state, including:
@z

@x
- Running and stopped containers
- Container logs and configuration
- Images and image layers
- Volumes and networks
- Build cache
@y
- Running and stopped containers
- Container logs and configuration
- Images and image layers
- Volumes and networks
- Build cache
@z

@x
## Data retention policy
@y
## Data retention policy
@z

@x
Gordon's data retention differs based on your subscription tier:
@y
Gordon's data retention differs based on your subscription tier:
@z

@x
### Paid subscriptions (Pro, Team, Business)
@y
### Paid subscriptions (Pro, Team, Business)
@z

@x
Docker and its AI providers do not retain any inputs or outputs from your
Gordon sessions. Your queries, Gordon's responses, and any code or files
processed are not stored.
@y
Docker and its AI providers do not retain any inputs or outputs from your
Gordon sessions. Your queries, Gordon's responses, and any code or files
processed are not stored.
@z

@x
### Personal (free) subscription
@y
### Personal (free) subscription
@z

@x
Conversation threads are stored for 30 days to improve the service. Individual
queries and responses are retained as part of your conversation history.
@y
Conversation threads are stored for 30 days to improve the service. Individual
queries and responses are retained as part of your conversation history.
@z

@x
### All subscriptions
@y
### All subscriptions
@z

@x
Data is never used for training AI models or shared with third parties. All
data transferred to Gordon's backend is encrypted in transit.
@y
Data is never used for training AI models or shared with third parties. All
data transferred to Gordon's backend is encrypted in transit.
@z

@x
## Data security
@y
## Data security
@z

@x
Your data is protected through encryption in transit. For paid subscriptions,
no persistent storage occurs—Gordon processes your requests and discards the
data immediately.
@y
Your data is protected through encryption in transit. For paid subscriptions,
no persistent storage occurs—Gordon processes your requests and discards the
data immediately.
@z

@x
For questions about privacy terms and conditions, review [Gordon's
Supplemental
Terms](https://www.docker.com/legal/docker-ai-supplemental-terms/).
@y
For questions about privacy terms and conditions, review [Gordon's
Supplemental
Terms](https://www.docker.com/legal/docker-ai-supplemental-terms/).
@z

@x
## Organizational data policies
@y
## Organizational data policies
@z

@x
For Business subscriptions, administrators can control Gordon access for their
organization using Settings Management.
@y
For Business subscriptions, administrators can control Gordon access for their
organization using Settings Management.
@z

@x
Available controls:
@y
Available controls:
@z

@x
- Enable or disable Gordon for the organization
- Set usage limits by subscription tier
@y
- Enable or disable Gordon for the organization
- Set usage limits by subscription tier
@z

@x
Administrators should review their organization's data handling requirements
before enabling Gordon.
@y
Administrators should review their organization's data handling requirements
before enabling Gordon.
@z

@x
See [Settings Management](/enterprise/security/hardened-desktop/settings-management/)
for configuration details.
@y
See [Settings Management](__SUBDIR__/enterprise/security/hardened-desktop/settings-management/)
for configuration details.
@z

@x
## Disabling Gordon
@y
## Disabling Gordon
@z

@x
You can disable Gordon at any time:
@y
You can disable Gordon at any time:
@z

@x
Individual users:
@y
Individual users:
@z

@x
1. Open Docker Desktop Settings.
2. Navigate to the **Beta features** section.
3. Clear the **Enable Docker AI** option.
4. Select **Apply**.
@y
1. Open Docker Desktop Settings.
2. Navigate to the **Beta features** section.
3. Clear the **Enable Docker AI** option.
4. Select **Apply**.
@z

@x
Business organizations:
@y
Business organizations:
@z

@x
Administrators can disable Gordon for the entire organization using Settings
Management. See [Settings Management](/enterprise/security/hardened-desktop/settings-management/)
for details.
@y
Administrators can disable Gordon for the entire organization using Settings
Management. See [Settings Management](__SUBDIR__/enterprise/security/hardened-desktop/settings-management/)
for details.
@z

@x
## Questions about privacy
@y
## Questions about privacy
@z

@x
For questions about Docker's privacy practices:
@y
For questions about Docker's privacy practices:
@z

@x
- Review the [Docker Privacy Policy](https://www.docker.com/legal/privacy/)
- Read [Gordon's Supplemental Terms](https://www.docker.com/legal/docker-ai-supplemental-terms/)
- Contact Docker Support for specific concerns
@y
- Review the [Docker Privacy Policy](https://www.docker.com/legal/privacy/)
- Read [Gordon's Supplemental Terms](https://www.docker.com/legal/docker-ai-supplemental-terms/)
- Contact Docker Support for specific concerns
@z
