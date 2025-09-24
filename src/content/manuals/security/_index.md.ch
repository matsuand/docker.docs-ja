%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Security for developers
linkTitle: Security
description: Learn about developer-level security features like 2FA and access tokens
keywords: docker, docker hub, docker desktop, security, developer security, 2FA, access tokens
@y
title: Security for developers
linkTitle: Security
description: Learn about developer-level security features like 2FA and access tokens
keywords: docker, docker hub, docker desktop, security, developer security, 2FA, access tokens
@z

% grid_developers:

@x
- title: Set up two-factor authentication
  description: Add an extra layer of authentication to your Docker account.
  link: /security/2fa/
  icon: phonelink_lock
@y
- title: Set up two-factor authentication
  description: Add an extra layer of authentication to your Docker account.
  link: __SUBDIR__/security/2fa/
  icon: phonelink_lock
@z

@x
- title: Manage access tokens
  description: Create personal access tokens as an alternative to your password.
  icon: password
  link: /security/access-tokens/
@y
- title: Manage access tokens
  description: Create personal access tokens as an alternative to your password.
  icon: password
  link: __SUBDIR__/security/access-tokens/
@z

@x
- title: Static vulnerability scanning
  description: Automatically run a point-in-time scan on your Docker images for vulnerabilities.
  icon: image_search
  link: /docker-hub/repos/manage/vulnerability-scanning/
@y
- title: Static vulnerability scanning
  description: Automatically run a point-in-time scan on your Docker images for vulnerabilities.
  icon: image_search
  link: __SUBDIR__/docker-hub/repos/manage/vulnerability-scanning/
@z

@x
- title: Docker Engine security
  description: Understand how to keep Docker Engine secure.
  icon: security
  link: /engine/security/
@y
- title: Docker Engine security
  description: Understand how to keep Docker Engine secure.
  icon: security
  link: __SUBDIR__/engine/security/
@z

@x
- title: Secrets in Docker Compose
  description: Learn how to use secrets in Docker Compose.
  icon: privacy_tip
  link: /compose/how-tos/use-secrets/
@y
- title: Secrets in Docker Compose
  description: Learn how to use secrets in Docker Compose.
  icon: privacy_tip
  link: __SUBDIR__/compose/how-tos/use-secrets/
@z

% grid_resources:

@x
- title: Security FAQs
  description: Explore common security FAQs.
  icon: help
  link: /faq/security/general/
@y
- title: Security FAQs
  description: Explore common security FAQs.
  icon: help
  link: __SUBDIR__/faq/security/general/
@z

@x
- title: Security best practices
  description: Understand the steps you can take to improve the security of your container.
  icon: category
  link: /develop/security-best-practices/
@y
- title: Security best practices
  description: Understand the steps you can take to improve the security of your container.
  icon: category
  link: __SUBDIR__/develop/security-best-practices/
@z

@x
- title: Suppress CVEs with VEX
  description: Learn how to suppress non-applicable or fixed vulnerabilities found in your images.
  icon: query_stats
  link: /scout/guides/vex/
@y
- title: Suppress CVEs with VEX
  description: Learn how to suppress non-applicable or fixed vulnerabilities found in your images.
  icon: query_stats
  link: __SUBDIR__/scout/guides/vex/
@z

@x
Docker helps you protect your local environments, infrastructure, and networks
with its developer-level security features.
@y
Docker helps you protect your local environments, infrastructure, and networks
with its developer-level security features.
@z

@x
Use tools like two-factor authentication (2FA), personal access tokens, and
Docker Scout to manage access and detect vulnerabilities early in your workflow.
You can also integrate secrets securely into your development stack using Docker Compose,
or enhance your software supply security with Docker Hardened Images.
@y
Use tools like two-factor authentication (2FA), personal access tokens, and
Docker Scout to manage access and detect vulnerabilities early in your workflow.
You can also integrate secrets securely into your development stack using Docker Compose,
or enhance your software supply security with Docker Hardened Images.
@z

@x
Explore the following sections to learn more.
@y
Explore the following sections to learn more.
@z

@x
## For developers
@y
## For developers
@z

@x
{{< grid items="grid_developers" >}}
@y
{{< grid items="grid_developers" >}}
@z

@x
## More resources
@y
## More resources
@z

@x
{{< grid items="grid_resources" >}}
@y
{{< grid items="grid_resources" >}}
@z
