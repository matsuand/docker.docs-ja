%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Learn how to troubleshoot common Docker Hub issues.
keywords: hub, troubleshoot
title: Troubleshoot Docker Hub
linkTitle: Troubleshoot
@y
description: Learn how to troubleshoot common Docker Hub issues.
keywords: hub, troubleshoot
title: Troubleshoot Docker Hub
linkTitle: Troubleshoot
@z

@x
tags: [Troubleshooting]
@y
tags: [Troubleshooting]
@z

@x
If you experience issues with Docker Hub, refer to the following solutions.
@y
If you experience issues with Docker Hub, refer to the following solutions.
@z

@x
## You have reached your pull rate limit (429 response code)
@y
## You have reached your pull rate limit (429 response code)
@z

@x
### Error message
@y
### Error message
@z

@x
When this issue occurs, you receive following error message in the Docker CLI or
in the Docker Engine logs:
@y
When this issue occurs, you receive following error message in the Docker CLI or
in the Docker Engine logs:
@z

@x
```text
You have reached your pull rate limit. You may increase the limit by authenticating and upgrading: https://www.docker.com/increase-rate-limits
```
@y
```text
You have reached your pull rate limit. You may increase the limit by authenticating and upgrading: https://www.docker.com/increase-rate-limits
```
@z

@x
### Possible causes
@y
### Possible causes
@z

@x
- You have reached your pull rate limit as an authenticated Docker Personal
  user.
- You have reached your pull rate limit as an unauthenticated user based on your
  IPv4 address or IPv6 /64 subnet.
@y
- You have reached your pull rate limit as an authenticated Docker Personal
  user.
- You have reached your pull rate limit as an unauthenticated user based on your
  IPv4 address or IPv6 /64 subnet.
@z

@x
### Solution
@y
### Solution
@z

@x
You can use one of the following solutions:
@y
You can use one of the following solutions:
@z

@x
- [Authenticate](./usage/pulls.md#authentication) or
  [upgrade](../subscription/change.md#upgrade-your-subscription) your Docker
  account.
- [View your pull rate limit](./usage/pulls.md#view-hourly-pull-rate-and-limit),
  wait until your pull rate limit decreases, and then try again.
@y
- [Authenticate](./usage/pulls.md#authentication) or
  [upgrade](../subscription/change.md#upgrade-your-subscription) your Docker
  account.
- [View your pull rate limit](./usage/pulls.md#view-hourly-pull-rate-and-limit),
  wait until your pull rate limit decreases, and then try again.
@z

@x
## Too many requests (429 response code)
@y
## Too many requests (429 response code)
@z

@x
### Error message
@y
### Error message
@z

@x
When this issue occurs, you receive following error message in the Docker CLI or
in the Docker Engine logs:
@y
When this issue occurs, you receive following error message in the Docker CLI or
in the Docker Engine logs:
@z

@x
```text
Too Many Requests
```
@y
```text
Too Many Requests
```
@z

@x
### Possible causes
@y
### Possible causes
@z

@x
- You have reached the [Abuse rate limit](./usage/_index.md#abuse-rate-limit).
@y
- You have reached the [Abuse rate limit](./usage/_index.md#abuse-rate-limit).
@z

@x
### Solution
@y
### Solution
@z

@x
1. Check for broken CI/CD pipelines accessing Docker Hub and fix them.
2. Implement a retry with back-off solution in your automated scripts to ensure
   that you're not resending thousands of requests per minute.
@y
1. Check for broken CI/CD pipelines accessing Docker Hub and fix them.
2. Implement a retry with back-off solution in your automated scripts to ensure
   that you're not resending thousands of requests per minute.
@z

@x
## 500 response code
@y
## 500 response code
@z

@x
### Error message
@y
### Error message
@z

@x
When this issue occurs, the following error message is common in the Docker CLI
or in the Docker Engine logs:
@y
When this issue occurs, the following error message is common in the Docker CLI
or in the Docker Engine logs:
@z

@x
```text
Unexpected status code 500
```
@y
```text
Unexpected status code 500
```
@z

@x
### Possible causes
@y
### Possible causes
@z

@x
- There is a temporary Docker Hub service issue.
@y
- There is a temporary Docker Hub service issue.
@z

@x
### Solution
@y
### Solution
@z

@x
1. View the [Docker System Status Page](https://www.dockerstatus.com/) and
   verify that all services are operational.
2. Try accessing Docker Hub again. It may be a temporary issue.
3. [Contact Docker Support](https://www.docker.com/support/) to report the issue.
@y
1. View the [Docker System Status Page](https://www.dockerstatus.com/) and
   verify that all services are operational.
2. Try accessing Docker Hub again. It may be a temporary issue.
3. [Contact Docker Support](https://www.docker.com/support/) to report the issue.
@z
