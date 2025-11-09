%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Configure Docker Offload
linktitle: Configure
@y
title: Configure Docker Offload
linktitle: Configure
@z

@x
description: Learn how to configure build settings for Docker Offload.
keywords: cloud, configuration, settings, offload
@y
description: Learn how to configure build settings for Docker Offload.
keywords: cloud, configuration, settings, offload
@z

@x
{{< summary-bar feature_name="Docker Offload" >}}
@y
{{< summary-bar feature_name="Docker Offload" >}}
@z

@x
You can configure Docker Offload settings at different levels depending on your role. Organization owners can manage
settings for all users in their organization, while individual developers can configure their own Docker Desktop
settings when allowed by their organization.
@y
You can configure Docker Offload settings at different levels depending on your role. Organization owners can manage
settings for all users in their organization, while individual developers can configure their own Docker Desktop
settings when allowed by their organization.
@z

@x
## Manage settings for your organization
@y
## Manage settings for your organization
@z

@x
For organization owners, you can manage Docker Offload settings for all users in your organization. For more details,
see [Manage Docker products](../admin/organization/manage-products.md). To view usage and configure billing for Docker
Offload, see [Docker Offload usage and billing](/offload/usage/).
@y
For organization owners, you can manage Docker Offload settings for all users in your organization. For more details,
see [Manage Docker products](../admin/organization/manage-products.md). To view usage and configure billing for Docker
Offload, see [Docker Offload usage and billing](__SUBDIR__/offload/usage/).
@z

@x
## Configure settings in Docker Desktop
@y
## Configure settings in Docker Desktop
@z

@x
For developers, you can manage Docker Offload settings in Docker Desktop. To manage settings:
@y
For developers, you can manage Docker Offload settings in Docker Desktop. To manage settings:
@z

@x
1. Open the Docker Desktop Dashboard and sign in.
2. Select the settings icon in the Docker Desktop Dashboard header.
3. In **Settings**, select **Docker Offload**.
@y
1. Open the Docker Desktop Dashboard and sign in.
2. Select the settings icon in the Docker Desktop Dashboard header.
3. In **Settings**, select **Docker Offload**.
@z

@x
   Here you can:
@y
   Here you can:
@z

@x
   - Toggle **Enable Docker Offload**. When enabled, you can start Offload sessions.
   - Select **Idle timeout**. This is the duration of time between no activity and Docker Offload entering idle mode.
     For details about idle timeout, see [Understand active and idle states](#understand-active-and-idle-states).
@y
   - Toggle **Enable Docker Offload**. When enabled, you can start Offload sessions.
   - Select **Idle timeout**. This is the duration of time between no activity and Docker Offload entering idle mode.
     For details about idle timeout, see [Understand active and idle states](#understand-active-and-idle-states).
@z

@x
### Understand active and idle states
@y
### Understand active and idle states
@z

@x
Docker Offload automatically transitions between active and idle states to help
you control costs while maintaining a seamless development experience.
@y
Docker Offload automatically transitions between active and idle states to help
you control costs while maintaining a seamless development experience.
@z

@x
#### When your session is active
@y
#### When your session is active
@z

@x
Your Docker Offload environment is active when you're building images, running
containers, or actively interacting with them, such as viewing logs or
maintaining an open network connection. During active state:
@y
Your Docker Offload environment is active when you're building images, running
containers, or actively interacting with them, such as viewing logs or
maintaining an open network connection. During active state:
@z

@x
- Usage is charged
- A remote Docker Engine is connected to your local machine
- All container operations execute in the cloud environment
@y
- Usage is charged
- A remote Docker Engine is connected to your local machine
- All container operations execute in the cloud environment
@z

@x
#### When your session is idle
@y
#### When your session is idle
@z

@x
When there's no activity, Docker Offload transitions to idle state. During idle
state:
@y
When there's no activity, Docker Offload transitions to idle state. During idle
state:
@z

@x
- You are not charged for usage
- The remote connection is suspended
- No containers are running in the cloud
@y
- You are not charged for usage
- The remote connection is suspended
- No containers are running in the cloud
@z

@x
The idle transition delay can be configured in Docker Desktop settings, ranging
from 10 seconds to 1 hour. This setting determines how long Docker Offload
waits after detecting inactivity before transitioning to idle state.
@y
The idle transition delay can be configured in Docker Desktop settings, ranging
from 10 seconds to 1 hour. This setting determines how long Docker Offload
waits after detecting inactivity before transitioning to idle state.
@z

@x
#### How your session is preserved
@y
#### How your session is preserved
@z

@x
If your session has been idle for less than 5 minutes and you resume activity,
your previous containers and images are preserved and remain available. This
allows you to pick up right where you left off.
@y
If your session has been idle for less than 5 minutes and you resume activity,
your previous containers and images are preserved and remain available. This
allows you to pick up right where you left off.
@z

@x
However, if the idle period exceeds 5 minutes, a new session starts with a
clean environment and any containers, images, or volumes from the previous
session are deleted.
@y
However, if the idle period exceeds 5 minutes, a new session starts with a
clean environment and any containers, images, or volumes from the previous
session are deleted.
@z

@x
> [!NOTE]
>
> Transitioning from active to idle and back to active within 5 minutes will be
> charged as continuous usage.
@y
> [!NOTE]
>
> Transitioning from active to idle and back to active within 5 minutes will be
> charged as continuous usage.
@z
