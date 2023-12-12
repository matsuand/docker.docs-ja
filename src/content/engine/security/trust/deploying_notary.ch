%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Deploying Notary
keywords: trust, security, notary, deployment
title: Deploy Notary Server with Compose
---
@y
---
description: Deploying Notary
keywords: trust, security, notary, deployment
title: Deploy Notary Server with Compose
---
@z

@x
The easiest way to deploy Notary Server is by using Docker Compose. To follow the procedure on this page, you must have already [installed Docker Compose](../../../compose/install/index.md).
@y
The easiest way to deploy Notary Server is by using Docker Compose. To follow the procedure on this page, you must have already [installed Docker Compose](../../../compose/install/index.md).
@z

@x
1. Clone the Notary repository.
@y
1. Clone the Notary repository.
@z

@x
       git clone https://github.com/theupdateframework/notary.git
@y
       git clone https://github.com/theupdateframework/notary.git
@z

@x
2. Build and start Notary Server with the sample certificates.
@y
2. Build and start Notary Server with the sample certificates.
@z

@x
       docker compose up -d
@y
       docker compose up -d
@z

@x
  For more detailed documentation about how to deploy Notary Server, see the [instructions to run a Notary service](https://github.com/theupdateframework/notary/blob/master/docs/running_a_service.md) as well as [the Notary repository](https://github.com/theupdateframework/notary) for more information.
3. Make sure that your Docker or Notary client trusts Notary Server's certificate before you try to interact with the Notary server.
@y
  For more detailed documentation about how to deploy Notary Server, see the [instructions to run a Notary service](https://github.com/theupdateframework/notary/blob/master/docs/running_a_service.md) as well as [the Notary repository](https://github.com/theupdateframework/notary) for more information.
3. Make sure that your Docker or Notary client trusts Notary Server's certificate before you try to interact with the Notary server.
@z

@x
See the instructions for [Docker](../../reference/commandline/cli.md#notary) or
for [Notary](https://github.com/docker/notary#using-notary) depending on which one you are using.
@y
See the instructions for [Docker](../../reference/commandline/cli.md#notary) or
for [Notary](https://github.com/docker/notary#using-notary) depending on which one you are using.
@z

@x
## If you want to use Notary in production
@y
## If you want to use Notary in production
@z

@x
Check back here for instructions after Notary Server has an official
stable release. To get a head start on deploying Notary in production, see
[the Notary repository](https://github.com/theupdateframework/notary).
@y
Check back here for instructions after Notary Server has an official
stable release. To get a head start on deploying Notary in production, see
[the Notary repository](https://github.com/theupdateframework/notary).
@z
