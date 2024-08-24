%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Docker Hub release notes
description: Learn about the new features, bug fixes, and breaking changes for Docker
  Hub
keywords: docker hub, whats new, release notes
@y
title: Docker Hub release notes
description: Learn about the new features, bug fixes, and breaking changes for Docker
  Hub
keywords: docker hub, whats new, release notes
@z

@x
Here you can learn about the latest changes, new features, bug fixes, and
known issues for each Docker Hub release.
@y
Here you can learn about the latest changes, new features, bug fixes, and
known issues for each Docker Hub release.
@z

@x
Take a look at the [Docker Public Roadmap](https://github.com/docker/roadmap/projects/1) to see what's coming next.
@y
Take a look at the [Docker Public Roadmap](https://github.com/docker/roadmap/projects/1) to see what's coming next.
@z

@x
## 2024-03-23
@y
## 2024-03-23
@z

@x
### New
@y
### New
@z

@x
 - You can tag Docker Hub repositories with [categories](./repos/categories.md).
@y
 - You can tag Docker Hub repositories with [categories](./repos/categories.md).
@z

@x
## 2023-12-11
@y
## 2023-12-11
@z

@x
- The Advanced Image Management feature, along with the corresponding API endpoints, has been retired.
  See [docker/roadmap#534](https://github.com/docker/roadmap/issues/534).
@y
- The Advanced Image Management feature, along with the corresponding API endpoints, has been retired.
  See [docker/roadmap#534](https://github.com/docker/roadmap/issues/534).
@z

@x
  The following API endpoints have been removed:
@y
  The following API endpoints have been removed:
@z

@x
  ```text
  /namespaces/{namespace}/repositories/{repository}/images
  /namespaces/{namespace}/repositories/{repository}/images/{digest}/tags
  /namespaces/{namespace}/repositories/{repository}/images-summary
  /namespaces/{namespace}/delete-images
  ```
@y
  ```text
  /namespaces/{namespace}/repositories/{repository}/images
  /namespaces/{namespace}/repositories/{repository}/images/{digest}/tags
  /namespaces/{namespace}/repositories/{repository}/images-summary
  /namespaces/{namespace}/delete-images
  ```
@z

@x
## 2023-08-28
@y
## 2023-08-28
@z

@x
- Organizations with SSO enabled can assign members to roles, organizations, and teams with [SCIM role mapping](scim.md#set-up-role-mapping). 
@y
- Organizations with SSO enabled can assign members to roles, organizations, and teams with [SCIM role mapping](scim.md#set-up-role-mapping). 
@z

@x
## 2023-07-26
@y
## 2023-07-26
@z

@x
### New
@y
### New
@z

@x
- Organizations can assign the [editor role](roles-and-permissions.md) to members to grant additional permissions without full administrative access.
@y
- Organizations can assign the [editor role](roles-and-permissions.md) to members to grant additional permissions without full administrative access.
@z

@x
## 2023-05-09
@y
## 2023-05-09
@z

@x
### New
@y
### New
@z

@x
- Docker Business subscribers can now [create a company](new-company.md) in Docker Hub to manage organizations and settings.
@y
- Docker Business subscribers can now [create a company](new-company.md) in Docker Hub to manage organizations and settings.
@z

@x
## 2023-03-07
@y
## 2023-03-07
@z

@x
### New
@y
### New
@z

@x
-  You can now automatically sync user updates with your Docker organizations and teams with [Group Mapping](group-mapping.md) for SSO and SCIM provisioning.
@y
-  You can now automatically sync user updates with your Docker organizations and teams with [Group Mapping](group-mapping.md) for SSO and SCIM provisioning.
@z

@x
## 2022-12-12
@y
## 2022-12-12
@z

@x
### New
@y
### New
@z

@x
- The new domain audit feature lets you audit your domains for users who aren't a member of your organization.
@y
- The new domain audit feature lets you audit your domains for users who aren't a member of your organization.
@z

@x
## 2022-09-26
@y
## 2022-09-26
@z

@x
### New
@y
### New
@z

@x
- The new [autobuild feature](../docker-hub/builds/manage-builds.md#check-your-active-builds) lets you view your in-progress logs every 30 seconds instead of when the build is complete.
@y
- The new [autobuild feature](../docker-hub/builds/manage-builds.md#check-your-active-builds) lets you view your in-progress logs every 30 seconds instead of when the build is complete.
@z

@x
## 2022-09-21
@y
## 2022-09-21
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- In Docker Hub, you can now download a [registry.json](../security/for-admins/enforce-sign-in/_index.md) file or copy the commands to create a registry.json file to enforce sign-in for your organization.
@y
- In Docker Hub, you can now download a [registry.json](../security/for-admins/enforce-sign-in/_index.md) file or copy the commands to create a registry.json file to enforce sign-in for your organization.
@z

@x
## 2022-09-19
@y
## 2022-09-19
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- You can now [export a CSV file of members](../admin/organization//members.md/#export-members) from organizations that you own.
@y
- You can now [export a CSV file of members](../admin/organization//members.md/#export-members) from organizations that you own.
@z

@x
## 2022-07-22
@y
## 2022-07-22
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- You can now invite members to your organization with a CSV file containing their email addresses. The CSV file can either be a file you create for this specific purpose or one that’s extracted from another in-house system.
@y
- You can now invite members to your organization with a CSV file containing their email addresses. The CSV file can either be a file you create for this specific purpose or one that’s extracted from another in-house system.
@z

@x
## 2022-07-19
@y
## 2022-07-19
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- SCIM is now available for organizations with a Docker Business subscription using an Entra ID (formerly Azure AD) identity provider.
@y
- SCIM is now available for organizations with a Docker Business subscription using an Entra ID (formerly Azure AD) identity provider.
@z

@x
## 2022-06-23
@y
## 2022-06-23
@z

@x
### New
@y
### New
@z

@x
- With [SCIM](scim.md), you can manage users within your Okta identity provider (IdP). In addition, you can enable SCIM on organizations that are part of the Docker Business subscription.
@y
- With [SCIM](scim.md), you can manage users within your Okta identity provider (IdP). In addition, you can enable SCIM on organizations that are part of the Docker Business subscription.
@z

@x
## 2022-05-24
@y
## 2022-05-24
@z

@x
### New
@y
### New
@z

@x
- [Registry Access Management](/security/for-admins/hardened-desktop/registry-access-management.md) is now available for all Docker Business subscriptions. When enabled, your users can access specific registries in Docker Hub.
@y
- [Registry Access Management](security/for-admins/hardened-desktop/registry-access-management.md) is now available for all Docker Business subscriptions. When enabled, your users can access specific registries in Docker Hub.
@z

@x
## 2022-05-03
@y
## 2022-05-03
@z

@x
### New
@y
### New
@z

@x
- Organization owners can [invite new members](members.md#invite-members) to an organization via Docker ID or email address.
@y
- Organization owners can [invite new members](members.md#invite-members) to an organization via Docker ID or email address.
@z

@x
## 2021-11-15
@y
## 2021-11-15
@z

@x
### New
@y
### New
@z

@x
- You can now purchase or upgrade to a Docker Business subscription using a credit card. To learn more, see [Upgrade your subscription](../subscription/core-subscription/upgrade.md).
@y
- You can now purchase or upgrade to a Docker Business subscription using a credit card. To learn more, see [Upgrade your subscription](../subscription/core-subscription/upgrade.md).
@z

@x
## 2021-08-31
@y
## 2021-08-31
@z

@x
### New
@y
### New
@z

@x
Docker has [announced](https://www.docker.com/blog/updating-product-subscriptions/) updates and extensions to the product subscriptions to increase productivity, collaboration, and added security for our developers and businesses. Docker subscription tiers now include Personal, Pro, Team, and Business.
@y
Docker has [announced](https://www.docker.com/blog/updating-product-subscriptions/) updates and extensions to the product subscriptions to increase productivity, collaboration, and added security for our developers and businesses. Docker subscription tiers now include Personal, Pro, Team, and Business.
@z

@x
The updated [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement) includes a change to the terms for **Docker Desktop**.
@y
The updated [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement) includes a change to the terms for **Docker Desktop**.
@z

@x
- Docker Desktop **remains free** for small businesses (fewer than 250 employees AND less than $10 million in annual revenue), personal use, education, and non-commercial open source projects.
- It requires a paid subscription (**Pro, Team, or Business**), for as little as $5 a month, for professional use in larger enterprises.
- The effective date of these terms is August 31, 2021. There is a grace period until January 31, 2022 for those that will require a paid subscription to use Docker Desktop.
- The Docker Pro and Docker Team subscriptions now **include commercial use** of Docker Desktop.
- The existing Docker Free subscription has been renamed **Docker Personal**.
- **No changes** to Docker Engine or any other upstream **open source** Docker or Moby project.
@y
- Docker Desktop **remains free** for small businesses (fewer than 250 employees AND less than $10 million in annual revenue), personal use, education, and non-commercial open source projects.
- It requires a paid subscription (**Pro, Team, or Business**), for as little as $5 a month, for professional use in larger enterprises.
- The effective date of these terms is August 31, 2021. There is a grace period until January 31, 2022 for those that will require a paid subscription to use Docker Desktop.
- The Docker Pro and Docker Team subscriptions now **include commercial use** of Docker Desktop.
- The existing Docker Free subscription has been renamed **Docker Personal**.
- **No changes** to Docker Engine or any other upstream **open source** Docker or Moby project.
@z

@x
    To understand how these changes affect you, read the [FAQs](https://www.docker.com/pricing/faq). For more information, see [Docker subscription overview](../subscription/index.md).
@y
    To understand how these changes affect you, read the [FAQs](https://www.docker.com/pricing/faq). For more information, see [Docker subscription overview](../subscription/index.md).
@z

@x
## 2021-05-05
@y
## 2021-05-05
@z

@x
### Enhancement
@y
### Enhancement
@z

@x
When managing the content of your repositories, you can now filter the results based on the currentness of the tags and more easily identify your untagged images.
@y
When managing the content of your repositories, you can now filter the results based on the currentness of the tags and more easily identify your untagged images.
@z

@x
For Docker Hub API documentation, see [Docker Hub API Reference](/reference/api/hub/latest.md#operation/GetNamespacesRepositoriesImages).
@y
For Docker Hub API documentation, see [Docker Hub API Reference](reference/api/hub/latest.md#operation/GetNamespacesRepositoriesImages).
@z

@x
## 2021-04-13
@y
## 2021-04-13
@z

@x
### Enhancement
@y
### Enhancement
@z

@x
The **Billing Details** page now shows any organizations you own, in addition to your personal account. This allows you to clearly identify the billing details of your chosen namespace, and enables you to switch between your personal and your organization accounts to view or update the details.
@y
The **Billing Details** page now shows any organizations you own, in addition to your personal account. This allows you to clearly identify the billing details of your chosen namespace, and enables you to switch between your personal and your organization accounts to view or update the details.
@z

@x
## 2021-04-09
@y
## 2021-04-09
@z

@x
### Enhancement
@y
### Enhancement
@z

@x
You can now specify any email address to receive billing-related emails for your organization. The email address doesn't have to be associated with an organization owner account. You must be an owner of the organization to update any billing details.
@y
You can now specify any email address to receive billing-related emails for your organization. The email address doesn't have to be associated with an organization owner account. You must be an owner of the organization to update any billing details.
@z

@x
To change the email address receiving billing-related emails, log into Docker Hub and navigate to the **Billing** tab of your organization. Select **Payment Methods** > **Billing Information**. Enter the new email address that you'd like to use in the **Email** field. Click **Update** for the changes to take effect.
@y
To change the email address receiving billing-related emails, log into Docker Hub and navigate to the **Billing** tab of your organization. Select **Payment Methods** > **Billing Information**. Enter the new email address that you'd like to use in the **Email** field. Click **Update** for the changes to take effect.
@z

@x
For details on how to update your billing information, see [Update billing information](../billing/index.md).
@y
For details on how to update your billing information, see [Update billing information](../billing/index.md).
@z

@x
## 2021-03-22
@y
## 2021-03-22
@z

@x
### New feature
@y
### New feature
@z

@x
**Advanced Image Management dashboard**
@y
**Advanced Image Management dashboard**
@z

@x
Docker introduces the Advanced Image Management dashboard that enables you to view and manage Docker images in your repositories.
@y
Docker introduces the Advanced Image Management dashboard that enables you to view and manage Docker images in your repositories.
@z

@x
## 2021-01-25
@y
## 2021-01-25
@z

@x
### New feature
@y
### New feature
@z

@x
Docker introduces Audit logs, a new feature that allows team owners to view a list of activities that occur at organization and repository levels. This feature begins tracking the activities from the release date, that is, **from 25 January 2021**.
@y
Docker introduces Audit logs, a new feature that allows team owners to view a list of activities that occur at organization and repository levels. This feature begins tracking the activities from the release date, that is, **from 25 January 2021**.
@z

@x
For more information about this feature and for instructions on how to use it, see [Activity logs](../admin/organization/activity-logs.md).
@y
For more information about this feature and for instructions on how to use it, see [Activity logs](../admin/organization/activity-logs.md).
@z

@x
## 2020-11-10
@y
## 2020-11-10
@z

@x
### New feature
@y
### New feature
@z

@x
The **Repositories** view now shows which images have gone stale because they haven't been pulled or pushed recently. For more information, see [repository tags](repos/access/index.md#view-repository-tags).
@y
The **Repositories** view now shows which images have gone stale because they haven't been pulled or pushed recently. For more information, see [repository tags](repos/access/index.md#view-repository-tags).
@z

@x
## 2020-10-07
@y
## 2020-10-07
@z

@x
### New feature
@y
### New feature
@z

@x
Docker introduces Hub Vulnerability Scanning which enables you to automatically scan Docker images for vulnerabilities using Snyk. For more information, see [Hub Vulnerability Scanning](vulnerability-scanning.md).
@y
Docker introduces Hub Vulnerability Scanning which enables you to automatically scan Docker images for vulnerabilities using Snyk. For more information, see [Hub Vulnerability Scanning](vulnerability-scanning.md).
@z

@x
## 2020-05-14
@y
## 2020-05-14
@z

@x
### New features
@y
### New features
@z

@x
* Docker has announced a new, per-seat pricing model to accelerate developer workflows for cloud-native development. The previous private repository/concurrent autobuild-based plans have been replaced with new **Pro** and **Team** plans that include unlimited private repositories. For more information, see [Docker subscription](../subscription/index.md).
@y
* Docker has announced a new, per-seat pricing model to accelerate developer workflows for cloud-native development. The previous private repository/concurrent autobuild-based plans have been replaced with new **Pro** and **Team** plans that include unlimited private repositories. For more information, see [Docker subscription](../subscription/index.md).
@z

@x
* Docker has enabled download rate limits for downloads and pull requests on Docker Hub. This caps the number of objects that users can download within a specified timeframe. For more information, see [Download rate limit](download-rate-limit.md).
@y
* Docker has enabled download rate limits for downloads and pull requests on Docker Hub. This caps the number of objects that users can download within a specified timeframe. For more information, see [Download rate limit](download-rate-limit.md).
@z

@x
## 2019-11-04
@y
## 2019-11-04
@z

@x
### Enhancements
@y
### Enhancements
@z

@x
* The [repositories page](repos/index.md) and all
related settings and tabs have been updated and moved from `cloud.docker.com`
to `hub.docker.com`. You can access the page at its new URL: [https://hub.docker.com/repositories](https://hub.docker.com/repositories).
@y
* The [repositories page](repos/index.md) and all
related settings and tabs have been updated and moved from `cloud.docker.com`
to `hub.docker.com`. You can access the page at its new URL: [https://hub.docker.com/repositories](https://hub.docker.com/repositories).
@z

@x
### Known Issues
@y
### Known Issues
@z

@x
* Scan results don't appear for some official images.
@y
* Scan results don't appear for some official images.
@z

@x
## 2019-10-21
@y
## 2019-10-21
@z

@x
### New features
@y
### New features
@z

@x
* **Beta:** Docker Hub now supports two-factor authentication (2FA). Enable it in your account settings, under the **[Security](https://hub.docker.com/settings/security)** section.
@y
* **Beta:** Docker Hub now supports two-factor authentication (2FA). Enable it in your account settings, under the **[Security](https://hub.docker.com/settings/security)** section.
@z

@x
    > If you lose both your 2FA authentication device and recovery code, you may
    > not be able to recover your account.
@y
    > If you lose both your 2FA authentication device and recovery code, you may
    > not be able to recover your account.
@z

@x
### Enhancements
@y
### Enhancements
@z

@x
* As a security measure, when two-factor authentication is enabled, the Docker CLI requires a personal access token instead of a password to log in.
@y
* As a security measure, when two-factor authentication is enabled, the Docker CLI requires a personal access token instead of a password to log in.
@z

@x
### Known Issues
@y
### Known Issues
@z

@x
* Scan results don't appear for some official images.
@y
* Scan results don't appear for some official images.
@z

@x
## 2019-10-02
@y
## 2019-10-02
@z

@x
### Enhancements
@y
### Enhancements
@z

@x
* You can now manage teams and members straight from your [organization page](https://hub.docker.com/orgs).
Each organization page now breaks down into these tabs:
  * **New:** Members - manage your members directly from this page (delete,
  add, or open their teams)
  * **New:** Teams - search by team or username, and open up any team page to
  manage the team
  * **New:** Invitees (conditional tab, only if an invite exists) - resend or
  remove invitiations from this tab
  * Repositories
  * Settings
  * Billing
@y
* You can now manage teams and members straight from your [organization page](https://hub.docker.com/orgs).
Each organization page now breaks down into these tabs:
  * **New:** Members - manage your members directly from this page (delete,
  add, or open their teams)
  * **New:** Teams - search by team or username, and open up any team page to
  manage the team
  * **New:** Invitees (conditional tab, only if an invite exists) - resend or
  remove invitiations from this tab
  * Repositories
  * Settings
  * Billing
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
* Fixed an issue where Kinematic could not connect and log in to Docker Hub.
@y
* Fixed an issue where Kinematic could not connect and log in to Docker Hub.
@z

@x
### Known Issues
@y
### Known Issues
@z

@x
* Scan results don't appear for some official images.
@y
* Scan results don't appear for some official images.
@z

@x
## 2019-09-19
@y
## 2019-09-19
@z

@x
### New features
@y
### New features
@z

@x
* You can now [create personal access tokens](access-tokens.md) in Docker Hub and use them to authenticate from the Docker CLI. Find them in your account settings, under the new **[Security](https://hub.docker.com/settings/security)** section.
@y
* You can now [create personal access tokens](access-tokens.md) in Docker Hub and use them to authenticate from the Docker CLI. Find them in your account settings, under the new **[Security](https://hub.docker.com/settings/security)** section.
@z

@x
### Known Issues
@y
### Known Issues
@z

@x
* Scan results don't appear for some official images.
@y
* Scan results don't appear for some official images.
@z

@x
## 2019-09-16
@y
## 2019-09-16
@z

@x
### Enhancements
@y
### Enhancements
@z

@x
* The [billing page](../subscription/core-subscription/upgrade.md) for personal accounts has been updated. You can access the page at its new URL: [https://hub.docker.com/billing/plan](https://hub.docker.com/billing/plan).
@y
* The [billing page](../subscription/core-subscription/upgrade.md) for personal accounts has been updated. You can access the page at its new URL: [https://hub.docker.com/billing/plan](https://hub.docker.com/billing/plan).
@z

@x
### Known Issues
@y
### Known Issues
@z

@x
* Scan results don't appear for some official images.
@y
* Scan results don't appear for some official images.
@z

@x
## 2019-09-05
@y
## 2019-09-05
@z

@x
### Enhancements
@y
### Enhancements
@z

@x
* The `Tags` tab on an image page now provides additional information for each tag:
  * A list of digests associated with the tag
  * The architecture it was built on
  * The OS
  * The user who most recently updated an image for a specific tag
* The security scan summary for Docker Official Images has been updated.
@y
* The `Tags` tab on an image page now provides additional information for each tag:
  * A list of digests associated with the tag
  * The architecture it was built on
  * The OS
  * The user who most recently updated an image for a specific tag
* The security scan summary for Docker Official Images has been updated.
@z

@x
### Known Issues
@y
### Known Issues
@z

@x
* Scan results don't appear for some official images.
@y
* Scan results don't appear for some official images.
@z
