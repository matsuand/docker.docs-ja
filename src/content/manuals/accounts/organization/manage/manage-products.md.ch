%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Manage usage and access for Docker products
linkTitle: Products
@y
title: Manage usage and access for Docker products
linkTitle: Products
@z

@x
description: >-
  Control which Docker products organization members can use, and find
  where to check usage
keywords: organization, product access, product usage, access control, seats,
  licenses, docker desktop, docker hub, docker scout, docker build cloud,
  docker offload, docker offload v1, testcontainers cloud, docker sandboxes,
  ai governance
@y
description: >-
  Control which Docker products organization members can use, and find
  where to check usage
keywords: organization, product access, product usage, access control, seats,
  licenses, docker desktop, docker hub, docker scout, docker build cloud,
  docker offload, docker offload v1, testcontainers cloud, docker sandboxes,
  ai governance
@z

@x
{{< summary-bar feature_name="Admin orgs" >}}
@y
{{< summary-bar feature_name="Admin orgs" >}}
@z

@x
Use this page to learn how to control and monitor product access and usage
for your organization's members.
@y
Use this page to learn how to control and monitor product access and usage
for your organization's members.
@z

@x
## How product access and usage works
@y
## How product access and usage works
@z

@x
Members receive access to products through seats, licenses, and the controls
you configure:
@y
Members receive access to products through seats, licenses, and the controls
you configure:
@z

@x
- A member uses one seat on a Docker Team or Business
  [subscription](/manuals/subscription-billing/plans/_index.md). The seat
  includes the products in the plan, such as Docker Desktop and Docker Hub.
- Some products need a separate
  [license](/manuals/accounts/organization/manage/manage-licenses.md) that
  you assign to teams or members.
- After a member has a seat or license, the controls on this page set what
  they can do in each product, such as which Hub images they can pull,
  which repositories Scout analyzes, or whether Docker Offload v1 is
  available in Docker Desktop.
@y
- A member uses one seat on a Docker Team or Business
  [subscription](manuals/subscription-billing/plans/_index.md). The seat
  includes the products in the plan, such as Docker Desktop and Docker Hub.
- Some products need a separate
  [license](manuals/accounts/organization/manage/manage-licenses.md) that
  you assign to teams or members.
- After a member has a seat or license, the controls on this page set what
  they can do in each product, such as which Hub images they can pull,
  which repositories Scout analyzes, or whether Docker Offload v1 is
  available in Docker Desktop.
@z

@x
Where a product has a usage allowance, the **Usage** section shows where to
check how much of it the organization has used. Products measure that
allowance in different units, such as build minutes, Hub pulls, or runtime
minutes.
@y
Where a product has a usage allowance, the **Usage** section shows where to
check how much of it the organization has used. Products measure that
allowance in different units, such as build minutes, Hub pulls, or runtime
minutes.
@z

@x
This page covers product access, but does not cover access tokens.
For organization access tokens,
see [Access tokens](/manuals/security/access-tokens/_index.md).
@y
This page covers product access, but does not cover access tokens.
For organization access tokens,
see [Access tokens](manuals/security/access-tokens/_index.md).
@z

@x
## Docker Desktop
@y
## Docker Desktop
@z

@x
For setup and configuration, see the [Docker Desktop manual](../../../desktop/_index.md).
@y
For setup and configuration, see the [Docker Desktop manual](../../../desktop/_index.md).
@z

@x
### Access
@y
### Access
@z

@x
To manage Docker Desktop access:
@y
To manage Docker Desktop access:
@z

@x
1. [Enforce sign-in](/manuals/desktop/enterprise/enforce-sign-in/_index.md).
1. Manage members [manually](./members.md) or use
   [provisioning](../../../security/provisioning/_index.md).
@y
1. [Enforce sign-in](manuals/desktop/enterprise/enforce-sign-in/_index.md).
1. Manage members [manually](./members.md) or use
   [provisioning](../../../security/provisioning/_index.md).
@z

@x
With sign-in enforced, only members of your organization can use Docker
Desktop after they sign in.
@y
With sign-in enforced, only members of your organization can use Docker
Desktop after they sign in.
@z

@x
Image Access and Registry Access are Docker Desktop controls. Image Access
limits which images members can pull from Docker Hub. Registry Access
limits which registries Docker Desktop can reach.
@y
Image Access and Registry Access are Docker Desktop controls. Image Access
limits which images members can pull from Docker Hub. Registry Access
limits which registries Docker Desktop can reach.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization, then select **Docker Desktop**.
1. Select **Registry Access** to configure
   [Registry Access Management](/manuals/desktop/enterprise/hardened-desktop/registry-access-management.md).
1. Select **Image Access** to control
   [Image Access Management](/manuals/desktop/enterprise/hardened-desktop/image-access-management.md).
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization, then select **Docker Desktop**.
1. Select **Registry Access** to configure
   [Registry Access Management](manuals/desktop/enterprise/hardened-desktop/registry-access-management.md).
1. Select **Image Access** to control
   [Image Access Management](manuals/desktop/enterprise/hardened-desktop/image-access-management.md).
@z

@x
### Usage
@y
### Usage
@z

@x
Desktop insights shows how members use Docker Desktop, including active
users, builds, containers, images, and extensions.
@y
Desktop insights shows how members use Docker Desktop, including active
users, builds, containers, images, and extensions.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Docker Desktop**, then
   [**Desktop insights**](/manuals/accounts/organization/insights.md).
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Docker Desktop**, then
   [**Desktop insights**](manuals/accounts/organization/insights.md).
@z

@x
## Docker Hub
@y
## Docker Hub
@z

@x
For setup and configuration, see the [Docker Hub manual](../../../docker-hub/_index.md).
@y
For setup and configuration, see the [Docker Hub manual](../../../docker-hub/_index.md).
@z

@x
### Usage
@y
### Usage
@z

@x
Hub usage counts how many times members pull images and how much space
your organization's repositories take up.
@y
Hub usage counts how many times members pull images and how much space
your organization's repositories take up.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Go to Hub**.
1. Select **Usage**, then **Pulls** or **Storage**. For example,
   `https://hub.docker.com/orgs/{namespace}/usage`.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Go to Hub**.
1. Select **Usage**, then **Pulls** or **Storage**. For example,
   `https://hub.docker.com/orgs/{namespace}/usage`.
@z

@x
## Docker Build Cloud
@y
## Docker Build Cloud
@z

@x
For setup and configuration, see the [Docker Build Cloud manual](../../../build-cloud/_index.md).
@y
For setup and configuration, see the [Docker Build Cloud manual](../../../build-cloud/_index.md).
@z

@x
### Access
@y
### Access
@z

@x
To set up Docker Build Cloud, sign in to
[Docker Build Cloud](https://app.docker.com/build) and follow the on-screen
instructions.
@y
To set up Docker Build Cloud, sign in to
[Docker Build Cloud](https://app.docker.com/build) and follow the on-screen
instructions.
@z

@x
To manage Docker Build Cloud access:
@y
To manage Docker Build Cloud access:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Build Cloud**, then **Account settings**.
1. Select **Lock access to Docker Build Account**.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Build Cloud**, then **Account settings**.
1. Select **Lock access to Docker Build Account**.
@z

@x
> [!WARNING]
>
> **Lock access to Docker Build Account** removes the ability to use cloud
> builders or build minutes, and it purges build data.
@y
> [!WARNING]
>
> **Lock access to Docker Build Account** removes the ability to use cloud
> builders or build minutes, and it purges build data.
@z

@x
### Usage
@y
### Usage
@z

@x
Build minutes are the time your organization spends on cloud builds.
@y
Build minutes are the time your organization spends on cloud builds.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Build Cloud**, then **Build minutes**.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Build Cloud**, then **Build minutes**.
@z

@x
## Docker Scout
@y
## Docker Scout
@z

@x
For setup and configuration, see the [Docker Scout manual](../../../scout/_index.md).
@y
For setup and configuration, see the [Docker Scout manual](../../../scout/_index.md).
@z

@x
### Access
@y
### Access
@z

@x
To set up Docker Scout, sign in to [Docker Scout](https://scout.docker.com/)
and follow the on-screen instructions.
@y
To set up Docker Scout, sign in to [Docker Scout](https://scout.docker.com/)
and follow the on-screen instructions.
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
1. To manage which repositories Docker Scout analyzes, select
   **Repository settings**. See
   [Repository settings](../../../scout/explore/dashboard.md#repository-settings).
1. To manage Docker Scout for local images in Docker Desktop, use
   [Settings Management](/manuals/desktop/enterprise/hardened-desktop/settings-management/_index.md)
   and set **SBOM indexing** (`sbomIndexing`) to **Enabled**, **Disabled**,
   or **User defined**. **Enabled** indexes images when they are inspected
   in Docker Desktop or with Docker Scout CLI commands.
@y
1. Sign in to [Docker Home](https://app.docker.com/), then select
   [Docker Scout](https://scout.docker.com/).
1. Select your organization, then **Settings**.
1. To manage which repositories Docker Scout analyzes, select
   **Repository settings**. See
   [Repository settings](../../../scout/explore/dashboard.md#repository-settings).
1. To manage Docker Scout for local images in Docker Desktop, use
   [Settings Management](manuals/desktop/enterprise/hardened-desktop/settings-management/_index.md)
   and set **SBOM indexing** (`sbomIndexing`) to **Enabled**, **Disabled**,
   or **User defined**. **Enabled** indexes images when they are inspected
   in Docker Desktop or with Docker Scout CLI commands.
@z

@x
### Usage
@y
### Usage
@z

@x
[Repository settings](../../../scout/explore/dashboard.md#repository-settings)
lists the repositories Docker Scout analyzes. Follow the access steps above
and select **Repository settings**.
@y
[Repository settings](../../../scout/explore/dashboard.md#repository-settings)
lists the repositories Docker Scout analyzes. Follow the access steps above
and select **Repository settings**.
@z

@x
## Testcontainers Cloud
@y
## Testcontainers Cloud
@z

@x
For setup and configuration, see
[Get started with Testcontainers Cloud](https://testcontainers.com/cloud/docs/#getting-started).
@y
For setup and configuration, see
[Get started with Testcontainers Cloud](https://testcontainers.com/cloud/docs/#getting-started).
@z

@x
### Access
@y
### Access
@z

@x
To set up Testcontainers Cloud, sign in to
[Testcontainers Cloud](https://app.testcontainers.cloud/) and follow the
on-screen instructions.
@y
To set up Testcontainers Cloud, sign in to
[Testcontainers Cloud](https://app.testcontainers.cloud/) and follow the
on-screen instructions.
@z

@x
To manage access to Testcontainers Cloud:
@y
To manage access to Testcontainers Cloud:
@z

@x
1. Sign in to [Testcontainers Cloud](https://app.testcontainers.cloud/),
   then select the menu icon.
1. Select **Account**, then **Settings**.
1. Select **Lock access to Testcontainers Cloud**.
@y
1. Sign in to [Testcontainers Cloud](https://app.testcontainers.cloud/),
   then select the menu icon.
1. Select **Account**, then **Settings**.
1. Select **Lock access to Testcontainers Cloud**.
@z

@x
### Usage
@y
### Usage
@z

@x
Billing shows the Testcontainers Cloud runtime minutes included with your
subscription.
@y
Billing shows the Testcontainers Cloud runtime minutes included with your
subscription.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Go to Testcontainers Cloud**.
1. Select the menu icon, then
   [**Billing**](https://app.testcontainers.cloud/dashboard/billing).
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Go to Testcontainers Cloud**.
1. Select the menu icon, then
   [**Billing**](https://app.testcontainers.cloud/dashboard/billing).
@z

@x
## Docker Offload v1
@y
## Docker Offload v1
@z

@x
For setup and configuration, see the [Docker Offload v1 manual](../../../offload/v1/_index.md).
@y
For setup and configuration, see the [Docker Offload v1 manual](../../../offload/v1/_index.md).
@z

@x
Docker Offload v1 uses its own [license](./manage-licenses.md). Assign it to
teams or members, or turn on automatic assignment so members receive a
license the first time they use Docker Offload v1.
@y
Docker Offload v1 uses its own [license](./manage-licenses.md). Assign it to
teams or members, or turn on automatic assignment so members receive a
license the first time they use Docker Offload v1.
@z

@x
### Access
@y
### Access
@z

@x
**Offload access** turns Docker Offload v1 on or off for the organization.
**Disabled** removes the ability for anybody in the organization, including
CI/CD, to use Offload resources or consume Offload minutes.
@y
**Offload access** turns Docker Offload v1 on or off for the organization.
**Disabled** removes the ability for anybody in the organization, including
CI/CD, to use Offload resources or consume Offload minutes.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Docker Offload**, then **Offload access**.
1. Set **Enable Docker Offload** to **Enabled** or **Disabled**.
1. When Offload is enabled, select **Allow GPU access** to let members run
   GPU workloads in cloud mode.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Docker Offload**, then **Offload access**.
1. Set **Enable Docker Offload** to **Enabled** or **Disabled**.
1. When Offload is enabled, select **Allow GPU access** to let members run
   GPU workloads in cloud mode.
@z

@x
To set the Docker Offload v1 default inside Docker Desktop, use [Settings
Management](/manuals/desktop/enterprise/hardened-desktop/settings-management/_index.md):
@y
To set the Docker Offload v1 default inside Docker Desktop, use [Settings
Management](manuals/desktop/enterprise/hardened-desktop/settings-management/_index.md):
@z

@x
1. Select **Docker Desktop**, then **Settings Management**.
1. Set **Enable Docker Offload** to one of these configurations:
   - **Always enabled**: Offload stays on, and members cannot turn it off.
   - **Enabled**: Offload is on by default, and members can turn it off.
   - **Disabled**: Offload is off by default, and members can turn it on.
   - **Always disabled**: Offload stays off, and members cannot turn it on.
   - **User defined**: Docker Desktop does not enforce a default. Members
     choose whether to turn Offload on.
1. Select **Save**.
@y
1. Select **Docker Desktop**, then **Settings Management**.
1. Set **Enable Docker Offload** to one of these configurations:
   - **Always enabled**: Offload stays on, and members cannot turn it off.
   - **Enabled**: Offload is on by default, and members can turn it off.
   - **Disabled**: Offload is off by default, and members can turn it on.
   - **Always disabled**: Offload stays off, and members cannot turn it on.
   - **User defined**: Docker Desktop does not enforce a default. Members
     choose whether to turn Offload on.
1. Select **Save**.
@z

@x
For more details on Settings Management, see the [Settings
reference](/manuals/desktop/enterprise/hardened-desktop/settings-management/settings-reference.md#enable-docker-offload).
@y
For more details on Settings Management, see the [Settings
reference](manuals/desktop/enterprise/hardened-desktop/settings-management/settings-reference.md#enable-docker-offload).
@z

@x
### Usage
@y
### Usage
@z

@x
[Offload activity](../../../offload/v1/usage.md) shows Docker Offload v1
sessions, including how long they ran and which images they used.
@y
[Offload activity](../../../offload/v1/usage.md) shows Docker Offload v1
sessions, including how long they ran and which images they used.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Docker Offload**, then **Offload activity**.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Docker Offload**, then **Offload activity**.
@z

@x
## AI Governance
@y
## AI Governance
@z

@x
For setup and configuration, see
[Docker Sandboxes](../../../ai/sandboxes/_index.md) and
[AI Governance](../../../ai/governance/_index.md).
@y
For setup and configuration, see
[Docker Sandboxes](../../../ai/sandboxes/_index.md) and
[AI Governance](../../../ai/governance/_index.md).
@z

@x
AI Governance is the separate paid subscription that adds the
organization-level controls to
[Docker Sandboxes](../../../ai/sandboxes/_index.md): policies for what
members' local sandboxes can reach on the network, mount from the filesystem,
or call through MCP, plus sign-in enforcement and audit logs.
@y
AI Governance is the separate paid subscription that adds the
organization-level controls to
[Docker Sandboxes](../../../ai/sandboxes/_index.md): policies for what
members' local sandboxes can reach on the network, mount from the filesystem,
or call through MCP, plus sign-in enforcement and audit logs.
@z

@x
### Access
@y
### Access
@z

@x
Organization policies govern only members who hold an AI Governance license.
@y
Organization policies govern only members who hold an AI Governance license.
@z

@x
- [Manage licenses](./manage-licenses.md): assign AI Governance licenses to
  teams or members, or turn on **Automatic license assignment** so members
  receive a license when they run `sbx login`.
- [Organization policies](../../../ai/governance/organization/policies/create-manage.md):
  create network, filesystem, and MCP policies under **AI Platform** in Docker
  Home, and scope them to the whole organization or to specific teams.
- [Sign-in enforcement](../../../ai/governance/organization/sign-in-enforcement.md):
  deploy a configuration through your endpoint management tooling so
  `sbx login` succeeds only for members of your organization.
@y
- [Manage licenses](./manage-licenses.md): assign AI Governance licenses to
  teams or members, or turn on **Automatic license assignment** so members
  receive a license when they run `sbx login`.
- [Organization policies](../../../ai/governance/organization/policies/create-manage.md):
  create network, filesystem, and MCP policies under **AI Platform** in Docker
  Home, and scope them to the whole organization or to specific teams.
- [Sign-in enforcement](../../../ai/governance/organization/sign-in-enforcement.md):
  deploy a configuration through your endpoint management tooling so
  `sbx login` succeeds only for members of your organization.
@z

@x
### Usage
@y
### Usage
@z

@x
- [View licenses](./manage-licenses.md#view-licenses): the **Licenses** page
  shows how many AI Governance licenses you have, how many are assigned, and
  whether the assignments go to teams or to individual members.
- [View and export audit events](../../../ai/governance/organization/audit/view-export.md):
  **AI Platform** > **Audit logs** shows the policy decisions Docker recorded
  for members' sandboxes, including who made the request, which resource it
  targeted, and whether Docker allowed or denied it.
@y
- [View licenses](./manage-licenses.md#view-licenses): the **Licenses** page
  shows how many AI Governance licenses you have, how many are assigned, and
  whether the assignments go to teams or to individual members.
- [View and export audit events](../../../ai/governance/organization/audit/view-export.md):
  **AI Platform** > **Audit logs** shows the policy decisions Docker recorded
  for members' sandboxes, including who made the request, which resource it
  targeted, and whether Docker allowed or denied it.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Manage subscription seats](./manage-seats.md) to add seats, and
  [Manage licenses](./manage-licenses.md) to assign product licenses.
- [Invite and manage organization members](./members.md) to invite people
  and assign roles.
- [Plan and maintain user access](./user-access.md) to choose roles,
  provisioning, and how you review access.
@y
- [Manage subscription seats](./manage-seats.md) to add seats, and
  [Manage licenses](./manage-licenses.md) to assign product licenses.
- [Invite and manage organization members](./members.md) to invite people
  and assign roles.
- [Plan and maintain user access](./user-access.md) to choose roles,
  provisioning, and how you review access.
@z
