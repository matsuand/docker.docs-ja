%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Using Docker with Zscaler
tags: [networking, admin]
summary: |
  This guide explains how to embed Zscaler’s root certificate into Docker
  images, allowing containers to operate securely with Zscaler proxies and
  avoid SSL errors.
@y
title: Using Docker with Zscaler
tags: [networking, admin]
summary: |
  This guide explains how to embed Zscaler’s root certificate into Docker
  images, allowing containers to operate securely with Zscaler proxies and
  avoid SSL errors.
@z

% params:

@x
  time: 10 minutes
@y
  time: 10 分
@z

@x
In many corporate environments, network traffic is intercepted and monitored
using HTTPS proxies, such as Zscaler. While Zscaler ensures security compliance
and network control, it can cause issues for developers using Docker,
particularly during build processes, where SSL certificate validation errors
might occur. This guide outlines how to configure Docker containers and builds
to properly handle Zscaler's custom certificates, ensuring smooth operation in
monitored environments.
@y
In many corporate environments, network traffic is intercepted and monitored
using HTTPS proxies, such as Zscaler. While Zscaler ensures security compliance
and network control, it can cause issues for developers using Docker,
particularly during build processes, where SSL certificate validation errors
might occur. This guide outlines how to configure Docker containers and builds
to properly handle Zscaler's custom certificates, ensuring smooth operation in
monitored environments.
@z

@x
## The role of certificates in Docker
@y
## The role of certificates in Docker
@z

@x
When Docker builds or runs containers, it often needs to fetch resources from
the internet—whether it's pulling a base image from a registry, downloading
dependencies, or communicating with external services. In a proxied
environment, Zscaler intercepts HTTPS traffic and replaces the remote server's
certificate with its own. However, Docker doesn't trust this Zscaler
certificate by default, leading to SSL errors.
@y
When Docker builds or runs containers, it often needs to fetch resources from
the internet—whether it's pulling a base image from a registry, downloading
dependencies, or communicating with external services. In a proxied
environment, Zscaler intercepts HTTPS traffic and replaces the remote server's
certificate with its own. However, Docker doesn't trust this Zscaler
certificate by default, leading to SSL errors.
@z

% snip code...

@x
These errors occur because Docker cannot verify the validity of the certificate
presented by Zscaler. To avoid this, you must configure Docker to trust
Zscaler's certificate.
@y
These errors occur because Docker cannot verify the validity of the certificate
presented by Zscaler. To avoid this, you must configure Docker to trust
Zscaler's certificate.
@z

@x
## Configure Zscaler proxy for Docker Desktop
@y
## Configure Zscaler proxy for Docker Desktop
@z

@x
Depending on how Zscaler is deployed, you may need to configure Docker Desktop
proxy settings manually to use the Zscaler proxy.
@y
Depending on how Zscaler is deployed, you may need to configure Docker Desktop
proxy settings manually to use the Zscaler proxy.
@z

@x
If you're using Zscaler as a system-level proxy via the [Zscaler Client Connector](https://help.zscaler.com/zscaler-client-connector/what-is-zscaler-client-connector),
all traffic on the device is automatically routed through Zscaler, so Docker
Desktop uses the Zscaler proxy automatically with no additional configuration
necessary.
@y
If you're using Zscaler as a system-level proxy via the [Zscaler Client Connector](https://help.zscaler.com/zscaler-client-connector/what-is-zscaler-client-connector),
all traffic on the device is automatically routed through Zscaler, so Docker
Desktop uses the Zscaler proxy automatically with no additional configuration
necessary.
@z

@x
If you are not using Zscaler as a system-level proxy, manually configure proxy
settings in Docker Desktop. Set up proxy settings for all clients in the
organization using [Settings Management](/manuals/enterprise/security/hardened-desktop/settings-management/_index.md),
or edit proxy configuration in the Docker Desktop GUI under [**Settings > Resources > Proxies**](/manuals/desktop/settings-and-maintenance/settings.md#proxies).
@y
If you are not using Zscaler as a system-level proxy, manually configure proxy
settings in Docker Desktop. Set up proxy settings for all clients in the
organization using [Settings Management](manuals/enterprise/security/hardened-desktop/settings-management/_index.md),
or edit proxy configuration in the Docker Desktop GUI under [**Settings > Resources > Proxies**](manuals/desktop/settings-and-maintenance/settings.md#proxies).
@z

@x
## Install root certificates in Docker images
@y
## Install root certificates in Docker images
@z

@x
To enable containers to use and trust the Zscaler proxy, embed the certificate
in the image and configure the image's trust store. Installing certificates at
image build time is the preferred approach, as it removes the need for
configuration during startup and provides an auditable, consistent environment.
@y
To enable containers to use and trust the Zscaler proxy, embed the certificate
in the image and configure the image's trust store. Installing certificates at
image build time is the preferred approach, as it removes the need for
configuration during startup and provides an auditable, consistent environment.
@z

@x
### Obtaining the root certificate
@y
### Obtaining the root certificate
@z

@x
The easiest way to obtain the root certificate is to export it from a machine
where an administrator has already installed it. You can use either a web
browser or the system's certificate management service (for example, Windows
Certificate Store).
@y
The easiest way to obtain the root certificate is to export it from a machine
where an administrator has already installed it. You can use either a web
browser or the system's certificate management service (for example, Windows
Certificate Store).
@z

@x
#### Example: Exporting the certificate using Google Chrome
@y
#### Example: Exporting the certificate using Google Chrome
@z

@x
1. In Google Chrome, navigate to `chrome://certificate-manager/`.
2. Under **Local certificates**, select **View imported certificates**.
3. Find the Zscaler root certificate, often labeled **Zscaler Root CA**.
4. Open the certificate details and select **Export**.
5. Save the certificate in ASCII PEM format.
6. Open the exported file in a text editor to confirm it includes `-----BEGIN CERTIFICATE-----` and `-----END CERTIFICATE-----`.
@y
1. In Google Chrome, navigate to `chrome://certificate-manager/`.
2. Under **Local certificates**, select **View imported certificates**.
3. Find the Zscaler root certificate, often labeled **Zscaler Root CA**.
4. Open the certificate details and select **Export**.
5. Save the certificate in ASCII PEM format.
6. Open the exported file in a text editor to confirm it includes `-----BEGIN CERTIFICATE-----` and `-----END CERTIFICATE-----`.
@z

@x
When you have obtained the certificate, store it in an accessible repository,
such as JFrog Artifactory or a Git repository. Alternatively, use generic
storage like AWS S3.
@y
When you have obtained the certificate, store it in an accessible repository,
such as JFrog Artifactory or a Git repository. Alternatively, use generic
storage like AWS S3.
@z

@x
### Building with the certificate
@y
### Building with the certificate
@z

@x
To install these certificates when building images, copy the certificate into
the build container and update the trust store. An example Dockerfile looks
like this:
@y
To install these certificates when building images, copy the certificate into
the build container and update the trust store. An example Dockerfile looks
like this:
@z

% snip code...

@x
Here, `zscaler-root-ca.crt` is the root certificate, located at the root of the
build context (often within the application's Git repository).
@y
Here, `zscaler-root-ca.crt` is the root certificate, located at the root of the
build context (often within the application's Git repository).
@z

@x
If you use an artifact repository, you can fetch the certificate directly using
the `ADD` instruction. You can also use the `--checksum` flag to verify that
the content digest of the certificate is correct.
@y
If you use an artifact repository, you can fetch the certificate directly using
the `ADD` instruction. You can also use the `--checksum` flag to verify that
the content digest of the certificate is correct.
@z

% snip code...

@x
#### Using multi-stage builds
@y
#### Using multi-stage builds
@z

@x
For multi-stage builds where certificates are needed in the final runtime
image, ensure the certificate installation occurs in the final stage.
@y
For multi-stage builds where certificates are needed in the final runtime
image, ensure the certificate installation occurs in the final stage.
@z

% snip code...

@x
## Conclusion
@y
## Conclusion
@z

@x
Embedding the Zscaler root certificate directly into your Docker images ensures
that containers run smoothly within Zscaler-proxied environments. By using this
approach, you reduce potential runtime errors and create a consistent,
auditable configuration that allows for smooth Docker operations within a
monitored network.
@y
Embedding the Zscaler root certificate directly into your Docker images ensures
that containers run smoothly within Zscaler-proxied environments. By using this
approach, you reduce potential runtime errors and create a consistent,
auditable configuration that allows for smooth Docker operations within a
monitored network.
@z
