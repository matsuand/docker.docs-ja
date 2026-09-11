%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Platform FAQs
linkTitle: Platform
description: Frequently asked questions about Docker platform security, containers, networking, and VMs.
keywords: Docker security, FAQs, authentication, vulnerability reporting, session management, container security, docker desktop isolation, enhanced container isolation, file sharing, docker desktop networking, virtualization, hyper-v, wsl2, network security, firewall
@y
title: Platform FAQs
linkTitle: Platform
description: Frequently asked questions about Docker platform security, containers, networking, and VMs.
keywords: Docker security, FAQs, authentication, vulnerability reporting, session management, container security, docker desktop isolation, enhanced container isolation, file sharing, docker desktop networking, virtualization, hyper-v, wsl2, network security, firewall
@z

@x
## General
@y
## General
@z

@x
### How do I report a vulnerability?
@y
### How do I report a vulnerability?
@z

@x
If you've discovered a security vulnerability in Docker, report it responsibly to security@docker.com so Docker can quickly address it.
@y
If you've discovered a security vulnerability in Docker, report it responsibly to security@docker.com so Docker can quickly address it.
@z

@x
### Does Docker lockout users after failed sign-ins?
@y
### Does Docker lockout users after failed sign-ins?
@z

@x
Docker Hub locks out users after 10 failed sign-in attempts within 5 minutes. The lockout duration is 5 minutes. This policy applies to Docker Hub, Docker Desktop, and Docker Scout authentication.
@y
Docker Hub locks out users after 10 failed sign-in attempts within 5 minutes. The lockout duration is 5 minutes. This policy applies to Docker Hub, Docker Desktop, and Docker Scout authentication.
@z

@x
### Do you support physical multi-factor authentication (MFA) with YubiKeys?
@y
### Do you support physical multi-factor authentication (MFA) with YubiKeys?
@z

@x
You can configure physical multi-factor authentication (MFA) through SSO using your identity provider (IdP). Check with your IdP if they support physical MFA devices like YubiKeys.
@y
You can configure physical multi-factor authentication (MFA) through SSO using your identity provider (IdP). Check with your IdP if they support physical MFA devices like YubiKeys.
@z

@x
### How are sessions managed and do they expire?
@y
### How are sessions managed and do they expire?
@z

@x
Docker uses tokens to manage user sessions with different expiration periods:
@y
Docker uses tokens to manage user sessions with different expiration periods:
@z

@x
- Docker Desktop: Signs you out after 90 days, or 30 days of inactivity
- Docker Hub and Docker Home: Sign you out after 24 hours
@y
- Docker Desktop: Signs you out after 90 days, or 30 days of inactivity
- Docker Hub and Docker Home: Sign you out after 24 hours
@z

@x
Docker also supports your IdP's default session timeout through SAML attributes. For more information, see [SSO attributes](/manuals/security/provisioning/_index.md#sso-attributes).
@y
Docker also supports your IdP's default session timeout through SAML attributes. For more information, see [SSO attributes](manuals/security/provisioning/_index.md#sso-attributes).
@z

@x
### How does Docker distinguish between employee users and contractor users?
@y
### How does Docker distinguish between employee users and contractor users?
@z

@x
Organizations use verified domains to distinguish user types. Team members with email domains other than verified domains appear as "Guest" users in the organization.
@y
Organizations use verified domains to distinguish user types. Team members with email domains other than verified domains appear as "Guest" users in the organization.
@z

@x
### How long are activity logs available?
@y
### How long are activity logs available?
@z

@x
Docker activity logs are available for 90 days. You're responsible for exporting logs or setting up drivers to send logs to your internal systems for longer retention.
@y
Docker activity logs are available for 90 days. You're responsible for exporting logs or setting up drivers to send logs to your internal systems for longer retention.
@z

@x
### Can I export a list of users with their roles and privileges?
@y
### Can I export a list of users with their roles and privileges?
@z

@x
Yes, use the [Export Members](/manuals/accounts/organization/manage/members.md#export-members-csv-file) feature to export a CSV file containing your organization's users with role and team information.
@y
Yes, use the [Export Members](manuals/accounts/organization/manage/members.md#export-members-csv-file) feature to export a CSV file containing your organization's users with role and team information.
@z

@x
### How do I remove users who aren't part of my IdP when using SSO without SCIM?
@y
### How do I remove users who aren't part of my IdP when using SSO without SCIM?
@z

@x
If SCIM isn't turned on, you must manually remove users from the organization. SCIM can automate user removal, but only for users added after SCIM is turned on. Users added before SCIM was turned on must be removed manually.
@y
If SCIM isn't turned on, you must manually remove users from the organization. SCIM can automate user removal, but only for users added after SCIM is turned on. Users added before SCIM was turned on must be removed manually.
@z

@x
For more information, see [Manage organization members](/manuals/accounts/organization/manage/members.md).
@y
For more information, see [Manage organization members](manuals/accounts/organization/manage/members.md).
@z

@x
### What metadata does Scout collect from container images?
@y
### What metadata does Scout collect from container images?
@z

@x
For information about metadata stored by Docker Scout, see [Data handling](/manuals/scout/deep-dive/data-handling.md).
@y
For information about metadata stored by Docker Scout, see [Data handling](manuals/scout/deep-dive/data-handling.md).
@z

@x
### How are Marketplace extensions vetted for security?
@y
### How are Marketplace extensions vetted for security?
@z

@x
Security vetting for extensions isn't implemented. Extensions aren't covered as part of Docker's Third-Party Risk Management Program.
@y
Security vetting for extensions isn't implemented. Extensions aren't covered as part of Docker's Third-Party Risk Management Program.
@z

@x
### Can I prevent users from pushing images to Docker Hub private repositories?
@y
### Can I prevent users from pushing images to Docker Hub private repositories?
@z

@x
No direct setting exists to disable private repositories. However, [Registry Access Management](/manuals/enterprise/security/hardened-desktop/registry-access-management.md) lets administrators control which registries developers can access through Docker Desktop via Docker Home.
@y
No direct setting exists to disable private repositories. However, [Registry Access Management](manuals/enterprise/security/hardened-desktop/registry-access-management.md) lets administrators control which registries developers can access through Docker Desktop via Docker Home.
@z

@x
## Docker Desktop
@y
## Docker Desktop
@z

@x
### How does Docker Desktop handle authentication information?
@y
### How does Docker Desktop handle authentication information?
@z

@x
Docker Desktop uses the host operating system's secure key management to store authentication tokens:
@y
Docker Desktop uses the host operating system's secure key management to store authentication tokens:
@z

@x
- macOS: [Keychain](https://support.apple.com/guide/security/keychain-data-protection-secb0694df1a/web)
- Windows: [Security and Identity API via Wincred](https://learn.microsoft.com/en-us/windows/win32/api/wincred/)
- Linux: [Pass](https://www.passwordstore.org/).
@y
- macOS: [Keychain](https://support.apple.com/guide/security/keychain-data-protection-secb0694df1a/web)
- Windows: [Security and Identity API via Wincred](https://learn.microsoft.com/en-us/windows/win32/api/wincred/)
- Linux: [Pass](https://www.passwordstore.org/).
@z

@x
### Containers
@y
### Containers
@z

@x
#### How are containers isolated from the host in Docker Desktop?
@y
#### How are containers isolated from the host in Docker Desktop?
@z

@x
Docker Desktop runs all containers inside a customized Linux virtual machine (except for native Windows containers). This adds strong isolation between containers and the host machine, even when containers run as root.
@y
Docker Desktop runs all containers inside a customized Linux virtual machine (except for native Windows containers). This adds strong isolation between containers and the host machine, even when containers run as root.
@z

@x
Important considerations include:
@y
Important considerations include:
@z

@x
- Containers have access to host files configured for file sharing via Docker Desktop settings
- Containers run as root with limited capabilities inside the Docker Desktop VM by default
- Privileged containers (`--privileged`, `--pid=host`, `--cap-add`) run with elevated privileges inside the VM, giving them access to VM internals and Docker Engine
@y
- Containers have access to host files configured for file sharing via Docker Desktop settings
- Containers run as root with limited capabilities inside the Docker Desktop VM by default
- Privileged containers (`--privileged`, `--pid=host`, `--cap-add`) run with elevated privileges inside the VM, giving them access to VM internals and Docker Engine
@z

@x
With Enhanced Container Isolation turned on, each container runs in a dedicated Linux user namespace inside the Docker Desktop VM. Even privileged containers only have privileges within their container boundary, not the VM. ECI uses advanced techniques to prevent containers from breaching the Docker Desktop VM and Docker Engine.
@y
With Enhanced Container Isolation turned on, each container runs in a dedicated Linux user namespace inside the Docker Desktop VM. Even privileged containers only have privileges within their container boundary, not the VM. ECI uses advanced techniques to prevent containers from breaching the Docker Desktop VM and Docker Engine.
@z

@x
#### Which portions of the host filesystem can containers access?
@y
#### Which portions of the host filesystem can containers access?
@z

@x
Containers can only access host files that are:
@y
Containers can only access host files that are:
@z

@x
1. Shared using Docker Desktop settings
1. Explicitly bind-mounted into the container (e.g., `docker run -v /path/to/host/file:/mnt`)
@y
1. Shared using Docker Desktop settings
1. Explicitly bind-mounted into the container (e.g., `docker run -v /path/to/host/file:/mnt`)
@z

@x
#### Can containers running as root access admin-owned files on the host?
@y
#### Can containers running as root access admin-owned files on the host?
@z

@x
No. Host file sharing uses a user-space file server (running in `com.docker.backend` as the Docker Desktop user), so containers can only access files that the Docker Desktop user already has permission to access.
@y
No. Host file sharing uses a user-space file server (running in `com.docker.backend` as the Docker Desktop user), so containers can only access files that the Docker Desktop user already has permission to access.
@z

@x
### Networking and VMs
@y
### Networking and VMs
@z

@x
#### How can I limit container internet access?
@y
#### How can I limit container internet access?
@z

@x
Docker Desktop doesn't have a built-in mechanism for this, but you can use process-level firewalls on the host. Apply rules to the `com.docker.vpnkit` user-space process to control where it can connect (DNS allowlists, packet filters) and which ports/protocols it can use.
@y
Docker Desktop doesn't have a built-in mechanism for this, but you can use process-level firewalls on the host. Apply rules to the `com.docker.vpnkit` user-space process to control where it can connect (DNS allowlists, packet filters) and which ports/protocols it can use.
@z

@x
For enterprise environments, consider [Air-gapped containers](/manuals/enterprise/security/hardened-desktop/air-gapped-containers.md) which provide network access controls for containers.
@y
For enterprise environments, consider [Air-gapped containers](manuals/enterprise/security/hardened-desktop/air-gapped-containers.md) which provide network access controls for containers.
@z

@x
#### Can I apply firewall rules to container network traffic?
@y
#### Can I apply firewall rules to container network traffic?
@z

@x
Yes. Docker Desktop uses a user-space process (`com.docker.vpnkit`) for network connectivity, which inherits constraints like firewall rules, VPN settings, and HTTP proxy properties from the user that launched it.
@y
Yes. Docker Desktop uses a user-space process (`com.docker.vpnkit`) for network connectivity, which inherits constraints like firewall rules, VPN settings, and HTTP proxy properties from the user that launched it.
@z

@x
#### Does Docker Desktop for Windows with Hyper-V allow users to create other VMs?
@y
#### Does Docker Desktop for Windows with Hyper-V allow users to create other VMs?
@z

@x
No. The `DockerDesktopVM` name is hard-coded in the service, so you cannot use Docker Desktop to create or manipulate other virtual machines.
@y
No. The `DockerDesktopVM` name is hard-coded in the service, so you cannot use Docker Desktop to create or manipulate other virtual machines.
@z

@x
#### How does Docker Desktop achieve network isolation with Hyper-V and WSL 2?
@y
#### How does Docker Desktop achieve network isolation with Hyper-V and WSL 2?
@z

@x
Docker Desktop uses the same VM processes for both WSL 2 (in the `docker-desktop` distribution) and Hyper-V (in `DockerDesktopVM`). Host/VM communication uses `AF_VSOCK` hypervisor sockets (shared memory) rather than network switches or interfaces. All host networking is performed using standard TCP/IP sockets from the `com.docker.vpnkit.exe` and `com.docker.backend.exe` processes.
@y
Docker Desktop uses the same VM processes for both WSL 2 (in the `docker-desktop` distribution) and Hyper-V (in `DockerDesktopVM`). Host/VM communication uses `AF_VSOCK` hypervisor sockets (shared memory) rather than network switches or interfaces. All host networking is performed using standard TCP/IP sockets from the `com.docker.vpnkit.exe` and `com.docker.backend.exe` processes.
@z

@x
For more information, see [How Docker Desktop networking works under the hood](https://www.docker.com/blog/how-docker-desktop-networking-works-under-the-hood/).
@y
For more information, see [How Docker Desktop networking works under the hood](https://www.docker.com/blog/how-docker-desktop-networking-works-under-the-hood/).
@z
