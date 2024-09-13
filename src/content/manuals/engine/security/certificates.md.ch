%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to set up and use certificates with a registry to verify access
keywords: Usage, registry, repository, client, root, certificate, docker, apache,
  ssl, tls, documentation, examples, articles, tutorials
title: Verify repository client with certificates
aliases:
- /articles/certificates/
- /engine/articles/certificates/
---
@y
---
description: How to set up and use certificates with a registry to verify access
keywords: Usage, registry, repository, client, root, certificate, docker, apache,
  ssl, tls, documentation, examples, articles, tutorials
title: Verify repository client with certificates
aliases:
- /articles/certificates/
- /engine/articles/certificates/
---
@z

@x
In [Running Docker with HTTPS](protect-access.md), you learned that, by default,
Docker runs via a non-networked Unix socket and TLS must be enabled in order
to have the Docker client and the daemon communicate securely over HTTPS.  TLS ensures authenticity of the registry endpoint and that traffic to/from registry is encrypted.
@y
In [Running Docker with HTTPS](protect-access.md), you learned that, by default,
Docker runs via a non-networked Unix socket and TLS must be enabled in order
to have the Docker client and the daemon communicate securely over HTTPS.  TLS ensures authenticity of the registry endpoint and that traffic to/from registry is encrypted.
@z

@x
This article demonstrates how to ensure the traffic between the Docker registry
server and the Docker daemon (a client of the registry server) is encrypted and
properly authenticated using certificate-based client-server authentication.
@y
This article demonstrates how to ensure the traffic between the Docker registry
server and the Docker daemon (a client of the registry server) is encrypted and
properly authenticated using certificate-based client-server authentication.
@z

@x
We show you how to install a Certificate Authority (CA) root certificate
for the registry and how to set the client TLS certificate for verification.
@y
We show you how to install a Certificate Authority (CA) root certificate
for the registry and how to set the client TLS certificate for verification.
@z

@x
## Understand the configuration
@y
## Understand the configuration
@z

@x
A custom certificate is configured by creating a directory under
`/etc/docker/certs.d` using the same name as the registry's hostname, such as
`localhost`. All `*.crt` files are added to this directory as CA roots.
@y
A custom certificate is configured by creating a directory under
`/etc/docker/certs.d` using the same name as the registry's hostname, such as
`localhost`. All `*.crt` files are added to this directory as CA roots.
@z

@x
> [!NOTE]
>
> On Linux any root certificates authorities are merged with the system defaults,
> including the host's root CA set. If you are running Docker on Windows Server,
> or Docker Desktop for Windows with Windows containers, the system default
> certificates are only used when no custom root certificates are configured.
@y
> [!NOTE]
>
> On Linux any root certificates authorities are merged with the system defaults,
> including the host's root CA set. If you are running Docker on Windows Server,
> or Docker Desktop for Windows with Windows containers, the system default
> certificates are only used when no custom root certificates are configured.
@z

@x
The presence of one or more `<filename>.key/cert` pairs indicates to Docker
that there are custom certificates required for access to the desired
repository.
@y
The presence of one or more `<filename>.key/cert` pairs indicates to Docker
that there are custom certificates required for access to the desired
repository.
@z

@x
> [!NOTE]
>
> If multiple certificates exist, each is tried in alphabetical
> order. If there is a 4xx-level or 5xx-level authentication error, Docker
> continues to try with the next certificate.
@y
> [!NOTE]
>
> If multiple certificates exist, each is tried in alphabetical
> order. If there is a 4xx-level or 5xx-level authentication error, Docker
> continues to try with the next certificate.
@z

@x
The following illustrates a configuration with custom certificates:
@y
The following illustrates a configuration with custom certificates:
@z

@x
```text
    /etc/docker/certs.d/        <-- Certificate directory
    └── localhost:5000          <-- Hostname:port
       ├── client.cert          <-- Client certificate
       ├── client.key           <-- Client key
       └── ca.crt               <-- Root CA that signed
                                    the registry certificate, in PEM
```
@y
```text
    /etc/docker/certs.d/        <-- Certificate directory
    └── localhost:5000          <-- Hostname:port
       ├── client.cert          <-- Client certificate
       ├── client.key           <-- Client key
       └── ca.crt               <-- Root CA that signed
                                    the registry certificate, in PEM
```
@z

@x
The preceding example is operating-system specific and is for illustrative
purposes only. You should consult your operating system documentation for
creating an os-provided bundled certificate chain.
@y
The preceding example is operating-system specific and is for illustrative
purposes only. You should consult your operating system documentation for
creating an os-provided bundled certificate chain.
@z

@x
## Create the client certificates
@y
## Create the client certificates
@z

@x
Use OpenSSL's `genrsa` and `req` commands to first generate an RSA
key and then use the key to create the certificate.   
@y
Use OpenSSL's `genrsa` and `req` commands to first generate an RSA
key and then use the key to create the certificate.   
@z

@x
```console
$ openssl genrsa -out client.key 4096
$ openssl req -new -x509 -text -key client.key -out client.cert
```
@y
```console
$ openssl genrsa -out client.key 4096
$ openssl req -new -x509 -text -key client.key -out client.cert
```
@z

@x
> [!NOTE]
>
> These TLS commands only generate a working set of certificates on Linux.
> The version of OpenSSL in macOS is incompatible with the type of
> certificate Docker requires.
@y
> [!NOTE]
>
> These TLS commands only generate a working set of certificates on Linux.
> The version of OpenSSL in macOS is incompatible with the type of
> certificate Docker requires.
@z

@x
## Troubleshooting tips
@y
## Troubleshooting tips
@z

@x
The Docker daemon interprets `.crt` files as CA certificates and `.cert` files
as client certificates. If a CA certificate is accidentally given the extension
`.cert` instead of the correct `.crt` extension, the Docker daemon logs the
following error message:
@y
The Docker daemon interprets `.crt` files as CA certificates and `.cert` files
as client certificates. If a CA certificate is accidentally given the extension
`.cert` instead of the correct `.crt` extension, the Docker daemon logs the
following error message:
@z

@x
```text
Missing key KEY_NAME for client certificate CERT_NAME. CA certificates should use the extension .crt.
```
@y
```text
Missing key KEY_NAME for client certificate CERT_NAME. CA certificates should use the extension .crt.
```
@z

@x
If the Docker registry is accessed without a port number, do not add the port to the directory name.  The following shows the configuration for a registry on default port 443 which is accessed with `docker login my-https.registry.example.com`:
@y
If the Docker registry is accessed without a port number, do not add the port to the directory name.  The following shows the configuration for a registry on default port 443 which is accessed with `docker login my-https.registry.example.com`:
@z

@x
```text
    /etc/docker/certs.d/
    └── my-https.registry.example.com          <-- Hostname without port
       ├── client.cert
       ├── client.key
       └── ca.crt
```
@y
```text
    /etc/docker/certs.d/
    └── my-https.registry.example.com          <-- Hostname without port
       ├── client.cert
       ├── client.key
       └── ca.crt
```
@z

@x
## Related information
@y
## Related information
@z

@x
* [Use trusted images](trust/_index.md)
* [Protect the Docker daemon socket](protect-access.md)
@y
* [Use trusted images](trust/_index.md)
* [Protect the Docker daemon socket](protect-access.md)
@z
