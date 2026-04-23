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
package manager, and may run as a non-root user by default.
@y
The key difference is that DHIs are security-focused and intentionally minimal
to reduce the attack surface. This means some variants don't include a shell or
package manager, and may run as a non-root user by default.
@z

@x
> [!IMPORTANT]
>
> You must authenticate to the Docker Hardened Images registry (`dhi.io`) to
> pull DHI Community images. You can authenticate using either of the following:
>
> - **Docker ID and password:** Use your Docker Hub username and password. If
>   you don't have a Docker account, [create one](../../accounts/create-account.md)
>   for free.
> - **Access token:** Use a [personal access token
>   (PAT)](../../security/access-tokens.md) for personal accounts, or an
>   [organization access token
>   (OAT)](../../enterprise/security/access-tokens.md) with your organization
>   name as the username.
>
> Run `docker login dhi.io` to authenticate.
@y
> [!IMPORTANT]
>
> You must authenticate to the Docker Hardened Images registry (`dhi.io`) to
> pull DHI Community images. You can authenticate using either of the following:
>
> - **Docker ID and password:** Use your Docker Hub username and password. If
>   you don't have a Docker account, [create one](../../accounts/create-account.md)
>   for free.
> - **Access token:** Use a [personal access token
>   (PAT)](../../security/access-tokens.md) for personal accounts, or an
>   [organization access token
>   (OAT)](../../enterprise/security/access-tokens.md) with your organization
>   name as the username.
>
> Run `docker login dhi.io` to authenticate.
@z

@x
## Considerations when adopting DHIs
@y
## Considerations when adopting DHIs
@z

@x
Docker Hardened Images are intentionally minimal to improve security. If you're
updating existing Dockerfiles or frameworks to use DHIs, keep in mind that
runtime images don't include shells or package managers, run as non-root users
by default, and may have different configurations than images you're familiar
with.
@y
Docker Hardened Images are intentionally minimal to improve security. If you're
updating existing Dockerfiles or frameworks to use DHIs, keep in mind that
runtime images don't include shells or package managers, run as non-root users
by default, and may have different configurations than images you're familiar
with.
@z

@x
For a comprehensive checklist of migration considerations and detailed guidance,
see [Migrate to Docker Hardened Images](../migration/_index.md).
@y
For a comprehensive checklist of migration considerations and detailed guidance,
see [Migrate to Docker Hardened Images](../migration/_index.md).
@z

@x
## Pull, run, and reference DHIs
@y
## Pull, run, and reference DHIs
@z

@x
Docker Hardened Images use different image references depending on your
subscription:
@y
Docker Hardened Images use different image references depending on your
subscription:
@z

@x
| Subscription        | Image reference            | Authentication        |
|---------------------|----------------------------|-----------------------|
| Community           | `dhi.io/<image>:<tag>`     | `docker login dhi.io` |
| Select & Enterprise | `<your-org>/<image>:<tag>` | `docker login`        |
@y
| Subscription        | Image reference            | Authentication        |
|---------------------|----------------------------|-----------------------|
| Community           | `dhi.io/<image>:<tag>`     | `docker login dhi.io` |
| Select & Enterprise | `<your-org>/<image>:<tag>` | `docker login`        |
@z

@x
Select and Enterprise users should [mirror](./mirror.md) repositories to their
Docker Hub organization to access compliance variants and customization
features.
@y
Select and Enterprise users should [mirror](./mirror.md) repositories to their
Docker Hub organization to access compliance variants and customization
features.
@z

@x
After authenticating, use the image reference in standard Docker commands and
Dockerfiles. For example:
@y
After authenticating, use the image reference in standard Docker commands and
Dockerfiles. For example:
@z

@x
```console
$ docker pull dhi.io/python:3.13
$ docker run --rm dhi.io/python:3.13 python -c "print('Hello from DHI')"
```
@y
```console
$ docker pull dhi.io/python:3.13
$ docker run --rm dhi.io/python:3.13 python -c "print('Hello from DHI')"
```
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
For multi-stage builds:
- Use a `-dev` tag for build stages that need a shell or package manager. See
  [Use dev variants for framework-based
  applications](#use-dev-variants-for-framework-based-applications).
- Use the `static` image for compiled executables with minimal runtime
  dependencies. See [Use a static image for compiled
  executables](#use-a-static-image-for-compiled-executables).
@y
For multi-stage builds:
- Use a `-dev` tag for build stages that need a shell or package manager. See
  [Use dev variants for framework-based
  applications](#use-dev-variants-for-framework-based-applications).
- Use the `static` image for compiled executables with minimal runtime
  dependencies. See [Use a static image for compiled
  executables](#use-a-static-image-for-compiled-executables).
@z

@x
To learn how to search for available variants, see [Search and evaluate
images](./explore.md).
@y
To learn how to search for available variants, see [Search and evaluate
images](./explore.md).
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
when building images from DHIs. This lets you document how the image was built,
verify its integrity, and enable downstream validation and policy enforcement
using tools like Docker Scout.
@y
To strengthen your software supply chain, consider adding your own attestations
when building images from DHIs. This lets you document how the image was built,
verify its integrity, and enable downstream validation and policy enforcement
using tools like Docker Scout.
@z

@x
To learn how to attach attestations during the build process, see [Docker Build
Attestations](/manuals/build/metadata/attestations.md).
@y
To learn how to attach attestations during the build process, see [Docker Build
Attestations](manuals/build/metadata/attestations.md).
@z

@x
### Discover attestations with ORAS
@y
### Discover attestations with ORAS
@z

@x
You can use [ORAS](https://oras.land/) to discover and inspect the attestations
attached to Docker Hardened Images. This is particularly useful in CI/CD
pipelines for supply chain security validation and compliance checks.
@y
You can use [ORAS](https://oras.land/) to discover and inspect the attestations
attached to Docker Hardened Images. This is particularly useful in CI/CD
pipelines for supply chain security validation and compliance checks.
@z

@x
For automated workflows, authenticate using an [organization access token
(OAT)](../../enterprise/security/access-tokens.md). OATs are owned by the
organization rather than an individual user, making them better suited for CI/CD
pipelines.
@y
For automated workflows, authenticate using an [organization access token
(OAT)](../../enterprise/security/access-tokens.md). OATs are owned by the
organization rather than an individual user, making them better suited for CI/CD
pipelines.
@z

@x
To discover attestations with ORAS:
@y
To discover attestations with ORAS:
@z

@x
1. [Generate an organization access
   token](../../enterprise/security/access-tokens.md) with **Read public
   repositories** scope.
@y
1. [Generate an organization access
   token](../../enterprise/security/access-tokens.md) with **Read public
   repositories** scope.
@z

@x
   The following example shows how to discover attestations on DHI community
   images from `dhi.io`. If you're discovering attestations on images mirrored to
   your organization, generate an OAT scoped to read from your mirrored repository
   instead of **Read public repositories**.
@y
   The following example shows how to discover attestations on DHI community
   images from `dhi.io`. If you're discovering attestations on images mirrored to
   your organization, generate an OAT scoped to read from your mirrored repository
   instead of **Read public repositories**.
@z

@x
2. Sign in to `dhi.io` using your organization name as the username and the OAT
   as the password.
@y
2. Sign in to `dhi.io` using your organization name as the username and the OAT
   as the password.
@z

@x
   > [!WARNING]
   >
   > The following examples export credentials directly on the command line for
   > demonstration purposes. This exposes sensitive tokens in your shell history
   > and process list. In production environments, use secure methods such as
   > reading from files with restricted permissions, environment files loaded
   > at runtime, or secret management tools.
@y
   > [!WARNING]
   >
   > The following examples export credentials directly on the command line for
   > demonstration purposes. This exposes sensitive tokens in your shell history
   > and process list. In production environments, use secure methods such as
   > reading from files with restricted permissions, environment files loaded
   > at runtime, or secret management tools.
@z

% snip command...

@x
   Or non-interactively in a CI/CD pipeline, set your organization name and token:
@y
   Or non-interactively in a CI/CD pipeline, set your organization name and token:
@z

% snip command...

@x
3. Discover attestations on a DHI image:
@y
3. Discover attestations on a DHI image:
@z

% snip command...

@x
   > [!NOTE]
   >
   > The `--platform` flag is required. Without it, `oras discover` resolves to
   > the multi-arch image index, which returns only an index-level signature
   > rather than the full set of per-platform attestations.
@y
   > [!NOTE]
   >
   > The `--platform` flag is required. Without it, `oras discover` resolves to
   > the multi-arch image index, which returns only an index-level signature
   > rather than the full set of per-platform attestations.
@z

@x
   A successful response lists the attestations attached to the image,
   including SBOMs, provenance, vulnerability reports, and changelog metadata.
@y
   A successful response lists the attestations attached to the image,
   including SBOMs, provenance, vulnerability reports, and changelog metadata.
@z

@x
## Use a static image for compiled executables
@y
## Use a static image for compiled executables
@z

@x
Docker Hardened Images include a `static` image repository designed specifically
for running compiled executables in an extremely minimal and secure runtime.
Unlike a non-hardened `FROM scratch` image, the DHI `static` image includes
attestations and essential packages like `ca-certificates`.
@y
Docker Hardened Images include a `static` image repository designed specifically
for running compiled executables in an extremely minimal and secure runtime.
Unlike a non-hardened `FROM scratch` image, the DHI `static` image includes
attestations and essential packages like `ca-certificates`.
@z

@x
Use a `-dev` or other builder image to compile your binary, then copy the output
into a `static` image:
@y
Use a `-dev` or other builder image to compile your binary, then copy the output
into a `static` image:
@z

@x
```dockerfile
FROM dhi.io/golang:1.22-dev AS build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -o myapp
@y
```dockerfile
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
For more multi-stage build patterns, see the [Go migration
example](../migration/examples/go.md).
@y
For more multi-stage build patterns, see the [Go migration
example](../migration/examples/go.md).
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
For detailed multi-stage Dockerfile examples using dev variants, see the
migration examples:
- [Go](../migration/examples/go.md)
- [Python](../migration/examples/python.md)
- [Node.js](../migration/examples/node.md)
@y
For detailed multi-stage Dockerfile examples using dev variants, see the
migration examples:
- [Go](../migration/examples/go.md)
- [Python](../migration/examples/python.md)
- [Node.js](../migration/examples/node.md)
@z

@x
## Use compliance and ELS variants
@y
## Use compliance and ELS variants
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
With a DHI Select or DHI Enterprise subscription, you can access additional
image variants:
@y
With a DHI Select or DHI Enterprise subscription, you can access additional
image variants:
@z

@x
- Compliance variants: FIPS-enabled and STIG-ready images for regulatory
  requirements
- ELS (Extended Lifecycle Support) variants (requires add-on): Security patches
  for end-of-life image versions
@y
- Compliance variants: FIPS-enabled and STIG-ready images for regulatory
  requirements
- ELS (Extended Lifecycle Support) variants (requires add-on): Security patches
  for end-of-life image versions
@z

@x
To access these variants, [mirror](./mirror.md) the repository to your Docker
Hub organization. For ELS, enable **Mirror end-of-life images** when setting up
mirroring. Once mirrored, use the compliance or EOL tags like any other image
tag.
@y
To access these variants, [mirror](./mirror.md) the repository to your Docker
Hub organization. For ELS, enable **Mirror end-of-life images** when setting up
mirroring. Once mirrored, use the compliance or EOL tags like any other image
tag.
@z

@x
## Use with Kubernetes
@y
## Use with Kubernetes
@z

@x
When deploying Docker Hardened Images to Kubernetes, the process is similar to
using any other container image with one key difference: you must configure
image pull secrets to authenticate to the DHI registry. This applies whether
you're pulling directly from `dhi.io`, from a mirror on Docker Hub, or from
your own third-party registry.
@y
When deploying Docker Hardened Images to Kubernetes, the process is similar to
using any other container image with one key difference: you must configure
image pull secrets to authenticate to the DHI registry. This applies whether
you're pulling directly from `dhi.io`, from a mirror on Docker Hub, or from
your own third-party registry.
@z

@x
### Create an image pull secret
@y
### Create an image pull secret
@z

@x
You can create an image pull secret using either an access token or Docker Desktop credentials.
@y
You can create an image pull secret using either an access token or Docker Desktop credentials.
@z

@x
For the `--docker-server` value:
- Use `dhi.io` for community images pulled directly from Docker Hardened Images
- Use `docker.io` for mirrored repositories on Docker Hub
- Use your registry's hostname for third-party registries
@y
For the `--docker-server` value:
- Use `dhi.io` for community images pulled directly from Docker Hardened Images
- Use `docker.io` for mirrored repositories on Docker Hub
- Use your registry's hostname for third-party registries
@z

@x
#### Using an access token
@y
#### Using an access token
@z

@x
Create a secret using a [Personal Access Token
(PAT)](../../security/access-tokens.md) or [Organization Access Token
(OAT)](../../enterprise/security/access-tokens.md). Ensure the token has at
least read-only access to the repositories.
@y
Create a secret using a [Personal Access Token
(PAT)](../../security/access-tokens.md) or [Organization Access Token
(OAT)](../../enterprise/security/access-tokens.md). Ensure the token has at
least read-only access to the repositories.
@z

@x
```console
$ kubectl create -n <kubernetes namespace> secret docker-registry <secret name> --docker-server=<registry server> \
        --docker-username=<registry user> --docker-password=<access token> \
        --docker-email=<registry email>
```
@y
```console
$ kubectl create -n <kubernetes namespace> secret docker-registry <secret name> --docker-server=<registry server> \
        --docker-username=<registry user> --docker-password=<access token> \
        --docker-email=<registry email>
```
@z

@x
#### Using Docker Desktop credentials
@y
#### Using Docker Desktop credentials
@z

@x
If you're already authenticated with Docker Desktop, you can create a secret
using your stored credentials. This method works for registries you've
authenticated to via Docker Desktop (using `docker login <registry>`).
@y
If you're already authenticated with Docker Desktop, you can create a secret
using your stored credentials. This method works for registries you've
authenticated to via Docker Desktop (using `docker login <registry>`).
@z

@x
```console
$ NS=<namespace>
$ kubectl create -n ${NS} secret docker-registry dhi-pull-secret \
    --docker-server=<registry server> \
    --docker-username=<registry user> \
    --docker-password="$(echo https://<registry server> | docker-credential-desktop get | jq -r .Secret)" \
    --docker-email=<registry email>
```
@y
```console
$ NS=<namespace>
$ kubectl create -n ${NS} secret docker-registry dhi-pull-secret \
    --docker-server=<registry server> \
    --docker-username=<registry user> \
    --docker-password="$(echo https://<registry server> | docker-credential-desktop get | jq -r .Secret)" \
    --docker-email=<registry email>
```
@z

@x
This method extracts credentials from Docker Desktop's credential store, avoiding the need to create a separate access token for local development.
@y
This method extracts credentials from Docker Desktop's credential store, avoiding the need to create a separate access token for local development.
@z

@x
### Test the image pull secret
@y
### Test the image pull secret
@z

@x
After creating the secret, verify it works by deploying a test pod that
references the secret in its `imagePullSecrets` configuration.
@y
After creating the secret, verify it works by deploying a test pod that
references the secret in its `imagePullSecrets` configuration.
@z

@x
Create a test pod:
@y
Create a test pod:
@z

@x
```console
kubectl apply --wait -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: dhi-test
  namespace: <kubernetes namespace>
spec:
  containers:
  - name: test
    image: bash:5
    command: [ "sh", "-c", "echo 'Hello from DHI in Kubernetes!'" ]
  imagePullSecrets:
  - name: <secret name>
EOF
```
@y
```console
kubectl apply --wait -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: dhi-test
  namespace: <kubernetes namespace>
spec:
  containers:
  - name: test
    image: bash:5
    command: [ "sh", "-c", "echo 'Hello from DHI in Kubernetes!'" ]
  imagePullSecrets:
  - name: <secret name>
EOF
```
@z

@x
Check the pod status to ensure it completed successfully:
@y
Check the pod status to ensure it completed successfully:
@z

@x
```console
$ kubectl get -n <kubernetes namespace> pods/dhi-test
```
@y
```console
$ kubectl get -n <kubernetes namespace> pods/dhi-test
```
@z

@x
A successful test shows `Completed` status:
@y
A successful test shows `Completed` status:
@z

@x
```console
NAME       READY   STATUS      RESTARTS     AGE
dhi-test   0/1     Completed   ...          ...
```
@y
```console
NAME       READY   STATUS      RESTARTS     AGE
dhi-test   0/1     Completed   ...          ...
```
@z

@x
If you see `ErrImagePull` status instead, there's an issue with your secret
configuration:
@y
If you see `ErrImagePull` status instead, there's an issue with your secret
configuration:
@z

@x
```console
NAME       READY   STATUS         RESTARTS   AGE
dhi-test   0/1     ErrImagePull   0          ...
```
@y
```console
NAME       READY   STATUS         RESTARTS   AGE
dhi-test   0/1     ErrImagePull   0          ...
```
@z

@x
Verify the pod output matches the expected message:
@y
Verify the pod output matches the expected message:
@z

@x
```console
$ kubectl logs -n <kubernetes namespace> pods/dhi-test
Hello from DHI in Kubernetes!
```
@y
```console
$ kubectl logs -n <kubernetes namespace> pods/dhi-test
Hello from DHI in Kubernetes!
```
@z

@x
Clean up the test pod:
@y
Clean up the test pod:
@z

@x
```console
$ kubectl delete -n <kubernetes namespace> pods/dhi-test
```
@y
```console
$ kubectl delete -n <kubernetes namespace> pods/dhi-test
```
@z
