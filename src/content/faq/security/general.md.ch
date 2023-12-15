%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Find the answers to common security related FAQs
keywords: Docker, Docker Hub, Docker Desktop secuirty FAQs, secuirty, platform, Docker Scout, admin, security
title: General security FAQs
---
@y
---
description: Find the answers to common security related FAQs
keywords: Docker, Docker Hub, Docker Desktop secuirty FAQs, secuirty, platform, Docker Scout, admin, security
title: General security FAQs
---
@z

@x
### How do I report a vulnerability?
@y
### How do I report a vulnerability?
@z

@x
If you’ve discovered a security vulnerability in Docker, we encourage you to report it responsibly. Report security issues to security@docker.com so that they can be quickly addressed by our team.
@y
If you’ve discovered a security vulnerability in Docker, we encourage you to report it responsibly. Report security issues to security@docker.com so that they can be quickly addressed by our team.
@z

@x
### How are passwords managed when SSO isn't used? 
@y
### How are passwords managed when SSO isn't used? 
@z

@x
Passwords are encrypted and salt-hashed. If you use application-level passwords instead of SSO, you are responsible for ensuring that your employees know how to pick strong passwords, don't share passwords, and don't reuse passwords across multiple systems. 
@y
Passwords are encrypted and salt-hashed. If you use application-level passwords instead of SSO, you are responsible for ensuring that your employees know how to pick strong passwords, don't share passwords, and don't reuse passwords across multiple systems. 
@z

@x
### Does Docker require password resets when SSO isn't used? 
@y
### Does Docker require password resets when SSO isn't used? 
@z

@x
Passwords aren't required to be periodically reset. NIST no longer recommends password resets as part of best practice.
@y
Passwords aren't required to be periodically reset. NIST no longer recommends password resets as part of best practice.
@z

@x
### Does Docker lockout users after failed sign-ins? 
@y
### Does Docker lockout users after failed sign-ins? 
@z

@x
Docker Hub’s global setting for system lockout is after 10 failed sign in attempts in a period of 5 minutes, and the lockout duration is 5 minutes. The same global policy applies to authenticated Docker Desktop users and Docker Scout, both of which use Docker Hub for authentication.
@y
Docker Hub’s global setting for system lockout is after 10 failed sign in attempts in a period of 5 minutes, and the lockout duration is 5 minutes. The same global policy applies to authenticated Docker Desktop users and Docker Scout, both of which use Docker Hub for authentication.
@z

@x
### Do you support physical MFA with YubiKeys? 
@y
### Do you support physical MFA with YubiKeys? 
@z

@x
You can configure this through SSO using your IdP. Check with your IdP if they support physical MFA.
@y
You can configure this through SSO using your IdP. Check with your IdP if they support physical MFA.
@z

@x
### How are sessions managed and do they expire?
@y
### How are sessions managed and do they expire?
@z

@x
If configured, the IdP manages sessions.
@y
If configured, the IdP manages sessions.
@z

@x
Docker Desktop sessions expire after 30 days, or after 7 days of inactivity. For Docker Hub, the IdP manages sessions, if configured. If you use application-level sign-in, users are signed out due to inactivity after 14 days and must sign in again after 30 days.
@y
Docker Desktop sessions expire after 30 days, or after 7 days of inactivity. For Docker Hub, the IdP manages sessions, if configured. If you use application-level sign-in, users are signed out due to inactivity after 14 days and must sign in again after 30 days.
@z

@x
### How does Docker attribute downloads to us and what data is used to classify or verify the user is part of our organization? 
@y
### How does Docker attribute downloads to us and what data is used to classify or verify the user is part of our organization? 
@z

@x
Docker Desktop downloads are linked to a specific organization by the user's email containing the customer's domain. Additionally, we use IP addresses to correlate users with organizations.
@y
Docker Desktop downloads are linked to a specific organization by the user's email containing the customer's domain. Additionally, we use IP addresses to correlate users with organizations.
@z

@x
### How do you attribute that number of downloads to us from IP data if most of our engineers work from home and aren’t allowed to use VPNs? 
@y
### How do you attribute that number of downloads to us from IP data if most of our engineers work from home and aren’t allowed to use VPNs? 
@z

@x
We attribute users and their IP addresses to domains using 3rd party data enrichment software, where our provider analyzes activity from public and private data sources related to that specific IP address, then uses that activity to identify the domain and map it to the IP address.
@y
We attribute users and their IP addresses to domains using 3rd party data enrichment software, where our provider analyzes activity from public and private data sources related to that specific IP address, then uses that activity to identify the domain and map it to the IP address.
@z

@x
Some users authenticate by signing in to Docker Desktop and joining their domain's Docker organization, which allows us to map them with a much higher degree of accuracy and report on direct feature usage for you. We highly encourage you to get your users authenticated so we can provide you with the most accurate data.
@y
Some users authenticate by signing in to Docker Desktop and joining their domain's Docker organization, which allows us to map them with a much higher degree of accuracy and report on direct feature usage for you. We highly encourage you to get your users authenticated so we can provide you with the most accurate data.
@z

@x
### How does Docker distinguish between employee users and contractor users? 
@y
### How does Docker distinguish between employee users and contractor users? 
@z

@x
Organizations set up in Docker use verified domains and any team member with an email domain other than what's verified is noted as a "Guest" in that organization.
@y
Organizations set up in Docker use verified domains and any team member with an email domain other than what's verified is noted as a "Guest" in that organization.
@z

@x
### How long are Docker Hub logs available? 
@y
### How long are Docker Hub logs available? 
@z

@x
Docker provides various types of audit logs and log retention varies. For example, Docker Hub Activity logs are available for 90 days. You are responsible for exporting logs or setting up drivers to their own internal systems.  
@y
Docker provides various types of audit logs and log retention varies. For example, Docker Hub Activity logs are available for 90 days. You are responsible for exporting logs or setting up drivers to their own internal systems.  
@z

@x
### Can I export a list of all users with their assigned roles and privileges and if so, in what format?
@y
### Can I export a list of all users with their assigned roles and privileges and if so, in what format?
@z

@x
Using the [Export Members](../../docker-hub/members.md) feature, you can export to CSV a list of your organization's users with role and team information. 
@y
Using the [Export Members](../../docker-hub/members.md) feature, you can export to CSV a list of your organization's users with role and team information. 
@z

@x
### How does Docker Desktop handle and store authentication information?
@y
### How does Docker Desktop handle and store authentication information?
@z

@x
Docker Desktop utilizes the host operating system's secure key management for handling and storing authentication tokens necessary for authenticating with image registries. On macOS, this is [Keychain](https://support.apple.com/guide/security/keychain-data-protection-secb0694df1a/web); on Windows, this is [Security and Identity API via Wincred](https://learn.microsoft.com/en-us/windows/win32/api/wincred/); and on Linux, this is [Pass](https://www.passwordstore.org/). 
@y
Docker Desktop utilizes the host operating system's secure key management for handling and storing authentication tokens necessary for authenticating with image registries. On macOS, this is [Keychain](https://support.apple.com/guide/security/keychain-data-protection-secb0694df1a/web); on Windows, this is [Security and Identity API via Wincred](https://learn.microsoft.com/en-us/windows/win32/api/wincred/); and on Linux, this is [Pass](https://www.passwordstore.org/). 
@z

@x
### How does Docker Hub secure passwords in storage and in transit? 
@y
### How does Docker Hub secure passwords in storage and in transit? 
@z

@x
This is applicable only when using Docker Hub's application-level password versus SSO/SAML. When using SSO, Docker Hub doesn't store passwords. Application-level passwords are hashed in storage (SHA-256) and encrypted in transit (TLS).
@y
This is applicable only when using Docker Hub's application-level password versus SSO/SAML. When using SSO, Docker Hub doesn't store passwords. Application-level passwords are hashed in storage (SHA-256) and encrypted in transit (TLS).
@z

@x
### How do we de-provision access to CLI users who use personal access tokens instead of our IdP? We use SSO but not SCIM. 
@y
### How do we de-provision access to CLI users who use personal access tokens instead of our IdP? We use SSO but not SCIM. 
@z

@x
If SCIM isn't enabled, you have to manually remove PAT users from the organization in our system. Using SCIM automates this.
@y
If SCIM isn't enabled, you have to manually remove PAT users from the organization in our system. Using SCIM automates this.
@z

@x
### What metadata is collected from container images that Scout analyzes?
@y
### What metadata is collected from container images that Scout analyzes?
@z

@x
For information about the metadata stored by Docker Scout, see [Data handling](../../scout/data-handling.md).
@y
For information about the metadata stored by Docker Scout, see [Data handling](../../scout/data-handling.md).
@z

@x
### To which portions of the host filesystem do containers have read and write access? Can containers running as root gain access to admin-owned files or directories on the host? 
@y
### To which portions of the host filesystem do containers have read and write access? Can containers running as root gain access to admin-owned files or directories on the host? 
@z

@x
File sharing (bind mount from the host filesystem) uses a user-space crafted file server (running in `com.docker.backend` as the user running Docker Desktop), so containers can’t gain any access that the user on the host doesn’t already have.
@y
File sharing (bind mount from the host filesystem) uses a user-space crafted file server (running in `com.docker.backend` as the user running Docker Desktop), so containers can’t gain any access that the user on the host doesn’t already have.
@z

@x
### How are Extensions within the Marketplace vetting for security prior to placement? 
@y
### How are Extensions within the Marketplace vetting for security prior to placement? 
@z

@x
Security vetting for extensions is on our roadmap however this vetting isn't currently done. 
@y
Security vetting for extensions is on our roadmap however this vetting isn't currently done. 
@z

@x
At present in the marketplace, there are two types of extensions: reviewed and self-published. Reviewed extensions are used and reviewed against a set of criteria, and if they pass, they're included in the marketplace with a **Reviewed** label. Self-published extensions are automatically placed in the marketplace with a **Not reviewed** label. 
@y
At present in the marketplace, there are two types of extensions: reviewed and self-published. Reviewed extensions are used and reviewed against a set of criteria, and if they pass, they're included in the marketplace with a **Reviewed** label. Self-published extensions are automatically placed in the marketplace with a **Not reviewed** label. 
@z

@x
Note that even if an extension is reviewed, it's only reviewed on the first publish. Any updates afterwards aren't reviewed. Extensions aren't covered as part of Docker’s Third-Party Risk Management Program.
@y
Note that even if an extension is reviewed, it's only reviewed on the first publish. Any updates afterwards aren't reviewed. Extensions aren't covered as part of Docker’s Third-Party Risk Management Program.
@z

@x
### Can I disable private repos in my organization via a setting to make sure nobody is pushing images into Docker Hub? 
@y
### Can I disable private repos in my organization via a setting to make sure nobody is pushing images into Docker Hub? 
@z

@x
No. With [Registry Access Management](../../security/for-admins/registry-access-management.md) (RAM), administrators can ensure that their developers using Docker Desktop only access allowed registries. This is done through the Registry Access Management dashboard on Docker Hub. 
@y
No. With [Registry Access Management](../../security/for-admins/registry-access-management.md) (RAM), administrators can ensure that their developers using Docker Desktop only access allowed registries. This is done through the Registry Access Management dashboard on Docker Hub. 
@z
