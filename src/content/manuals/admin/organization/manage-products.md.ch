%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Manage Docker products
@y
title: Manage Docker products
@z

@x
description: Learn how to manage access and usage for Docker products for your organization
keywords: organization, tools, products, product access, organization management
@y
description: Learn how to manage access and usage for Docker products for your organization
keywords: organization, tools, products, product access, organization management
@z

@x
{{< summary-bar feature_name="Admin orgs" >}}
@y
{{< summary-bar feature_name="Admin orgs" >}}
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
- [Docker Desktop](../../desktop/_index.md)
- [Docker Hub](../../docker-hub/_index.md)
- [Docker Build Cloud](../../build-cloud/_index.md)
- [Docker Scout](../../scout/_index.md)
- [Testcontainers Cloud](https://testcontainers.com/cloud/docs/#getting-started)
@y
- [Docker Desktop](../../desktop/_index.md)
- [Docker Hub](../../docker-hub/_index.md)
- [Docker Build Cloud](../../build-cloud/_index.md)
- [Docker Scout](../../scout/_index.md)
- [Testcontainers Cloud](https://testcontainers.com/cloud/docs/#getting-started)
@z

@x
## Manage product access for your organization
@y
## Manage product access for your organization
@z

@x
Access to the Docker products included in your subscription is turned on by
default for all users. For an overview of products included in your
subscription, see
[Docker subscriptions and features](/manuals/subscription/details.md).
@y
Access to the Docker products included in your subscription is turned on by
default for all users. For an overview of products included in your
subscription, see
[Docker subscriptions and features](manuals/subscription/details.md).
@z

@x
{{< tabs >}}
{{< tab name="Docker Desktop" >}}
@y
{{< tabs >}}
{{< tab name="Docker Desktop" >}}
@z

@x
### Manage Docker Desktop access
@y
### Manage Docker Desktop access
@z

@x
To manage Docker Desktop access:
@y
To manage Docker Desktop access:
@z

@x
1. [Enforce sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md).
1. Manage members [manually](./members.md) or use
[provisioning](/manuals/enterprise/security/provisioning/_index.md).
@y
1. [Enforce sign-in](manuals/enterprise/security/enforce-sign-in/_index.md).
1. Manage members [manually](./members.md) or use
[provisioning](manuals/enterprise/security/provisioning/_index.md).
@z

@x
With sign-in enforced, only users who are a member of your organization can
use Docker Desktop after signing in.
@y
With sign-in enforced, only users who are a member of your organization can
use Docker Desktop after signing in.
@z

@x
{{< /tab >}}
{{< tab name="Docker Hub" >}}
@y
{{< /tab >}}
{{< tab name="Docker Hub" >}}
@z

@x
### Manage Docker Hub access
@y
### Manage Docker Hub access
@z

@x
To manage Docker Hub access, sign in to
[Docker Home](https://app.docker.com/) and configure [Registry Access Management](/manuals/enterprise/security/hardened-desktop/registry-access-management.md)
or [Image Access Management](/manuals/enterprise/security/hardened-desktop/image-access-management.md).
@y
To manage Docker Hub access, sign in to
[Docker Home](https://app.docker.com/) and configure [Registry Access Management](manuals/enterprise/security/hardened-desktop/registry-access-management.md)
or [Image Access Management](manuals/enterprise/security/hardened-desktop/image-access-management.md).
@z

@x
{{< /tab >}}
{{< tab name="Docker Build Cloud" >}}
@y
{{< /tab >}}
{{< tab name="Docker Build Cloud" >}}
@z

@x
### Manage Docker Build Cloud access
@y
### Manage Docker Build Cloud access
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
1. Sign in to [Docker Build Cloud](http://app.docker.com/build) as an
organization owner.
1. Select **Account settings**.
1. Select **Lock access to Docker Build Account**.
@y
1. Sign in to [Docker Build Cloud](http://app.docker.com/build) as an
organization owner.
1. Select **Account settings**.
1. Select **Lock access to Docker Build Account**.
@z

@x
{{< /tab >}}
{{< tab name="Docker Scout" >}}
@y
{{< /tab >}}
{{< tab name="Docker Scout" >}}
@z

@x
### Manage Docker Scout access
@y
### Manage Docker Scout access
@z

@x
To initially set up and configure Docker Scout, sign in to
[Docker Scout](https://scout.docker.com/) and follow the on-screen instructions.
@y
To initially set up and configure Docker Scout, sign in to
[Docker Scout](https://scout.docker.com/) and follow the on-screen instructions.
@z

@x
To manage Docker Scout access:
@y
To manage Docker Scout access:
@z

@x
1. Sign in to [Docker Scout](https://scout.docker.com/) as an organization
owner.
1. Select your organization, then **Settings**.
1. To manage what repositories are enabled for Docker Scout analysis, select
**Repository settings**. For more information on,
see [repository settings](../../scout/explore/dashboard.md#repository-settings).
1. To manage access to Docker Scout for use on local images with Docker Desktop,
use [Settings Management](/manuals/enterprise/security/hardened-desktop/settings-management/_index.md)
and set `sbomIndexing` to `false` to disable, or to `true` to enable.
@y
1. Sign in to [Docker Scout](https://scout.docker.com/) as an organization
owner.
1. Select your organization, then **Settings**.
1. To manage what repositories are enabled for Docker Scout analysis, select
**Repository settings**. For more information on,
see [repository settings](../../scout/explore/dashboard.md#repository-settings).
1. To manage access to Docker Scout for use on local images with Docker Desktop,
use [Settings Management](manuals/enterprise/security/hardened-desktop/settings-management/_index.md)
and set `sbomIndexing` to `false` to disable, or to `true` to enable.
@z

@x
{{< /tab >}}
{{< tab name="Testcontainers Cloud" >}}
@y
{{< /tab >}}
{{< tab name="Testcontainers Cloud" >}}
@z

@x
### Manage Testcontainers Cloud access
@y
### Manage Testcontainers Cloud access
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
1. Sign in to the [Testcontainers Cloud](https://app.testcontainers.cloud/) and
select **Account**.
1. Select **Settings**, then **Lock access to Testcontainers Cloud**.
@y
1. Sign in to the [Testcontainers Cloud](https://app.testcontainers.cloud/) and
select **Account**.
1. Select **Settings**, then **Lock access to Testcontainers Cloud**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Monitor product usage for your organization
@y
## Monitor product usage for your organization
@z

@x
To view usage for Docker products:
@y
To view usage for Docker products:
@z

@x
- Docker Desktop: View the **Insights** page in [Docker Home](https://app.docker.com/). For more details, see [Insights](./insights.md).
- Docker Hub: View the [**Usage** page](https://hub.docker.com/usage) in Docker Hub.
- Docker Build Cloud: View the **Build minutes** page in [Docker Build Cloud](http://app.docker.com/build).
- Docker Scout: View the [**Repository settings** page](https://scout.docker.com/settings/repos) in Docker Scout.
- Testcontainers Cloud: View the [**Billing** page](https://app.testcontainers.cloud/dashboard/billing) in Testcontainers Cloud.
@y
- Docker Desktop: View the **Insights** page in [Docker Home](https://app.docker.com/). For more details, see [Insights](./insights.md).
- Docker Hub: View the [**Usage** page](https://hub.docker.com/usage) in Docker Hub.
- Docker Build Cloud: View the **Build minutes** page in [Docker Build Cloud](http://app.docker.com/build).
- Docker Scout: View the [**Repository settings** page](https://scout.docker.com/settings/repos) in Docker Scout.
- Testcontainers Cloud: View the [**Billing** page](https://app.testcontainers.cloud/dashboard/billing) in Testcontainers Cloud.
@z

@x
If your usage or seat count exceeds your subscription amount, you can
[scale your subscription](../../subscription/scale.md) to meet your needs.
@y
If your usage or seat count exceeds your subscription amount, you can
[scale your subscription](../../subscription/scale.md) to meet your needs.
@z
