%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Base image hardening
linktitle: Hardening
description: Learn how Docker Hardened Images are designed for security, with minimal components, nonroot execution, and secure-by-default configurations.
keywords: hardened base image, minimal container image, non-root containers, secure container configuration, remove package manager
@y
title: Base image hardening
linktitle: Hardening
description: Learn how Docker Hardened Images are designed for security, with minimal components, nonroot execution, and secure-by-default configurations.
keywords: hardened base image, minimal container image, non-root containers, secure container configuration, remove package manager
@z

@x
## What is base image hardening?
@y
## What is base image hardening?
@z

@x
Base image hardening is the process of securing the foundational layers of a
container image by minimizing what they include and configuring them with
security-first defaults. A hardened base image removes unnecessary components,
like shells, compilers, and package managers, which limits the available attack
surface, making it more difficult for an attacker to gain control or escalate
privileges inside the container.
@y
Base image hardening is the process of securing the foundational layers of a
container image by minimizing what they include and configuring them with
security-first defaults. A hardened base image removes unnecessary components,
like shells, compilers, and package managers, which limits the available attack
surface, making it more difficult for an attacker to gain control or escalate
privileges inside the container.
@z

@x
Hardening also involves applying best practices like running as a non-root user,
reducing writable surfaces, and ensuring consistency through immutability. While
[Docker Official
Images](../../docker-hub/image-library/trusted-content.md#docker-official-images)
and [Docker Verified Publisher
Images](../../docker-hub/image-library/trusted-content.md#verified-publisher-images)
follow best practices for security, they may not be as hardened as Docker
Hardened Images, as they are designed to support a broader range of use cases.
@y
Hardening also involves applying best practices like running as a non-root user,
reducing writable surfaces, and ensuring consistency through immutability. While
[Docker Official
Images](../../docker-hub/image-library/trusted-content.md#docker-official-images)
and [Docker Verified Publisher
Images](../../docker-hub/image-library/trusted-content.md#verified-publisher-images)
follow best practices for security, they may not be as hardened as Docker
Hardened Images, as they are designed to support a broader range of use cases.
@z

@x
## Why is it important?
@y
## Why is it important?
@z

@x
Most containers inherit their security posture from the base image they use. If
the base image includes unnecessary tools or runs with elevated privileges,
every container built on top of it is exposed to those risks.
@y
Most containers inherit their security posture from the base image they use. If
the base image includes unnecessary tools or runs with elevated privileges,
every container built on top of it is exposed to those risks.
@z

@x
Hardening the base image:
@y
Hardening the base image:
@z

@x
- Reduces the attack surface by removing tools and libraries that could be exploited
- Enforces least privilege by dropping root access and restricting what the container can do
- Improves reliability and consistency by avoiding runtime changes and drift
- Aligns with secure software supply chain practices and helps meet compliance standards
@y
- Reduces the attack surface by removing tools and libraries that could be exploited
- Enforces least privilege by dropping root access and restricting what the container can do
- Improves reliability and consistency by avoiding runtime changes and drift
- Aligns with secure software supply chain practices and helps meet compliance standards
@z

@x
Using hardened base images is a critical first step in securing the software you
build and run in containers.
@y
Using hardened base images is a critical first step in securing the software you
build and run in containers.
@z

@x
## What's removed and why
@y
## What's removed and why
@z

@x
Hardened images typically exclude common components that are risky or unnecessary in secure production environments:
@y
Hardened images typically exclude common components that are risky or unnecessary in secure production environments:
@z

@x
| Removed component                                | Reason                                                                           |
|--------------------------------------------------|----------------------------------------------------------------------------------|
| Shells (e.g., `sh`, `bash`)                      | Prevents users or attackers from executing arbitrary commands inside containers  |
| Package managers (e.g., `apt`, `apk`)            | Disables the ability to install software post-build, reducing drift and exposure |
| Compilers and interpreters                       | Avoids introducing tools that could be used to run or inject malicious code      |
| Debugging tools (e.g., `strace`, `curl`, `wget`) | Reduces risk of exploitation or information leakage                              |
| Unused libraries or locales                      | Shrinks image size and minimizes attack vectors                                  |
@y
| Removed component                                | Reason                                                                           |
|--------------------------------------------------|----------------------------------------------------------------------------------|
| Shells (e.g., `sh`, `bash`)                      | Prevents users or attackers from executing arbitrary commands inside containers  |
| Package managers (e.g., `apt`, `apk`)            | Disables the ability to install software post-build, reducing drift and exposure |
| Compilers and interpreters                       | Avoids introducing tools that could be used to run or inject malicious code      |
| Debugging tools (e.g., `strace`, `curl`, `wget`) | Reduces risk of exploitation or information leakage                              |
| Unused libraries or locales                      | Shrinks image size and minimizes attack vectors                                  |
@z

@x
## How Docker Hardened Images apply base image hardening
@y
## How Docker Hardened Images apply base image hardening
@z

@x
Docker Hardened Images (DHIs) apply base image hardening principles by design.
Each image is constructed to include only what is necessary for its specific
purpose, whether that’s building applications (with `-dev` or `-sdk` tags) or
running them in production.
@y
Docker Hardened Images (DHIs) apply base image hardening principles by design.
Each image is constructed to include only what is necessary for its specific
purpose, whether that’s building applications (with `-dev` or `-sdk` tags) or
running them in production.
@z

@x
### Docker Hardened Image traits
@y
### Docker Hardened Image traits
@z

@x
Docker Hardened Images are built to be:
@y
Docker Hardened Images are built to be:
@z

@x
- Minimal: Only essential libraries and binaries are included
- Immutable: Images are fixed at build time—no runtime installations
- Non-root by default: Containers run as an unprivileged user unless configured otherwise
- Purpose-scoped: Different tags are available for development (`-dev`), SDK-based builds (`-sdk`), and production runtime
@y
- Minimal: Only essential libraries and binaries are included
- Immutable: Images are fixed at build time—no runtime installations
- Non-root by default: Containers run as an unprivileged user unless configured otherwise
- Purpose-scoped: Different tags are available for development (`-dev`), SDK-based builds (`-sdk`), and production runtime
@z

@x
These characteristics help enforce consistent, secure behavior across development, testing, and production environments.
@y
These characteristics help enforce consistent, secure behavior across development, testing, and production environments.
@z

@x
### Docker Hardened Image compatibility considerations
@y
### Docker Hardened Image compatibility considerations
@z

@x
Because Docker Hardened Images strip out many common tools, they may not work out of the box for all use cases. You may need to:
@y
Because Docker Hardened Images strip out many common tools, they may not work out of the box for all use cases. You may need to:
@z

@x
- Use multi-stage builds to compile code or install dependencies in a `-dev` image and copy the output into a hardened runtime image
- Replace shell scripts with equivalent entrypoint binaries or explicitly include a shell if needed
- Use [Docker Debug](../../../reference/cli/docker/debug.md) to temporarily inspect or troubleshoot containers without altering the base image
@y
- Use multi-stage builds to compile code or install dependencies in a `-dev` image and copy the output into a hardened runtime image
- Replace shell scripts with equivalent entrypoint binaries or explicitly include a shell if needed
- Use [Docker Debug](../../../reference/cli/docker/debug.md) to temporarily inspect or troubleshoot containers without altering the base image
@z

@x
These trade-offs are intentional and help support best practices for building secure, reproducible, and production-ready containers.
@y
These trade-offs are intentional and help support best practices for building secure, reproducible, and production-ready containers.
@z
