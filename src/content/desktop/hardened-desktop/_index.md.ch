%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Overview of Hardened Docker Desktop
description: Overview of what Hardened Docker Desktop is and its key features
keywords: security, hardened desktop, enhanced container isolation, registry access
  management, settings management root access, admins, docker desktop, image access
  management
@y
title: Overview of Hardened Docker Desktop
description: Overview of what Hardened Docker Desktop is and its key features
keywords: security, hardened desktop, enhanced container isolation, registry access
  management, settings management root access, admins, docker desktop, image access
  management
@z

% grid:
@x
  - title: "Settings Management"
    description: Learn how Settings Management can secure your developers' workflows.
    icon: shield_locked
    link: /desktop/hardened-desktop/settings-management/
@y
  - title: "Settings Management"
    description: Learn how Settings Management can secure your developers' workflows.
    icon: shield_locked
    link: __SUBDIR__/desktop/hardened-desktop/settings-management/
@z

@x
  - title: "Enhanced Container Isolation"
    description: Understand how Enhanced Container Isolation can prevent container attacks.
    icon: "security"
    link: /desktop/hardened-desktop/enhanced-container-isolation/
@y
  - title: "Enhanced Container Isolation"
    description: Understand how Enhanced Container Isolation can prevent container attacks.
    icon: "security"
    link: __SUBDIR__/desktop/hardened-desktop/enhanced-container-isolation/
@z

@x
  - title: "Registry Access Management"
    description: Control the registries developers can access while using Docker Desktop.
    icon: "home_storage"
    link: /security/for-admins/registry-access-management/
@y
  - title: "Registry Access Management"
    description: Control the registries developers can access while using Docker Desktop.
    icon: "home_storage"
    link: __SUBDIR__/security/for-admins/registry-access-management/
@z

@x
  - title: "Image Access Management"
    description: Control the images developers can pull from Docker Hub.
    icon: "photo_library"
    link: /security/for-admins/image-access-management/
@y
  - title: "Image Access Management"
    description: Control the images developers can pull from Docker Hub.
    icon: "photo_library"
    link: __SUBDIR__/security/for-admins/image-access-management/
@z

@x
  - title: "Air-Gapped Containers"
    description: Restrict containers from accessing unwanted network resources.
    icon: "vpn_lock"
    link: /desktop/hardened-desktop/air-gapped-containers/
@y
  - title: "Air-Gapped Containers"
    description: Restrict containers from accessing unwanted network resources.
    icon: "vpn_lock"
    link: __SUBDIR__/desktop/hardened-desktop/air-gapped-containers/
@z

@x
> **Note**
>
> Hardened Docker Desktop is available to Docker Business customers only.
@y
> **Note**
>
> Hardened Docker Desktop is available to Docker Business customers only.
@z

@x
### What is Hardened Docker Desktop?
@y
### What is Hardened Docker Desktop?
@z

@x
Hardened Docker Desktop is a group of security features for Docker Desktop, designed to improve the security of developer environments without impacting developer experience or productivity.
@y
Hardened Docker Desktop is a group of security features for Docker Desktop, designed to improve the security of developer environments without impacting developer experience or productivity.
@z

@x
It lets admins define and enforce robust security settings. It guarantees that developers and the containers they deploy are unable to intentionally or unintentionally circumvent these settings. Additionally, you can enhance container isolation, which helps mitigate potential security threats such as malicious payloads breaching the Docker Desktop Linux VM and the underlying host.
@y
It lets admins define and enforce robust security settings. It guarantees that developers and the containers they deploy are unable to intentionally or unintentionally circumvent these settings. Additionally, you can enhance container isolation, which helps mitigate potential security threats such as malicious payloads breaching the Docker Desktop Linux VM and the underlying host.
@z

@x
Hardened Docker Desktop moves the ownership boundary for Docker Desktop configuration to the organization, meaning that any security controls admins set cannot be altered by the user of Docker Desktop.
@y
Hardened Docker Desktop moves the ownership boundary for Docker Desktop configuration to the organization, meaning that any security controls admins set cannot be altered by the user of Docker Desktop.
@z

@x
### Who is it for?
@y
### Who is it for?
@z

@x
It is for security conscious organizations who:
- Don’t give their users root or admin access on their machines
- Would like Docker Desktop to be within their organization’s centralized control 
- Have certain compliance obligations
@y
It is for security conscious organizations who:
- Don’t give their users root or admin access on their machines
- Would like Docker Desktop to be within their organization’s centralized control 
- Have certain compliance obligations
@z

@x
### What does Hardened Docker Desktop include?
@y
### What does Hardened Docker Desktop include?
@z

@x
It includes:
@y
It includes:
@z

@x
- Settings Management, which helps admins to confidently manage and control the usage of Docker Desktop within their organization.
- Enhanced Container Isolation (ECI), a setting that instantly enhances security by preventing containers from running as root in Docker Desktop’s Linux VM and ensures that any configurations set using Settings Management cannot be bypassed or modified by containers.
- Registry Access Management (RAM), which allows admins to control the registries developers can access.
- Image Access Management (IAM), which gives admins control over which images developers can pull from Docker Hub.
@y
- Settings Management, which helps admins to confidently manage and control the usage of Docker Desktop within their organization.
- Enhanced Container Isolation (ECI), a setting that instantly enhances security by preventing containers from running as root in Docker Desktop’s Linux VM and ensures that any configurations set using Settings Management cannot be bypassed or modified by containers.
- Registry Access Management (RAM), which allows admins to control the registries developers can access.
- Image Access Management (IAM), which gives admins control over which images developers can pull from Docker Hub.
@z

@x
### How does it help my organisation?
@y
### How does it help my organisation?
@z

@x
Hardened Desktop features work independently but collectively to create a defense-in-depth strategy, safeguarding developer workstations against potential attacks across various functional layers, such as configuring Docker Desktop, pulling container images, and running container images. This multi-layered defense approach ensures comprehensive security.
@y
Hardened Desktop features work independently but collectively to create a defense-in-depth strategy, safeguarding developer workstations against potential attacks across various functional layers, such as configuring Docker Desktop, pulling container images, and running container images. This multi-layered defense approach ensures comprehensive security.
@z

@x
It helps mitigate against threats such as:
 - **Malware and supply chain attacks:** RAM and IAM prevent developers from accessing certain container registries and image types, significantly lowering the risk of malicious payloads. Additionally, ECI restricts the impact of containers with malicious payloads by running them without root privileges inside a Linux user namespace.
 - **Lateral movement:** Air gapped containers allows admins to configure network access restrictions for containers, thereby preventing malicious containers from performing lateral movement within the organization's network.
 - **Insider threats:** Settings Management configures and locks various Docker Desktop settings, such as proxy settings, ECI, and prevents exposure of the Docker API. This helps admins enforce company policies and prevents developers from introducing insecure configurations, intentionally or unintentionally.
@y
It helps mitigate against threats such as:
 - **Malware and supply chain attacks:** RAM and IAM prevent developers from accessing certain container registries and image types, significantly lowering the risk of malicious payloads. Additionally, ECI restricts the impact of containers with malicious payloads by running them without root privileges inside a Linux user namespace.
 - **Lateral movement:** Air gapped containers allows admins to configure network access restrictions for containers, thereby preventing malicious containers from performing lateral movement within the organization's network.
 - **Insider threats:** Settings Management configures and locks various Docker Desktop settings, such as proxy settings, ECI, and prevents exposure of the Docker API. This helps admins enforce company policies and prevents developers from introducing insecure configurations, intentionally or unintentionally.
@z

% snip grid...
