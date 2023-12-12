%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Automating content push pulls with trust
keywords: trust, security, docker, documentation, automation
title: Automation with content trust
---
@y
---
description: Automating content push pulls with trust
keywords: trust, security, docker, documentation, automation
title: Automation with content trust
---
@z

@x
It is very common for Docker Content Trust to be built into existing automation
systems. To allow tools to wrap Docker and push trusted content, there are 
environment variables that can be passed through to the client. 
@y
It is very common for Docker Content Trust to be built into existing automation
systems. To allow tools to wrap Docker and push trusted content, there are 
environment variables that can be passed through to the client. 
@z

@x
This guide follows the steps as described 
[here](index.md#signing-images-with-docker-content-trust) so please read 
that and understand its prerequisites. 
@y
This guide follows the steps as described 
[here](index.md#signing-images-with-docker-content-trust) so please read 
that and understand its prerequisites. 
@z

@x
When working directly with the Notary client, it uses its [own set of environment variables](https://github.com/theupdateframework/notary/blob/master/docs/reference/client-config.md#environment-variables-optional).
@y
When working directly with the Notary client, it uses its [own set of environment variables](https://github.com/theupdateframework/notary/blob/master/docs/reference/client-config.md#environment-variables-optional).
@z

@x
## Add a delegation private key
@y
## Add a delegation private key
@z

@x
To automate importing a delegation private key to the local Docker trust store, we 
need to pass a passphrase for the new key. This passphrase will be required 
everytime that delegation signs a tag. 
@y
To automate importing a delegation private key to the local Docker trust store, we 
need to pass a passphrase for the new key. This passphrase will be required 
everytime that delegation signs a tag. 
@z

@x
```console
$ export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE="mypassphrase123"
@y
```console
$ export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE="mypassphrase123"
@z

@x
$ docker trust key load delegation.key --name jeff
Loading key from "delegation.key"...
Successfully imported key from delegation.key
```
@y
$ docker trust key load delegation.key --name jeff
Loading key from "delegation.key"...
Successfully imported key from delegation.key
```
@z

@x
## Add a delegation public key
@y
## Add a delegation public key
@z

@x
If you initialising a repository at the same time as adding a Delegation
public key, then you will need to use the local Notary Canonical Root Key's 
passphrase to create the repositories trust data. If the repository has already 
been initiated then you only need the repositories passphrase. 
@y
If you initialising a repository at the same time as adding a Delegation
public key, then you will need to use the local Notary Canonical Root Key's 
passphrase to create the repositories trust data. If the repository has already 
been initiated then you only need the repositories passphrase. 
@z

@x
```console
# Export the Local Root Key Passphrase if required.
$ export DOCKER_CONTENT_TRUST_ROOT_PASSPHRASE="rootpassphrase123"
@y
```console
# Export the Local Root Key Passphrase if required.
$ export DOCKER_CONTENT_TRUST_ROOT_PASSPHRASE="rootpassphrase123"
@z

@x
# Export the Repository Passphrase
$ export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE="repopassphrase123"
@y
# Export the Repository Passphrase
$ export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE="repopassphrase123"
@z

@x
# Initialise Repo and Push Delegation
$ docker trust signer add --key delegation.crt jeff registry.example.com/admin/demo
Adding signer "jeff" to registry.example.com/admin/demo...
Initializing signed repository for registry.example.com/admin/demo...
Successfully initialized "registry.example.com/admin/demo"
Successfully added signer: registry.example.com/admin/demo
```
@y
# Initialise Repo and Push Delegation
$ docker trust signer add --key delegation.crt jeff registry.example.com/admin/demo
Adding signer "jeff" to registry.example.com/admin/demo...
Initializing signed repository for registry.example.com/admin/demo...
Successfully initialized "registry.example.com/admin/demo"
Successfully added signer: registry.example.com/admin/demo
```
@z

@x
## Sign an image
@y
## Sign an image
@z

@x
Finally when signing an image, we will need to export the passphrase of the 
signing key. This was created when the key was loaded into the local Docker 
trust store with `$ docker trust key load`.
@y
Finally when signing an image, we will need to export the passphrase of the 
signing key. This was created when the key was loaded into the local Docker 
trust store with `$ docker trust key load`.
@z

@x
```console
$ export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE="mypassphrase123"
@y
```console
$ export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE="mypassphrase123"
@z

@x
$ docker trust sign registry.example.com/admin/demo:1
Signing and pushing trust data for local image registry.example.com/admin/demo:1, may overwrite remote trust data
The push refers to repository [registry.example.com/admin/demo]
428c97da766c: Layer already exists
2: digest: sha256:1a6fd470b9ce10849be79e99529a88371dff60c60aab424c077007f6979b4812 size: 524
Signing and pushing trust metadata
Successfully signed registry.example.com/admin/demo:1
```
@y
$ docker trust sign registry.example.com/admin/demo:1
Signing and pushing trust data for local image registry.example.com/admin/demo:1, may overwrite remote trust data
The push refers to repository [registry.example.com/admin/demo]
428c97da766c: Layer already exists
2: digest: sha256:1a6fd470b9ce10849be79e99529a88371dff60c60aab424c077007f6979b4812 size: 524
Signing and pushing trust metadata
Successfully signed registry.example.com/admin/demo:1
```
@z

@x
## Build with content trust
@y
## Build with content trust
@z

@x
You can also build with content trust. Before running the `docker build` command, 
you should set the environment variable `DOCKER_CONTENT_TRUST` either manually or 
in a scripted fashion. Consider the simple Dockerfile below.
@y
You can also build with content trust. Before running the `docker build` command, 
you should set the environment variable `DOCKER_CONTENT_TRUST` either manually or 
in a scripted fashion. Consider the simple Dockerfile below.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM docker/trusttest:latest
RUN echo
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM docker/trusttest:latest
RUN echo
```
@z

@x
The `FROM` tag is pulling a signed image. You cannot build an image that has a
`FROM` that is not either present locally or signed. Given that content trust
data exists for the tag `latest`, the following build should succeed:
@y
The `FROM` tag is pulling a signed image. You cannot build an image that has a
`FROM` that is not either present locally or signed. Given that content trust
data exists for the tag `latest`, the following build should succeed:
@z

@x
```console
$  docker build -t docker/trusttest:testing .
Using default tag: latest
latest: Pulling from docker/trusttest
@y
```console
$  docker build -t docker/trusttest:testing .
Using default tag: latest
latest: Pulling from docker/trusttest
@z

@x
b3dbab3810fc: Pull complete
a9539b34a6ab: Pull complete
Digest: sha256:d149ab53f871
```
@y
b3dbab3810fc: Pull complete
a9539b34a6ab: Pull complete
Digest: sha256:d149ab53f871
```
@z

@x
If content trust is enabled, building from a Dockerfile that relies on tag 
without trust data, causes the build command to fail:
@y
If content trust is enabled, building from a Dockerfile that relies on tag 
without trust data, causes the build command to fail:
@z

@x
```console
$  docker build -t docker/trusttest:testing .
unable to process Dockerfile: No trust data for notrust
```
@y
```console
$  docker build -t docker/trusttest:testing .
unable to process Dockerfile: No trust data for notrust
```
@z

@x
## Related information
@y
## Related information
@z

@x
* [Delegations for content trust](trust_delegation.md)
* [Content trust in Docker](index.md)
* [Manage keys for content trust](trust_key_mng.md)
* [Play in a content trust sandbox](trust_sandbox.md)
@y
* [Delegations for content trust](trust_delegation.md)
* [Content trust in Docker](index.md)
* [Manage keys for content trust](trust_key_mng.md)
* [Play in a content trust sandbox](trust_sandbox.md)
@z
