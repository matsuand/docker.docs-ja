%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Learn about usage and limits for Docker Hub.
keywords: Docker Hub, limit, usage
title: Docker Hub usage and limits
linkTitle: Usage and limits
@y
description: Learn about usage and limits for Docker Hub.
keywords: Docker Hub, limit, usage
title: Docker Hub usage and limits
linkTitle: Usage and limits
@z

@x
{{% include "hub-limits.md" %}}
@y
{{% include "hub-limits.md" %}}
@z

@x
The following table provides an overview of the included usage and limits for each
user type, subject to fair use:
@y
The following table provides an overview of the included usage and limits for each
user type, subject to fair use:
@z

@x
| User type                | Pull rate limit per hour               | Number of public repositories | Number of private repositories |
|--------------------------|----------------------------------------|---------------------|----------------------|
| Business (authenticated) | Unlimited                              | Unlimited           | Unlimited            |
| Team (authenticated)     | Unlimited                              | Unlimited           | Unlimited            |
| Pro (authenticated)      | Unlimited                              | Unlimited           | Unlimited            |
| Personal (authenticated) | 100                                    | Unlimited           | Up to 1              |
| Unauthenticated users    | 10 per IPv4 address or IPv6 /64 subnet | Not applicable      | Not applicable       |
@y
| User type                | Pull rate limit per hour               | Number of public repositories | Number of private repositories |
|--------------------------|----------------------------------------|---------------------|----------------------|
| Business (authenticated) | Unlimited                              | Unlimited           | Unlimited            |
| Team (authenticated)     | Unlimited                              | Unlimited           | Unlimited            |
| Pro (authenticated)      | Unlimited                              | Unlimited           | Unlimited            |
| Personal (authenticated) | 100                                    | Unlimited           | Up to 1              |
| Unauthenticated users    | 10 per IPv4 address or IPv6 /64 subnet | Not applicable      | Not applicable       |
@z

@x
For more details, see the following:
@y
For more details, see the following:
@z

@x
- [Pull usage and limits](./pulls.md)
- [Docker Hub repositories](./repositories.md)
@y
- [Pull usage and limits](./pulls.md)
- [Docker Hub repositories](./repositories.md)
@z

@x
## Fair use
@y
## Fair use
@z

@x
When utilizing the Docker Platform, users should be aware that excessive data
transfer, pull rates, or data storage can lead to throttling, or additional
charges. To ensure fair resource usage and maintain service quality, we reserve
the right to impose restrictions or apply additional charges to accounts
exhibiting excessive data and storage consumption.
@y
When utilizing the Docker Platform, users should be aware that excessive data
transfer, pull rates, or data storage can lead to throttling, or additional
charges. To ensure fair resource usage and maintain service quality, we reserve
the right to impose restrictions or apply additional charges to accounts
exhibiting excessive data and storage consumption.
@z

@x
### Abuse rate limit
@y
### Abuse rate limit
@z

@x
Docker Hub has an abuse rate limit to protect the application and
infrastructure. This limit applies to all requests to Hub properties including
web pages, APIs, and image pulls. The limit is applied per IPv4 address or per
IPv6 /64 subnet, and while the limit changes over time depending on load and
other factors, it's in the order of thousands of requests per minute. The abuse
limit applies to all users equally regardless of account level.
@y
Docker Hub has an abuse rate limit to protect the application and
infrastructure. This limit applies to all requests to Hub properties including
web pages, APIs, and image pulls. The limit is applied per IPv4 address or per
IPv6 /64 subnet, and while the limit changes over time depending on load and
other factors, it's in the order of thousands of requests per minute. The abuse
limit applies to all users equally regardless of account level.
@z

@x
You can differentiate between the pull rate limit and abuse rate limit by
looking at the error code. The abuse limit returns a simple `429 Too Many
Requests` response. The pull limit returns a longer error message that includes
a link to documentation.
@y
You can differentiate between the pull rate limit and abuse rate limit by
looking at the error code. The abuse limit returns a simple `429 Too Many
Requests` response. The pull limit returns a longer error message that includes
a link to documentation.
@z
