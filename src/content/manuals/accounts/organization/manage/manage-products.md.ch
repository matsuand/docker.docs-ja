%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Manage usage and access for Docker products
linkTitle: Product usage and access
@y
title: Manage usage and access for Docker products
linkTitle: Product usage and access
@z

@x
description: Learn how to manage access and usage for Docker products for your organization
keywords: organization, product access, product usage, access control, docker desktop, docker hub, docker scout, docker build cloud, docker offload, testcontainers cloud
@y
description: Learn how to manage access and usage for Docker products for your organization
keywords: organization, product access, product usage, access control, docker desktop, docker hub, docker scout, docker build cloud, docker offload, testcontainers cloud
@z

@x
{{< summary-bar feature_name="Admin orgs" >}}
@y
{{< summary-bar feature_name="Admin orgs" >}}
@z

@x
Use this page to learn how to control and monitor product access and usage
for your organization's members. If you're looking for setup and
configuration instructions, see each product's manual under
[Next steps](#next-steps).
@y
Use this page to learn how to control and monitor product access and usage
for your organization's members. If you're looking for setup and
configuration instructions, see each product's manual under
[Next steps](#next-steps).
@z

@x
## Control access for your organization
@y
## Control access for your organization
@z

@x
Organization members can access Docker products that your organization is
subscribed to by default. When signed in as an organization owner, you can
use the following procedures to control access for all members.
@y
Organization members can access Docker products that your organization is
subscribed to by default. When signed in as an organization owner, you can
use the following procedures to control access for all members.
@z

@x
### Docker Desktop access
@y
### Docker Desktop access
@z

@x
To manage Docker Desktop access:
@y
To manage Docker Desktop access:
@z

@x
1. [Enforce sign-in](../../../enterprise/security/enforce-sign-in/_index.md).
1. Manage members [manually](./members.md) or use
   [provisioning](../../../security/provisioning/_index.md).
@y
1. [Enforce sign-in](../../../enterprise/security/enforce-sign-in/_index.md).
1. Manage members [manually](./members.md) or use
   [provisioning](../../../security/provisioning/_index.md).
@z

@x
With sign-in enforced, only users who are a member of your organization can
use Docker Desktop after signing in.
@y
With sign-in enforced, only users who are a member of your organization can
use Docker Desktop after signing in.
@z

@x
### Docker Hub access
@y
### Docker Hub access
@z

@x
To manage Docker Hub access:
@y
To manage Docker Hub access:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization, then select **Docker Desktop**.
1. Select **Registry Access** to configure
   [Registry Access Management](../../../enterprise/security/hardened-desktop/registry-access-management.md).
1. Select **Image Access** to control
   [Image Access Management](../../../enterprise/security/hardened-desktop/image-access-management.md).
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization, then select **Docker Desktop**.
1. Select **Registry Access** to configure
   [Registry Access Management](../../../enterprise/security/hardened-desktop/registry-access-management.md).
1. Select **Image Access** to control
   [Image Access Management](../../../enterprise/security/hardened-desktop/image-access-management.md).
@z

@x
### Docker Build Cloud access
@y
### Docker Build Cloud access
@z

@x
To initially set up and configure Docker Build Cloud, sign in to
[Docker Build Cloud](https://app.docker.com/build) and follow the
on-screen instructions.
@y
To initially set up and configure Docker Build Cloud, sign in to
[Docker Build Cloud](https://app.docker.com/build) and follow the
on-screen instructions.
@z

@x
To manage Docker Build Cloud access:
@y
To manage Docker Build Cloud access:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/), then select
   [Docker Build Cloud](http://app.docker.com/build).
1. Select **Account settings**.
1. Select **Lock access to Docker Build Account**.
@y
1. Sign in to [Docker Home](https://app.docker.com/), then select
   [Docker Build Cloud](http://app.docker.com/build).
1. Select **Account settings**.
1. Select **Lock access to Docker Build Account**.
@z

@x
### Docker Scout access
@y
### Docker Scout access
@z

@x
To initially set up and configure Docker Scout, sign in to
[Docker Scout](https://scout.docker.com/) and follow the on-screen
instructions.
@y
To initially set up and configure Docker Scout, sign in to
[Docker Scout](https://scout.docker.com/) and follow the on-screen
instructions.
@z

@x
To manage Docker Scout access:
@y
To manage Docker Scout access:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/), then select
   [Docker Scout](https://scout.docker.com/).
1. Select your organization, then **Settings**.
1. To manage what repositories are enabled for Docker Scout analysis, select
   **Repository settings**. For more information, see
   [repository settings](../../../scout/explore/dashboard.md#repository-settings).
1. To manage access to Docker Scout for use on local images with Docker
   Desktop, use
   [Settings Management](../../../enterprise/security/hardened-desktop/settings-management/_index.md)
   and set `sbomIndexing` to `false` to disable, or to `true` to enable.
@y
1. Sign in to [Docker Home](https://app.docker.com/), then select
   [Docker Scout](https://scout.docker.com/).
1. Select your organization, then **Settings**.
1. To manage what repositories are enabled for Docker Scout analysis, select
   **Repository settings**. For more information, see
   [repository settings](../../../scout/explore/dashboard.md#repository-settings).
1. To manage access to Docker Scout for use on local images with Docker
   Desktop, use
   [Settings Management](../../../enterprise/security/hardened-desktop/settings-management/_index.md)
   and set `sbomIndexing` to `false` to disable, or to `true` to enable.
@z

@x
### Testcontainers Cloud access
@y
### Testcontainers Cloud access
@z

@x
To initially set up and configure Testcontainers Cloud, sign in to
[Testcontainers Cloud](https://app.testcontainers.cloud/) and follow the
on-screen instructions.
@y
To initially set up and configure Testcontainers Cloud, sign in to
[Testcontainers Cloud](https://app.testcontainers.cloud/) and follow the
on-screen instructions.
@z

@x
To manage access to Testcontainers Cloud:
@y
To manage access to Testcontainers Cloud:
@z

@x
1. Sign in to the [Testcontainers Cloud](https://app.testcontainers.cloud/),
   then select the menu icon.
1. Select **Account**, then **Settings**.
1. Choose **Lock access to Testcontainers Cloud**.
@y
1. Sign in to the [Testcontainers Cloud](https://app.testcontainers.cloud/),
   then select the menu icon.
1. Select **Account**, then **Settings**.
1. Choose **Lock access to Testcontainers Cloud**.
@z

@x
### Docker Offload access
@y
### Docker Offload access
@z

@x
> [!NOTE]
>
> Docker Offload isn't included in the core Docker subscription plans. To
> make Docker Offload available, you must
> [contact sales](https://www.docker.com/products/docker-offload/) and
> subscribe.
@y
> [!NOTE]
>
> Docker Offload isn't included in the core Docker subscription plans. To
> make Docker Offload available, you must
> [contact sales](https://www.docker.com/products/docker-offload/) and
> subscribe.
@z

@x
To manage Docker Offload access for your organization, use [Settings
Management](../../../enterprise/security/hardened-desktop/settings-management/_index.md):
@y
To manage Docker Offload access for your organization, use [Settings
Management](../../../enterprise/security/hardened-desktop/settings-management/_index.md):
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/), then select **Docker
   Desktop**.
1. Select **Settings Management**.
1. Configure the **Enable Docker Offload** setting to control whether
   Docker Offload features are available in Docker Desktop. You can
   configure this setting in five states:
   - **Always enabled**: Docker Offload is always enabled and users cannot
     disable it. The Offload toggle is always visible in the Docker Desktop
     header. Recommended for VDI environments where local Docker execution
     is not possible.
   - **Enabled**: Docker Offload is enabled by default but users can
     disable it in Docker Desktop settings. Suitable for hybrid
     environments.
   - **Disabled**: Docker Offload is disabled by default but users can
     enable it in Docker Desktop settings.
   - **Always disabled**: Docker Offload is disabled and users cannot
     enable it. The option is visible but locked. Use when Docker Offload
     is not approved for organizational use.
   - **User defined**: No enforced default. Users choose whether to enable
     or disable Docker Offload in their Docker Desktop settings.
1. Select **Save**.
@y
1. Sign in to [Docker Home](https://app.docker.com/), then select **Docker
   Desktop**.
1. Select **Settings Management**.
1. Configure the **Enable Docker Offload** setting to control whether
   Docker Offload features are available in Docker Desktop. You can
   configure this setting in five states:
   - **Always enabled**: Docker Offload is always enabled and users cannot
     disable it. The Offload toggle is always visible in the Docker Desktop
     header. Recommended for VDI environments where local Docker execution
     is not possible.
   - **Enabled**: Docker Offload is enabled by default but users can
     disable it in Docker Desktop settings. Suitable for hybrid
     environments.
   - **Disabled**: Docker Offload is disabled by default but users can
     enable it in Docker Desktop settings.
   - **Always disabled**: Docker Offload is disabled and users cannot
     enable it. The option is visible but locked. Use when Docker Offload
     is not approved for organizational use.
   - **User defined**: No enforced default. Users choose whether to enable
     or disable Docker Offload in their Docker Desktop settings.
1. Select **Save**.
@z

@x
For more details on Settings Management, see the [Settings
reference](../../../enterprise/security/hardened-desktop/settings-management/settings-reference.md#enable-docker-offload).
@y
For more details on Settings Management, see the [Settings
reference](../../../enterprise/security/hardened-desktop/settings-management/settings-reference.md#enable-docker-offload).
@z

@x
## Monitor product usage for your organization
@y
## Monitor product usage for your organization
@z

@x
You can monitor usage for Docker products across your organization. Use the
following table to learn where you can monitor organization usage:
@y
You can monitor usage for Docker products across your organization. Use the
following table to learn where you can monitor organization usage:
@z

@x
| Product              | Monitor usage                                                                                                                                                                                    |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Docker Desktop       | From [Docker Home](https://app.docker.com/), view the [**Insights**](/manuals/accounts/organization/insights.md) page.                                                                                                    |
| Docker Hub           | From Docker Hub, view the [**Usage** page](https://hub.docker.com/usage).                                                                                                                        |
| Docker Build Cloud   | From [Docker Build Cloud](http://app.docker.com/build), view the **Build minutes** page.                                                                                                         |
| Docker Scout         | From [Docker Home](https://app.docker.com/), select **Go to Scout** to view the [**Repository settings** page](https://scout.docker.com/settings/repos).                                         |
| Testcontainers Cloud | From [Docker Home](https://app.docker.com/), select **Go to Testcontainers Cloud**, then select the menu icon. Go to the [**Billing** page](https://app.testcontainers.cloud/dashboard/billing). |
| Docker Offload       | From [Docker Home](https://app.docker.com/), select **Offload**, then **Offload activity**. See [Docker Offload usage and billing](../../../offload/usage.md) for more details.                  |
@y
| Product              | Monitor usage                                                                                                                                                                                    |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Docker Desktop       | From [Docker Home](https://app.docker.com/), view the [**Insights**](manuals/accounts/organization/insights.md) page.                                                                                                    |
| Docker Hub           | From Docker Hub, view the [**Usage** page](https://hub.docker.com/usage).                                                                                                                        |
| Docker Build Cloud   | From [Docker Build Cloud](http://app.docker.com/build), view the **Build minutes** page.                                                                                                         |
| Docker Scout         | From [Docker Home](https://app.docker.com/), select **Go to Scout** to view the [**Repository settings** page](https://scout.docker.com/settings/repos).                                         |
| Testcontainers Cloud | From [Docker Home](https://app.docker.com/), select **Go to Testcontainers Cloud**, then select the menu icon. Go to the [**Billing** page](https://app.testcontainers.cloud/dashboard/billing). |
| Docker Offload       | From [Docker Home](https://app.docker.com/), select **Offload**, then **Offload activity**. See [Docker Offload usage and billing](../../../offload/usage.md) for more details.                  |
@z

@x
If your usage or seat count exceeds your subscription amount, you can
[add seats](./manage-seats.md) or [view available Docker plans](../../../subscription-billing/plans/_index.md) to meet your needs.
@y
If your usage or seat count exceeds your subscription amount, you can
[add seats](./manage-seats.md) or [view available Docker plans](../../../subscription-billing/plans/_index.md) to meet your needs.
@z

@x
## Next steps
@y
## Next steps
@z

@x
For more detailed information about each product, including how to set up
and configure them, see the following manuals:
@y
For more detailed information about each product, including how to set up
and configure them, see the following manuals:
@z

@x
- [Docker Desktop](../../../desktop/_index.md)
- [Docker Hub](../../../docker-hub/_index.md)
- [Docker Build Cloud](../../../build-cloud/_index.md)
- [Docker Scout](../../../scout/_index.md)
- [Testcontainers Cloud](https://testcontainers.com/cloud/docs/#getting-started)
- [Docker Offload](../../../offload/_index.md)
@y
- [Docker Desktop](../../../desktop/_index.md)
- [Docker Hub](../../../docker-hub/_index.md)
- [Docker Build Cloud](../../../build-cloud/_index.md)
- [Docker Scout](../../../scout/_index.md)
- [Testcontainers Cloud](https://testcontainers.com/cloud/docs/#getting-started)
- [Docker Offload](../../../offload/_index.md)
@z
