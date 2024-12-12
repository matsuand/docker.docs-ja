%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Manage Docker products
@y
title: Manage Docker products
@z

@x
description: Learn how to manage Docker products for your organization
keywords: organization, tools, products
@y
description: Learn how to manage Docker products for your organization
keywords: organization, tools, products
@z

@x
In this section, learn how to manage access and view usage of the Docker
products for your organization. For more detailed information about each
product, including how to set up and configure them, see the following manuals:
@y
In this section, learn how to manage access and view usage of the Docker
products for your organization. For more detailed information about each
product, including how to set up and configure them, see the following manuals:
@z

@x
- [Docker Build Cloud](../../build-cloud/_index.md)
- [Docker Desktop](../../desktop/_index.md)
- [Docker Hub](../../docker-hub/_index.md)
- [Docker Scout](../../scout/_index.md)
- [Testcontainers Cloud](https://testcontainers.com/cloud/docs/#getting-started)
@y
- [Docker Build Cloud](../../build-cloud/_index.md)
- [Docker Desktop](../../desktop/_index.md)
- [Docker Hub](../../docker-hub/_index.md)
- [Docker Scout](../../scout/_index.md)
- [Testcontainers Cloud](https://testcontainers.com/cloud/docs/#getting-started)
@z

@x
## Manage access to Docker products
@y
## Manage access to Docker products
@z

@x
Access to Docker products included in your subscription is enabled by default
for all users. The included products are:
@y
Access to Docker products included in your subscription is enabled by default
for all users. The included products are:
@z

@x
- Docker Hub
- Docker Build Cloud
- Docker Desktop
- Docker Scout
@y
- Docker Hub
- Docker Build Cloud
- Docker Desktop
- Docker Scout
@z

@x
Testcontainers Cloud is not enabled by default. To enable Testcontainers Cloud, see the Testcontainers [Getting Started](https://testcontainers.com/cloud/docs/#getting-started) guide.
@y
Testcontainers Cloud is not enabled by default. To enable Testcontainers Cloud, see the Testcontainers [Getting Started](https://testcontainers.com/cloud/docs/#getting-started) guide.
@z

@x
The following sections describe how to enable or disable access for these products.
@y
The following sections describe how to enable or disable access for these products.
@z

@x
### Manage access to Docker Build Cloud
@y
### Manage access to Docker Build Cloud
@z

@x
To learn how to initially set up and configure Docker Build Cloud, sign in to
the [Docker Build Cloud Dashboard](https://app.docker.com/build) and follow the
on-screen instructions.
@y
To learn how to initially set up and configure Docker Build Cloud, sign in to
the [Docker Build Cloud Dashboard](https://app.docker.com/build) and follow the
on-screen instructions.
@z

@x
To manage access to Docker Build Cloud, sign in to [Docker Build
Cloud](http://app.docker.com/build) as an organization owner, select **Account
settings**, and then manage access under **Lock Docker Build Cloud**.
@y
To manage access to Docker Build Cloud, sign in to [Docker Build
Cloud](http://app.docker.com/build) as an organization owner, select **Account
settings**, and then manage access under **Lock Docker Build Cloud**.
@z

@x
### Manage access to Docker Scout
@y
### Manage access to Docker Scout
@z

@x
To learn how to initially set up and configure Docker Scout for remote
repositories, sign in to the [Docker Scout Dashboard](https://scout.docker.com/)
and follow the on-screen instructions.
@y
To learn how to initially set up and configure Docker Scout for remote
repositories, sign in to the [Docker Scout Dashboard](https://scout.docker.com/)
and follow the on-screen instructions.
@z

@x
To manage access to Docker Scout for use on remote repositories, sign in to the
[Docker Scout Dashboard](https://scout.docker.com/) and configure
[integrations](../../scout/explore/dashboard.md#integrations) and [repository
settings](../../scout/explore/dashboard.md#repository-settings).
@y
To manage access to Docker Scout for use on remote repositories, sign in to the
[Docker Scout Dashboard](https://scout.docker.com/) and configure
[integrations](../../scout/explore/dashboard.md#integrations) and [repository
settings](../../scout/explore/dashboard.md#repository-settings).
@z

@x
To manage access to Docker Scout for use on local images with Docker Desktop, use
[Settings
Management](../../security/for-admins/hardened-desktop/settings-management/_index.md)
and set `sbomIndexing` to `false` to disable, or to `true` to enable.
@y
To manage access to Docker Scout for use on local images with Docker Desktop, use
[Settings
Management](../../security/for-admins/hardened-desktop/settings-management/_index.md)
and set `sbomIndexing` to `false` to disable, or to `true` to enable.
@z

@x
### Manage access to Docker Hub
@y
### Manage access to Docker Hub
@z

@x
To manage access to Docker Hub, sign in to the [Docker Admin Console](https://app.docker.com/admin) and configure [Registry Access
Management](../../security/for-admins/hardened-desktop/registry-access-management.md)
or [Image Access
Management](../../security/for-admins/hardened-desktop/image-access-management.md).
@y
To manage access to Docker Hub, sign in to the [Docker Admin Console](https://app.docker.com/admin) and configure [Registry Access
Management](../../security/for-admins/hardened-desktop/registry-access-management.md)
or [Image Access
Management](../../security/for-admins/hardened-desktop/image-access-management.md).
@z

@x
### Manage access to Testcontainers Cloud
@y
### Manage access to Testcontainers Cloud
@z

@x
To learn how to initially set up and configure Testcontainers Cloud, sign in to
[Testcontainers Cloud](https://app.testcontainers.cloud/) and follow the
on-screen instructions.
@y
To learn how to initially set up and configure Testcontainers Cloud, sign in to
[Testcontainers Cloud](https://app.testcontainers.cloud/) and follow the
on-screen instructions.
@z

@x
To manage access to Testcontainers Cloud, sign in to the [Testcontainers Cloud
Settings page](https://app.testcontainers.cloud/dashboard/settings) as
an organization owner, and then manage access under **Lock Testcontainers
Cloud**.
@y
To manage access to Testcontainers Cloud, sign in to the [Testcontainers Cloud
Settings page](https://app.testcontainers.cloud/dashboard/settings) as
an organization owner, and then manage access under **Lock Testcontainers
Cloud**.
@z

@x
### Manage access to Docker Desktop
@y
### Manage access to Docker Desktop
@z

@x
To manage access to Docker Desktop, you can [enforce
sign-in](../../security/for-admins/enforce-sign-in/_index.md), then and manage
members [manually](./members.md) or use
[provisioning](../../security/for-admins/provisioning/_index.md). With sign-in
enforced, only users who are a member of your organization can use Docker
Desktop after signing in.
@y
To manage access to Docker Desktop, you can [enforce
sign-in](../../security/for-admins/enforce-sign-in/_index.md), then and manage
members [manually](./members.md) or use
[provisioning](../../security/for-admins/provisioning/_index.md). With sign-in
enforced, only users who are a member of your organization can use Docker
Desktop after signing in.
@z

@x
## View Docker product usage
@y
## View Docker product usage
@z

@x
View usage for the products on the following pages:
@y
View usage for the products on the following pages:
@z

@x
- Docker Build Cloud: View the **Build minutes** page in the [Docker Build Cloud
  Dashboard](http://app.docker.com/build).
@y
- Docker Build Cloud: View the **Build minutes** page in the [Docker Build Cloud
  Dashboard](http://app.docker.com/build).
@z

@x
- Docker Scout: View the [**Repository settings**
  page](https://scout.docker.com/settings/repos) in the Docker Scout
  Dashboard.
@y
- Docker Scout: View the [**Repository settings**
  page](https://scout.docker.com/settings/repos) in the Docker Scout
  Dashboard.
@z

@x
- Docker Hub: View the [**Usage** page](https://hub.docker.com/usage) in Docker
  Hub.
@y
- Docker Hub: View the [**Usage** page](https://hub.docker.com/usage) in Docker
  Hub.
@z

@x
- Testcontainers Cloud: View the [**Billing**
  page](https://app.testcontainers.cloud/dashboard/billing) in the
  Testcontainers Cloud Dashboard.
@y
- Testcontainers Cloud: View the [**Billing**
  page](https://app.testcontainers.cloud/dashboard/billing) in the
  Testcontainers Cloud Dashboard.
@z

@x
- Docker Desktop: View the **Insights** page in the [Docker Admin Console](https://app.docker.com/admin). For more details, see
  [Insights](./insights.md).
@y
- Docker Desktop: View the **Insights** page in the [Docker Admin Console](https://app.docker.com/admin). For more details, see
  [Insights](./insights.md).
@z

@x
If your usage exceeds your subscription amount, you can [scale your
subscription](../../subscription/scale.md) to meet your needs.
@y
If your usage exceeds your subscription amount, you can [scale your
subscription](../../subscription/scale.md) to meet your needs.
@z
