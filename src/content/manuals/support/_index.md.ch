%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Get support for Docker products
linkTitle: Support
description: Learn about support options for Docker products including paid subscriptions and community resources
keywords: support, help, docker desktop, subscriptions, community, troubleshooting
@y
title: Get support for Docker products
linkTitle: Support
description: Learn about support options for Docker products including paid subscriptions and community resources
keywords: support, help, docker desktop, subscriptions, community, troubleshooting
@z

@x
Docker offers multiple support channels depending on your subscription level and needs.
@y
Docker offers multiple support channels depending on your subscription level and needs.
@z

@x
## Paid subscription support
@y
## Paid subscription support
@z

@x
All Docker Pro, Team, and Business subscribers receive email support for Docker products.
@y
All Docker Pro, Team, and Business subscribers receive email support for Docker products.
@z

@x
### Support response times
@y
### Support response times
@z

@x
- Docker Pro: 3 business day response
- Docker Team: 2 business day response, 24×5 availability
- Docker Business: 1 business day response, 24×5 availability
@y
- Docker Pro: 3 business day response
- Docker Team: 2 business day response, 24×5 availability
- Docker Business: 1 business day response, 24×5 availability
@z

@x
> [!TIP]
>
> Premium Support with faster response times and 24×7 availability is available as an add-on for [Docker Business subscribers](https://www.docker.com/pricing/).
@y
> [!TIP]
>
> Premium Support with faster response times and 24×7 availability is available as an add-on for [Docker Business subscribers](https://www.docker.com/pricing/).
@z

@x
### Support severity levels
@y
### Support severity levels
@z

@x
| Level    | Description                                                                                                                                                                |
| :------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Critical | Widespread or company-wide service outage affecting many customers or all users within a single organization. Business operations are halted with no workaround available. |
| High     | Team or department-level impact preventing significant users from accessing core functionality. Severe business impact with no workaround exists.                          |
| Medium   | Individual user or small group impact causing partial loss of functionality. Business operations continue, often with workarounds available but reduced productivity.      |
@y
| Level    | Description                                                                                                                                                                |
| :------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Critical | Widespread or company-wide service outage affecting many customers or all users within a single organization. Business operations are halted with no workaround available. |
| High     | Team or department-level impact preventing significant users from accessing core functionality. Severe business impact with no workaround exists.                          |
| Medium   | Individual user or small group impact causing partial loss of functionality. Business operations continue, often with workarounds available but reduced productivity.      |
@z

@x
### Request support
@y
### Request support
@z

@x
> [!TIP]
>
> Before reaching out for support, review the troubleshooting documentation for your product.
@y
> [!TIP]
>
> Before reaching out for support, review the troubleshooting documentation for your product.
@z

@x
If you have a paid Docker subscription, [contact the Support team](https://hub.docker.com/support/contact/).
@y
If you have a paid Docker subscription, [contact the Support team](https://hub.docker.com/support/contact/).
@z

@x
## Community support
@y
## Community support
@z

@x
All Docker users can seek support through community resources, where Docker or the community respond on a best effort basis:
@y
All Docker users can seek support through community resources, where Docker or the community respond on a best effort basis:
@z

@x
- [Docker Community Forums](https://forums.docker.com/)
- [Docker Community Slack](http://dockr.ly/comm-slack)
@y
- [Docker Community Forums](https://forums.docker.com/)
- [Docker Community Slack](http://dockr.ly/comm-slack)
@z

@x
## Docker Desktop support
@y
## Docker Desktop support
@z

@x
Docker Desktop support is available with a paid subscription.
@y
Docker Desktop support is available with a paid subscription.
@z

@x
### Scope of support
@y
### Scope of support
@z

@x
{{< tabs >}}
{{< tab name="Covered">}}
@y
{{< tabs >}}
{{< tab name="Covered">}}
@z

@x
Docker Desktop support includes:
@y
Docker Desktop support includes:
@z

@x
- Account management and billing
- Configuration and installation issues
- Desktop updates
- Sign-in issues
- Push or pull issues, including rate limiting
- Application crashes or unexpected behavior
- Automated builds
- Basic product 'how to' questions
@y
- Account management and billing
- Configuration and installation issues
- Desktop updates
- Sign-in issues
- Push or pull issues, including rate limiting
- Application crashes or unexpected behavior
- Automated builds
- Basic product 'how to' questions
@z

@x
**Windows-specific:**
@y
**Windows-specific:**
@z

@x
- Turning on virtualization in BIOS
- Turning on Windows features
- Running inside [certain VM or VDI environments](/manuals/desktop/setup/vm-vdi.md) (Docker Business only)
@y
- Turning on virtualization in BIOS
- Turning on Windows features
- Running inside [certain VM or VDI environments](manuals/desktop/setup/vm-vdi.md) (Docker Business only)
@z

@x
{{< /tab >}}
{{< tab name="Not covered">}}
@y
{{< /tab >}}
{{< tab name="Not covered">}}
@z

@x
Docker Desktop support excludes:
@y
Docker Desktop support excludes:
@z

@x
- Unsupported operating systems, including beta/preview versions
- Running containers of a different architecture using emulation
- Docker Engine, Docker CLI, or other bundled Linux components
- Kubernetes
- Features labeled as experimental
- System/Server administration activities
- Desktop as a production runtime
- Scale deployment/multi-machine installation
- Routine product maintenance (data backup, disk space, log rotation)
- Third-party applications not provided by Docker
- Altered or modified Docker software
- Hardware malfunction, abuse, or improper use
- Versions older than the latest release (except Docker Business)
- Training, customization, and integration
- Running multiple instances on a single machine
@y
- Unsupported operating systems, including beta/preview versions
- Running containers of a different architecture using emulation
- Docker Engine, Docker CLI, or other bundled Linux components
- Kubernetes
- Features labeled as experimental
- System/Server administration activities
- Desktop as a production runtime
- Scale deployment/multi-machine installation
- Routine product maintenance (data backup, disk space, log rotation)
- Third-party applications not provided by Docker
- Altered or modified Docker software
- Hardware malfunction, abuse, or improper use
- Versions older than the latest release (except Docker Business)
- Training, customization, and integration
- Running multiple instances on a single machine
@z

@x
> [!NOTE]
>
> Support for [running Docker Desktop in a VM or VDI environment](/manuals/desktop/setup/vm-vdi.md) is only available to Docker Business customers.
@y
> [!NOTE]
>
> Support for [running Docker Desktop in a VM or VDI environment](manuals/desktop/setup/vm-vdi.md) is only available to Docker Business customers.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Supported versions
@y
### Supported versions
@z

@x
- Docker Business: Versions up to six months older than the latest version (fixes applied to latest version only)
- Docker Pro and Team: Latest version only
@y
- Docker Business: Versions up to six months older than the latest version (fixes applied to latest version only)
- Docker Pro and Team: Latest version only
@z

@x
### Number of machines
@y
### Number of machines
@z

@x
- Docker Pro: One machine
- Docker Team: Number of machines equal to subscription seats
- Docker Business: Unlimited machines
@y
- Docker Pro: One machine
- Docker Team: Number of machines equal to subscription seats
- Docker Business: Unlimited machines
@z

@x
### Supported operating systems
@y
### Supported operating systems
@z

@x
- [Mac system requirements](/manuals/desktop/setup/install/mac-install.md#system-requirements)
- [Windows system requirements](/manuals/desktop/setup/install/windows-install.md#system-requirements)
- [Linux system requirements](/manuals/desktop/setup/install/linux/_index.md#system-requirements)
@y
- [Mac system requirements](manuals/desktop/setup/install/mac-install.md#system-requirements)
- [Windows system requirements](manuals/desktop/setup/install/windows-install.md#system-requirements)
- [Linux system requirements](manuals/desktop/setup/install/linux/_index.md#system-requirements)
@z

@x
### Community resources
@y
### Community resources
@z

@x
- [Docker Desktop issue tracker](https://github.com/docker/desktop-feedback)
@y
- [Docker Desktop issue tracker](https://github.com/docker/desktop-feedback)
@z

@x
### Diagnostic data and privacy
@y
### Diagnostic data and privacy
@z

@x
When uploading diagnostics, the bundle may contain personal data such as usernames and IP addresses. Diagnostics bundles are only accessible to Docker, Inc. employees directly involved in diagnosing issues.
@y
When uploading diagnostics, the bundle may contain personal data such as usernames and IP addresses. Diagnostics bundles are only accessible to Docker, Inc. employees directly involved in diagnosing issues.
@z

@x
By default, Docker, Inc. deletes uploaded diagnostics bundles after 30 days. You may request removal of a diagnostics bundle by specifying the diagnostics ID or your GitHub ID. Docker, Inc. only uses the data to investigate specific user issues but may derive high-level (non-personal) metrics.
@y
By default, Docker, Inc. deletes uploaded diagnostics bundles after 30 days. You may request removal of a diagnostics bundle by specifying the diagnostics ID or your GitHub ID. Docker, Inc. only uses the data to investigate specific user issues but may derive high-level (non-personal) metrics.
@z

@x
For more information, see [Docker Data Processing Agreement](https://www.docker.com/legal/data-processing-agreement).
@y
For more information, see [Docker Data Processing Agreement](https://www.docker.com/legal/data-processing-agreement).
@z
