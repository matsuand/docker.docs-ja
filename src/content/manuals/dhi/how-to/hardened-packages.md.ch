%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Use Hardened System Packages
linkTitle: Use hardened packages
@y
title: Use Hardened System Packages
linkTitle: Use hardened packages
@z

@x
keywords: hardened images, DHI, hardened packages, packages, alpine, apk, debian, apt
description: Learn how to use and verify Docker's hardened system packages in your images.
@y
keywords: hardened images, DHI, hardened packages, packages, alpine, apk, debian, apt
description: Learn how to use and verify Docker's hardened system packages in your images.
@z

@x
Docker Hardened System Packages are built from source by Docker. This ensures
supply chain integrity throughout your entire image stack by eliminating risks
from potentially compromised public packages.
@y
Docker Hardened System Packages are built from source by Docker. This ensures
supply chain integrity throughout your entire image stack by eliminating risks
from potentially compromised public packages.
@z

@x
Access to hardened packages varies by subscription:
@y
Access to hardened packages varies by subscription:
@z

@x
- **DHI Community**: Includes hardened packages in base images. Can configure the
  public package repository to access the same packages in custom images.
- **DHI Select**: Includes all Community packages, plus access to additional
  compliance-specific packages (such as FIPS variants) and Docker-patched
  packages through the image customization UI.
- **DHI Enterprise**: Includes all Select packages, plus the ability to configure
  the enterprise package repository directly in your own images for full access
  to compliance and security-patched packages.
@y
- **DHI Community**: Includes hardened packages in base images. Can configure the
  public package repository to access the same packages in custom images.
- **DHI Select**: Includes all Community packages, plus access to additional
  compliance-specific packages (such as FIPS variants) and Docker-patched
  packages through the image customization UI.
- **DHI Enterprise**: Includes all Select packages, plus the ability to configure
  the enterprise package repository directly in your own images for full access
  to compliance and security-patched packages.
@z

@x
## Built-in packages
@y
## Built-in packages
@z

@x
Supported distributions of Docker Hardened Images (DHI) automatically include
hardened system packages. No additional configuration is required. Simply pull
and use the images as normal.
@y
Supported distributions of Docker Hardened Images (DHI) automatically include
hardened system packages. No additional configuration is required. Simply pull
and use the images as normal.
@z

@x
All packages in these images are built by Docker from source, maintaining
the same security standards as the base images themselves.
@y
All packages in these images are built by Docker from source, maintaining
the same security standards as the base images themselves.
@z

@x
## Add hardened packages to your images
@y
## Add hardened packages to your images
@z

@x
You can add hardened packages to your own images in the following two ways.
@y
You can add hardened packages to your own images in the following two ways.
@z

@x
### Add packages through image customization
@y
### Add packages through image customization
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
When customizing Docker Hardened Images with DHI Select or DHI Enterprise, you
can add hardened packages for Alpine-based images through the customization
interface. Follow the steps to [create an image
customization](./customize.md#create-an-image-customization) and select hardened
packages during the customization process.
@y
When customizing Docker Hardened Images with DHI Select or DHI Enterprise, you
can add hardened packages for Alpine-based images through the customization
interface. Follow the steps to [create an image
customization](./customize.md#create-an-image-customization) and select hardened
packages during the customization process.
@z

@x
### Configure the package manager
@y
### Configure the package manager
@z

@x
You can configure your package manager to pull from Docker's hardened package
repositories. This lets you install hardened packages in your own images.
@y
You can configure your package manager to pull from Docker's hardened package
repositories. This lets you install hardened packages in your own images.
@z

@x
#### Public repository
@y
#### Public repository
@z

@x
To use Docker's public hardened package repository in your own images,
configure your package manager in your Dockerfile to install the DHI signing
key and add the DHI repository.
@y
To use Docker's public hardened package repository in your own images,
configure your package manager in your Dockerfile to install the DHI signing
key and add the DHI repository.
@z

@x
The configuration process involves three steps:
@y
The configuration process involves three steps:
@z

@x
1. Install the [signing key](https://github.com/docker-hardened-images/keyring)
2. Configure the package repository
3. Update and install packages
@y
1. Install the [signing key](https://github.com/docker-hardened-images/keyring)
2. Configure the package repository
3. Update and install packages
@z

@x
{{< tabs group="os" >}}
{{< tab name="Alpine" >}}
@y
{{< tabs group="os" >}}
{{< tab name="Alpine" >}}
@z

@x
The following example shows how to configure the Alpine package manager in your
Dockerfile to use Docker's public hardened package repository:
@y
The following example shows how to configure the Alpine package manager in your
Dockerfile to use Docker's public hardened package repository:
@z

@x
```dockerfile
FROM alpine:3.23
@y
```dockerfile
FROM alpine:3.23
@z

@x
# Install the signing key
RUN cd /etc/apk/keys && \
    wget https://dhi.io/keyring/dhi-apk@docker-0F81AD7700D99184.rsa.pub
@y
# Install the signing key
RUN cd /etc/apk/keys && \
    wget https://dhi.io/keyring/dhi-apk@docker-0F81AD7700D99184.rsa.pub
@z

@x
# Replace the default repositories with the hardened package repository
RUN echo "https://dhi.io/apk/alpine/v3.23/main" > /etc/apk/repositories
@y
# Replace the default repositories with the hardened package repository
RUN echo "https://dhi.io/apk/alpine/v3.23/main" > /etc/apk/repositories
@z

@x
# Update and install packages
RUN apk update && \
    apk add libpng
```
@y
# Update and install packages
RUN apk update && \
    apk add libpng
```
@z

@x
Replace `3.23` with your Alpine version in both the base image tag and repository URL.
@y
Replace `3.23` with your Alpine version in both the base image tag and repository URL.
@z

@x
To verify the configuration, build and run the image:
@y
To verify the configuration, build and run the image:
@z

@x
```console
$ docker build -t myapp:latest .
$ docker run -it myapp:latest sh
```
@y
```console
$ docker build -t myapp:latest .
$ docker run -it myapp:latest sh
```
@z

@x
Inside the container, check the configured repositories:
@y
Inside the container, check the configured repositories:
@z

@x
```console
/ # cat /etc/apk/repositories
https://dhi.io/apk/alpine/v3.23/main
```
@y
```console
/ # cat /etc/apk/repositories
https://dhi.io/apk/alpine/v3.23/main
```
@z

@x
This ensures all packages are installed from Docker's hardened repository.
@y
This ensures all packages are installed from Docker's hardened repository.
@z

@x
{{< /tab >}}
{{< tab name="Debian" >}}
@y
{{< /tab >}}
{{< tab name="Debian" >}}
@z

@x
The following example shows how to configure the Debian package manager in your
Dockerfile to use Docker's public hardened package repository:
@y
The following example shows how to configure the Debian package manager in your
Dockerfile to use Docker's public hardened package repository:
@z

@x
```dockerfile
FROM debian:trixie-slim
@y
```dockerfile
FROM debian:trixie-slim
@z

@x
# Install the signing key
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl gnupg \
    && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://dhi.io/keyring/dhi-deb-gpg.D46852F6925E9F71.key \
    | gpg --dearmor -o /usr/share/keyrings/dhi-deb.gpg
@y
# Install the signing key
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl gnupg \
    && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://dhi.io/keyring/dhi-deb-gpg.D46852F6925E9F71.key \
    | gpg --dearmor -o /usr/share/keyrings/dhi-deb.gpg
@z

@x
# Add the hardened package repository
RUN echo "deb [signed-by=/usr/share/keyrings/dhi-deb.gpg] https://dhi.io/deb/debian/main trixie main" \
    > /etc/apt/sources.list.d/dhi.list
@y
# Add the hardened package repository
RUN echo "deb [signed-by=/usr/share/keyrings/dhi-deb.gpg] https://dhi.io/deb/debian/main trixie main" \
    > /etc/apt/sources.list.d/dhi.list
@z

@x
# Update and install packages
RUN apt-get update && apt-get install -y jq \
    && rm -rf /var/lib/apt/lists/*
```
@y
# Update and install packages
RUN apt-get update && apt-get install -y jq \
    && rm -rf /var/lib/apt/lists/*
```
@z

@x
To verify the configuration, build and run the image:
@y
To verify the configuration, build and run the image:
@z

@x
```console
$ docker build -t myapp:latest .
$ docker run -it myapp:latest bash
```
@y
```console
$ docker build -t myapp:latest .
$ docker run -it myapp:latest bash
```
@z

@x
Inside the container, check the configured repository:
@y
Inside the container, check the configured repository:
@z

@x
```console
root@myapp:/# cat /etc/apt/sources.list.d/dhi.list
deb [signed-by=/usr/share/keyrings/dhi-deb.gpg] https://dhi.io/deb/debian/main trixie main
```
@y
```console
root@myapp:/# cat /etc/apt/sources.list.d/dhi.list
deb [signed-by=/usr/share/keyrings/dhi-deb.gpg] https://dhi.io/deb/debian/main trixie main
```
@z

@x
When the DHI repository carries a hardened version of a package, `apt` prefers
it over the upstream Debian version automatically. You can confirm this with
`apt-cache policy <package>`, which shows a candidate with a `+dhi` or `dhi`
version suffix sourced from `https://dhi.io/deb/debian/main`.
@y
When the DHI repository carries a hardened version of a package, `apt` prefers
it over the upstream Debian version automatically. You can confirm this with
`apt-cache policy <package>`, which shows a candidate with a `+dhi` or `dhi`
version suffix sourced from `https://dhi.io/deb/debian/main`.
@z

@x
Not every Debian package is available as a hardened system package. When a
package is not in the DHI repository, `apt` transparently falls back to the
upstream Debian mirrors configured in the base image.
@y
Not every Debian package is available as a hardened system package. When a
package is not in the DHI repository, `apt` transparently falls back to the
upstream Debian mirrors configured in the base image.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
All packages installed from the Docker Hardened Images repository are built from
source by Docker and include full provenance.
@y
All packages installed from the Docker Hardened Images repository are built from
source by Docker and include full provenance.
@z

@x
#### Enterprise repository
@y
#### Enterprise repository
@z

@x
{{< summary-bar feature_name="Docker Hardened Images Enterprise" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images Enterprise" >}}
@z

@x
With DHI Enterprise, you have access to an additional package
repository that includes hardened packages for compliance variants such as FIPS,
as well as additional security patches.
@y
With DHI Enterprise, you have access to an additional package
repository that includes hardened packages for compliance variants such as FIPS,
as well as additional security patches.
@z

@x
The configuration process involves five steps:
@y
The configuration process involves five steps:
@z

@x
1. Install the [signing keys](https://github.com/docker-hardened-images/keyring)
2. Configure the base package repository
3. Add the enterprise security repository
4. Configure package installation with authentication
5. Build the image passing credentials as a secret using the DHI CLI
@y
1. Install the [signing keys](https://github.com/docker-hardened-images/keyring)
2. Configure the base package repository
3. Add the enterprise security repository
4. Configure package installation with authentication
5. Build the image passing credentials as a secret using the DHI CLI
@z

@x
{{< tabs group="os" >}}
{{< tab name="Alpine" >}}
@y
{{< tabs group="os" >}}
{{< tab name="Alpine" >}}
@z

@x
The following example shows how to configure the Alpine package manager in your
Dockerfile to use Docker's enterprise hardened package repository:
@y
The following example shows how to configure the Alpine package manager in your
Dockerfile to use Docker's enterprise hardened package repository:
@z

@x
```dockerfile
FROM alpine:3.23
@y
```dockerfile
FROM alpine:3.23
@z

@x
# Install the signing key
RUN cd /etc/apk/keys && \
    wget https://dhi.io/keyring/dhi-apk@docker-0F81AD7700D99184.rsa.pub
@y
# Install the signing key
RUN cd /etc/apk/keys && \
    wget https://dhi.io/keyring/dhi-apk@docker-0F81AD7700D99184.rsa.pub
@z

@x
# Replace the default repositories with the hardened package repository
RUN echo "https://dhi.io/apk/alpine/v3.23/main" > /etc/apk/repositories
@y
# Replace the default repositories with the hardened package repository
RUN echo "https://dhi.io/apk/alpine/v3.23/main" > /etc/apk/repositories
@z

@x
# Update and install the enterprise configuration package to add the security repository
RUN apk update && \
    apk add dhi-enterprise-conf
@y
# Update and install the enterprise configuration package to add the security repository
RUN apk update && \
    apk add dhi-enterprise-conf
@z

@x
# Install packages from the security repository with authentication
RUN --mount=type=secret,id=http_auth \
    HTTP_AUTH="$(cat /run/secrets/http_auth)" \
    apk update && \
    apk add openssl-fips
```
@y
# Install packages from the security repository with authentication
RUN --mount=type=secret,id=http_auth \
    HTTP_AUTH="$(cat /run/secrets/http_auth)" \
    apk update && \
    apk add openssl-fips
```
@z

@x
Build the image with authentication passed securely as a build secret:
@y
Build the image with authentication passed securely as a build secret:
@z

@x
```console
$ docker dhi auth apk > http_auth.txt
$ docker build --secret id=http_auth,src=http_auth.txt -t myapp-enterprise:latest .
$ rm http_auth.txt
```
@y
```console
$ docker dhi auth apk > http_auth.txt
$ docker build --secret id=http_auth,src=http_auth.txt -t myapp-enterprise:latest .
$ rm http_auth.txt
```
@z

@x
The `--secret` flag securely mounts the authentication credentials during build
without storing them in the image layers or metadata.
@y
The `--secret` flag securely mounts the authentication credentials during build
without storing them in the image layers or metadata.
@z

@x
{{< /tab >}}
{{< tab name="Debian" >}}
@y
{{< /tab >}}
{{< tab name="Debian" >}}
@z

@x
The following example shows how to configure the Debian package manager in your
Dockerfile to use Docker's enterprise hardened package repository. Mount
credentials at `/etc/apt/auth.conf.d/dhi.conf`; `apt` reads files in
`/etc/apt/auth.conf.d/` automatically when they have mode `0600`:
@y
The following example shows how to configure the Debian package manager in your
Dockerfile to use Docker's enterprise hardened package repository. Mount
credentials at `/etc/apt/auth.conf.d/dhi.conf`; `apt` reads files in
`/etc/apt/auth.conf.d/` automatically when they have mode `0600`:
@z

@x
```dockerfile
FROM debian:trixie-slim
@y
```dockerfile
FROM debian:trixie-slim
@z

@x
# Install the signing keys
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl gnupg \
    && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://dhi.io/keyring/dhi-deb-gpg.D46852F6925E9F71.key \
    | gpg --dearmor -o /usr/share/keyrings/dhi-deb.gpg
RUN curl -fsSL https://dhi.io/keyring/dhi-deb-sec-gpg.D46852F6925E9F71.key \
    | gpg --dearmor -o /usr/share/keyrings/dhi-deb-sec.gpg
@y
# Install the signing keys
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl gnupg \
    && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://dhi.io/keyring/dhi-deb-gpg.D46852F6925E9F71.key \
    | gpg --dearmor -o /usr/share/keyrings/dhi-deb.gpg
RUN curl -fsSL https://dhi.io/keyring/dhi-deb-sec-gpg.D46852F6925E9F71.key \
    | gpg --dearmor -o /usr/share/keyrings/dhi-deb-sec.gpg
@z

@x
# Add the hardened package repository and the enterprise security repository
RUN echo "deb [signed-by=/usr/share/keyrings/dhi-deb.gpg] https://dhi.io/deb/debian/main trixie main" \
    > /etc/apt/sources.list.d/dhi.list
RUN echo "deb [signed-by=/usr/share/keyrings/dhi-deb-sec.gpg] https://dhi.io/deb/debian/security trixie main" \
    > /etc/apt/sources.list.d/dhi-sec.list
@y
# Add the hardened package repository and the enterprise security repository
RUN echo "deb [signed-by=/usr/share/keyrings/dhi-deb.gpg] https://dhi.io/deb/debian/main trixie main" \
    > /etc/apt/sources.list.d/dhi.list
RUN echo "deb [signed-by=/usr/share/keyrings/dhi-deb-sec.gpg] https://dhi.io/deb/debian/security trixie main" \
    > /etc/apt/sources.list.d/dhi-sec.list
@z

@x
# Install packages from the security repository with authentication
RUN --mount=type=secret,id=netrc,target=/etc/apt/auth.conf.d/dhi.conf,mode=0600 \
    apt-get update && apt-get install -y openssl \
    && rm -rf /var/lib/apt/lists/*
```
@y
# Install packages from the security repository with authentication
RUN --mount=type=secret,id=netrc,target=/etc/apt/auth.conf.d/dhi.conf,mode=0600 \
    apt-get update && apt-get install -y openssl \
    && rm -rf /var/lib/apt/lists/*
```
@z

@x
Build the image, passing credentials securely as a build secret through an
environment variable:
@y
Build the image, passing credentials securely as a build secret through an
environment variable:
@z

@x
```console
$ NETRC=$(docker dhi auth deb) docker build \
    --secret id=netrc,env=NETRC \
    -t myapp-enterprise:latest .
```
@y
```console
$ NETRC=$(docker dhi auth deb) docker build \
    --secret id=netrc,env=NETRC \
    -t myapp-enterprise:latest .
```
@z

@x
The `--secret id=netrc,env=NETRC` form securely mounts the authentication
credentials during build without storing them in the image layers or metadata.
@y
The `--secret id=netrc,env=NETRC` form securely mounts the authentication
credentials during build without storing them in the image layers or metadata.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Verify packages
@y
## Verify packages
@z

@x
Every hardened package is cryptographically signed and includes metadata that
proves its provenance and build integrity. You can verify the signatures and
view the metadata to ensure your packages come from Docker's trusted build
infrastructure.
@y
Every hardened package is cryptographically signed and includes metadata that
proves its provenance and build integrity. You can verify the signatures and
view the metadata to ensure your packages come from Docker's trusted build
infrastructure.
@z

@x
### View package metadata
@y
### View package metadata
@z

@x
To view information about a hardened package:
@y
To view information about a hardened package:
@z

@x
{{< tabs group="os" >}}
{{< tab name="Alpine" >}}
@y
{{< tabs group="os" >}}
{{< tab name="Alpine" >}}
@z

@x
```console
$ apk info -L <package-name>
```
@y
```console
$ apk info -L <package-name>
```
@z

@x
{{< /tab >}}
{{< tab name="Debian" >}}
@y
{{< /tab >}}
{{< tab name="Debian" >}}
@z

@x
```console
$ dpkg -L <package-name>
```
@y
```console
$ dpkg -L <package-name>
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
This shows the files included in the package and its metadata.
@y
This shows the files included in the package and its metadata.
@z

@x
### Verify package signatures
@y
### Verify package signatures
@z

@x
Hardened packages are cryptographically signed by Docker. When you install the
signing keys and configure your package manager as described previously, the
package manager automatically verifies signatures during installation.
@y
Hardened packages are cryptographically signed by Docker. When you install the
signing keys and configure your package manager as described previously, the
package manager automatically verifies signatures during installation.
@z

@x
If a package fails signature verification, the package manager will refuse to
install it, protecting you from tampered or compromised packages.
@y
If a package fails signature verification, the package manager will refuse to
install it, protecting you from tampered or compromised packages.
@z

@x
### Build provenance and cryptographic verification
@y
### Build provenance and cryptographic verification
@z

@x
Docker hardened packages are built by Docker's trusted infrastructure and include
verifiable metadata and cryptographic signatures.
@y
Docker hardened packages are built by Docker's trusted infrastructure and include
verifiable metadata and cryptographic signatures.
@z

@x
To view this metadata for an installed package:
@y
To view this metadata for an installed package:
@z

@x
{{< tabs group="os" >}}
{{< tab name="Alpine" >}}
@y
{{< tabs group="os" >}}
{{< tab name="Alpine" >}}
@z

@x
```console
$ apk info -a <package-name>
```
@y
```console
$ apk info -a <package-name>
```
@z

@x
{{< /tab >}}
{{< tab name="Debian" >}}
@y
{{< /tab >}}
{{< tab name="Debian" >}}
@z

@x
```console
$ apt-cache show <package-name>
```
@y
```console
$ apt-cache show <package-name>
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Or to view metadata for a package before installing:
@y
Or to view metadata for a package before installing:
@z

@x
{{< tabs group="os" >}}
{{< tab name="Alpine" >}}
@y
{{< tabs group="os" >}}
{{< tab name="Alpine" >}}
@z

@x
```console
$ apk fetch --stdout <package-name> | tar -xzO .PKGINFO
```
@y
```console
$ apk fetch --stdout <package-name> | tar -xzO .PKGINFO
```
@z

@x
{{< /tab >}}
{{< tab name="Debian" >}}
@y
{{< /tab >}}
{{< tab name="Debian" >}}
@z

@x
```console
$ apt-get download <package-name>
$ dpkg-deb -I <package-name>_*.deb
```
@y
```console
$ apt-get download <package-name>
$ dpkg-deb -I <package-name>_*.deb
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
The package signing keys ensure that packages haven't been tampered with after
being built. When you install the signing key and configure your package manager,
all packages are automatically verified before installation.
@y
The package signing keys ensure that packages haven't been tampered with after
being built. When you install the signing key and configure your package manager,
all packages are automatically verified before installation.
@z

@x
### Package attestations
@y
### Package attestations
@z

@x
Each hardened package includes its own attestations, similar to [image
attestations](./verify.md). These attestations provide provenance and build
information for individual packages, allowing you to trace the supply chain down
to the package level.
@y
Each hardened package includes its own attestations, similar to [image
attestations](./verify.md). These attestations provide provenance and build
information for individual packages, allowing you to trace the supply chain down
to the package level.
@z

@x
You can retrieve package attestations by first extracting package information
from the image's SLSA provenance, then using the package digest to access its
attestations.
@y
You can retrieve package attestations by first extracting package information
from the image's SLSA provenance, then using the package digest to access its
attestations.
@z

@x
#### Extract package information from image attestations
@y
#### Extract package information from image attestations
@z

@x
To get provenance information for a specific package from an image's SLSA
provenance attestation, you first need to retrieve the image's provenance and
then filter for the specific package you're interested in.
@y
To get provenance information for a specific package from an image's SLSA
provenance attestation, you first need to retrieve the image's provenance and
then filter for the specific package you're interested in.
@z

@x
The SLSA provenance attestation includes a `materials` array that lists all
build inputs, including packages. You can use `jq` to filter this array for a
specific package:
@y
The SLSA provenance attestation includes a `materials` array that lists all
build inputs, including packages. You can use `jq` to filter this array for a
specific package:
@z

@x
```console
$ docker scout attest get dhi.io/golang:1.26-alpine3.23 \
    --predicate-type https://slsa.dev/provenance/v0.2 | \
    jq '.predicate.materials[] | select( .uri == "https://dhi.io/apk/alpine/v3.23/main/aarch64/golang-1.26-1.26.0-r0.apk" )'
```
@y
```console
$ docker scout attest get dhi.io/golang:1.26-alpine3.23 \
    --predicate-type https://slsa.dev/provenance/v0.2 | \
    jq '.predicate.materials[] | select( .uri == "https://dhi.io/apk/alpine/v3.23/main/aarch64/golang-1.26-1.26.0-r0.apk" )'
```
@z

@x
Replace the package URI in the `select()` filter with the specific package
you're looking for. You can find available packages by first running the command
without the `select()` filter to see all materials.
@y
Replace the package URI in the `select()` filter with the specific package
you're looking for. You can find available packages by first running the command
without the `select()` filter to see all materials.
@z

@x
This returns the package URI and its SHA-256 digest:
@y
This returns the package URI and its SHA-256 digest:
@z

@x
```json
{
  "uri": "https://dhi.io/apk/alpine/v3.23/main/aarch64/golang-1.26-1.26.0-r0.apk",
  "digest": {
    "sha256": "4082a2500abc2e7b8435f9398d3514d760044fa52ca3d10cf80015469124a838"
  }
}
```
@y
```json
{
  "uri": "https://dhi.io/apk/alpine/v3.23/main/aarch64/golang-1.26-1.26.0-r0.apk",
  "digest": {
    "sha256": "4082a2500abc2e7b8435f9398d3514d760044fa52ca3d10cf80015469124a838"
  }
}
```
@z

@x
#### List attestations for a package
@y
#### List attestations for a package
@z

@x
Using the package digest from the previous section, you can list all available
attestations for that package:
@y
Using the package digest from the previous section, you can list all available
attestations for that package:
@z

@x
```console
$ curl -s https://dhi.io/apk/alpine/v3.23/main/sha256:4082a2500abc2e7b8435f9398d3514d760044fa52ca3d10cf80015469124a838/attestations/list | jq .
```
@y
```console
$ curl -s https://dhi.io/apk/alpine/v3.23/main/sha256:4082a2500abc2e7b8435f9398d3514d760044fa52ca3d10cf80015469124a838/attestations/list | jq .
```
@z

@x
This returns information about the package and its available attestations:
@y
This returns information about the package and its available attestations:
@z

@x
```json
{
  "subject": {
    "name": "pkg:apk/alpine/golang-1.26@1.26.0-r0?os_name=&os_version=",
    "digest": {
      "sha256": "4082a2500abc2e7b8435f9398d3514d760044fa52ca3d10cf80015469124a838"
    }
  },
  "attestations": [
    {
      "predicate_type": "https://slsa.dev/provenance/v1",
      "digest": {
        "sha256": "97c919cf0edb27087739bbabeea4c1ef88d069cd41791476ba64b69280d63a32"
      },
      "url": "https://dhi.io/apk/alpine/v3.23/main/sha256:4082a2500abc2e7b8435f9398d3514d760044fa52ca3d10cf80015469124a838/attestations/sha256:97c919cf0edb27087739bbabeea4c1ef88d069cd41791476ba64b69280d63a32"
    }
  ]
}
```
@y
```json
{
  "subject": {
    "name": "pkg:apk/alpine/golang-1.26@1.26.0-r0?os_name=&os_version=",
    "digest": {
      "sha256": "4082a2500abc2e7b8435f9398d3514d760044fa52ca3d10cf80015469124a838"
    }
  },
  "attestations": [
    {
      "predicate_type": "https://slsa.dev/provenance/v1",
      "digest": {
        "sha256": "97c919cf0edb27087739bbabeea4c1ef88d069cd41791476ba64b69280d63a32"
      },
      "url": "https://dhi.io/apk/alpine/v3.23/main/sha256:4082a2500abc2e7b8435f9398d3514d760044fa52ca3d10cf80015469124a838/attestations/sha256:97c919cf0edb27087739bbabeea4c1ef88d069cd41791476ba64b69280d63a32"
    }
  ]
}
```
@z

@x
#### Retrieve package attestations
@y
#### Retrieve package attestations
@z

@x
To retrieve the actual attestation content, use the URL provided in the
attestation list:
@y
To retrieve the actual attestation content, use the URL provided in the
attestation list:
@z

@x
```console
$ curl -s https://dhi.io/apk/alpine/v3.23/main/sha256:4082a2500abc2e7b8435f9398d3514d760044fa52ca3d10cf80015469124a838/attestations/sha256:97c919cf0edb27087739bbabeea4c1ef88d069cd41791476ba64b69280d63a32 | jq .
```
@y
```console
$ curl -s https://dhi.io/apk/alpine/v3.23/main/sha256:4082a2500abc2e7b8435f9398d3514d760044fa52ca3d10cf80015469124a838/attestations/sha256:97c919cf0edb27087739bbabeea4c1ef88d069cd41791476ba64b69280d63a32 | jq .
```
@z

@x
This returns the full SLSA provenance attestation for the package, which
includes information about how the package was built, its dependencies, and
other build materials.
@y
This returns the full SLSA provenance attestation for the package, which
includes information about how the package was built, its dependencies, and
other build materials.
@z

@x
You can continue this process recursively to trace the supply chain all the way
down to the compiler and other build tools used to create the package.
@y
You can continue this process recursively to trace the supply chain all the way
down to the compiler and other build tools used to create the package.
@z
