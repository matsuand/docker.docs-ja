%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
---
description: Enabling content trust in Docker
keywords: content, trust, security, docker, documentation
title: Content trust in Docker
aliases:
- /engine/security/trust/content_trust/
- /notary/getting_started/
- /notary/advanced_usage/
- /notary/service_architecture/
- /notary/running_a_service/
- /notary/changelog/
- /notary/reference/server-config/
- /notary/reference/signer-config/
- /notary/reference/client-config/
- /notary/reference/common-configs/
---
@y
---
description: Enabling content trust in Docker
keywords: content, trust, security, docker, documentation
title: Content trust in Docker
aliases:
- /engine/security/trust/content_trust/
- /notary/getting_started/
- /notary/advanced_usage/
- /notary/service_architecture/
- /notary/running_a_service/
- /notary/changelog/
- /notary/reference/server-config/
- /notary/reference/signer-config/
- /notary/reference/client-config/
- /notary/reference/common-configs/
---
@z

@x
When transferring data among networked systems, trust is a central concern. In
particular, when communicating over an untrusted medium such as the internet, it
is critical to ensure the integrity and the publisher of all the data a system
operates on. You use Docker Engine to push and pull images (data) to a
public or private registry. Content trust gives you the ability to verify both
the integrity and the publisher of all the data received from a registry over
any channel.
@y
When transferring data among networked systems, trust is a central concern. In
particular, when communicating over an untrusted medium such as the internet, it
is critical to ensure the integrity and the publisher of all the data a system
operates on. You use Docker Engine to push and pull images (data) to a
public or private registry. Content trust gives you the ability to verify both
the integrity and the publisher of all the data received from a registry over
any channel.
@z

@x
## About Docker Content Trust (DCT)
@y
## About Docker Content Trust (DCT)
@z

@x
Docker Content Trust (DCT) provides the ability to use digital signatures for
data sent to and received from remote Docker registries. These signatures allow
client-side or runtime verification of the integrity and publisher of specific
image tags.
@y
Docker Content Trust (DCT) provides the ability to use digital signatures for
data sent to and received from remote Docker registries. These signatures allow
client-side or runtime verification of the integrity and publisher of specific
image tags.
@z

@x
Through DCT, image publishers can sign their images and image consumers can
ensure that the images they pull are signed. Publishers could be individuals
or organizations manually signing their content or automated software supply
chains signing content as part of their release process.
@y
Through DCT, image publishers can sign their images and image consumers can
ensure that the images they pull are signed. Publishers could be individuals
or organizations manually signing their content or automated software supply
chains signing content as part of their release process.
@z

@x
### Image tags and DCT
@y
### Image tags and DCT
@z

@x
An individual image record has the following identifier:
@y
An individual image record has the following identifier:
@z

@x
```text
[REGISTRY_HOST[:REGISTRY_PORT]/]REPOSITORY[:TAG]
```
@y
```text
[REGISTRY_HOST[:REGISTRY_PORT]/]REPOSITORY[:TAG]
```
@z

@x
A particular image `REPOSITORY` can have multiple tags. For example, `latest` and
 `3.1.2` are both tags on the `mongo` image. An image publisher can build an image
 and tag combination many times changing the image with each build.
@y
A particular image `REPOSITORY` can have multiple tags. For example, `latest` and
 `3.1.2` are both tags on the `mongo` image. An image publisher can build an image
 and tag combination many times changing the image with each build.
@z

@x
DCT is associated with the `TAG` portion of an image. Each image repository has
a set of keys that image publishers use to sign an image tag. Image publishers
have discretion on which tags they sign.
@y
DCT is associated with the `TAG` portion of an image. Each image repository has
a set of keys that image publishers use to sign an image tag. Image publishers
have discretion on which tags they sign.
@z

@x
An image repository can contain an image with one tag that is signed and another
tag that is not. For example, consider [the Mongo image
repository](https://hub.docker.com/r/library/mongo/tags/). The `latest`
tag could be unsigned while the `3.1.6` tag could be signed. It is the
responsibility of the image publisher to decide if an image tag is signed or
not. In this representation, some image tags are signed, others are not:
@y
An image repository can contain an image with one tag that is signed and another
tag that is not. For example, consider [the Mongo image
repository](https://hub.docker.com/r/library/mongo/tags/). The `latest`
tag could be unsigned while the `3.1.6` tag could be signed. It is the
responsibility of the image publisher to decide if an image tag is signed or
not. In this representation, some image tags are signed, others are not:
@z

@x
![Signed tags](images/tag_signing.png)
@y
![Signed tags](images/tag_signing.png)
@z

@x
Publishers can choose to sign a specific tag or not. As a result, the content of
an unsigned tag and that of a signed tag with the same name may not match. For
example, a publisher can push a tagged image `someimage:latest` and sign it.
Later, the same publisher can push an unsigned `someimage:latest` image. This second
push replaces the last unsigned tag `latest` but does not affect the signed `latest` version.
The ability to choose which tags they can sign, allows publishers to iterate over
the unsigned version of an image before officially signing it.
@y
Publishers can choose to sign a specific tag or not. As a result, the content of
an unsigned tag and that of a signed tag with the same name may not match. For
example, a publisher can push a tagged image `someimage:latest` and sign it.
Later, the same publisher can push an unsigned `someimage:latest` image. This second
push replaces the last unsigned tag `latest` but does not affect the signed `latest` version.
The ability to choose which tags they can sign, allows publishers to iterate over
the unsigned version of an image before officially signing it.
@z

@x
Image consumers can enable DCT to ensure that images they use were signed. If a
consumer enables DCT, they can only pull, run, or build with trusted images.
Enabling DCT is a bit like applying a "filter" to your registry. Consumers "see"
only signed image tags and the less desirable, unsigned image tags are
"invisible" to them.
@y
Image consumers can enable DCT to ensure that images they use were signed. If a
consumer enables DCT, they can only pull, run, or build with trusted images.
Enabling DCT is a bit like applying a "filter" to your registry. Consumers "see"
only signed image tags and the less desirable, unsigned image tags are
"invisible" to them.
@z

@x
![Trust view](images/trust_view.png)
@y
![Trust view](images/trust_view.png)
@z

@x
To the consumer who has not enabled DCT, nothing about how they work with Docker
images changes. Every image is visible regardless of whether it is signed or
not.
@y
To the consumer who has not enabled DCT, nothing about how they work with Docker
images changes. Every image is visible regardless of whether it is signed or
not.
@z

@x
### Docker Content Trust Keys
@y
### Docker Content Trust Keys
@z

@x
Trust for an image tag is managed through the use of signing keys. A key set is
created when an operation using DCT is first invoked. A key set consists
of the following classes of keys:
@y
Trust for an image tag is managed through the use of signing keys. A key set is
created when an operation using DCT is first invoked. A key set consists
of the following classes of keys:
@z

@x
- An offline key that is the root of DCT for an image tag
- Repository or tagging keys that sign tags
- Server-managed keys such as the timestamp key, which provides freshness
	security guarantees for your repository
@y
- An offline key that is the root of DCT for an image tag
- Repository or tagging keys that sign tags
- Server-managed keys such as the timestamp key, which provides freshness
	security guarantees for your repository
@z

@x
The following image depicts the various signing keys and their relationships:
@y
The following image depicts the various signing keys and their relationships:
@z

@x
![Content Trust components](images/trust_components.png)
@y
![Content Trust components](images/trust_components.png)
@z

@x
> **Warning**
>
>The root key once lost is not recoverable. If you lose any other key, send an email to [Docker Hub Support](mailto:hub-support@docker.com). This loss also requires manual intervention from every
consumer that used a signed tag from this repository prior to the loss.
{ .warning }
@y
> **Warning**
>
>The root key once lost is not recoverable. If you lose any other key, send an email to [Docker Hub Support](mailto:hub-support@docker.com). This loss also requires manual intervention from every
consumer that used a signed tag from this repository prior to the loss.
{ .warning }
@z

@x
You should back up the root key somewhere safe. Given that it is only required
to create new repositories, it is a good idea to store it offline in hardware.
For details on securing, and backing up your keys, make sure you
read how to [manage keys for DCT](trust_key_mng.md).
@y
You should back up the root key somewhere safe. Given that it is only required
to create new repositories, it is a good idea to store it offline in hardware.
For details on securing, and backing up your keys, make sure you
read how to [manage keys for DCT](trust_key_mng.md).
@z

@x
## Signing images with Docker Content Trust
@y
## Signing images with Docker Content Trust
@z

@x
Within the Docker CLI we can sign and push a container image with the
`$ docker trust` command syntax. This is built on top of the Notary feature
set. For more information, see the [Notary GitHub repository](https://github.com/theupdateframework/notary).
@y
Within the Docker CLI we can sign and push a container image with the
`$ docker trust` command syntax. This is built on top of the Notary feature
set. For more information, see the [Notary GitHub repository](https://github.com/theupdateframework/notary).
@z

@x
A prerequisite for signing an image is a Docker Registry with a Notary server
attached (Such as the Docker Hub ). Instructions for
standing up a self-hosted environment can be found [here](/engine/security/trust/deploying_notary/).
@y
A prerequisite for signing an image is a Docker Registry with a Notary server
attached (Such as the Docker Hub ). Instructions for
standing up a self-hosted environment can be found [here](__SUBDIR__/engine/security/trust/deploying_notary/).
@z

@x
To sign a Docker Image you will need a delegation key pair. These keys
can be generated locally using `$ docker trust key generate` or generated
by a certificate authority.
@y
To sign a Docker Image you will need a delegation key pair. These keys
can be generated locally using `$ docker trust key generate` or generated
by a certificate authority.
@z

@x
First we will add the delegation private key to the local Docker trust
repository. (By default this is stored in `~/.docker/trust/`). If you are
generating delegation keys with `$ docker trust key generate`, the private key
is automatically added to the local trust store. If you are importing a separate
key, you will need to use the
`$ docker trust key load` command.
@y
First we will add the delegation private key to the local Docker trust
repository. (By default this is stored in `~/.docker/trust/`). If you are
generating delegation keys with `$ docker trust key generate`, the private key
is automatically added to the local trust store. If you are importing a separate
key, you will need to use the
`$ docker trust key load` command.
@z

@x
```console
$ docker trust key generate jeff
Generating key for jeff...
Enter passphrase for new jeff key with ID 9deed25:
Repeat passphrase for new jeff key with ID 9deed25:
Successfully generated and loaded private key. Corresponding public key available: /home/ubuntu/Documents/mytrustdir/jeff.pub
```
@y
```console
$ docker trust key generate jeff
Generating key for jeff...
Enter passphrase for new jeff key with ID 9deed25:
Repeat passphrase for new jeff key with ID 9deed25:
Successfully generated and loaded private key. Corresponding public key available: /home/ubuntu/Documents/mytrustdir/jeff.pub
```
@z

@x
Or if you have an existing key:
@y
Or if you have an existing key:
@z

@x
```console
$ docker trust key load key.pem --name jeff
Loading key from "key.pem"...
Enter passphrase for new jeff key with ID 8ae710e:
Repeat passphrase for new jeff key with ID 8ae710e:
Successfully imported key from key.pem
```
@y
```console
$ docker trust key load key.pem --name jeff
Loading key from "key.pem"...
Enter passphrase for new jeff key with ID 8ae710e:
Repeat passphrase for new jeff key with ID 8ae710e:
Successfully imported key from key.pem
```
@z

@x
Next we will need to add the delegation public key to the Notary server;
this is specific to a particular image repository in Notary known as a Global
Unique Name (GUN). If this is the first time you are adding a delegation to that
repository, this command will also initiate the repository, using a local Notary
canonical root key. To understand more about initiating a repository, and the
role of delegations, head to
[delegations for content trust](trust_delegation.md).
@y
Next we will need to add the delegation public key to the Notary server;
this is specific to a particular image repository in Notary known as a Global
Unique Name (GUN). If this is the first time you are adding a delegation to that
repository, this command will also initiate the repository, using a local Notary
canonical root key. To understand more about initiating a repository, and the
role of delegations, head to
[delegations for content trust](trust_delegation.md).
@z

@x
```console
$ docker trust signer add --key cert.pem jeff registry.example.com/admin/demo
Adding signer "jeff" to registry.example.com/admin/demo...
Enter passphrase for new repository key with ID 10b5e94:
```
@y
```console
$ docker trust signer add --key cert.pem jeff registry.example.com/admin/demo
Adding signer "jeff" to registry.example.com/admin/demo...
Enter passphrase for new repository key with ID 10b5e94:
```
@z

@x
Finally, we will use the delegation private key to sign a particular tag and
push it up to the registry.
@y
Finally, we will use the delegation private key to sign a particular tag and
push it up to the registry.
@z

@x
```console
$ docker trust sign registry.example.com/admin/demo:1
Signing and pushing trust data for local image registry.example.com/admin/demo:1, may overwrite remote trust data
The push refers to repository [registry.example.com/admin/demo]
7bff100f35cb: Pushed
1: digest: sha256:3d2e482b82608d153a374df3357c0291589a61cc194ec4a9ca2381073a17f58e size: 528
Signing and pushing trust metadata
Enter passphrase for signer key with ID 8ae710e:
Successfully signed registry.example.com/admin/demo:1
```
@y
```console
$ docker trust sign registry.example.com/admin/demo:1
Signing and pushing trust data for local image registry.example.com/admin/demo:1, may overwrite remote trust data
The push refers to repository [registry.example.com/admin/demo]
7bff100f35cb: Pushed
1: digest: sha256:3d2e482b82608d153a374df3357c0291589a61cc194ec4a9ca2381073a17f58e size: 528
Signing and pushing trust metadata
Enter passphrase for signer key with ID 8ae710e:
Successfully signed registry.example.com/admin/demo:1
```
@z

@x
Alternatively, once the keys have been imported an image can be pushed with the
`$ docker push` command, by exporting the DCT environmental variable.
@y
Alternatively, once the keys have been imported an image can be pushed with the
`$ docker push` command, by exporting the DCT environmental variable.
@z

@x
```console
$ export DOCKER_CONTENT_TRUST=1
@y
```console
$ export DOCKER_CONTENT_TRUST=1
@z

@x
$ docker push registry.example.com/admin/demo:1
The push refers to repository [registry.example.com/admin/demo:1]
7bff100f35cb: Pushed
1: digest: sha256:3d2e482b82608d153a374df3357c0291589a61cc194ec4a9ca2381073a17f58e size: 528
Signing and pushing trust metadata
Enter passphrase for signer key with ID 8ae710e:
Successfully signed registry.example.com/admin/demo:1
```
@y
$ docker push registry.example.com/admin/demo:1
The push refers to repository [registry.example.com/admin/demo:1]
7bff100f35cb: Pushed
1: digest: sha256:3d2e482b82608d153a374df3357c0291589a61cc194ec4a9ca2381073a17f58e size: 528
Signing and pushing trust metadata
Enter passphrase for signer key with ID 8ae710e:
Successfully signed registry.example.com/admin/demo:1
```
@z

@x
Remote trust data for a tag or a repository can be viewed by the
`$ docker trust inspect` command:
@y
Remote trust data for a tag or a repository can be viewed by the
`$ docker trust inspect` command:
@z

@x
```console
$ docker trust inspect --pretty registry.example.com/admin/demo:1
@y
```console
$ docker trust inspect --pretty registry.example.com/admin/demo:1
@z

@x
Signatures for registry.example.com/admin/demo:1
@y
Signatures for registry.example.com/admin/demo:1
@z

@x
SIGNED TAG          DIGEST                                                             SIGNERS
1                   3d2e482b82608d153a374df3357c0291589a61cc194ec4a9ca2381073a17f58e   jeff
@y
SIGNED TAG          DIGEST                                                             SIGNERS
1                   3d2e482b82608d153a374df3357c0291589a61cc194ec4a9ca2381073a17f58e   jeff
@z

@x
List of signers and their keys for registry.example.com/admin/demo:1
@y
List of signers and their keys for registry.example.com/admin/demo:1
@z

@x
SIGNER              KEYS
jeff                8ae710e3ba82
@y
SIGNER              KEYS
jeff                8ae710e3ba82
@z

@x
Administrative keys for registry.example.com/admin/demo:1
@y
Administrative keys for registry.example.com/admin/demo:1
@z

@x
  Repository Key:	10b5e94c916a0977471cc08fa56c1a5679819b2005ba6a257aa78ce76d3a1e27
  Root Key:	84ca6e4416416d78c4597e754f38517bea95ab427e5f95871f90d460573071fc
```
@y
  Repository Key:	10b5e94c916a0977471cc08fa56c1a5679819b2005ba6a257aa78ce76d3a1e27
  Root Key:	84ca6e4416416d78c4597e754f38517bea95ab427e5f95871f90d460573071fc
```
@z

@x
Remote Trust data for a tag can be removed by the `$ docker trust revoke` command:
@y
Remote Trust data for a tag can be removed by the `$ docker trust revoke` command:
@z

@x
```console
$ docker trust revoke registry.example.com/admin/demo:1
Enter passphrase for signer key with ID 8ae710e:
Successfully deleted signature for registry.example.com/admin/demo:1
```
@y
```console
$ docker trust revoke registry.example.com/admin/demo:1
Enter passphrase for signer key with ID 8ae710e:
Successfully deleted signature for registry.example.com/admin/demo:1
```
@z

@x
## Client enforcement with Docker Content Trust
@y
## Client enforcement with Docker Content Trust
@z

@x
Content trust is disabled by default in the Docker Client. To enable
it, set the `DOCKER_CONTENT_TRUST` environment variable to `1`. This prevents
users from working with tagged images unless they contain a signature.
@y
Content trust is disabled by default in the Docker Client. To enable
it, set the `DOCKER_CONTENT_TRUST` environment variable to `1`. This prevents
users from working with tagged images unless they contain a signature.
@z

@x
When DCT is enabled in the Docker client, `docker` CLI commands that operate on
tagged images must either have content signatures or explicit content hashes.
The commands that operate with DCT are:
@y
When DCT is enabled in the Docker client, `docker` CLI commands that operate on
tagged images must either have content signatures or explicit content hashes.
The commands that operate with DCT are:
@z

@x
* `push`
* `build`
* `create`
* `pull`
* `run`
@y
* `push`
* `build`
* `create`
* `pull`
* `run`
@z

@x
For example, with DCT enabled a `docker pull someimage:latest` only
succeeds if `someimage:latest` is signed. However, an operation with an explicit
content hash always succeeds as long as the hash exists:
@y
For example, with DCT enabled a `docker pull someimage:latest` only
succeeds if `someimage:latest` is signed. However, an operation with an explicit
content hash always succeeds as long as the hash exists:
@z

@x
```console
$ docker pull registry.example.com/user/image:1
Error: remote trust data does not exist for registry.example.com/user/image: registry.example.com does not have trust data for registry.example.com/user/image
@y
```console
$ docker pull registry.example.com/user/image:1
Error: remote trust data does not exist for registry.example.com/user/image: registry.example.com does not have trust data for registry.example.com/user/image
@z

@x
$ docker pull registry.example.com/user/image@sha256:d149ab53f8718e987c3a3024bb8aa0e2caadf6c0328f1d9d850b2a2a67f2819a
sha256:ee7491c9c31db1ffb7673d91e9fac5d6354a89d0e97408567e09df069a1687c1: Pulling from user/image
ff3a5c916c92: Pull complete
a59a168caba3: Pull complete
Digest: sha256:ee7491c9c31db1ffb7673d91e9fac5d6354a89d0e97408567e09df069a1687c1
Status: Downloaded newer image for registry.example.com/user/image@sha256:ee7491c9c31db1ffb7673d91e9fac5d6354a89d0e97408567e09df069a1687c1
```
@y
$ docker pull registry.example.com/user/image@sha256:d149ab53f8718e987c3a3024bb8aa0e2caadf6c0328f1d9d850b2a2a67f2819a
sha256:ee7491c9c31db1ffb7673d91e9fac5d6354a89d0e97408567e09df069a1687c1: Pulling from user/image
ff3a5c916c92: Pull complete
a59a168caba3: Pull complete
Digest: sha256:ee7491c9c31db1ffb7673d91e9fac5d6354a89d0e97408567e09df069a1687c1
Status: Downloaded newer image for registry.example.com/user/image@sha256:ee7491c9c31db1ffb7673d91e9fac5d6354a89d0e97408567e09df069a1687c1
```
@z

@x
## Related information
@y
## Related information
@z

@x
* [Delegations for content trust](trust_delegation.md)
* [Automation with content trust](trust_automation.md)
* [Manage keys for content trust](trust_key_mng.md)
* [Play in a content trust sandbox](trust_sandbox.md)
@y
* [Delegations for content trust](trust_delegation.md)
* [Automation with content trust](trust_automation.md)
* [Manage keys for content trust](trust_key_mng.md)
* [Play in a content trust sandbox](trust_sandbox.md)
@z
