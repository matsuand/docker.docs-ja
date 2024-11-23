%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Software artifacts on Docker Hub
linkTitle: Software artifacts
@y
title: Software artifacts on Docker Hub
linkTitle: Software artifacts
@z

@x
keywords: oci, artifacts, docker hub
description: You can use Docker Hub to store software artifacts packaged as OCI artifacts.
@y
keywords: oci, artifacts, docker hub
description: You can use Docker Hub to store software artifacts packaged as OCI artifacts.
@z

@x
You can use Docker Hub to store any kind of software artifact, not just
container images. A software artifact is any item produced during the software
development process that contributes to the creation, maintenance, or
understanding of the software. Docker Hub supports OCI artifacts by leveraging
the config property on the image manifest.
@y
You can use Docker Hub to store any kind of software artifact, not just
container images. A software artifact is any item produced during the software
development process that contributes to the creation, maintenance, or
understanding of the software. Docker Hub supports OCI artifacts by leveraging
the config property on the image manifest.
@z

@x
## What are OCI artifacts?
@y
## What are OCI artifacts?
@z

@x
OCI artifacts are any arbitrary files related to a software application. Some
examples include:
@y
OCI artifacts are any arbitrary files related to a software application. Some
examples include:
@z

@x
- Helm charts
- Software Bill of Materials (SBOM)
- Digital signatures
- Provenance data
- Attestations
- Vulnerability reports
@y
- Helm charts
- Software Bill of Materials (SBOM)
- Digital signatures
- Provenance data
- Attestations
- Vulnerability reports
@z

@x
Docker Hub supporting OCI artifacts means you can use one repository for storing
and distributing container images as well as other assets.
@y
Docker Hub supporting OCI artifacts means you can use one repository for storing
and distributing container images as well as other assets.
@z

@x
A common use case for OCI artifacts is
[Helm charts](https://helm.sh/docs/topics/charts/). Helm charts is a packaging
format that defines a Kubernetes deployment for an application. Since Kubernetes
is a popular runtime for containers, it makes sense to host application images
and deployment templates all in one place.
@y
A common use case for OCI artifacts is
[Helm charts](https://helm.sh/docs/topics/charts/). Helm charts is a packaging
format that defines a Kubernetes deployment for an application. Since Kubernetes
is a popular runtime for containers, it makes sense to host application images
and deployment templates all in one place.
@z

@x
## Using OCI artifacts with Docker Hub
@y
## Using OCI artifacts with Docker Hub
@z

@x
You manage OCI artifacts on Docker Hub in a similar way you would container
images.
@y
You manage OCI artifacts on Docker Hub in a similar way you would container
images.
@z

@x
Pushing and pulling OCI artifacts to and from a registry is done using a
registry client. [ORAS CLI](https://oras.land/docs/installation)
is a command-line tool that provides the capability of managing
OCI artifacts in a registry. If you use Helm charts, the
[Helm CLI](https://helm.sh/docs/intro/install/) provides built-in
functionality for pushing and pulling charts to and from a registry.
@y
Pushing and pulling OCI artifacts to and from a registry is done using a
registry client. [ORAS CLI](https://oras.land/docs/installation)
is a command-line tool that provides the capability of managing
OCI artifacts in a registry. If you use Helm charts, the
[Helm CLI](https://helm.sh/docs/intro/install/) provides built-in
functionality for pushing and pulling charts to and from a registry.
@z

@x
Registry clients invoke HTTP requests to the Docker Hub registry API. The
registry API conforms to a standard protocol defined in the
[OCI distribution specification](https://github.com/opencontainers/distribution-spec).
@y
Registry clients invoke HTTP requests to the Docker Hub registry API. The
registry API conforms to a standard protocol defined in the
[OCI distribution specification](https://github.com/opencontainers/distribution-spec).
@z

@x
## Examples
@y
## Examples
@z

@x
This section shows some examples on using OCI artifacts with Docker Hub.
@y
This section shows some examples on using OCI artifacts with Docker Hub.
@z

@x
### Push a Helm chart
@y
### Push a Helm chart
@z

@x
The following procedure shows how to push a Helm chart as an OCI artifact to
Docker Hub.
@y
The following procedure shows how to push a Helm chart as an OCI artifact to
Docker Hub.
@z

@x
Prerequisites:
@y
Prerequisites:
@z

@x
- Helm version 3.0.0 or later
@y
- Helm version 3.0.0 or later
@z

@x
Steps:
@y
Steps:
@z

@x
1. Create a new Helm chart
@y
1. Create a new Helm chart
@z

@x
   ```console
   $ helm create demo
   ```
@y
   ```console
   $ helm create demo
   ```
@z

@x
   This command generates a boilerplate template chart.
@y
   This command generates a boilerplate template chart.
@z

@x
2. Package the Helm chart into a tarball.
@y
2. Package the Helm chart into a tarball.
@z

@x
   ```console
   $ helm package demo
   Successfully packaged chart and saved it to: /Users/hubuser/demo-0.1.0.tgz
   ```
@y
   ```console
   $ helm package demo
   Successfully packaged chart and saved it to: /Users/hubuser/demo-0.1.0.tgz
   ```
@z

@x
3. Sign in to Docker Hub with Helm, using your Docker credentials.
@y
3. Sign in to Docker Hub with Helm, using your Docker credentials.
@z

@x
   ```console
   $ helm registry login registry-1.docker.io -u hubuser
   ```
@y
   ```console
   $ helm registry login registry-1.docker.io -u hubuser
   ```
@z

@x
4. Push the chart to a Docker Hub repository.
@y
4. Push the chart to a Docker Hub repository.
@z

@x
   ```console
   $ helm push demo-0.1.0.tgz oci://registry-1.docker.io/docker
   ```
@y
   ```console
   $ helm push demo-0.1.0.tgz oci://registry-1.docker.io/docker
   ```
@z

@x
   This uploads the Helm chart tarball to a `demo` repository in the `docker`
   namespace.
@y
   This uploads the Helm chart tarball to a `demo` repository in the `docker`
   namespace.
@z

@x
5. Go to the repository page on Docker Hub. The **Tags** section of the page
   shows the Helm chart tag.
@y
5. Go to the repository page on Docker Hub. The **Tags** section of the page
   shows the Helm chart tag.
@z

@x
   ![List of repository tags](./images/oci-helm.png)
@y
   ![List of repository tags](./images/oci-helm.png)
@z

@x
6. Select the tag name to go to the page for that tag.
@y
6. Select the tag name to go to the page for that tag.
@z

@x
   The page lists a few useful commands for working with Helm charts.
@y
   The page lists a few useful commands for working with Helm charts.
@z

@x
   ![Tag page of a Helm chart artifact](./images/oci-helm-tagview.png)
@y
   ![Tag page of a Helm chart artifact](./images/oci-helm-tagview.png)
@z

@x
### Push a volume
@y
### Push a volume
@z

@x
The following procedure shows how to push container volume as an OCI artifact to
Docker Hub.
@y
The following procedure shows how to push container volume as an OCI artifact to
Docker Hub.
@z

@x
Prerequisites:
@y
Prerequisites:
@z

@x
- ORAS CLI version 0.15 or later
@y
- ORAS CLI version 0.15 or later
@z

@x
Steps:
@y
Steps:
@z

@x
1. Create a dummy file to use as volume content.
@y
1. Create a dummy file to use as volume content.
@z

@x
   ```console
   $ touch myvolume.txt
   ```
@y
   ```console
   $ touch myvolume.txt
   ```
@z

@x
2. Sign in to Docker Hub using the ORAS CLI.
@y
2. Sign in to Docker Hub using the ORAS CLI.
@z

@x
   ```console
   $ oras login -u hubuser registry-1.docker.io
   ```
@y
   ```console
   $ oras login -u hubuser registry-1.docker.io
   ```
@z

@x
3. Push the file to Docker Hub.
@y
3. Push the file to Docker Hub.
@z

@x
   ```console
   $ oras push registry-1.docker.io/docker/demo:0.0.1 \
     --artifact-type=application/vnd.docker.volume.v1+tar.gz \
     myvolume.txt:text/plain
   ```
@y
   ```console
   $ oras push registry-1.docker.io/docker/demo:0.0.1 \
     --artifact-type=application/vnd.docker.volume.v1+tar.gz \
     myvolume.txt:text/plain
   ```
@z

@x
   This uploads the volume to a `demo` repository in the `docker` namespace. The
   `--artifact-type` flag specifies a special media type that makes Docker Hub
   recognize the artifact as a container volume.
@y
   This uploads the volume to a `demo` repository in the `docker` namespace. The
   `--artifact-type` flag specifies a special media type that makes Docker Hub
   recognize the artifact as a container volume.
@z

@x
4. Go to the repository page on Docker Hub. The **Tags** section on that page
   shows the volume tag.
@y
4. Go to the repository page on Docker Hub. The **Tags** section on that page
   shows the volume tag.
@z

@x
   ![Repository page showing a volume in the tag list](./images/oci-volume.png)
@y
   ![Repository page showing a volume in the tag list](./images/oci-volume.png)
@z

@x
### Push a generic artifact file
@y
### Push a generic artifact file
@z

@x
The following procedure shows how to push a generic OCI artifact to Docker Hub.
@y
The following procedure shows how to push a generic OCI artifact to Docker Hub.
@z

@x
Prerequisites:
@y
Prerequisites:
@z

@x
- ORAS CLI version 0.15 or later
@y
- ORAS CLI version 0.15 or later
@z

@x
Steps:
@y
Steps:
@z

@x
1. Create your artifact file.
@y
1. Create your artifact file.
@z

@x
   ```console
   $ touch myartifact.txt
   ```
@y
   ```console
   $ touch myartifact.txt
   ```
@z

@x
2. Sign in to Docker Hub using the ORAS CLI.
@y
2. Sign in to Docker Hub using the ORAS CLI.
@z

@x
   ```console
   $ oras login -u hubuser registry-1.docker.io
   ```
@y
   ```console
   $ oras login -u hubuser registry-1.docker.io
   ```
@z

@x
3. Push the file to Docker Hub.
@y
3. Push the file to Docker Hub.
@z

@x
   ```console
   $ oras push registry-1.docker.io/docker/demo:0.0.1 myartifact.txt:text/plain
   ```
@y
   ```console
   $ oras push registry-1.docker.io/docker/demo:0.0.1 myartifact.txt:text/plain
   ```
@z

@x
4. Go to the repository page on Docker Hub. The **Tags** section on that page
   shows the artifact tag.
@y
4. Go to the repository page on Docker Hub. The **Tags** section on that page
   shows the artifact tag.
@z

@x
   ![Repository page showing an artifact in the tag list](./images/oci-artifact.png)
@y
   ![Repository page showing an artifact in the tag list](./images/oci-artifact.png)
@z
