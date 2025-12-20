%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Use a Docker Hardened Image
linktitle: Use an image
description: Learn how to pull, run, and reference Docker Hardened Images in Dockerfiles, CI pipelines, and standard development workflows.
keywords: use hardened image, docker pull secure image, non-root containers, multi-stage dockerfile, dev image variant
@y
title: Use a Docker Hardened Image
linktitle: Use an image
description: Learn how to pull, run, and reference Docker Hardened Images in Dockerfiles, CI pipelines, and standard development workflows.
keywords: use hardened image, docker pull secure image, non-root containers, multi-stage dockerfile, dev image variant
@z

@x
You can use a Docker Hardened Image (DHI) just like any other image on Docker
Hub. DHIs follow the same familiar usage patterns. Pull them with `docker pull`,
reference them in your Dockerfile, and run containers with `docker run`.
@y
You can use a Docker Hardened Image (DHI) just like any other image on Docker
Hub. DHIs follow the same familiar usage patterns. Pull them with `docker pull`,
reference them in your Dockerfile, and run containers with `docker run`.
@z

@x
The key difference is that DHIs are security-focused and intentionally minimal
to reduce the attack surface. This means some variants don't include a shell or
package manager, and may run as a nonroot user by default.
@y
The key difference is that DHIs are security-focused and intentionally minimal
to reduce the attack surface. This means some variants don't include a shell or
package manager, and may run as a nonroot user by default.
@z

@x
> [!IMPORTANT]
>
> You must authenticate to the Docker Hardened Images registry (`dhi.io`) to
> pull images. Use your Docker ID credentials (the same username and password
> you use for Docker Hub) when signing in. If you don't have a Docker account,
> [create one](../../accounts/create-account.md) for free.
>
> Run `docker login dhi.io` to authenticate.
@y
> [!IMPORTANT]
>
> You must authenticate to the Docker Hardened Images registry (`dhi.io`) to
> pull images. Use your Docker ID credentials (the same username and password
> you use for Docker Hub) when signing in. If you don't have a Docker account,
> [create one](../../accounts/create-account.md) for free.
>
> Run `docker login dhi.io` to authenticate.
@z

% snip command...

@x
## Considerations when adopting DHIs
@y
## Considerations when adopting DHIs
@z

@x
Docker Hardened Images are intentionally minimal to improve security. If you're updating existing Dockerfiles or frameworks to use DHIs, keep the following considerations in mind:
@y
Docker Hardened Images are intentionally minimal to improve security. If you're updating existing Dockerfiles or frameworks to use DHIs, keep the following considerations in mind:
@z

@x
| Feature            | Details                                                                                                                                                                                                                                               |
|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| No shell or package manager | Runtime images don’t include a shell or package manager. Use `-dev` or `-sdk` variants in build stages to run shell commands or install packages, and then copy artifacts to a minimal runtime image.                                         |
| Non-root runtime    | Runtime DHIs default to running as a non-root user. Ensure your application doesn't require privileged access and that all needed files are readable and executable by a non-root user.                                                             |
| Ports               | Applications running as non-root users can't bind to ports below 1024 in older versions of Docker or in some Kubernetes configurations. Use ports above 1024 for compatibility.                                             |
| Entry point         | DHIs may not include a default entrypoint or might use a different one than the original image you're familiar with. Check the image configuration and update your `CMD` or `ENTRYPOINT` directives accordingly.                                        |
| Multi-stage builds  | Always use multi-stage builds for frameworks: a `-dev` image for building or installing dependencies, and a minimal runtime image for the final stage.                                                                                                              |
| TLS certificates    | DHIs include standard TLS certificates. You do not need to manually install CA certs.                                                                                                                                                               |
@y
| Feature            | Details                                                                                                                                                                                                                                               |
|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| No shell or package manager | Runtime images don’t include a shell or package manager. Use `-dev` or `-sdk` variants in build stages to run shell commands or install packages, and then copy artifacts to a minimal runtime image.                                         |
| Non-root runtime    | Runtime DHIs default to running as a non-root user. Ensure your application doesn't require privileged access and that all needed files are readable and executable by a non-root user.                                                             |
| Ports               | Applications running as non-root users can't bind to ports below 1024 in older versions of Docker or in some Kubernetes configurations. Use ports above 1024 for compatibility.                                             |
| Entry point         | DHIs may not include a default entrypoint or might use a different one than the original image you're familiar with. Check the image configuration and update your `CMD` or `ENTRYPOINT` directives accordingly.                                        |
| Multi-stage builds  | Always use multi-stage builds for frameworks: a `-dev` image for building or installing dependencies, and a minimal runtime image for the final stage.                                                                                                              |
| TLS certificates    | DHIs include standard TLS certificates. You do not need to manually install CA certs.                                                                                                                                                               |
@z

@x
If you're migrating an existing application, see  [Migrate an existing application to use Docker Hardened Images](../migration/_index.md).
@y
If you're migrating an existing application, see  [Migrate an existing application to use Docker Hardened Images](../migration/_index.md).
@z

@x
## Use a DHI in a Dockerfile
@y
## Use a DHI in a Dockerfile
@z

@x
To use a DHI as the base image for your container, specify it in the `FROM` instruction in your Dockerfile:
@y
To use a DHI as the base image for your container, specify it in the `FROM` instruction in your Dockerfile:
@z

@x
```dockerfile
FROM dhi.io/<image>:<tag>
```
@y
```dockerfile
FROM dhi.io/<image>:<tag>
```
@z

@x
Replace the image name and tag with the variant you want to use. For example,
use a `-dev` tag if you need a shell or package manager during build stages:
@y
Replace the image name and tag with the variant you want to use. For example,
use a `-dev` tag if you need a shell or package manager during build stages:
@z

@x
```dockerfile
FROM dhi.io/python:3.13-dev AS build
```
@y
```dockerfile
FROM dhi.io/python:3.13-dev AS build
```
@z

@x
To learn how to explore available variants, see [Explore images](./explore.md).
@y
To learn how to explore available variants, see [Explore images](./explore.md).
@z

@x
> [!TIP]
>
> Use a multi-stage Dockerfile to separate build and runtime stages, using a
> `-dev` variant in build stages and a minimal runtime image in the final stage.
@y
> [!TIP]
>
> Use a multi-stage Dockerfile to separate build and runtime stages, using a
> `-dev` variant in build stages and a minimal runtime image in the final stage.
@z

@x
## Pull a DHI
@y
## Pull a DHI
@z

@x
Just like any other image, you can pull DHIs using tools such as
the Docker CLI or within your CI pipelines.
@y
Just like any other image, you can pull DHIs using tools such as
the Docker CLI or within your CI pipelines.
@z

@x
You can pull Docker Hardened Images from three different locations depending on your needs:
@y
You can pull Docker Hardened Images from three different locations depending on your needs:
@z

@x
- Directly from `dhi.io`
- From a mirror on Docker Hub
- From a mirror on a third-party registry
@y
- Directly from `dhi.io`
- From a mirror on Docker Hub
- From a mirror on a third-party registry
@z

@x
To understand which approach is right for your use case, see [Mirror a Docker Hardened Image repository](./mirror.md).
@y
To understand which approach is right for your use case, see [Mirror a Docker Hardened Image repository](./mirror.md).
@z

@x
The following sections show how to pull images from each location.
@y
The following sections show how to pull images from each location.
@z

@x
### Pull directly from dhi.io
@y
### Pull directly from dhi.io
@z

@x
After authenticating to `dhi.io`, you can pull images using standard Docker commands:
@y
After authenticating to `dhi.io`, you can pull images using standard Docker commands:
@z

@x
```console
$ docker login dhi.io
$ docker pull dhi.io/python:3.13
```
@y
```console
$ docker login dhi.io
$ docker pull dhi.io/python:3.13
```
@z

@x
Reference images in your Dockerfile:
@y
Reference images in your Dockerfile:
@z

@x
```dockerfile
FROM dhi.io/python:3.13
COPY . /app
CMD ["python", "/app/main.py"]
```
@y
```dockerfile
FROM dhi.io/python:3.13
COPY . /app
CMD ["python", "/app/main.py"]
```
@z

@x
### Pull from a mirror on Docker Hub
@y
### Pull from a mirror on Docker Hub
@z

@x
Once you've mirrored a repository to Docker Hub, you can pull images from your organization's namespace:
@y
Once you've mirrored a repository to Docker Hub, you can pull images from your organization's namespace:
@z

@x
```console
$ docker login
$ docker pull <your-namespace>/dhi-python:3.13
```
@y
```console
$ docker login
$ docker pull <your-namespace>/dhi-python:3.13
```
@z

@x
Reference mirrored images in your Dockerfile:
@y
Reference mirrored images in your Dockerfile:
@z

@x
```dockerfile
FROM <your-namespace>/dhi-python:3.13
COPY . /app
CMD ["python", "/app/main.py"]
```
@y
```dockerfile
FROM <your-namespace>/dhi-python:3.13
COPY . /app
CMD ["python", "/app/main.py"]
```
@z

@x
To learn how to mirror repositories, see [Mirror a DHI repository to Docker Hub](./mirror.md#mirror-a-dhi-repository-to-docker-hub).
@y
To learn how to mirror repositories, see [Mirror a DHI repository to Docker Hub](./mirror.md#mirror-a-dhi-repository-to-docker-hub).
@z

@x
### Pull from a mirror on a third-party registry
@y
### Pull from a mirror on a third-party registry
@z

@x
Once you've mirrored a repository to your third-party registry, you can pull images:
@y
Once you've mirrored a repository to your third-party registry, you can pull images:
@z

@x
```console
$ docker pull <your-registry>/<your-namespace>/python:3.13
```
@y
```console
$ docker pull <your-registry>/<your-namespace>/python:3.13
```
@z

@x
Reference third-party mirrored images in your Dockerfile:
@y
Reference third-party mirrored images in your Dockerfile:
@z

@x
```dockerfile
FROM <your-registry>/<your-namespace>/python:3.13
COPY . /app
CMD ["python", "/app/main.py"]
```
@y
```dockerfile
FROM <your-registry>/<your-namespace>/python:3.13
COPY . /app
CMD ["python", "/app/main.py"]
```
@z

@x
To learn more, see [Mirror to a third-party registry](./mirror.md#mirror-to-a-third-party-registry).
@y
To learn more, see [Mirror to a third-party registry](./mirror.md#mirror-to-a-third-party-registry).
@z

@x
## Run a DHI
@y
## Run a DHI
@z

@x
After pulling the image, you can run it using `docker run`. For example:
@y
After pulling the image, you can run it using `docker run`. For example:
@z

@x
```console
$ docker run --rm dhi.io/python:3.13 python -c "print('Hello from DHI')"
```
@y
```console
$ docker run --rm dhi.io/python:3.13 python -c "print('Hello from DHI')"
```
@z

@x
## Use a DHI in CI/CD pipelines
@y
## Use a DHI in CI/CD pipelines
@z

@x
Docker Hardened Images work just like any other image in your CI/CD pipelines.
You can reference them in Dockerfiles, pull them as part of a pipeline step, or
run containers based on them during builds and tests.
@y
Docker Hardened Images work just like any other image in your CI/CD pipelines.
You can reference them in Dockerfiles, pull them as part of a pipeline step, or
run containers based on them during builds and tests.
@z

@x
Unlike typical container images, DHIs also include signed
[attestations](../core-concepts/attestations.md) such as SBOMs and provenance
metadata. You can incorporate these into your pipeline to support supply chain
security, policy checks, or audit requirements if your tooling supports it.
@y
Unlike typical container images, DHIs also include signed
[attestations](../core-concepts/attestations.md) such as SBOMs and provenance
metadata. You can incorporate these into your pipeline to support supply chain
security, policy checks, or audit requirements if your tooling supports it.
@z

@x
To strengthen your software supply chain, consider adding your own attestations
when building images from DHIs. This lets you document how the image was
built, verify its integrity, and enable downstream validation and policy
enforcement using tools like Docker Scout.
@y
To strengthen your software supply chain, consider adding your own attestations
when building images from DHIs. This lets you document how the image was
built, verify its integrity, and enable downstream validation and policy
enforcement using tools like Docker Scout.
@z

@x
To learn how to attach attestations during the build process, see [Docker Build
Attestations](/manuals/build/metadata/attestations.md).
@y
To learn how to attach attestations during the build process, see [Docker Build
Attestations](manuals/build/metadata/attestations.md).
@z

@x
## Use a static image for compiled executables
@y
## Use a static image for compiled executables
@z

@x
Docker Hardened Images include a `static` image repository designed specifically
for running compiled executables in an extremely minimal and secure runtime.
@y
Docker Hardened Images include a `static` image repository designed specifically
for running compiled executables in an extremely minimal and secure runtime.
@z

@x
Unlike a non-hardened `FROM scratch` image, the DHI `static` image includes all
the attestations needed to verify its integrity and provenance. Although it is
minimal, it includes the common packages needed to run containers securely, such
as `ca-certificates`.
@y
Unlike a non-hardened `FROM scratch` image, the DHI `static` image includes all
the attestations needed to verify its integrity and provenance. Although it is
minimal, it includes the common packages needed to run containers securely, such
as `ca-certificates`.
@z

@x
Use a `-dev` or other builder image in an earlier stage to compile your binary,
and copy the output into a `static` image.
@y
Use a `-dev` or other builder image in an earlier stage to compile your binary,
and copy the output into a `static` image.
@z

@x
The following example shows a multi-stage Dockerfile that builds a Go application
and runs it in a minimal static image:
@y
The following example shows a multi-stage Dockerfile that builds a Go application
and runs it in a minimal static image:
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
FROM dhi.io/golang:1.22-dev AS build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -o myapp
@y
FROM dhi.io/golang:1.22-dev AS build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -o myapp
@z

@x
FROM dhi.io/static:20230311
COPY --from=build /app/myapp /myapp
ENTRYPOINT ["/myapp"]
```
@y
FROM dhi.io/static:20230311
COPY --from=build /app/myapp /myapp
ENTRYPOINT ["/myapp"]
```
@z

@x
This pattern ensures a hardened runtime environment with no unnecessary
components, reducing the attack surface to a bare minimum.
@y
This pattern ensures a hardened runtime environment with no unnecessary
components, reducing the attack surface to a bare minimum.
@z

@x
## Use dev variants for framework-based applications
@y
## Use dev variants for framework-based applications
@z

@x
If you're building applications with frameworks that require package managers or
build tools (such as Python, Node.js, or Go), use a `-dev` variant during the
development or build stage. These variants include essential utilities like
shells, compilers, and package managers to support local iteration and CI
workflows.
@y
If you're building applications with frameworks that require package managers or
build tools (such as Python, Node.js, or Go), use a `-dev` variant during the
development or build stage. These variants include essential utilities like
shells, compilers, and package managers to support local iteration and CI
workflows.
@z

@x
Use `-dev` images in your inner development loop or in isolated CI stages to
maximize productivity. Once you're ready to produce artifacts for production,
switch to a smaller runtime variant to reduce the attack surface and image size.
@y
Use `-dev` images in your inner development loop or in isolated CI stages to
maximize productivity. Once you're ready to produce artifacts for production,
switch to a smaller runtime variant to reduce the attack surface and image size.
@z

@x
Dev variants are typically configured with no `ENTRYPOINT` and a default `CMD` that
launches a shell (for example, ["/bin/bash"]). In those cases, running the
container without additional arguments starts an interactive shell by default.
@y
Dev variants are typically configured with no `ENTRYPOINT` and a default `CMD` that
launches a shell (for example, ["/bin/bash"]). In those cases, running the
container without additional arguments starts an interactive shell by default.
@z

@x
The following example shows how to build a Python app using a `-dev` variant and
run it using the smaller runtime variant:
@y
The following example shows how to build a Python app using a `-dev` variant and
run it using the smaller runtime variant:
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
FROM dhi.io/python:3.13-alpine3.21-dev AS builder
@y
FROM dhi.io/python:3.13-alpine3.21-dev AS builder
@z

@x
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@y
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN python -m venv /app/venv
COPY requirements.txt .
@y
RUN python -m venv /app/venv
COPY requirements.txt .
@z

@x
RUN pip install --no-cache-dir -r requirements.txt
@y
RUN pip install --no-cache-dir -r requirements.txt
@z

@x
FROM dhi.io/python:3.13-alpine3.21
@y
FROM dhi.io/python:3.13-alpine3.21
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@y
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@z

@x
COPY image.py image.png ./
COPY --from=builder /app/venv /app/venv
@y
COPY image.py image.png ./
COPY --from=builder /app/venv /app/venv
@z

@x
ENTRYPOINT [ "python", "/app/image.py" ]
```
@y
ENTRYPOINT [ "python", "/app/image.py" ]
```
@z

@x
This pattern separates the build environment from the runtime environment,
helping reduce image size and improve security by removing unnecessary tooling
from the final image.
@y
This pattern separates the build environment from the runtime environment,
helping reduce image size and improve security by removing unnecessary tooling
from the final image.
@z

@x
## Use compliance variants {{< badge color="blue" text="DHI Enterprise" >}}
@y
## Use compliance variants {{< badge color="blue" text="DHI Enterprise" >}}
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
When you have a Docker Hardened Images Enterprise subscription, you can access
compliance variants such as FIPS-enabled and STIG-ready images. These
variants help meet regulatory and compliance requirements for secure
deployments.
@y
When you have a Docker Hardened Images Enterprise subscription, you can access
compliance variants such as FIPS-enabled and STIG-ready images. These
variants help meet regulatory and compliance requirements for secure
deployments.
@z

@x
To use a compliance variant, you must first [mirror](./mirror.md) the
repository, and then pull the compliance image from your mirrored repository.
@y
To use a compliance variant, you must first [mirror](./mirror.md) the
repository, and then pull the compliance image from your mirrored repository.
@z
