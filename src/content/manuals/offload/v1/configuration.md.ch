%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Configure Docker Offload v1
linktitle: Configure
@y
title: Configure Docker Offload v1
linktitle: Configure
@z

@x
description: Learn how to configure build settings for Docker Offload v1.
keywords: cloud, configuration, settings, offload
@y
description: Learn how to configure build settings for Docker Offload v1.
keywords: cloud, configuration, settings, offload
@z

@x
{{< summary-bar feature_name="Docker Offload v1" >}}
@y
{{< summary-bar feature_name="Docker Offload v1" >}}
@z

@x
You can configure Docker Offload v1 settings at different levels depending on your
role. Organization owners can manage settings for all users in their
organization, while individual developers can configure their own Docker Desktop
settings when allowed by their organization.
@y
You can configure Docker Offload v1 settings at different levels depending on your
role. Organization owners can manage settings for all users in their
organization, while individual developers can configure their own Docker Desktop
settings when allowed by their organization.
@z

@x
## Manage settings for your organization
@y
## Manage settings for your organization
@z

@x
For organization owners, you can manage Docker Offload v1 settings for all users in
your organization. For more details, see [Manage Docker
products](/manuals/accounts/organization/manage/manage-products.md). To view
usage for Docker Offload v1, see [Docker Offload v1
usage](/manuals/offload/v1/usage.md).
@y
For organization owners, you can manage Docker Offload v1 settings for all users in
your organization. For more details, see [Manage Docker
products](manuals/accounts/organization/manage/manage-products.md). To view
usage for Docker Offload v1, see [Docker Offload v1
usage](manuals/offload/v1/usage.md).
@z

@x
## Configure settings in Docker Desktop
@y
## Configure settings in Docker Desktop
@z

@x
For developers, you can enable or disable Docker Offload in Docker Desktop if
allowed by your organization. To manage this setting:
@y
For developers, you can enable or disable Docker Offload in Docker Desktop if
allowed by your organization. To manage this setting:
@z

@x
1. Open the Docker Desktop Dashboard and sign in.
2. Select the settings icon in the Docker Desktop Dashboard header.
3. In **Settings**, select **Docker Offload**.
4. Toggle **Enable Docker Offload**. When enabled, you can start Offload sessions.
@y
1. Open the Docker Desktop Dashboard and sign in.
2. Select the settings icon in the Docker Desktop Dashboard header.
3. In **Settings**, select **Docker Offload**.
4. Toggle **Enable Docker Offload**. When enabled, you can start Offload sessions.
@z

@x
### Move to the current version of Docker Offload
@y
### Move to the current version of Docker Offload
@z

@x
To use `docker offload create` and `docker --cloud`, turn off **Enable Docker
Offload** and make sure your account has a Docker Agentic Platform
subscription. Turning off the setting alone doesn't grant access. For what
changes, see [Docker Offload](/manuals/offload/_index.md).
@y
To use `docker offload create` and `docker --cloud`, turn off **Enable Docker
Offload** and make sure your account has a Docker Agentic Platform
subscription. Turning off the setting alone doesn't grant access. For what
changes, see [Docker Offload](manuals/offload/_index.md).
@z

@x
You can keep using v1 by leaving the setting on. The two versions can't run at
the same time.
@y
You can keep using v1 by leaving the setting on. The two versions can't run at
the same time.
@z
