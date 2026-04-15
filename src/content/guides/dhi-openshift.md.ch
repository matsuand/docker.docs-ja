%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Use Docker Hardened Images with Red Hat OpenShift
description: Deploy Docker Hardened Images on Red Hat OpenShift Container Platform, covering Security Context Constraints, arbitrary user ID assignment, file permissions, and best practices.
summary: Learn how to deploy Docker Hardened Images (DHI) on Red Hat OpenShift, configure Security Context Constraints, handle arbitrary user ID assignment, and set file permissions for both runtime and development image variants.
keywords: docker hardened images, dhi, openshift, OCP, SCC, security context constraints, non-root, distroless, containers, red hat
tags: ["Docker Hardened Images", "dhi"]
@y
title: Use Docker Hardened Images with Red Hat OpenShift
description: Deploy Docker Hardened Images on Red Hat OpenShift Container Platform, covering Security Context Constraints, arbitrary user ID assignment, file permissions, and best practices.
summary: Learn how to deploy Docker Hardened Images (DHI) on Red Hat OpenShift, configure Security Context Constraints, handle arbitrary user ID assignment, and set file permissions for both runtime and development image variants.
keywords: docker hardened images, dhi, openshift, OCP, SCC, security context constraints, non-root, distroless, containers, red hat
tags: ["Docker Hardened Images", "dhi"]
@z

@x
  time: 30 minutes
@y
  time: 30 分
@z

@x
  prerequisites:
    - An OpenShift cluster (version 4.11 or later recommended)
    - The oc CLI authenticated to your cluster
    - A Docker Hub account with access to Docker Hardened Images
    - Familiarity with OpenShift Security Context Constraints (SCCs)
@y
  prerequisites:
    - An OpenShift cluster (version 4.11 or later recommended)
    - The oc CLI authenticated to your cluster
    - A Docker Hub account with access to Docker Hardened Images
    - Familiarity with OpenShift Security Context Constraints (SCCs)
@z

@x
Docker Hardened Images (DHI) can be deployed on Red Hat OpenShift Container
Platform, but OpenShift’s security model differs from standard Kubernetes in
ways that require specific configuration. Because OpenShift runs containers
with an arbitrarily assigned user ID rather than the image’s default, you must
adjust file ownership and group permissions in your Dockerfiles to ensure
writable paths remain accessible.
@y
Docker Hardened Images (DHI) can be deployed on Red Hat OpenShift Container
Platform, but OpenShift’s security model differs from standard Kubernetes in
ways that require specific configuration. Because OpenShift runs containers
with an arbitrarily assigned user ID rather than the image’s default, you must
adjust file ownership and group permissions in your Dockerfiles to ensure
writable paths remain accessible.
@z

@x
This guide explains how to deploy Docker Hardened Images in OpenShift
environments, covering Security Context Constraints (SCCs), arbitrary user ID
assignment, file permission requirements, and best practices for both runtime
and development image variants.
@y
This guide explains how to deploy Docker Hardened Images in OpenShift
environments, covering Security Context Constraints (SCCs), arbitrary user ID
assignment, file permission requirements, and best practices for both runtime
and development image variants.
@z

@x
## How OpenShift security differs from Kubernetes
@y
## How OpenShift security differs from Kubernetes
@z

@x
OpenShift extends Kubernetes with Security Context Constraints (SCCs), which
control what actions a pod can perform and what resources it can access. While
vanilla Kubernetes uses Pod Security Standards (PSS) for similar purposes, SCCs
are more granular and enforced by default.
@y
OpenShift extends Kubernetes with Security Context Constraints (SCCs), which
control what actions a pod can perform and what resources it can access. While
vanilla Kubernetes uses Pod Security Standards (PSS) for similar purposes, SCCs
are more granular and enforced by default.
@z

@x
The key differences that affect DHI deployments:
@y
The key differences that affect DHI deployments:
@z

@x
**Arbitrary user IDs.** By default, OpenShift runs containers using an
arbitrarily assigned user ID (UID) from a range allocated to each project. The
default `restricted-v2` SCC (introduced in OpenShift 4.11) uses the
`MustRunAsRange` strategy, which overrides the `USER` directive in the container
image with a UID from the project’s allocated range (typically starting higher than
1000000000). This means even though a DHI image specifies a non-root user
(UID 65532), OpenShift will run the container as a different, unpredictable UID.
@y
**Arbitrary user IDs.** By default, OpenShift runs containers using an
arbitrarily assigned user ID (UID) from a range allocated to each project. The
default `restricted-v2` SCC (introduced in OpenShift 4.11) uses the
`MustRunAsRange` strategy, which overrides the `USER` directive in the container
image with a UID from the project’s allocated range (typically starting higher than
1000000000). This means even though a DHI image specifies a non-root user
(UID 65532), OpenShift will run the container as a different, unpredictable UID.
@z

@x
**Root group requirement.** OpenShift assigns the arbitrary UID to the root
group (GID 0). The container process always runs with `gid=0(root)`. Any
directories or files that the process needs to write to must be owned by the
root group (GID 0) with group read/write permissions. This is documented in the
[Red Hat guidelines for creating images](https://docs.openshift.com/container-platform/4.14/openshift_images/create-images.html#use-uid_create-images).
@y
**Root group requirement.** OpenShift assigns the arbitrary UID to the root
group (GID 0). The container process always runs with `gid=0(root)`. Any
directories or files that the process needs to write to must be owned by the
root group (GID 0) with group read/write permissions. This is documented in the
[Red Hat guidelines for creating images](https://docs.openshift.com/container-platform/4.14/openshift_images/create-images.html#use-uid_create-images).
@z

@x
> [!IMPORTANT]
> 
> DHI images set file ownership to `nonroot:nonroot` (65532:65532) by default.
> Because the OpenShift arbitrary UID is NOT in the `nonroot` group (65532), it
> cannot write to those files — even though the pod is admitted by the SCC and
> the container starts. You must change group ownership to GID 0 for any
> writable path. This is the most common source of permission errors when
> deploying DHI on OpenShift.
@y
> [!IMPORTANT]
> 
> DHI images set file ownership to `nonroot:nonroot` (65532:65532) by default.
> Because the OpenShift arbitrary UID is NOT in the `nonroot` group (65532), it
> cannot write to those files — even though the pod is admitted by the SCC and
> the container starts. You must change group ownership to GID 0 for any
> writable path. This is the most common source of permission errors when
> deploying DHI on OpenShift.
@z

@x
**Capability restrictions.** The `restricted-v2` SCC drops all Linux
capabilities by default and enforces `allowPrivilegeEscalation: false`,
`runAsNonRoot: true`, and a `seccompProfile` of type `RuntimeDefault`. DHI
runtime images already satisfy these constraints because they run as a non-root
user and don’t require elevated capabilities.
@y
**Capability restrictions.** The `restricted-v2` SCC drops all Linux
capabilities by default and enforces `allowPrivilegeEscalation: false`,
`runAsNonRoot: true`, and a `seccompProfile` of type `RuntimeDefault`. DHI
runtime images already satisfy these constraints because they run as a non-root
user and don’t require elevated capabilities.
@z

@x
## Pull DHI images into OpenShift
@y
## Pull DHI images into OpenShift
@z

@x
Before deploying, create an image pull secret so your OpenShift cluster can
authenticate to the DHI registry or your mirrored repository on Docker Hub.
@y
Before deploying, create an image pull secret so your OpenShift cluster can
authenticate to the DHI registry or your mirrored repository on Docker Hub.
@z

@x
### Create an image pull secret
@y
### Create an image pull secret
@z

@x
```console
oc create secret docker-registry dhi-pull-secret \
    --docker-server=docker.io \
    --docker-username=<your-docker-username> \
    --docker-password=<your-docker-access-token> \
    --docker-email=<your-email>
```
@y
```console
oc create secret docker-registry dhi-pull-secret \
    --docker-server=docker.io \
    --docker-username=<your-docker-username> \
    --docker-password=<your-docker-access-token> \
    --docker-email=<your-email>
```
@z

@x
If you’re pulling directly from `dhi.io` instead of a mirrored repository, set
`--docker-server=dhi.io`.
@y
If you’re pulling directly from `dhi.io` instead of a mirrored repository, set
`--docker-server=dhi.io`.
@z

@x
### Link the secret to a service account
@y
### Link the secret to a service account
@z

@x
Link the pull secret to the `default` service account in your project so that
all deployments can pull DHI images automatically:
@y
Link the pull secret to the `default` service account in your project so that
all deployments can pull DHI images automatically:
@z

@x
```console
oc secrets link default dhi-pull-secret --for=pull
```
@y
```console
oc secrets link default dhi-pull-secret --for=pull
```
@z

@x
To use the secret with a specific service account instead:
@y
To use the secret with a specific service account instead:
@z

@x
```console
oc secrets link <service-account-name> dhi-pull-secret --for=pull
```
@y
```console
oc secrets link <service-account-name> dhi-pull-secret --for=pull
```
@z

@x
## Build OpenShift-compatible images from DHI
@y
## Build OpenShift-compatible images from DHI
@z

@x
DHI runtime images are distroless — they contain no shell, no package manager,
and no `RUN`-capable environment. This means you **cannot use `RUN` commands in
the runtime stage** of your Dockerfile. All file permission adjustments for
OpenShift must happen in the `-dev` build stage, and the results must be copied
into the runtime stage using `COPY --chown`.
@y
DHI runtime images are distroless — they contain no shell, no package manager,
and no `RUN`-capable environment. This means you **cannot use `RUN` commands in
the runtime stage** of your Dockerfile. All file permission adjustments for
OpenShift must happen in the `-dev` build stage, and the results must be copied
into the runtime stage using `COPY --chown`.
@z

@x
The core pattern for OpenShift compatibility:
@y
The core pattern for OpenShift compatibility:
@z

@x
1. Use a DHI `-dev` variant as the build stage (it has a shell).
1. Build your application and set GID 0 ownership in the build stage.
1. Copy the results into the DHI runtime image using `COPY --chown=<UID>:0`.
@y
1. Use a DHI `-dev` variant as the build stage (it has a shell).
1. Build your application and set GID 0 ownership in the build stage.
1. Copy the results into the DHI runtime image using `COPY --chown=<UID>:0`.
@z

@x
### Example: Nginx for OpenShift
@y
### Example: Nginx for OpenShift
@z

@x
```dockerfile
# Build stage — has a shell, can run commands
FROM YOUR_ORG/dhi-nginx:1.29-alpine3.23-dev AS build
@y
```dockerfile
# Build stage — has a shell, can run commands
FROM YOUR_ORG/dhi-nginx:1.29-alpine3.23-dev AS build
@z

@x
# Copy custom config and set root group ownership
COPY nginx.conf /tmp/nginx.conf
COPY default.conf /tmp/default.conf
@y
# Copy custom config and set root group ownership
COPY nginx.conf /tmp/nginx.conf
COPY default.conf /tmp/default.conf
@z

@x
# Prepare writable directories with GID 0
# (Nginx needs to write to cache, logs, and PID file locations)
RUN mkdir -p /tmp/nginx-cache /tmp/nginx-run && \
    chgrp -R 0 /tmp/nginx-cache /tmp/nginx-run && \
    chmod -R g=u /tmp/nginx-cache /tmp/nginx-run
@y
# Prepare writable directories with GID 0
# (Nginx needs to write to cache, logs, and PID file locations)
RUN mkdir -p /tmp/nginx-cache /tmp/nginx-run && \
    chgrp -R 0 /tmp/nginx-cache /tmp/nginx-run && \
    chmod -R g=u /tmp/nginx-cache /tmp/nginx-run
@z

@x
# Runtime stage — distroless, NO shell, NO RUN commands
FROM YOUR_ORG/dhi-nginx:1.29-alpine3.23
@y
# Runtime stage — distroless, NO shell, NO RUN commands
FROM YOUR_ORG/dhi-nginx:1.29-alpine3.23
@z

@x
COPY --from=build --chown=65532:0 /tmp/nginx.conf /etc/nginx/nginx.conf
COPY --from=build --chown=65532:0 /tmp/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build --chown=65532:0 /tmp/nginx-cache /var/cache/nginx
COPY --from=build --chown=65532:0 /tmp/nginx-run /var/run
```
@y
COPY --from=build --chown=65532:0 /tmp/nginx.conf /etc/nginx/nginx.conf
COPY --from=build --chown=65532:0 /tmp/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build --chown=65532:0 /tmp/nginx-cache /var/cache/nginx
COPY --from=build --chown=65532:0 /tmp/nginx-run /var/run
```
@z

@x
> [!IMPORTANT]
> 
> Always use `--chown=<UID>:0` (user:root-group) when copying files into the
> runtime stage. This ensures the arbitrary UID that OpenShift assigns can
> access the files through root group membership. Never use `RUN` in the runtime
> stage — distroless DHI images have no shell.
@y
> [!IMPORTANT]
> 
> Always use `--chown=<UID>:0` (user:root-group) when copying files into the
> runtime stage. This ensures the arbitrary UID that OpenShift assigns can
> access the files through root group membership. Never use `RUN` in the runtime
> stage — distroless DHI images have no shell.
@z

@x
> [!NOTE]
> 
> The UID for DHI images varies by image. Most use 65532 (`nonroot`), but some
> (like the Node.js image) may use a different UID. Verify with:
> `docker inspect dhi.io/<image>:<tag> --format '{{.Config.User}}'`
@y
> [!NOTE]
> 
> The UID for DHI images varies by image. Most use 65532 (`nonroot`), but some
> (like the Node.js image) may use a different UID. Verify with:
> `docker inspect dhi.io/<image>:<tag> --format '{{.Config.User}}'`
@z

@x
Deploy to OpenShift:
@y
Deploy to OpenShift:
@z

@x
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-dhi
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx-dhi
  template:
    metadata:
      labels:
        app: nginx-dhi
    spec:
      containers:
        - name: nginx
          image: YOUR_ORG/dhi-nginx:1.29-alpine3.23
          ports:
            - containerPort: 8080
          securityContext:
            allowPrivilegeEscalation: false
            runAsNonRoot: true
            seccompProfile:
              type: RuntimeDefault
            capabilities:
              drop:
                - ALL
      imagePullSecrets:
        - name: dhi-pull-secret
```
@y
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-dhi
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx-dhi
  template:
    metadata:
      labels:
        app: nginx-dhi
    spec:
      containers:
        - name: nginx
          image: YOUR_ORG/dhi-nginx:1.29-alpine3.23
          ports:
            - containerPort: 8080
          securityContext:
            allowPrivilegeEscalation: false
            runAsNonRoot: true
            seccompProfile:
              type: RuntimeDefault
            capabilities:
              drop:
                - ALL
      imagePullSecrets:
        - name: dhi-pull-secret
```
@z

@x
DHI Nginx listens on port 8080 by default (not 80), which is compatible with
the non-root requirement. No SCC changes are needed.
@y
DHI Nginx listens on port 8080 by default (not 80), which is compatible with
the non-root requirement. No SCC changes are needed.
@z

@x
### Example: Node.js application for OpenShift
@y
### Example: Node.js application for OpenShift
@z

@x
```dockerfile
# Build stage — dev variant has shell and npm
FROM YOUR_ORG/dhi-node:24-alpine3.23-dev AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
@y
```dockerfile
# Build stage — dev variant has shell and npm
FROM YOUR_ORG/dhi-node:24-alpine3.23-dev AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
@z

@x
# Set GID 0 on everything the runtime needs to write
RUN chgrp -R 0 /app/dist /app/node_modules && \
    chmod -R g=u /app/dist /app/node_modules
@y
# Set GID 0 on everything the runtime needs to write
RUN chgrp -R 0 /app/dist /app/node_modules && \
    chmod -R g=u /app/dist /app/node_modules
@z

@x
# Runtime stage — distroless, NO shell
FROM YOUR_ORG/dhi-node:24-alpine3.23
WORKDIR /app
COPY --from=build --chown=65532:0 /app/dist ./dist
COPY --from=build --chown=65532:0 /app/node_modules ./node_modules
CMD ["node", "dist/index.js"]
```
@y
# Runtime stage — distroless, NO shell
FROM YOUR_ORG/dhi-node:24-alpine3.23
WORKDIR /app
COPY --from=build --chown=65532:0 /app/dist ./dist
COPY --from=build --chown=65532:0 /app/node_modules ./node_modules
CMD ["node", "dist/index.js"]
```
@z

@x
Deploy:
@y
Deploy:
@z

@x
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: node-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: node-app
  template:
    metadata:
      labels:
        app: node-app
    spec:
      containers:
        - name: app
          image: YOUR_ORG/dhi-node-app:latest
          ports:
            - containerPort: 3000
          securityContext:
            allowPrivilegeEscalation: false
            runAsNonRoot: true
            seccompProfile:
              type: RuntimeDefault
            capabilities:
              drop:
                - ALL
      imagePullSecrets:
        - name: dhi-pull-secret
```
@y
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: node-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: node-app
  template:
    metadata:
      labels:
        app: node-app
    spec:
      containers:
        - name: app
          image: YOUR_ORG/dhi-node-app:latest
          ports:
            - containerPort: 3000
          securityContext:
            allowPrivilegeEscalation: false
            runAsNonRoot: true
            seccompProfile:
              type: RuntimeDefault
            capabilities:
              drop:
                - ALL
      imagePullSecrets:
        - name: dhi-pull-secret
```
@z

@x
## Handle arbitrary user IDs
@y
## Handle arbitrary user IDs
@z

@x
OpenShift’s `restricted-v2` SCC assigns a random UID to the container process.
This UID won’t exist in `/etc/passwd` inside the image, but the container will
still run — the process just won’t have a username associated with it.
@y
OpenShift’s `restricted-v2` SCC assigns a random UID to the container process.
This UID won’t exist in `/etc/passwd` inside the image, but the container will
still run — the process just won’t have a username associated with it.
@z

@x
This can cause issues with applications that:
@y
This can cause issues with applications that:
@z

@x
- Look up the current user’s home directory or username
- Write to directories owned by a specific UID
- Check `/etc/passwd` for the running user
@y
- Look up the current user’s home directory or username
- Write to directories owned by a specific UID
- Check `/etc/passwd` for the running user
@z

@x
### Add a `passwd` entry for the arbitrary UID
@y
### Add a `passwd` entry for the arbitrary UID
@z

@x
Some applications (notably those using certain Python or Java libraries) require
a valid `/etc/passwd` entry for the running user. You can handle this with a
wrapper entrypoint script.
@y
Some applications (notably those using certain Python or Java libraries) require
a valid `/etc/passwd` entry for the running user. You can handle this with a
wrapper entrypoint script.
@z

@x
Because this pattern requires a shell, it only works with DHI `-dev` variants or
with a DHI Enterprise customized image that includes a shell. Prepare the image
in the build stage:
@y
Because this pattern requires a shell, it only works with DHI `-dev` variants or
with a DHI Enterprise customized image that includes a shell. Prepare the image
in the build stage:
@z

@x
```dockerfile
FROM YOUR_ORG/dhi-python:3.13-alpine3.23-dev AS build
# ... build your application ...
@y
```dockerfile
FROM YOUR_ORG/dhi-python:3.13-alpine3.23-dev AS build
# ... build your application ...
@z

@x
# Make /etc/passwd group-writable so the entrypoint can append to it
RUN chgrp 0 /etc/passwd && chmod g=u /etc/passwd
@y
# Make /etc/passwd group-writable so the entrypoint can append to it
RUN chgrp 0 /etc/passwd && chmod g=u /etc/passwd
@z

@x
# Create the entrypoint wrapper
RUN printf '#!/bin/sh\n\
if ! whoami > /dev/null 2>&1; then\n\
  if [ -w /etc/passwd ]; then\n\
    echo "${USER_NAME:-appuser}:x:$(id -u):0:dynamic user:/tmp:/sbin/nologin" >> /etc/passwd\n\
  fi\n\
fi\n\
exec "$@"\n' > /entrypoint.sh && chmod +x /entrypoint.sh
@y
# Create the entrypoint wrapper
RUN printf '#!/bin/sh\n\
if ! whoami > /dev/null 2>&1; then\n\
  if [ -w /etc/passwd ]; then\n\
    echo "${USER_NAME:-appuser}:x:$(id -u):0:dynamic user:/tmp:/sbin/nologin" >> /etc/passwd\n\
  fi\n\
fi\n\
exec "$@"\n' > /entrypoint.sh && chmod +x /entrypoint.sh
@z

@x
# This pattern requires a -dev variant as runtime (has shell)
FROM YOUR_ORG/dhi-python:3.13-alpine3.23-dev
COPY --from=build --chown=65532:0 /app ./app
COPY --from=build --chown=65532:0 /entrypoint.sh /entrypoint.sh
COPY --from=build --chown=65532:0 /etc/passwd /etc/passwd
USER 65532
ENTRYPOINT ["/entrypoint.sh"]
CMD ["python", "app/main.py"]
```
@y
# This pattern requires a -dev variant as runtime (has shell)
FROM YOUR_ORG/dhi-python:3.13-alpine3.23-dev
COPY --from=build --chown=65532:0 /app ./app
COPY --from=build --chown=65532:0 /entrypoint.sh /entrypoint.sh
COPY --from=build --chown=65532:0 /etc/passwd /etc/passwd
USER 65532
ENTRYPOINT ["/entrypoint.sh"]
CMD ["python", "app/main.py"]
```
@z

@x
> [!NOTE]
> 
> For distroless runtime images (no shell), the passwd-injection pattern is not
> possible. Instead, use the `nonroot` SCC (described in the following section) to run with the
> image’s built-in UID so the existing `/etc/passwd` entry matches the running
> process. Alternatively, OpenShift 4.x automatically injects the arbitrary UID
> into `/etc/passwd` in most cases, which resolves this for many applications.
@y
> [!NOTE]
> 
> For distroless runtime images (no shell), the passwd-injection pattern is not
> possible. Instead, use the `nonroot` SCC (described in the following section) to run with the
> image’s built-in UID so the existing `/etc/passwd` entry matches the running
> process. Alternatively, OpenShift 4.x automatically injects the arbitrary UID
> into `/etc/passwd` in most cases, which resolves this for many applications.
@z

@x
## Use the non-root SCC for fixed UIDs
@y
## Use the non-root SCC for fixed UIDs
@z

@x
If your application requires running as the specific UID defined in the image
(typically 65532 for DHI), you can use the `nonroot` SCC instead of the default
`restricted-v2`. The `nonroot` SCC uses the `MustRunAsNonRoot` strategy, which
allows any non-zero UID.
@y
If your application requires running as the specific UID defined in the image
(typically 65532 for DHI), you can use the `nonroot` SCC instead of the default
`restricted-v2`. The `nonroot` SCC uses the `MustRunAsNonRoot` strategy, which
allows any non-zero UID.
@z

@x
> [!IMPORTANT]
> 
> For the `nonroot` SCC to work, the image’s `USER` directive must specify a
> **numeric** UID (for example, `65532`), not a username string like `nonroot`.
> OpenShift cannot verify that a username maps to a non-zero UID. Verify your
> DHI image with:
> `docker inspect YOUR_ORG/dhi-node:24-alpine3.23 --format '{{.Config.User}}'`
> If the output is a string rather than a number, set `runAsUser` explicitly in
> the pod spec.
@y
> [!IMPORTANT]
> 
> For the `nonroot` SCC to work, the image’s `USER` directive must specify a
> **numeric** UID (for example, `65532`), not a username string like `nonroot`.
> OpenShift cannot verify that a username maps to a non-zero UID. Verify your
> DHI image with:
> `docker inspect YOUR_ORG/dhi-node:24-alpine3.23 --format '{{.Config.User}}'`
> If the output is a string rather than a number, set `runAsUser` explicitly in
> the pod spec.
@z

@x
Create a service account and grant it the `nonroot` SCC:
@y
Create a service account and grant it the `nonroot` SCC:
@z

@x
```console
oc create serviceaccount dhi-nonroot
oc adm policy add-scc-to-user nonroot -z dhi-nonroot
```
@y
```console
oc create serviceaccount dhi-nonroot
oc adm policy add-scc-to-user nonroot -z dhi-nonroot
```
@z

@x
Reference the service account in your deployment:
@y
Reference the service account in your deployment:
@z

@x
```yaml
spec:
  template:
    spec:
      serviceAccountName: dhi-nonroot
      containers:
        - name: app
          image: YOUR_ORG/dhi-node:24-alpine3.23
          securityContext:
            runAsUser: 65532
            runAsNonRoot: true
            allowPrivilegeEscalation: false
            seccompProfile:
              type: RuntimeDefault
            capabilities:
              drop:
                - ALL
```
@y
```yaml
spec:
  template:
    spec:
      serviceAccountName: dhi-nonroot
      containers:
        - name: app
          image: YOUR_ORG/dhi-node:24-alpine3.23
          securityContext:
            runAsUser: 65532
            runAsNonRoot: true
            allowPrivilegeEscalation: false
            seccompProfile:
              type: RuntimeDefault
            capabilities:
              drop:
                - ALL
```
@z

@x
Verify the SCC assignment after deployment:
@y
Verify the SCC assignment after deployment:
@z

@x
```console
oc get pod <pod-name> -o jsonpath='{.metadata.annotations.openshift\.io/scc}'
```
@y
```console
oc get pod <pod-name> -o jsonpath='{.metadata.annotations.openshift\.io/scc}'
```
@z

@x
This should return `nonroot`.
@y
This should return `nonroot`.
@z

@x
When using the `nonroot` SCC with a fixed UID, the process runs as 65532
(matching the image’s file ownership), so the GID 0 adjustments are not strictly
required for paths already owned by 65532. However, applying `chown <UID>:0` is
still recommended for portability across both `restricted-v2` and `nonroot` SCCs.
@y
When using the `nonroot` SCC with a fixed UID, the process runs as 65532
(matching the image’s file ownership), so the GID 0 adjustments are not strictly
required for paths already owned by 65532. However, applying `chown <UID>:0` is
still recommended for portability across both `restricted-v2` and `nonroot` SCCs.
@z

@x
## Use DHI dev variants in OpenShift
@y
## Use DHI dev variants in OpenShift
@z

@x
DHI `-dev` variants include a shell, package manager, and development tools.
They run as root (UID 0) by default, which conflicts with OpenShift’s
`restricted-v2` SCC. There are three approaches:
@y
DHI `-dev` variants include a shell, package manager, and development tools.
They run as root (UID 0) by default, which conflicts with OpenShift’s
`restricted-v2` SCC. There are three approaches:
@z

@x
### Option 1: Use dev variants only in build stages (recommended)
@y
### Option 1: Use dev variants only in build stages (recommended)
@z

@x
Use `-dev` variants only in Dockerfile build stages and never deploy them
directly to OpenShift:
@y
Use `-dev` variants only in Dockerfile build stages and never deploy them
directly to OpenShift:
@z

@x
```dockerfile
FROM YOUR_ORG/dhi-node:24-alpine3.23-dev AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
@y
```dockerfile
FROM YOUR_ORG/dhi-node:24-alpine3.23-dev AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
@z

@x
# Set root group ownership for OpenShift compatibility
RUN chgrp -R 0 /app/dist /app/node_modules && \
    chmod -R g=u /app/dist /app/node_modules
@y
# Set root group ownership for OpenShift compatibility
RUN chgrp -R 0 /app/dist /app/node_modules && \
    chmod -R g=u /app/dist /app/node_modules
@z

@x
FROM YOUR_ORG/dhi-node:24-alpine3.23
WORKDIR /app
COPY --from=build --chown=65532:0 /app/dist ./dist
COPY --from=build --chown=65532:0 /app/node_modules ./node_modules
CMD ["node", "dist/index.js"]
```
@y
FROM YOUR_ORG/dhi-node:24-alpine3.23
WORKDIR /app
COPY --from=build --chown=65532:0 /app/dist ./dist
COPY --from=build --chown=65532:0 /app/node_modules ./node_modules
CMD ["node", "dist/index.js"]
```
@z

@x
The final runtime image is non-root and distroless, fully compatible with
`restricted-v2`.
@y
The final runtime image is non-root and distroless, fully compatible with
`restricted-v2`.
@z

@x
### Option 2: Grant the `anyuid` SCC for debugging
@y
### Option 2: Grant the `anyuid` SCC for debugging
@z

@x
If you need to run a `-dev` variant directly in OpenShift for debugging, grant
the `anyuid` SCC to a dedicated service account:
@y
If you need to run a `-dev` variant directly in OpenShift for debugging, grant
the `anyuid` SCC to a dedicated service account:
@z

@x
```console
oc create serviceaccount dhi-debug
oc adm policy add-scc-to-user anyuid -z dhi-debug
```
@y
```console
oc create serviceaccount dhi-debug
oc adm policy add-scc-to-user anyuid -z dhi-debug
```
@z

@x
Then reference it in your pod:
@y
Then reference it in your pod:
@z

@x
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: dhi-debug
spec:
  serviceAccountName: dhi-debug
  containers:
    - name: debug
      image: YOUR_ORG/dhi-node:24-alpine3.23-dev
      command: ["sleep", "infinity"]
  imagePullSecrets:
    - name: dhi-pull-secret
```
@y
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: dhi-debug
spec:
  serviceAccountName: dhi-debug
  containers:
    - name: debug
      image: YOUR_ORG/dhi-node:24-alpine3.23-dev
      command: ["sleep", "infinity"]
  imagePullSecrets:
    - name: dhi-pull-secret
```
@z

@x
> [!IMPORTANT]
> 
> The `anyuid` SCC allows running as any UID including root. Only use this for
> temporary debugging — never in production workloads.
@y
> [!IMPORTANT]
> 
> The `anyuid` SCC allows running as any UID including root. Only use this for
> temporary debugging — never in production workloads.
@z

@x
### Option 3: Use `oc debug` or ephemeral containers
@y
### Option 3: Use `oc debug` or ephemeral containers
@z

@x
For distroless runtime images with no shell, use OpenShift-native debugging
tools instead of `docker debug` (which only works with Docker Engine, not with
CRI-O on OpenShift).
@y
For distroless runtime images with no shell, use OpenShift-native debugging
tools instead of `docker debug` (which only works with Docker Engine, not with
CRI-O on OpenShift).
@z

@x
Use `oc debug` to create a copy of a pod with a debug shell:
@y
Use `oc debug` to create a copy of a pod with a debug shell:
@z

@x
```console
# Create a debug pod based on a deployment
oc debug deployment/nginx-dhi
@y
```console
# Create a debug pod based on a deployment
oc debug deployment/nginx-dhi
@z

@x
# Override the image to use a -dev variant with a shell
oc debug deployment/nginx-dhi --image=YOUR_ORG/dhi-node:24-alpine3.23-dev
```
@y
# Override the image to use a -dev variant with a shell
oc debug deployment/nginx-dhi --image=YOUR_ORG/dhi-node:24-alpine3.23-dev
```
@z

@x
Use ephemeral containers (OpenShift 4.12+ / Kubernetes 1.25+):
@y
Use ephemeral containers (OpenShift 4.12+ / Kubernetes 1.25+):
@z

@x
```console
kubectl debug -it <pod-name> --image=YOUR_ORG/dhi-node:24-alpine3.23-dev \
    --target=app -- sh
```
@y
```console
kubectl debug -it <pod-name> --image=YOUR_ORG/dhi-node:24-alpine3.23-dev \
    --target=app -- sh
```
@z

@x
This attaches a temporary debug container to a running pod without restarting
it, sharing the pod’s process namespace.
@y
This attaches a temporary debug container to a running pod without restarting
it, sharing the pod’s process namespace.
@z

@x
> [!NOTE]
> 
> `docker debug` is a Docker Desktop/CLI feature for local development. It is
> not available on OpenShift clusters, which use CRI-O as their container
> runtime.
@y
> [!NOTE]
> 
> `docker debug` is a Docker Desktop/CLI feature for local development. It is
> not available on OpenShift clusters, which use CRI-O as their container
> runtime.
@z

@x
## Deploy DHI Helm charts on OpenShift
@y
## Deploy DHI Helm charts on OpenShift
@z

@x
DHI provides pre-configured Helm charts for popular applications. When deploying
these charts on OpenShift, you may need to adjust security context settings.
@y
DHI provides pre-configured Helm charts for popular applications. When deploying
these charts on OpenShift, you may need to adjust security context settings.
@z

@x
### Inspect chart values first
@y
### Inspect chart values first
@z

@x
Before installing, check what security context values the chart exposes:
@y
Before installing, check what security context values the chart exposes:
@z

@x
```console
helm registry login dhi.io
@y
```console
helm registry login dhi.io
@z

@x
helm show values oci://dhi.io/<chart-name> --version <version> | grep -A 20 securityContext
```
@y
helm show values oci://dhi.io/<chart-name> --version <version> | grep -A 20 securityContext
```
@z

@x
The available value paths vary by chart, so always check `values.yaml` before
setting overrides.
@y
The available value paths vary by chart, so always check `values.yaml` before
setting overrides.
@z

@x
### Install with OpenShift overrides
@y
### Install with OpenShift overrides
@z

@x
The following example shows a typical installation pattern. Adjust the `--set`
paths based on what `helm show values` returns for your specific chart:
@y
The following example shows a typical installation pattern. Adjust the `--set`
paths based on what `helm show values` returns for your specific chart:
@z

@x
```console
helm install my-release oci://dhi.io/<chart-name> \
    --version <version> \
    --set "imagePullSecrets[0].name=dhi-pull-secret" \
    -f openshift-values.yaml
```
@y
```console
helm install my-release oci://dhi.io/<chart-name> \
    --version <version> \
    --set "imagePullSecrets[0].name=dhi-pull-secret" \
    -f openshift-values.yaml
```
@z

@x
Create an `openshift-values.yaml` with security context overrides appropriate
for your chart:
@y
Create an `openshift-values.yaml` with security context overrides appropriate
for your chart:
@z

@x
```yaml
# Example — adjust keys based on `helm show values` output
podSecurityContext:
  runAsNonRoot: true
  seccompProfile:
    type: RuntimeDefault
@y
```yaml
# Example — adjust keys based on `helm show values` output
podSecurityContext:
  runAsNonRoot: true
  seccompProfile:
    type: RuntimeDefault
@z

@x
securityContext:
  allowPrivilegeEscalation: false
  capabilities:
    drop:
      - ALL
```
@y
securityContext:
  allowPrivilegeEscalation: false
  capabilities:
    drop:
      - ALL
```
@z

@x
> [!NOTE]
> 
> DHI Helm chart value paths are not standardized across charts. For example,
> one chart may use `image.imagePullSecrets`, while another uses
> `global.imagePullSecrets`. Always consult the specific chart’s documentation
> or `values.yaml`.
@y
> [!NOTE]
> 
> DHI Helm chart value paths are not standardized across charts. For example,
> one chart may use `image.imagePullSecrets`, while another uses
> `global.imagePullSecrets`. Always consult the specific chart’s documentation
> or `values.yaml`.
@z

@x
## Verify your deployment
@y
## Verify your deployment
@z

@x
After deploying a DHI image to OpenShift, verify the security configuration.
@y
After deploying a DHI image to OpenShift, verify the security configuration.
@z

@x
### Check the assigned SCC
@y
### Check the assigned SCC
@z

@x
```console
oc get pods -o 'custom-columns=NAME:.metadata.name,SCC:.metadata.annotations.openshift\.io/scc'
```
@y
```console
oc get pods -o 'custom-columns=NAME:.metadata.name,SCC:.metadata.annotations.openshift\.io/scc'
```
@z

@x
Runtime DHI images should show `restricted-v2` (or `nonroot` if you configured
it).
@y
Runtime DHI images should show `restricted-v2` (or `nonroot` if you configured
it).
@z

@x
### Check the running UID
@y
### Check the running UID
@z

@x
```console
oc exec <pod-name> -- id
```
@y
```console
oc exec <pod-name> -- id
```
@z

@x
With the `restricted-v2` SCC, you should see output like:
@y
With the `restricted-v2` SCC, you should see output like:
@z

@x
```text
uid=1000650000 gid=0(root) groups=0(root),1000650000
```
@y
```text
uid=1000650000 gid=0(root) groups=0(root),1000650000
```
@z

@x
The UID is from the project’s allocated range, and the primary GID is always 0
(root group). With the `nonroot` SCC and `runAsUser: 65532`, you would see
`uid=65532`.
@y
The UID is from the project’s allocated range, and the primary GID is always 0
(root group). With the `nonroot` SCC and `runAsUser: 65532`, you would see
`uid=65532`.
@z

@x
### Confirm the image is distroless
@y
### Confirm the image is distroless
@z

@x
```console
oc exec <pod-name> -- sh -c "echo hello"
```
@y
```console
oc exec <pod-name> -- sh -c "echo hello"
```
@z

@x
For runtime (non-dev) DHI images, this command should fail with an error
indicating that `sh` was not found in `$PATH`. The exact error format varies
between CRI-O versions.
@y
For runtime (non-dev) DHI images, this command should fail with an error
indicating that `sh` was not found in `$PATH`. The exact error format varies
between CRI-O versions.
@z

@x
### Scan the deployed image
@y
### Scan the deployed image
@z

@x
Use Docker Scout to verify the security posture of the deployed image (run this
from your local machine, not on the cluster):
@y
Use Docker Scout to verify the security posture of the deployed image (run this
from your local machine, not on the cluster):
@z

@x
```console
docker scout cves YOUR_ORG/dhi-nginx:1.29-alpine3.23
docker scout quickview YOUR_ORG/dhi-nginx:1.29-alpine3.23
```
@y
```console
docker scout cves YOUR_ORG/dhi-nginx:1.29-alpine3.23
docker scout quickview YOUR_ORG/dhi-nginx:1.29-alpine3.23
```
@z

@x
## Common issues and solutions
@y
## Common issues and solutions
@z

@x
**Pod fails to start with “container has runAsNonRoot and image has group or
user ID set to root.”** This happens when deploying a DHI `-dev` variant with
the default `restricted-v2` SCC. Either use the runtime variant instead, or
grant the `anyuid` SCC to the service account.
@y
**Pod fails to start with “container has runAsNonRoot and image has group or
user ID set to root.”** This happens when deploying a DHI `-dev` variant with
the default `restricted-v2` SCC. Either use the runtime variant instead, or
grant the `anyuid` SCC to the service account.
@z

@x
**Application cannot write to a directory.** The arbitrary UID assigned by
OpenShift doesn’t have write permissions. This is the most common issue with DHI
on OpenShift. All writable paths must be owned by GID 0 with group write
permissions. Fix this in the build stage:
`chgrp -R 0 /path && chmod -R g=u /path`, then `COPY --chown=<UID>:0` into the
runtime stage.
@y
**Application cannot write to a directory.** The arbitrary UID assigned by
OpenShift doesn’t have write permissions. This is the most common issue with DHI
on OpenShift. All writable paths must be owned by GID 0 with group write
permissions. Fix this in the build stage:
`chgrp -R 0 /path && chmod -R g=u /path`, then `COPY --chown=<UID>:0` into the
runtime stage.
@z

@x
**Application fails with “user not found” or “no matching entries in passwd
file.”** Some applications require a valid `/etc/passwd` entry. OpenShift 4.x
automatically injects the arbitrary UID into `/etc/passwd` in most cases. If
your application still fails, use the passwd-injection pattern (requires a `-dev`
variant) or use the `nonroot` SCC to run with the image’s built-in UID.
@y
**Application fails with “user not found” or “no matching entries in passwd
file.”** Some applications require a valid `/etc/passwd` entry. OpenShift 4.x
automatically injects the arbitrary UID into `/etc/passwd` in most cases. If
your application still fails, use the passwd-injection pattern (requires a `-dev`
variant) or use the `nonroot` SCC to run with the image’s built-in UID.
@z

@x
**Pod fails to bind to port 80 or 443.** Ports lower than 1024 require root
privileges. DHI images use unprivileged ports by default (for example, Nginx
uses 8080). Configure your OpenShift Service to map the external port to the
container’s unprivileged port:
@y
**Pod fails to bind to port 80 or 443.** Ports lower than 1024 require root
privileges. DHI images use unprivileged ports by default (for example, Nginx
uses 8080). Configure your OpenShift Service to map the external port to the
container’s unprivileged port:
@z

@x
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-dhi
spec:
  ports:
    - port: 80
      targetPort: 8080
  selector:
    app: nginx-dhi
```
@y
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-dhi
spec:
  ports:
    - port: 80
      targetPort: 8080
  selector:
    app: nginx-dhi
```
@z

@x
**ImagePullBackOff with “unauthorized: authentication required.”** Verify the
pull secret is correctly configured and linked to the service account. Check
with `oc get secret dhi-pull-secret` and `oc describe sa default`.
@y
**ImagePullBackOff with “unauthorized: authentication required.”** Verify the
pull secret is correctly configured and linked to the service account. Check
with `oc get secret dhi-pull-secret` and `oc describe sa default`.
@z

@x
**Dockerfile build fails with “exec: not found” in runtime stage.** You are
using `RUN` in a distroless runtime stage. DHI runtime images have no shell, so
`RUN` commands cannot execute. Move all `RUN` commands to the `-dev` build stage
and use `COPY --chown` to transfer results.
@y
**Dockerfile build fails with “exec: not found” in runtime stage.** You are
using `RUN` in a distroless runtime stage. DHI runtime images have no shell, so
`RUN` commands cannot execute. Move all `RUN` commands to the `-dev` build stage
and use `COPY --chown` to transfer results.
@z

@x
## DHI and OpenShift compatibility summary
@y
## DHI and OpenShift compatibility summary
@z

@x
|Feature                      |DHI runtime                      |DHI `-dev`          |DHI with Enterprise customization|
|-----------------------------|---------------------------------|--------------------|---------------------------------|
|Default SCC (`restricted-v2`)|Yes, with GID 0 permissions      |Requires `anyuid`   |Yes, with GID 0 permissions      |
|Non-root by default          |Yes (UID 65532)                  |No (root)           |Yes (configurable UID)           |
|Arbitrary UID support        |Yes, with `chown <UID>:0`        |Yes                 |Yes, with `chown <UID>:0`        |
|Distroless (no shell)        |Yes — no `RUN` in Dockerfile     |No                  |Yes — no `RUN` in Dockerfile     |
|Unprivileged ports           |Yes (higher than 1024)                 |Configurable        |Yes (higher than 1024)                 |
|SLSA Build Level 3           |Yes                              |Yes                 |Yes                              |
|Debug on cluster             |`oc debug` / ephemeral containers|`oc exec` with shell|`oc debug` / ephemeral containers|
@y
|Feature                      |DHI runtime                      |DHI `-dev`          |DHI with Enterprise customization|
|-----------------------------|---------------------------------|--------------------|---------------------------------|
|Default SCC (`restricted-v2`)|Yes, with GID 0 permissions      |Requires `anyuid`   |Yes, with GID 0 permissions      |
|Non-root by default          |Yes (UID 65532)                  |No (root)           |Yes (configurable UID)           |
|Arbitrary UID support        |Yes, with `chown <UID>:0`        |Yes                 |Yes, with `chown <UID>:0`        |
|Distroless (no shell)        |Yes — no `RUN` in Dockerfile     |No                  |Yes — no `RUN` in Dockerfile     |
|Unprivileged ports           |Yes (higher than 1024)                 |Configurable        |Yes (higher than 1024)                 |
|SLSA Build Level 3           |Yes                              |Yes                 |Yes                              |
|Debug on cluster             |`oc debug` / ephemeral containers|`oc exec` with shell|`oc debug` / ephemeral containers|
@z

@x
## What’s next
@y
## What’s next
@z

@x
- [Use an image in Kubernetes](/dhi/how-to/k8s/) — general DHI Kubernetes deployment guide.
- [Customize an image](/dhi/how-to/customize/) — add packages to DHI images using Enterprise customization.
- [Debug a container](/dhi/troubleshoot/#general-debugging) — troubleshoot distroless containers with Docker Debug (local development).
- [Managing SCCs](https://docs.openshift.com/container-platform/4.14/authentication/managing-security-context-constraints.html) — Red Hat’s reference documentation on Security Context Constraints.
- [Creating images for OpenShift](https://docs.openshift.com/container-platform/4.14/openshift_images/create-images.html) — Red Hat’s guidelines for building OpenShift-compatible container images.
@y
- [Use an image in Kubernetes](__SUBDIR__/dhi/how-to/k8s/) — general DHI Kubernetes deployment guide.
- [Customize an image](__SUBDIR__/dhi/how-to/customize/) — add packages to DHI images using Enterprise customization.
- [Debug a container](__SUBDIR__/dhi/troubleshoot/#general-debugging) — troubleshoot distroless containers with Docker Debug (local development).
- [Managing SCCs](https://docs.openshift.com/container-platform/4.14/authentication/managing-security-context-constraints.html) — Red Hat’s reference documentation on Security Context Constraints.
- [Creating images for OpenShift](https://docs.openshift.com/container-platform/4.14/openshift_images/create-images.html) — Red Hat’s guidelines for building OpenShift-compatible container images.
@z
