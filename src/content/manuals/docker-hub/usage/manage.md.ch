%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Learn how to optimize and manage your Docker Hub usage.
keywords: Docker Hub, limit, usage
title: Best practices for optimizing Docker Hub usage
linkTitle: Optimize usage
@y
description: Learn how to optimize and manage your Docker Hub usage.
keywords: Docker Hub, limit, usage
title: Best practices for optimizing Docker Hub usage
linkTitle: Optimize usage
@z

@x
Use the following steps to help optimize and manage your Docker Hub usage for
both individuals and organizations:
@y
Use the following steps to help optimize and manage your Docker Hub usage for
both individuals and organizations:
@z

@x
1. [View your Docker Hub usage](https://hub.docker.com/usage).
@y
1. [View your Docker Hub usage](https://hub.docker.com/usage).
@z

@x
2. Use the Docker Hub usage data to identify which accounts consume the most
   data, determine peak usage times, and identify which images are related to
   the most data usage. In addition, look for usage trends, such as the
   following:
@y
2. Use the Docker Hub usage data to identify which accounts consume the most
   data, determine peak usage times, and identify which images are related to
   the most data usage. In addition, look for usage trends, such as the
   following:
@z

@x
   - Inefficient pull behavior: Identify frequently accessed repositories to
     assess whether you can optimize caching practices or consolidate usage to
     reduce pulls.
   - Inefficient automated systems: Check which automated tools, such as CI/CD
     pipelines, may be causing higher pull rates, and configure them to avoid
     unnecessary image pulls.
@y
   - Inefficient pull behavior: Identify frequently accessed repositories to
     assess whether you can optimize caching practices or consolidate usage to
     reduce pulls.
   - Inefficient automated systems: Check which automated tools, such as CI/CD
     pipelines, may be causing higher pull rates, and configure them to avoid
     unnecessary image pulls.
@z

@x
3. Optimize image pulls by:
@y
3. Optimize image pulls by:
@z

@x
   - Using caching: Implement local image caching via
     [mirroring](/docker-hub/mirror/) or within your CI/CD pipelines to reduce
     redundant pulls.
   - Automating manual workflows: Avoid unnecessary pulls by configuring automated
     systems to pull only when a new version of an image is available.
@y
   - Using caching: Implement local image caching via
     [mirroring](__SUBDIR__/docker-hub/mirror/) or within your CI/CD pipelines to reduce
     redundant pulls.
   - Automating manual workflows: Avoid unnecessary pulls by configuring automated
     systems to pull only when a new version of an image is available.
@z

@x
4. Optimize your storage by:
@y
4. Optimize your storage by:
@z

@x
    - Regularly auditing and [removing entire repositories](../repos/delete.md) with untagged, unused, or outdated images.
    - Using [Image Management](../repos/manage/hub-images/manage.md) to remove stale and outdated images within a repository.
@y
    - Regularly auditing and [removing entire repositories](../repos/delete.md) with untagged, unused, or outdated images.
    - Using [Image Management](../repos/manage/hub-images/manage.md) to remove stale and outdated images within a repository.
@z

@x
5. For organizations, monitor and enforce organizational policies by doing the
   following:
@y
5. For organizations, monitor and enforce organizational policies by doing the
   following:
@z

@x
   - Routinely [view Docker Hub usage](https://hub.docker.com/usage) to monitor usage.
   - [Enforce sign-in](/security/for-admins/enforce-sign-in/) to ensure that you
     can monitor the usage of your users and users receive higher usage limits.
   - Look for duplicate user accounts in Docker and remove accounts from your organization
   as needed.
@y
   - Routinely [view Docker Hub usage](https://hub.docker.com/usage) to monitor usage.
   - [Enforce sign-in](__SUBDIR__/security/for-admins/enforce-sign-in/) to ensure that you
     can monitor the usage of your users and users receive higher usage limits.
   - Look for duplicate user accounts in Docker and remove accounts from your organization
   as needed.
@z
