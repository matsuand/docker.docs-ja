%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: >-
  Security announcements for Docker products, including CVE fixes for Docker
  Desktop, Docker Sandboxes, and Docker Official Images.
keywords: Docker security announcements, CVE, security advisory, vulnerability,
  Docker Desktop security update, Log4j 2, Log4Shell, Text4Shell
title: Docker security announcements
linkTitle: Announcements
@y
description: >-
  Security announcements for Docker products, including CVE fixes for Docker
  Desktop, Docker Sandboxes, and Docker Official Images.
keywords: Docker security announcements, CVE, security advisory, vulnerability,
  Docker Desktop security update, Log4j 2, Log4Shell, Text4Shell
title: Docker security announcements
linkTitle: Announcements
@z

@x
[Subscribe to security RSS feed](/security/security-announcements/index.xml)
@y
[Subscribe to security RSS feed](__SUBDIR__/security/security-announcements/index.xml)
@z

@x
## Docker Sandboxes 0.42.0 security update: CVE-2026-77179 and CVE-2026-79994
@y
## Docker Sandboxes 0.42.0 security update: CVE-2026-77179 and CVE-2026-79994
@z

@x
Two vulnerabilities in Docker Sandboxes were fixed on September 7 in the
[0.42.0](/manuals/ai/sandboxes/release-notes.md#0420) release:
@y
Two vulnerabilities in Docker Sandboxes were fixed on September 7 in the
[0.42.0](manuals/ai/sandboxes/release-notes.md#0420) release:
@z

@x
- Addressed [CVE-2026-77179](https://www.cve.org/cverecord?id=CVE-2026-77179),
  where the virtio-fs host server on macOS followed symlinks when reopening an
  unlinked file from a stored path. A malicious guest could replace a parent
  directory with a symlink, escape the shared workspace, and read or modify
  arbitrary host files as the VMM user, potentially leading to code execution on
  the host. Versions 0.28.0 up to but not including 0.42.0 on macOS are
  affected. [Critical]
- Addressed [CVE-2026-79994](https://www.cve.org/cverecord?id=CVE-2026-79994),
  where the guest-to-host Unix domain socket relay checked that a socket path
  was inside an authorized workspace but reconnected using the path name. A
  malicious guest could replace an intermediate directory with a symlink between
  the check and the connection, causing the host to connect to an arbitrary
  `AF_UNIX` socket outside the shared workspace and exposing data or host-side
  capabilities provided by that socket. Versions 0.37.0 up to but not including
  0.42.0 are affected. [High]
@y
- Addressed [CVE-2026-77179](https://www.cve.org/cverecord?id=CVE-2026-77179),
  where the virtio-fs host server on macOS followed symlinks when reopening an
  unlinked file from a stored path. A malicious guest could replace a parent
  directory with a symlink, escape the shared workspace, and read or modify
  arbitrary host files as the VMM user, potentially leading to code execution on
  the host. Versions 0.28.0 up to but not including 0.42.0 on macOS are
  affected. [Critical]
- Addressed [CVE-2026-79994](https://www.cve.org/cverecord?id=CVE-2026-79994),
  where the guest-to-host Unix domain socket relay checked that a socket path
  was inside an authorized workspace but reconnected using the path name. A
  malicious guest could replace an intermediate directory with a symlink between
  the check and the connection, causing the host to connect to an arbitrary
  `AF_UNIX` socket outside the shared workspace and exposing data or host-side
  capabilities provided by that socket. Versions 0.37.0 up to but not including
  0.42.0 are affected. [High]
@z

@x
If you can't update to [0.42.0](/manuals/ai/sandboxes/release-notes.md#0420) or
later, use [clone mode](/manuals/ai/sandboxes/usage.md#clone-mode) and avoid
adding read-write host mounts.
@y
If you can't update to [0.42.0](manuals/ai/sandboxes/release-notes.md#0420) or
later, use [clone mode](manuals/ai/sandboxes/usage.md#clone-mode) and avoid
adding read-write host mounts.
@z

@x
## Docker Desktop 4.86.0 security update: CVE-2026-17106
@y
## Docker Desktop 4.86.0 security update: CVE-2026-17106
@z

@x
A vulnerability in Docker Desktop was fixed on August 10 in the
[4.86.0](/manuals/desktop/release-notes.md#4860) release:
@y
A vulnerability in Docker Desktop was fixed on August 10 in the
[4.86.0](manuals/desktop/release-notes.md#4860) release:
@z

@x
- Addressed CVE-2026-17106, a destination-escape flaw in `docker container cp`.
@y
- Addressed CVE-2026-17106, a destination-escape flaw in `docker container cp`.
@z

@x
## Docker Desktop 4.71.0 security update: CVE-2026-5843
@y
## Docker Desktop 4.71.0 security update: CVE-2026-5843
@z

@x
A vulnerability in Docker Desktop was fixed on April 27 in the
[4.71.0](/manuals/desktop/release-notes.md#4710) release:
@y
A vulnerability in Docker Desktop was fixed on April 27 in the
[4.71.0](manuals/desktop/release-notes.md#4710) release:
@z

@x
- Addressed [CVE-2026-5843](https://www.cve.org/cverecord?id=CVE-2026-5843),
  container-to-host code execution in the Docker Model Runner MLX inference
  backend.
@y
- Addressed [CVE-2026-5843](https://www.cve.org/cverecord?id=CVE-2026-5843),
  container-to-host code execution in the Docker Model Runner MLX inference
  backend.
@z

@x
## Docker Desktop 4.68.0 security update: CVE-2026-5817
@y
## Docker Desktop 4.68.0 security update: CVE-2026-5817
@z

@x
A vulnerability in Docker Desktop was fixed on April 7 in the
[4.68.0](/manuals/desktop/release-notes.md#4680) release:
@y
A vulnerability in Docker Desktop was fixed on April 7 in the
[4.68.0](manuals/desktop/release-notes.md#4680) release:
@z

@x
- Addressed [CVE-2026-5817](https://www.cve.org/cverecord?id=CVE-2026-5817),
  container-to-host code execution in the Docker Model Runner vllm-metal
  inference backend.
@y
- Addressed [CVE-2026-5817](https://www.cve.org/cverecord?id=CVE-2026-5817),
  container-to-host code execution in the Docker Model Runner vllm-metal
  inference backend.
@z

@x
## Docker Desktop 4.67.0 security update: CVE-2026-33990
@y
## Docker Desktop 4.67.0 security update: CVE-2026-33990
@z

@x
A vulnerability in Docker Desktop was fixed on March 30 in the
[4.67.0](/manuals/desktop/release-notes.md#4670) release:
@y
A vulnerability in Docker Desktop was fixed on March 30 in the
[4.67.0](manuals/desktop/release-notes.md#4670) release:
@z

@x
- Addressed [CVE-2026-33990](https://www.cve.org/cverecord?id=CVE-2026-33990),
  SSRF in Docker Model Runner OCI Registry Client.
@y
- Addressed [CVE-2026-33990](https://www.cve.org/cverecord?id=CVE-2026-33990),
  SSRF in Docker Model Runner OCI Registry Client.
@z

@x
## Docker Desktop 4.62.0 security update: CVE-2026-28400
@y
## Docker Desktop 4.62.0 security update: CVE-2026-28400
@z

@x
A vulnerability in Docker Desktop was fixed on February 23 in the
[4.62.0](/manuals/desktop/release-notes.md#4620) release:
@y
A vulnerability in Docker Desktop was fixed on February 23 in the
[4.62.0](manuals/desktop/release-notes.md#4620) release:
@z

@x
- Addressed [CVE-2026-28400](https://www.cve.org/cverecord?id=CVE-2026-28400),
  runtime flag injection in Docker Model Runner.
@y
- Addressed [CVE-2026-28400](https://www.cve.org/cverecord?id=CVE-2026-28400),
  runtime flag injection in Docker Model Runner.
@z

@x
## Docker Desktop 4.62.0 security update: CVE-2026-2664
@y
## Docker Desktop 4.62.0 security update: CVE-2026-2664
@z

@x
A vulnerability in Docker Desktop was fixed on February 23 in the
[4.62.0](/manuals/desktop/release-notes.md#4620) release:
@y
A vulnerability in Docker Desktop was fixed on February 23 in the
[4.62.0](manuals/desktop/release-notes.md#4620) release:
@z

@x
- Fixed [CVE-2026-2664](https://www.cve.org/cverecord?id=CVE-2026-2664), out of
  bounds read in gRPC-FUSE kernel module.
@y
- Fixed [CVE-2026-2664](https://www.cve.org/cverecord?id=CVE-2026-2664), out of
  bounds read in gRPC-FUSE kernel module.
@z

@x
## Docker Desktop 4.54.0 security update: CVE-2025-13743
@y
## Docker Desktop 4.54.0 security update: CVE-2025-13743
@z

@x
A vulnerability in Docker Desktop was fixed on December 4 in the
[4.54.0](/manuals/desktop/release-notes.md#4540) release:
@y
A vulnerability in Docker Desktop was fixed on December 4 in the
[4.54.0](manuals/desktop/release-notes.md#4540) release:
@z

@x
- Fixed [CVE-2025-13743](https://www.cve.org/cverecord?id=CVE-2025-13743) where
  Docker Desktop diagnostics bundles were found to include expired Hub PATs in
  log output due to error object serialization.
@y
- Fixed [CVE-2025-13743](https://www.cve.org/cverecord?id=CVE-2025-13743) where
  Docker Desktop diagnostics bundles were found to include expired Hub PATs in
  log output due to error object serialization.
@z

@x
## Docker Desktop 4.49.0 security update: CVE-2025-9164
@y
## Docker Desktop 4.49.0 security update: CVE-2025-9164
@z

@x
A vulnerability in Docker Desktop for Windows was fixed on October 23 in the
[4.49.0](/manuals/desktop/release-notes.md#4490) release:
@y
A vulnerability in Docker Desktop for Windows was fixed on October 23 in the
[4.49.0](manuals/desktop/release-notes.md#4490) release:
@z

@x
- Fixed [CVE-2025-9164](https://www.cve.org/cverecord?id=CVE-2025-9164) where
  the Docker Desktop for Windows installer was vulnerable to DLL hijacking due
  to insecure DLL search order. The installer searches for required DLLs in the
  user's Downloads folder before checking system directories, allowing local
  privilege escalation through malicious DLL placement.
@y
- Fixed [CVE-2025-9164](https://www.cve.org/cverecord?id=CVE-2025-9164) where
  the Docker Desktop for Windows installer was vulnerable to DLL hijacking due
  to insecure DLL search order. The installer searches for required DLLs in the
  user's Downloads folder before checking system directories, allowing local
  privilege escalation through malicious DLL placement.
@z

@x
## Docker Desktop 4.47.0 security update: CVE-2025-10657
@y
## Docker Desktop 4.47.0 security update: CVE-2025-10657
@z

@x
A vulnerability in Docker Desktop was fixed on September 25 in the
[4.47.0](/manuals/desktop/release-notes.md#4470) release:
@y
A vulnerability in Docker Desktop was fixed on September 25 in the
[4.47.0](manuals/desktop/release-notes.md#4470) release:
@z

@x
- Fixed [CVE-2025-10657](https://www.cve.org/CVERecord?id=CVE-2025-10657) where
  the Enhanced Container Isolation
  [Docker Socket command restrictions](/manuals/desktop/enterprise/hardened-desktop/enhanced-container-isolation/config.md#command-restrictions)
  feature was not working properly in Docker Desktop 4.46.0 only (the
  configuration for it was being ignored).
@y
- Fixed [CVE-2025-10657](https://www.cve.org/CVERecord?id=CVE-2025-10657) where
  the Enhanced Container Isolation
  [Docker Socket command restrictions](manuals/desktop/enterprise/hardened-desktop/enhanced-container-isolation/config.md#command-restrictions)
  feature was not working properly in Docker Desktop 4.46.0 only (the
  configuration for it was being ignored).
@z

@x
## Docker Desktop 4.44.3 security update: CVE-2025-9074
@y
## Docker Desktop 4.44.3 security update: CVE-2025-9074
@z

@x
_Last updated August 20, 2025_
@y
_Last updated August 20, 2025_
@z

@x
A vulnerability in Docker Desktop was fixed on August 20 in the
[4.44.3](/manuals/desktop/release-notes.md#4443) release:
@y
A vulnerability in Docker Desktop was fixed on August 20 in the
[4.44.3](manuals/desktop/release-notes.md#4443) release:
@z

@x
- Fixed [CVE-2025-9074](https://www.cve.org/CVERecord?id=CVE-2025-9074) where a
  malicious container running on Docker Desktop could access the Docker Engine
  and launch additional containers without requiring the Docker socket to be
  mounted. This could allow unauthorized access to user files on the host
  system. Enhanced Container Isolation (ECI) does not mitigate this
  vulnerability.
@y
- Fixed [CVE-2025-9074](https://www.cve.org/CVERecord?id=CVE-2025-9074) where a
  malicious container running on Docker Desktop could access the Docker Engine
  and launch additional containers without requiring the Docker socket to be
  mounted. This could allow unauthorized access to user files on the host
  system. Enhanced Container Isolation (ECI) does not mitigate this
  vulnerability.
@z

@x
## Docker Desktop 4.44.0 security update: CVE-2025-23266
@y
## Docker Desktop 4.44.0 security update: CVE-2025-23266
@z

@x
_Last updated July 31, 2025_
@y
_Last updated July 31, 2025_
@z

@x
Docker is aware of
[CVE-2025-23266](https://nvd.nist.gov/vuln/detail/CVE-2025-23266), a critical
vulnerability affecting the NVIDIA Container Toolkit in CDI mode up to version
1.17.7. Docker Desktop includes version 1.17.8, which is not impacted. However,
older versions of Docker Desktop that bundled earlier toolkit versions may be
affected if CDI mode was manually enabled. Upgrade to Docker Desktop 4.44 or
later to ensure you're using the patched version.
@y
Docker is aware of
[CVE-2025-23266](https://nvd.nist.gov/vuln/detail/CVE-2025-23266), a critical
vulnerability affecting the NVIDIA Container Toolkit in CDI mode up to version
1.17.7. Docker Desktop includes version 1.17.8, which is not impacted. However,
older versions of Docker Desktop that bundled earlier toolkit versions may be
affected if CDI mode was manually enabled. Upgrade to Docker Desktop 4.44 or
later to ensure you're using the patched version.
@z

@x
## Docker Desktop 4.43.0 security update: CVE-2025-6587
@y
## Docker Desktop 4.43.0 security update: CVE-2025-6587
@z

@x
_Last updated July 3, 2025_
@y
_Last updated July 3, 2025_
@z

@x
A vulnerability in Docker Desktop was fixed on July 3 in the
[4.43.0](/manuals/desktop/release-notes.md#4430) release:
@y
A vulnerability in Docker Desktop was fixed on July 3 in the
[4.43.0](manuals/desktop/release-notes.md#4430) release:
@z

@x
- Fixed [CVE-2025-6587](https://www.cve.org/CVERecord?id=CVE-2025-6587) where
  sensitive system environment variables were included in Docker Desktop
  diagnostic logs, allowing for potential secret exposure.
@y
- Fixed [CVE-2025-6587](https://www.cve.org/CVERecord?id=CVE-2025-6587) where
  sensitive system environment variables were included in Docker Desktop
  diagnostic logs, allowing for potential secret exposure.
@z

@x
## Docker Desktop 4.41.0 security update: CVE-2025-3224, CVE-2025-4095, and CVE-2025-3911
@y
## Docker Desktop 4.41.0 security update: CVE-2025-3224, CVE-2025-4095, and CVE-2025-3911
@z

@x
_Last updated May 15, 2025_
@y
_Last updated May 15, 2025_
@z

@x
Three vulnerabilities in Docker Desktop were fixed on April 28 in the
[4.41.0](/manuals/desktop/release-notes.md#4410) release.
@y
Three vulnerabilities in Docker Desktop were fixed on April 28 in the
[4.41.0](manuals/desktop/release-notes.md#4410) release.
@z

@x
- Fixed [CVE-2025-3224](https://www.cve.org/CVERecord?id=CVE-2025-3224) allowing
  an attacker with access to a user machine to perform an elevation of privilege
  when Docker Desktop updates.
- Fixed [CVE-2025-4095](https://www.cve.org/CVERecord?id=CVE-2025-4095) where
  Registry Access Management (RAM) policies were not enforced when using a MacOS
  configuration profile, allowing users to pull images from unapproved
  registries.
- Fixed [CVE-2025-3911](https://www.cve.org/CVERecord?id=CVE-2025-3911) allowing
  an attacker with read access to a user's machine to obtain sensitive
  information from Docker Desktop log files, including environment variables
  configured for running containers.
@y
- Fixed [CVE-2025-3224](https://www.cve.org/CVERecord?id=CVE-2025-3224) allowing
  an attacker with access to a user machine to perform an elevation of privilege
  when Docker Desktop updates.
- Fixed [CVE-2025-4095](https://www.cve.org/CVERecord?id=CVE-2025-4095) where
  Registry Access Management (RAM) policies were not enforced when using a MacOS
  configuration profile, allowing users to pull images from unapproved
  registries.
- Fixed [CVE-2025-3911](https://www.cve.org/CVERecord?id=CVE-2025-3911) allowing
  an attacker with read access to a user's machine to obtain sensitive
  information from Docker Desktop log files, including environment variables
  configured for running containers.
@z

@x
Update to Docker Desktop
[4.41.0](/manuals/desktop/release-notes.md#4410).
@y
Update to Docker Desktop
[4.41.0](manuals/desktop/release-notes.md#4410).
@z

@x
## Docker Desktop 4.34.2 security update: CVE-2024-8695 and CVE-2024-8696
@y
## Docker Desktop 4.34.2 security update: CVE-2024-8695 and CVE-2024-8696
@z

@x
_Last updated September 13, 2024_
@y
_Last updated September 13, 2024_
@z

@x
Two remote code execution (RCE) vulnerabilities in Docker Desktop related to
Docker Extensions were reported by [Cure53](https://cure53.de/) and were fixed
on September 12 in the [4.34.2](/manuals/desktop/release-notes.md#4342) release.
@y
Two remote code execution (RCE) vulnerabilities in Docker Desktop related to
Docker Extensions were reported by [Cure53](https://cure53.de/) and were fixed
on September 12 in the [4.34.2](manuals/desktop/release-notes.md#4342) release.
@z

@x
- [CVE-2024-8695](https://www.cve.org/cverecord?id=CVE-2024-8695): A remote code
  execution (RCE) vulnerability via crafted extension description/changelog
  could be abused by a malicious extension in Docker Desktop before 4.34.2.
  [Critical]
- [CVE-2024-8696](https://www.cve.org/cverecord?id=CVE-2024-8696): A remote code
  execution (RCE) vulnerability via crafted extension
  publisher-url/additional-urls could be abused by a malicious extension in
  Docker Desktop before 4.34.2. [High]
@y
- [CVE-2024-8695](https://www.cve.org/cverecord?id=CVE-2024-8695): A remote code
  execution (RCE) vulnerability via crafted extension description/changelog
  could be abused by a malicious extension in Docker Desktop before 4.34.2.
  [Critical]
- [CVE-2024-8696](https://www.cve.org/cverecord?id=CVE-2024-8696): A remote code
  execution (RCE) vulnerability via crafted extension
  publisher-url/additional-urls could be abused by a malicious extension in
  Docker Desktop before 4.34.2. [High]
@z

@x
No existing extensions exploiting the vulnerabilities were found in the
Extensions Marketplace. The Docker Team will be closely monitoring and
diligently reviewing any requests for publishing new extensions.
@y
No existing extensions exploiting the vulnerabilities were found in the
Extensions Marketplace. The Docker Team will be closely monitoring and
diligently reviewing any requests for publishing new extensions.
@z

@x
Update to Docker Desktop
[4.34.2](/manuals/desktop/release-notes.md#4342). If you are unable to update
promptly, you can
[disable Docker Extensions](/manuals/extensions/settings-feedback.md#turn-on-or-turn-off-extensions)
as a workaround.
@y
Update to Docker Desktop
[4.34.2](manuals/desktop/release-notes.md#4342). If you are unable to update
promptly, you can
[disable Docker Extensions](manuals/extensions/settings-feedback.md#turn-on-or-turn-off-extensions)
as a workaround.
@z

@x
## Deprecation of password logins on CLI when SSO enforced
@y
## Deprecation of password logins on CLI when SSO enforced
@z

@x
_Last updated July 2024_
@y
_Last updated July 2024_
@z

@x
When
[SSO enforcement](/manuals/security/authentication/single-sign-on/connect.md)
was first introduced, Docker provided a grace period to continue to let
passwords be used on the Docker CLI when authenticating to Docker Hub. This was
allowed so organizations could adopt SSO enforcement. It is recommended that
administrators configuring SSO encourage users using the CLI
[to switch over to Personal Access Tokens](/manuals/security/authentication/single-sign-on/_index.md#prerequisites)
in anticipation of this grace period ending.
@y
When
[SSO enforcement](manuals/security/authentication/single-sign-on/connect.md)
was first introduced, Docker provided a grace period to continue to let
passwords be used on the Docker CLI when authenticating to Docker Hub. This was
allowed so organizations could adopt SSO enforcement. It is recommended that
administrators configuring SSO encourage users using the CLI
[to switch over to Personal Access Tokens](manuals/security/authentication/single-sign-on/_index.md#prerequisites)
in anticipation of this grace period ending.
@z

@x
On September 16, 2024, the grace period ended and passwords can no longer
authenticate to Docker Hub via the Docker CLI when SSO is enforced. Affected
users are required to switch over to using PATs to continue signing in.
@y
On September 16, 2024, the grace period ended and passwords can no longer
authenticate to Docker Hub via the Docker CLI when SSO is enforced. Affected
users are required to switch over to using PATs to continue signing in.
@z

@x
This deprecation is a step toward a secure experience for developers and
organizations.
@y
This deprecation is a step toward a secure experience for developers and
organizations.
@z

@x
## SOC 2 Type 2 attestation and ISO 27001 certification
@y
## SOC 2 Type 2 attestation and ISO 27001 certification
@z

@x
_Last updated June 2024_
@y
_Last updated June 2024_
@z

@x
Docker received its SOC 2 Type 2 attestation and ISO 27001 certification with
no exceptions or major non-conformities.
@y
Docker received its SOC 2 Type 2 attestation and ISO 27001 certification with
no exceptions or major non-conformities.
@z

@x
Security is part of Docker's operations, mission, and company strategy.
Docker's products are core to the user community, and the SOC 2 Type 2
attestation and ISO 27001 certification demonstrate Docker's ongoing commitment
to security.
@y
Security is part of Docker's operations, mission, and company strategy.
Docker's products are core to the user community, and the SOC 2 Type 2
attestation and ISO 27001 certification demonstrate Docker's ongoing commitment
to security.
@z

@x
For more information, see the
[Blog announcement](https://www.docker.com/blog/docker-announces-soc-2-type-2-attestation-iso-27001-certification/).
@y
For more information, see the
[Blog announcement](https://www.docker.com/blog/docker-announces-soc-2-type-2-attestation-iso-27001-certification/).
@z

@x
## Docker security advisory: multiple vulnerabilities in runc, BuildKit, and Moby
@y
## Docker security advisory: multiple vulnerabilities in runc, BuildKit, and Moby
@z

@x
_Last updated February 2, 2024_
@y
_Last updated February 2, 2024_
@z

@x
Docker prioritizes the security and integrity of its software and the trust of
its users. Security researchers at Snyk Labs identified and reported four
security vulnerabilities in the container ecosystem. One of the vulnerabilities,
[CVE-2024-21626](https://scout.docker.com/v/CVE-2024-21626), concerns the runc
container runtime, and the other three affect BuildKit
([CVE-2024-23651](https://scout.docker.com/v/CVE-2024-23651),
[CVE-2024-23652](https://scout.docker.com/v/CVE-2024-23652), and
[CVE-2024-23653](https://scout.docker.com/v/CVE-2024-23653)). Docker, in
collaboration with the reporters and open source maintainers, coordinated and
implemented the remediations.
@y
Docker prioritizes the security and integrity of its software and the trust of
its users. Security researchers at Snyk Labs identified and reported four
security vulnerabilities in the container ecosystem. One of the vulnerabilities,
[CVE-2024-21626](https://scout.docker.com/v/CVE-2024-21626), concerns the runc
container runtime, and the other three affect BuildKit
([CVE-2024-23651](https://scout.docker.com/v/CVE-2024-23651),
[CVE-2024-23652](https://scout.docker.com/v/CVE-2024-23652), and
[CVE-2024-23653](https://scout.docker.com/v/CVE-2024-23653)). Docker, in
collaboration with the reporters and open source maintainers, coordinated and
implemented the remediations.
@z

@x
Docker published patched versions of runc, BuildKit, and Moby on January 31 and
released an update for Docker Desktop on February 1 to address these
vulnerabilities. The latest BuildKit and Moby releases also included fixes for
[CVE-2024-23650](https://scout.docker.com/v/CVE-2024-23650) and
[CVE-2024-24557](https://scout.docker.com/v/CVE-2024-24557), discovered
respectively by an independent researcher and through Docker's internal research
initiatives.
@y
Docker published patched versions of runc, BuildKit, and Moby on January 31 and
released an update for Docker Desktop on February 1 to address these
vulnerabilities. The latest BuildKit and Moby releases also included fixes for
[CVE-2024-23650](https://scout.docker.com/v/CVE-2024-23650) and
[CVE-2024-24557](https://scout.docker.com/v/CVE-2024-24557), discovered
respectively by an independent researcher and through Docker's internal research
initiatives.
@z

@x
|                        | Versions impacted       |
| :--------------------- | :---------------------- |
| `runc`                 | <= 1.1.11               |
| `BuildKit`             | <= 0.12.4               |
| `Moby (Docker Engine)` | <= 25.0.1 and <= 24.0.8 |
| `Docker Desktop`       | <= 4.27.0               |
@y
|                        | Versions impacted       |
| :--------------------- | :---------------------- |
| `runc`                 | <= 1.1.11               |
| `BuildKit`             | <= 0.12.4               |
| `Moby (Docker Engine)` | <= 25.0.1 and <= 24.0.8 |
| `Docker Desktop`       | <= 4.27.0               |
@z

@x
### What should I do if I'm on an affected version?
@y
### What should I do if I'm on an affected version?
@z

@x
If you are using affected versions of runc, BuildKit, Moby, or Docker Desktop,
make sure to update to the latest versions, linked in the following table:
@y
If you are using affected versions of runc, BuildKit, Moby, or Docker Desktop,
make sure to update to the latest versions, linked in the following table:
@z

@x
|                        | Patched versions                                                                                                                  |
| :--------------------- | :-------------------------------------------------------------------------------------------------------------------------------- |
| `runc`                 | >= [1.1.12](https://github.com/opencontainers/runc/releases/tag/v1.1.12)                                                          |
| `BuildKit`             | >= [0.12.5](https://github.com/moby/buildkit/releases/tag/v0.12.5)                                                                |
| `Moby (Docker Engine)` | >= [25.0.2](https://github.com/moby/moby/releases/tag/v25.0.2) and >= [24.0.9](https://github.com/moby/moby/releases/tag/v24.0.9) |
| `Docker Desktop`       | >= [4.27.1](/manuals/desktop/release-notes.md#4271)                                                                               |
@y
|                        | Patched versions                                                                                                                  |
| :--------------------- | :-------------------------------------------------------------------------------------------------------------------------------- |
| `runc`                 | >= [1.1.12](https://github.com/opencontainers/runc/releases/tag/v1.1.12)                                                          |
| `BuildKit`             | >= [0.12.5](https://github.com/moby/buildkit/releases/tag/v0.12.5)                                                                |
| `Moby (Docker Engine)` | >= [25.0.2](https://github.com/moby/moby/releases/tag/v25.0.2) and >= [24.0.9](https://github.com/moby/moby/releases/tag/v24.0.9) |
| `Docker Desktop`       | >= [4.27.1](manuals/desktop/release-notes.md#4271)                                                                               |
@z

@x
If you are unable to update to an unaffected version promptly, follow these best
practices to mitigate risk:
@y
If you are unable to update to an unaffected version promptly, follow these best
practices to mitigate risk:
@z

@x
- Only use trusted Docker images (such as
  [Docker Official Images](/manuals/docker-hub/image-library/trusted-content.md#docker-official-images)).
- Don't build Docker images from untrusted sources or untrusted Dockerfiles.
- If you are a Docker Business customer using Docker Desktop and unable to
  update to v4.27.1, make sure to enable
  [Hardened Docker Desktop](/manuals/desktop/enterprise/hardened-desktop/_index.md)
  features such as:
  - [Enhanced Container Isolation](/manuals/desktop/enterprise/hardened-desktop/enhanced-container-isolation/_index.md),
    which mitigates the impact of CVE-2024-21626 in the case of running
    containers from malicious images.
  - [Image Access Management](/manuals/desktop/enterprise/hardened-desktop/image-access-management.md),
    and
    [Registry Access Management](/manuals/desktop/enterprise/hardened-desktop/registry-access-management.md),
    which give organizations control over which images and repositories their
    users can access.
- For CVE-2024-23650, CVE-2024-23651, CVE-2024-23652, and CVE-2024-23653, avoid
  using BuildKit frontend from an untrusted source. A frontend image is usually
  specified as the #syntax line on your Dockerfile, or with `--frontend` flag
  when using the `buildctl build` command.
- To mitigate CVE-2024-24557, make sure to either use BuildKit or disable
  caching when building images. From the CLI this can be done via the
  `DOCKER_BUILDKIT=1` environment variable (default for Moby >= v23.0 if the
  Buildx plugin is installed) or the `--no-cache flag`. If you are using the
  HTTP API directly or through a client, the same can be done by setting
  `nocache` to `true` or `version` to `2` for the
  [/build API endpoint](https://docs.docker.com/reference/api/engine/version/v1.44/#tag/Image/operation/ImageBuild).
@y
- Only use trusted Docker images (such as
  [Docker Official Images](manuals/docker-hub/image-library/trusted-content.md#docker-official-images)).
- Don't build Docker images from untrusted sources or untrusted Dockerfiles.
- If you are a Docker Business customer using Docker Desktop and unable to
  update to v4.27.1, make sure to enable
  [Hardened Docker Desktop](manuals/desktop/enterprise/hardened-desktop/_index.md)
  features such as:
  - [Enhanced Container Isolation](manuals/desktop/enterprise/hardened-desktop/enhanced-container-isolation/_index.md),
    which mitigates the impact of CVE-2024-21626 in the case of running
    containers from malicious images.
  - [Image Access Management](manuals/desktop/enterprise/hardened-desktop/image-access-management.md),
    and
    [Registry Access Management](manuals/desktop/enterprise/hardened-desktop/registry-access-management.md),
    which give organizations control over which images and repositories their
    users can access.
- For CVE-2024-23650, CVE-2024-23651, CVE-2024-23652, and CVE-2024-23653, avoid
  using BuildKit frontend from an untrusted source. A frontend image is usually
  specified as the #syntax line on your Dockerfile, or with `--frontend` flag
  when using the `buildctl build` command.
- To mitigate CVE-2024-24557, make sure to either use BuildKit or disable
  caching when building images. From the CLI this can be done via the
  `DOCKER_BUILDKIT=1` environment variable (default for Moby >= v23.0 if the
  Buildx plugin is installed) or the `--no-cache flag`. If you are using the
  HTTP API directly or through a client, the same can be done by setting
  `nocache` to `true` or `version` to `2` for the
  [/build API endpoint](https://docs.docker.com/reference/api/engine/version/v1.44/#tag/Image/operation/ImageBuild).
@z

@x
### Technical details and impact
@y
### Technical details and impact
@z

@x
#### CVE-2024-21626 (High)
@y
#### CVE-2024-21626 (High)
@z

@x
In runc v1.1.11 and earlier, due to certain leaked file descriptors, an attacker
can gain access to the host filesystem by causing a newly-spawned container
process (from `runc exec`) to have a working directory in the host filesystem
namespace, or by tricking a user to run a malicious image and allow a container
process to gain access to the host filesystem through `runc run`. The attacks
can also be adapted to overwrite semi-arbitrary host binaries, allowing for
complete container escapes. Note that when using higher-level runtimes (such as
Docker or Kubernetes), this vulnerability can be exploited by running a
malicious container image without additional configuration or by passing
specific workdir options when starting a container. The vulnerability can also
be exploited from within Dockerfiles in the case of Docker.
@y
In runc v1.1.11 and earlier, due to certain leaked file descriptors, an attacker
can gain access to the host filesystem by causing a newly-spawned container
process (from `runc exec`) to have a working directory in the host filesystem
namespace, or by tricking a user to run a malicious image and allow a container
process to gain access to the host filesystem through `runc run`. The attacks
can also be adapted to overwrite semi-arbitrary host binaries, allowing for
complete container escapes. Note that when using higher-level runtimes (such as
Docker or Kubernetes), this vulnerability can be exploited by running a
malicious container image without additional configuration or by passing
specific workdir options when starting a container. The vulnerability can also
be exploited from within Dockerfiles in the case of Docker.
@z

@x
_The issue has been fixed in runc v1.1.12._
@y
_The issue has been fixed in runc v1.1.12._
@z

@x
#### CVE-2024-23651 (High)
@y
#### CVE-2024-23651 (High)
@z

@x
In BuildKit <= v0.12.4, two malicious build steps running in parallel sharing
the same cache mounts with subpaths could cause a race condition, leading to
files from the host system being accessible to the build container. This will
only occur if a user is trying to build a Dockerfile of a malicious project.
@y
In BuildKit <= v0.12.4, two malicious build steps running in parallel sharing
the same cache mounts with subpaths could cause a race condition, leading to
files from the host system being accessible to the build container. This will
only occur if a user is trying to build a Dockerfile of a malicious project.
@z

@x
_The issue has been fixed in BuildKit v0.12.5._
@y
_The issue has been fixed in BuildKit v0.12.5._
@z

@x
#### CVE-2024-23652 (High)
@y
#### CVE-2024-23652 (High)
@z

@x
In BuildKit <= v0.12.4, a malicious BuildKit frontend or Dockerfile using
`RUN --mount` could trick the feature that removes empty files created for the
mountpoints into removing a file outside the container from the host system.
This will only occur if a user is using a malicious Dockerfile.
@y
In BuildKit <= v0.12.4, a malicious BuildKit frontend or Dockerfile using
`RUN --mount` could trick the feature that removes empty files created for the
mountpoints into removing a file outside the container from the host system.
This will only occur if a user is using a malicious Dockerfile.
@z

@x
_The issue has been fixed in BuildKit v0.12.5._
@y
_The issue has been fixed in BuildKit v0.12.5._
@z

@x
#### CVE-2024-23653 (High)
@y
#### CVE-2024-23653 (High)
@z

@x
In addition to running containers as build steps, BuildKit also provides APIs
for running interactive containers based on built images. In BuildKit <=
v0.12.4, it is possible to use these APIs to ask BuildKit to run a container
with elevated privileges. Normally, running such containers is only allowed if
special `security.insecure` entitlement is enabled both by buildkitd
configuration and allowed by the user initializing the build request.
@y
In addition to running containers as build steps, BuildKit also provides APIs
for running interactive containers based on built images. In BuildKit <=
v0.12.4, it is possible to use these APIs to ask BuildKit to run a container
with elevated privileges. Normally, running such containers is only allowed if
special `security.insecure` entitlement is enabled both by buildkitd
configuration and allowed by the user initializing the build request.
@z

@x
_The issue has been fixed in BuildKit v0.12.5._
@y
_The issue has been fixed in BuildKit v0.12.5._
@z

@x
#### CVE-2024-23650 (Medium)
@y
#### CVE-2024-23650 (Medium)
@z

@x
In BuildKit <= v0.12.4, a malicious BuildKit client or frontend could craft a
request that could lead to BuildKit daemon crashing with a panic.
@y
In BuildKit <= v0.12.4, a malicious BuildKit client or frontend could craft a
request that could lead to BuildKit daemon crashing with a panic.
@z

@x
_The issue has been fixed in BuildKit v0.12.5._
@y
_The issue has been fixed in BuildKit v0.12.5._
@z

@x
#### CVE-2024-24557 (Medium)
@y
#### CVE-2024-24557 (Medium)
@z

@x
In Moby <= v25.0.1 and <= v24.0.8, the classic builder cache system is prone to
cache poisoning if the image is built FROM scratch. Also, changes to some
instructions (most important being `HEALTHCHECK` and `ONBUILD`) would not cause
a cache miss. An attacker with knowledge of the Dockerfile someone is using
could poison their cache by making them pull a specially crafted image that
would be considered a valid cache candidate for some build steps.
@y
In Moby <= v25.0.1 and <= v24.0.8, the classic builder cache system is prone to
cache poisoning if the image is built FROM scratch. Also, changes to some
instructions (most important being `HEALTHCHECK` and `ONBUILD`) would not cause
a cache miss. An attacker with knowledge of the Dockerfile someone is using
could poison their cache by making them pull a specially crafted image that
would be considered a valid cache candidate for some build steps.
@z

@x
_The issue has been fixed in Moby >= v25.0.2 and >= v24.0.9._
@y
_The issue has been fixed in Moby >= v25.0.2 and >= v24.0.9._
@z

@x
### How are Docker products affected?
@y
### How are Docker products affected?
@z

@x
#### Docker Desktop
@y
#### Docker Desktop
@z

@x
Docker Desktop v4.27.0 and earlier are affected. Docker Desktop v4.27.1 was
released on February 1 and includes runc, BuildKit, and dockerd binaries
patches. In addition to updating to this new version, use only trusted Docker
images and Dockerfiles in your builds.
@y
Docker Desktop v4.27.0 and earlier are affected. Docker Desktop v4.27.1 was
released on February 1 and includes runc, BuildKit, and dockerd binaries
patches. In addition to updating to this new version, use only trusted Docker
images and Dockerfiles in your builds.
@z

@x
As always, you should check Docker Desktop system requirements for your
operating system
([Windows](/manuals/desktop/setup/install/windows-install.md#system-requirements),
[Linux](/manuals/desktop/setup/install/linux/_index.md#general-system-requirements),
[Mac](/manuals/desktop/setup/install/mac-install.md#system-requirements)) before
updating to ensure full compatibility.
@y
As always, you should check Docker Desktop system requirements for your
operating system
([Windows](manuals/desktop/setup/install/windows-install.md#system-requirements),
[Linux](manuals/desktop/setup/install/linux/_index.md#general-system-requirements),
[Mac](manuals/desktop/setup/install/mac-install.md#system-requirements)) before
updating to ensure full compatibility.
@z

@x
#### Docker Build Cloud
@y
#### Docker Build Cloud
@z

@x
Any new Docker Build Cloud builder instances will be provisioned with the latest
Docker Engine and BuildKit versions and will, therefore, be unaffected by these
CVEs. Updates have also been rolled out to existing Docker Build Cloud builders.
@y
Any new Docker Build Cloud builder instances will be provisioned with the latest
Docker Engine and BuildKit versions and will, therefore, be unaffected by these
CVEs. Updates have also been rolled out to existing Docker Build Cloud builders.
@z

@x
_No other Docker products are affected by these vulnerabilities._
@y
_No other Docker products are affected by these vulnerabilities._
@z

@x
### Advisory links
@y
### Advisory links
@z

@x
- Runc
  - [CVE-2024-21626](https://github.com/opencontainers/runc/security/advisories/GHSA-xr7r-f8xq-vfvv)
- BuildKit
  - [CVE-2024-23650](https://github.com/moby/buildkit/security/advisories/GHSA-9p26-698r-w4hx)
  - [CVE-2024-23651](https://github.com/moby/buildkit/security/advisories/GHSA-m3r6-h7wv-7xxv)
  - [CVE-2024-23652](https://github.com/moby/buildkit/security/advisories/GHSA-4v98-7qmw-rqr8)
  - [CVE-2024-23653](https://github.com/moby/buildkit/security/advisories/GHSA-wr6v-9f75-vh2g)
- Moby
  - [CVE-2024-24557](https://github.com/moby/moby/security/advisories/GHSA-xw73-rw38-6vjc)
@y
- Runc
  - [CVE-2024-21626](https://github.com/opencontainers/runc/security/advisories/GHSA-xr7r-f8xq-vfvv)
- BuildKit
  - [CVE-2024-23650](https://github.com/moby/buildkit/security/advisories/GHSA-9p26-698r-w4hx)
  - [CVE-2024-23651](https://github.com/moby/buildkit/security/advisories/GHSA-m3r6-h7wv-7xxv)
  - [CVE-2024-23652](https://github.com/moby/buildkit/security/advisories/GHSA-4v98-7qmw-rqr8)
  - [CVE-2024-23653](https://github.com/moby/buildkit/security/advisories/GHSA-wr6v-9f75-vh2g)
- Moby
  - [CVE-2024-24557](https://github.com/moby/moby/security/advisories/GHSA-xw73-rw38-6vjc)
@z

@x
## Text4Shell CVE-2022-42889
@y
## Text4Shell CVE-2022-42889
@z

@x
_Last updated October 2022_
@y
_Last updated October 2022_
@z

@x
[CVE-2022-42889](https://nvd.nist.gov/vuln/detail/CVE-2022-42889) has been
discovered in the popular Apache Commons Text library. Versions of this library
up to but not including 1.10.0 are affected by this vulnerability.
@y
[CVE-2022-42889](https://nvd.nist.gov/vuln/detail/CVE-2022-42889) has been
discovered in the popular Apache Commons Text library. Versions of this library
up to but not including 1.10.0 are affected by this vulnerability.
@z

@x
Update to the latest version of
[Apache Commons Text](https://commons.apache.org/proper/commons-text/download_text.cgi).
@y
Update to the latest version of
[Apache Commons Text](https://commons.apache.org/proper/commons-text/download_text.cgi).
@z

@x
### Scan images on Docker Hub
@y
### Scan images on Docker Hub
@z

@x
Docker Hub security scans triggered after 1200 UTC 21 October 2021 are now
correctly identifying the Text4Shell CVE. Scans before this date do not
currently reflect the status of this vulnerability. Trigger scans by pushing
new images to Docker Hub to view the status of the Text4Shell CVE in the
vulnerability report. For detailed instructions, see
[Scan images on Docker Hub](/manuals/docker-hub/repos/manage/vulnerability-scanning.md).
@y
Docker Hub security scans triggered after 1200 UTC 21 October 2021 are now
correctly identifying the Text4Shell CVE. Scans before this date do not
currently reflect the status of this vulnerability. Trigger scans by pushing
new images to Docker Hub to view the status of the Text4Shell CVE in the
vulnerability report. For detailed instructions, see
[Scan images on Docker Hub](manuals/docker-hub/repos/manage/vulnerability-scanning.md).
@z

@x
### Docker Official Images impacted by CVE-2022-42889
@y
### Docker Official Images impacted by CVE-2022-42889
@z

@x
A number of
[Docker Official Images](/manuals/docker-hub/image-library/trusted-content.md#docker-official-images)
contain the vulnerable versions of Apache Commons Text. The following lists
Docker Official Images that may contain the vulnerable versions of Apache
Commons Text:
@y
A number of
[Docker Official Images](manuals/docker-hub/image-library/trusted-content.md#docker-official-images)
contain the vulnerable versions of Apache Commons Text. The following lists
Docker Official Images that may contain the vulnerable versions of Apache
Commons Text:
@z

@x
- [bonita](https://hub.docker.com/_/bonita)
- [Couchbase](https://hub.docker.com/_/couchbase)
- [Geonetwork](https://hub.docker.com/_/geonetwork)
- [neo4j](https://hub.docker.com/_/neo4j)
- [sliverpeas](https://hub.docker.com/_/sliverpeas)
- [solr](https://hub.docker.com/_/solr)
- [xwiki](https://hub.docker.com/_/xwiki)
@y
- [bonita](https://hub.docker.com/_/bonita)
- [Couchbase](https://hub.docker.com/_/couchbase)
- [Geonetwork](https://hub.docker.com/_/geonetwork)
- [neo4j](https://hub.docker.com/_/neo4j)
- [sliverpeas](https://hub.docker.com/_/sliverpeas)
- [solr](https://hub.docker.com/_/solr)
- [xwiki](https://hub.docker.com/_/xwiki)
@z

@x
Docker updated Apache Commons Text in these images to the latest version. Some
of these images may not be vulnerable for other reasons. Also review the
guidelines published on the upstream websites.
@y
Docker updated Apache Commons Text in these images to the latest version. Some
of these images may not be vulnerable for other reasons. Also review the
guidelines published on the upstream websites.
@z

@x
## Log4j 2 CVE-2021-44228
@y
## Log4j 2 CVE-2021-44228
@z

@x
_Last updated December 2021_
@y
_Last updated December 2021_
@z

@x
The [Log4j 2 CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228)
vulnerability in Log4j 2, a common Java logging library, allows remote code
execution, often from a context that is available to an attacker. For example,
it was found in Minecraft servers which allowed the commands to be typed into
chat logs as these were then sent to the logger. This makes it a serious
vulnerability, as the logging library is used so widely and it may be simple
to exploit. Many open source maintainers are working hard with fixes and
updates to the software ecosystem.
@y
The [Log4j 2 CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228)
vulnerability in Log4j 2, a common Java logging library, allows remote code
execution, often from a context that is available to an attacker. For example,
it was found in Minecraft servers which allowed the commands to be typed into
chat logs as these were then sent to the logger. This makes it a serious
vulnerability, as the logging library is used so widely and it may be simple
to exploit. Many open source maintainers are working hard with fixes and
updates to the software ecosystem.
@z

@x
The vulnerable versions of Log4j 2 are versions 2.0 to version 2.14.1 inclusive.
The first fixed version is 2.15.0. Update to the
[latest version](https://logging.apache.org/log4j/2.x/download.html) if you can.
If you are using a version before 2.0, you are also not vulnerable.
@y
The vulnerable versions of Log4j 2 are versions 2.0 to version 2.14.1 inclusive.
The first fixed version is 2.15.0. Update to the
[latest version](https://logging.apache.org/log4j/2.x/download.html) if you can.
If you are using a version before 2.0, you are also not vulnerable.
@z

@x
You may not be vulnerable if you are using these versions, as your configuration
may already mitigate this, or the things you log may not include any user input.
This may be difficult to validate however without understanding all the code
paths that may log in detail, and where they may get input from. So you probably
will want to upgrade all code using vulnerable versions.
@y
You may not be vulnerable if you are using these versions, as your configuration
may already mitigate this, or the things you log may not include any user input.
This may be difficult to validate however without understanding all the code
paths that may log in detail, and where they may get input from. So you probably
will want to upgrade all code using vulnerable versions.
@z

@x
> CVE-2021-45046
>
> As an update to
> [CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228), the fix
> made in version 2.15.0 was incomplete. Additional issues have been identified
> and are tracked with
> [CVE-2021-45046](https://nvd.nist.gov/vuln/detail/CVE-2021-45046) and
> [CVE-2021-45105](https://nvd.nist.gov/vuln/detail/CVE-2021-45105). For a more
> complete fix to this vulnerability, update to 2.17.0 where possible.
@y
> CVE-2021-45046
>
> As an update to
> [CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228), the fix
> made in version 2.15.0 was incomplete. Additional issues have been identified
> and are tracked with
> [CVE-2021-45046](https://nvd.nist.gov/vuln/detail/CVE-2021-45046) and
> [CVE-2021-45105](https://nvd.nist.gov/vuln/detail/CVE-2021-45105). For a more
> complete fix to this vulnerability, update to 2.17.0 where possible.
@z

@x
### Scan images on Docker Hub
@y
### Scan images on Docker Hub
@z

@x
Docker Hub security scans triggered after 1700 UTC 13 December 2021 are now
correctly identifying the Log4j 2 CVEs. Scans before this date do not currently
reflect the status of this vulnerability. Trigger scans by pushing new images
to Docker Hub to view the status of Log4j 2 CVE in the vulnerability report.
For detailed instructions, see
[Scan images on Docker Hub](/manuals/docker-hub/repos/manage/vulnerability-scanning.md).
@y
Docker Hub security scans triggered after 1700 UTC 13 December 2021 are now
correctly identifying the Log4j 2 CVEs. Scans before this date do not currently
reflect the status of this vulnerability. Trigger scans by pushing new images
to Docker Hub to view the status of Log4j 2 CVE in the vulnerability report.
For detailed instructions, see
[Scan images on Docker Hub](manuals/docker-hub/repos/manage/vulnerability-scanning.md).
@z

@x
## Docker Official Images impacted by Log4j 2 CVE
@y
## Docker Official Images impacted by Log4j 2 CVE
@z

@x
_Last updated December 2021_
@y
_Last updated December 2021_
@z

@x
A number of
[Docker Official Images](/manuals/docker-hub/image-library/trusted-content.md#docker-official-images)
contain the vulnerable versions of Log4j 2 CVE-2021-44228. The following table
lists Docker Official Images that may contain the vulnerable versions of Log4j
2. Docker updated Log4j 2 in these images to the latest version. Some of these
images may not be vulnerable for other reasons. Also review the guidelines
published on the upstream websites.
@y
A number of
[Docker Official Images](manuals/docker-hub/image-library/trusted-content.md#docker-official-images)
contain the vulnerable versions of Log4j 2 CVE-2021-44228. The following table
lists Docker Official Images that may contain the vulnerable versions of Log4j
2. Docker updated Log4j 2 in these images to the latest version. Some of these
images may not be vulnerable for other reasons. Also review the guidelines
published on the upstream websites.
@z

@x
| Repository                                              | Patched version                | Additional documentation                                                                                                |
| :------------------------------------------------------ | :----------------------------- | :---------------------------------------------------------------------------------------------------------------------- |
| [couchbase](https://hub.docker.com/_/couchbase)         | 7.0.3                          | [Couchbase blog](https://blog.couchbase.com/what-to-know-about-the-log4j-vulnerability-cve-2021-44228/)                 |
| [Elasticsearch](https://hub.docker.com/_/elasticsearch) | 6.8.22, 7.16.2                 | [Elasticsearch announcement](https://www.elastic.co/blog/new-elasticsearch-and-logstash-releases-upgrade-apache-log4j2) |
| [Flink](https://hub.docker.com/_/flink)                 | 1.11.6, 1.12.7, 1.13.5, 1.14.2 | [Flink advice on Log4j CVE](https://flink.apache.org/2021/12/10/log4j-cve.html)                                         |
| [Geonetwork](https://hub.docker.com/_/geonetwork)       | 3.10.10                        | [Geonetwork GitHub discussion](https://github.com/geonetwork/core-geonetwork/issues/6076)                               |
| [lightstreamer](https://hub.docker.com/_/lightstreamer) | Awaiting info                  | Awaiting info                                                                                                           |
| [logstash](https://hub.docker.com/_/logstash)           | 6.8.22, 7.16.2                 | [Elasticsearch announcement](https://www.elastic.co/blog/new-elasticsearch-and-logstash-releases-upgrade-apache-log4j2) |
| [neo4j](https://hub.docker.com/_/neo4j)                 | 4.4.2                          | [Neo4j announcement](https://community.neo4j.com/t/log4j-cve-mitigation-for-neo4j/48856)                                |
| [solr](https://hub.docker.com/_/solr)                   | 8.11.1                         | [Solr security news](https://solr.apache.org/security.html#apache-solr-affected-by-apache-log4j-cve-2021-44228)         |
| [sonarqube](https://hub.docker.com/_/sonarqube)         | 8.9.5, 9.2.2                   | [SonarQube announcement](https://community.sonarsource.com/t/sonarqube-sonarcloud-and-the-log4j-vulnerability/54721)    |
| [storm](https://hub.docker.com/_/storm)                 | Awaiting info                  | Awaiting info                                                                                                           |
@y
| Repository                                              | Patched version                | Additional documentation                                                                                                |
| :------------------------------------------------------ | :----------------------------- | :---------------------------------------------------------------------------------------------------------------------- |
| [couchbase](https://hub.docker.com/_/couchbase)         | 7.0.3                          | [Couchbase blog](https://blog.couchbase.com/what-to-know-about-the-log4j-vulnerability-cve-2021-44228/)                 |
| [Elasticsearch](https://hub.docker.com/_/elasticsearch) | 6.8.22, 7.16.2                 | [Elasticsearch announcement](https://www.elastic.co/blog/new-elasticsearch-and-logstash-releases-upgrade-apache-log4j2) |
| [Flink](https://hub.docker.com/_/flink)                 | 1.11.6, 1.12.7, 1.13.5, 1.14.2 | [Flink advice on Log4j CVE](https://flink.apache.org/2021/12/10/log4j-cve.html)                                         |
| [Geonetwork](https://hub.docker.com/_/geonetwork)       | 3.10.10                        | [Geonetwork GitHub discussion](https://github.com/geonetwork/core-geonetwork/issues/6076)                               |
| [lightstreamer](https://hub.docker.com/_/lightstreamer) | Awaiting info                  | Awaiting info                                                                                                           |
| [logstash](https://hub.docker.com/_/logstash)           | 6.8.22, 7.16.2                 | [Elasticsearch announcement](https://www.elastic.co/blog/new-elasticsearch-and-logstash-releases-upgrade-apache-log4j2) |
| [neo4j](https://hub.docker.com/_/neo4j)                 | 4.4.2                          | [Neo4j announcement](https://community.neo4j.com/t/log4j-cve-mitigation-for-neo4j/48856)                                |
| [solr](https://hub.docker.com/_/solr)                   | 8.11.1                         | [Solr security news](https://solr.apache.org/security.html#apache-solr-affected-by-apache-log4j-cve-2021-44228)         |
| [sonarqube](https://hub.docker.com/_/sonarqube)         | 8.9.5, 9.2.2                   | [SonarQube announcement](https://community.sonarsource.com/t/sonarqube-sonarcloud-and-the-log4j-vulnerability/54721)    |
| [storm](https://hub.docker.com/_/storm)                 | Awaiting info                  | Awaiting info                                                                                                           |
@z

@x
> [!NOTE]
>
> Although [xwiki](https://hub.docker.com/_/xwiki) images may be detected as
> vulnerable by some scanners, the authors believe the images are not vulnerable
> by Log4j 2 CVE as the API jars do not contain the vulnerability. The
> [Nuxeo](https://hub.docker.com/_/nuxeo) image is deprecated and will not be
> updated.
@y
> [!NOTE]
>
> Although [xwiki](https://hub.docker.com/_/xwiki) images may be detected as
> vulnerable by some scanners, the authors believe the images are not vulnerable
> by Log4j 2 CVE as the API jars do not contain the vulnerability. The
> [Nuxeo](https://hub.docker.com/_/nuxeo) image is deprecated and will not be
> updated.
@z
