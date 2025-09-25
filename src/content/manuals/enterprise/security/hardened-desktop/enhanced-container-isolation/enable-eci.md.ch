%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Enable Enhanced Container Isolation
linkTitle: Enable ECI
description: Enable Enhanced Container Isolation to secure containers in Docker Desktop
keywords: enhanced container isolation, enable eci, container security, docker desktop setup
@y
title: Enable Enhanced Container Isolation
linkTitle: Enable ECI
description: Enable Enhanced Container Isolation to secure containers in Docker Desktop
keywords: enhanced container isolation, enable eci, container security, docker desktop setup
@z

@x
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@y
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@z

@x
ECI prevents malicious containers from compromising Docker Desktop while maintaining full developer productivity.
@y
ECI prevents malicious containers from compromising Docker Desktop while maintaining full developer productivity.
@z

@x
This page shows you how to turn on Enhanced Container Isolation (ECI) and verify it's working correctly.
@y
This page shows you how to turn on Enhanced Container Isolation (ECI) and verify it's working correctly.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin, you must have:
@y
Before you begin, you must have:
@z

@x
- A Docker Business subscription
- Docker Desktop 4.13 or later
- [Enforced sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md) (for administrators managing organization-wide settings only)
@y
- A Docker Business subscription
- Docker Desktop 4.13 or later
- [Enforced sign-in](manuals/enterprise/security/enforce-sign-in/_index.md) (for administrators managing organization-wide settings only)
@z

@x
## Enable Enhanced Container Isolation
@y
## Enable Enhanced Container Isolation
@z

@x
### For developers
@y
### For developers
@z

@x
Turn on ECI in your Docker Desktop settings:
@y
Turn on ECI in your Docker Desktop settings:
@z

@x
1. Sign in to your organization in Docker Desktop. Your organization must have
a Docker Business subscription.
1. Stop and remove all existing containers:
@y
1. Sign in to your organization in Docker Desktop. Your organization must have
a Docker Business subscription.
1. Stop and remove all existing containers:
@z

@x
    ```console
    $ docker stop $(docker ps -q)
    $ docker rm $(docker ps -aq)
    ```
@y
    ```console
    $ docker stop $(docker ps -q)
    $ docker rm $(docker ps -aq)
    ```
@z

@x
1. In Docker Desktop, go to **Settings** > **General**.
1. Select the **Use Enhanced Container Isolation** checkbox.
1. Select **Apply and restart**.
@y
1. In Docker Desktop, go to **Settings** > **General**.
1. Select the **Use Enhanced Container Isolation** checkbox.
1. Select **Apply and restart**.
@z

@x
> [!IMPORTANT]
>
> ECI doesn't protect containers created before turning on the feature. Remove existing containers before turning on ECI.
@y
> [!IMPORTANT]
>
> ECI doesn't protect containers created before turning on the feature. Remove existing containers before turning on ECI.
@z

@x
### For administrators
@y
### For administrators
@z

@x
Configure Enhanced Container Isolation organization-wide using Settings Management:
@y
Configure Enhanced Container Isolation organization-wide using Settings Management:
@z

@x
{{< tabs >}}
{{< tab name="Admin Console" >}}
@y
{{< tabs >}}
{{< tab name="Admin Console" >}}
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization from the top-left account drop-down.
1. Go to **Admin Console** > **Desktop Settings Management**.
1. [Create or edit a setting policy](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md).
1. Set **Enhanced Container Isolation** to **Always enabled**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization from the top-left account drop-down.
1. Go to **Admin Console** > **Desktop Settings Management**.
1. [Create or edit a setting policy](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md).
1. Set **Enhanced Container Isolation** to **Always enabled**.
@z

@x
{{< /tab >}}
{{< tab name="JSON file" >}}
@y
{{< /tab >}}
{{< tab name="JSON file" >}}
@z

@x
1. Create an [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md) and add:
@y
1. Create an [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md) and add:
@z

@x
      ```json
      {
        "configurationFileVersion": 2,
        "enhancedContainerIsolation": {
          "value": true,
          "locked": true
        }
      }
      ```
@y
      ```json
      {
        "configurationFileVersion": 2,
        "enhancedContainerIsolation": {
          "value": true,
          "locked": true
        }
      }
      ```
@z

@x
1. Configure the following as needed:
    - `"value": true`: Turns on ECI by default (required)
    - `"locked": true`: Prevents developers from turning off ECI
    - `"locked": false`: Allows developers to control the setting
@y
1. Configure the following as needed:
    - `"value": true`: Turns on ECI by default (required)
    - `"locked": true`: Prevents developers from turning off ECI
    - `"locked": false`: Allows developers to control the setting
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Apply the configuration
@y
### Apply the configuration
@z

@x
For ECI settings to take effect:
@y
For ECI settings to take effect:
@z

@x
- New installations: Users launch Docker Desktop and sign in
- Existing installations: Users must fully quit Docker Desktop and relaunch
@y
- New installations: Users launch Docker Desktop and sign in
- Existing installations: Users must fully quit Docker Desktop and relaunch
@z

@x
> [!IMPORTANT]
>
> Restarting from the Docker Desktop menu isn't sufficient. Users must completely quit and reopen Docker Desktop.
@y
> [!IMPORTANT]
>
> Restarting from the Docker Desktop menu isn't sufficient. Users must completely quit and reopen Docker Desktop.
@z

@x
You can also configure [Docker socket mount permissions](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/config.md) for trusted images that need Docker API access.
@y
You can also configure [Docker socket mount permissions](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/config.md) for trusted images that need Docker API access.
@z

@x
## Verify Enhanced Container Isolation is active
@y
## Verify Enhanced Container Isolation is active
@z

@x
After turning on ECI, verify it's working correctly using these methods.
@y
After turning on ECI, verify it's working correctly using these methods.
@z

@x
### Check user namespace mapping
@y
### Check user namespace mapping
@z

@x
Run a container and examine the user namespace mapping:
@y
Run a container and examine the user namespace mapping:
@z

@x
```console
$ docker run --rm alpine cat /proc/self/uid_map
```
@y
```console
$ docker run --rm alpine cat /proc/self/uid_map
```
@z

@x
With ECI turned on:
@y
With ECI turned on:
@z

@x
```text
0     100000      65536
```
@y
```text
0     100000      65536
```
@z

@x
This shows the container's root user (0) maps to an unprivileged user (100000) in the Docker Desktop VM, with a range of 64K user IDs. Each container gets an exclusive user ID range for isolation.
@y
This shows the container's root user (0) maps to an unprivileged user (100000) in the Docker Desktop VM, with a range of 64K user IDs. Each container gets an exclusive user ID range for isolation.
@z

@x
With ECI turned off:
@y
With ECI turned off:
@z

@x
```text
0          0 4294967295
```
@y
```text
0          0 4294967295
```
@z

@x
This shows the container root user (0) maps directly to the VM root user (0), providing less isolation.
@y
This shows the container root user (0) maps directly to the VM root user (0), providing less isolation.
@z

@x
### Check container runtime
@y
### Check container runtime
@z

@x
Verify the container runtime being used:
@y
Verify the container runtime being used:
@z

@x
```console
$ docker inspect --format='{{.HostConfig.Runtime}}' <container_name>
```
@y
```console
$ docker inspect --format='{{.HostConfig.Runtime}}' <container_name>
```
@z

@x
With ECI turned on, it turns `sysbox-runc`. With ECI turned off, it returns
`runc`.
@y
With ECI turned on, it turns `sysbox-runc`. With ECI turned off, it returns
`runc`.
@z

@x
### Test security restrictions
@y
### Test security restrictions
@z

@x
Verify that ECI security restrictions are active.
@y
Verify that ECI security restrictions are active.
@z

@x
Test namespace sharing:
@y
Test namespace sharing:
@z

@x
```console
$ docker run -it --rm --pid=host alpine
```
@y
```console
$ docker run -it --rm --pid=host alpine
```
@z

@x
With ECI turned on, this command fails with an error about Sysbox containers
not being able to share namespaces with the host.
@y
With ECI turned on, this command fails with an error about Sysbox containers
not being able to share namespaces with the host.
@z

@x
Test Docker socket access:
@y
Test Docker socket access:
@z

@x
```console
$ docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock alpine
```
@y
```console
$ docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock alpine
```
@z

@x
With ECI turned on, this command fails unless you've configured Docker socket exceptions for trusted images.
@y
With ECI turned on, this command fails unless you've configured Docker socket exceptions for trusted images.
@z

@x
## What users see with enforced ECI
@y
## What users see with enforced ECI
@z

@x
When administrators enforce Enhanced Container Isolation through
Settings Management:
@y
When administrators enforce Enhanced Container Isolation through
Settings Management:
@z

@x
- The **Use Enhanced Container Isolation** setting appears turned on in
Docker Desktop settings.
- If set to `"locked": true`, the setting is locked and greyed out.
- All new containers automatically use Linux user namespaces.
- Existing development workflows continue to work without modification.
- Users see `sysbox-runc` as the container runtime in `docker inspect` output.
@y
- The **Use Enhanced Container Isolation** setting appears turned on in
Docker Desktop settings.
- If set to `"locked": true`, the setting is locked and greyed out.
- All new containers automatically use Linux user namespaces.
- Existing development workflows continue to work without modification.
- Users see `sysbox-runc` as the container runtime in `docker inspect` output.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Review [Configure Docker socket exceptions and advanced settings](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/config.md).
- Review [Enhanced Container Isolation limitations](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/limitations.md).
@y
- Review [Configure Docker socket exceptions and advanced settings](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/config.md).
- Review [Enhanced Container Isolation limitations](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/limitations.md).
@z
