%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Explore the Learning center and understand the benefits of signing in
  to Docker Desktop
keywords: Docker Dashboard, manage, containers, gui, dashboard, images, user manual,
  learning center, guide, sign in
title: Sign in to Docker Desktop
linkTitle: Sign in
@y
description: Explore the Learning center and understand the benefits of signing in
  to Docker Desktop
keywords: Docker Dashboard, manage, containers, gui, dashboard, images, user manual,
  learning center, guide, sign in
title: Sign in to Docker Desktop
linkTitle: Sign in
@z

@x
Docker recommends signing in with the **Sign in** option in the top-right corner of the Docker Dashboard. 
@y
Docker recommends signing in with the **Sign in** option in the top-right corner of the Docker Dashboard. 
@z

@x
In large enterprises where admin access is restricted, administrators can [enforce sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md). 
@y
In large enterprises where admin access is restricted, administrators can [enforce sign-in](manuals/enterprise/security/enforce-sign-in/_index.md). 
@z

@x
> [!TIP]
>
> Explore [Docker's core subscriptions](https://www.docker.com/pricing/) to see what else Docker can offer you. 
@y
> [!TIP]
>
> Explore [Docker's core subscriptions](https://www.docker.com/pricing/) to see what else Docker can offer you. 
@z

@x
## Benefits of signing in
@y
## Benefits of signing in
@z

@x
- Access your Docker Hub repositories directly from Docker Desktop.
@y
- Access your Docker Hub repositories directly from Docker Desktop.
@z

@x
- Increase your pull rate limit compared to anonymous users. See [Usage and limits](/manuals/docker-hub/usage/_index.md).
@y
- Increase your pull rate limit compared to anonymous users. See [Usage and limits](manuals/docker-hub/usage/_index.md).
@z

@x
- Enhance your organization’s security posture for containerized development with [Hardened Desktop](/manuals/enterprise/security/hardened-desktop/_index.md).
@y
- Enhance your organization’s security posture for containerized development with [Hardened Desktop](manuals/enterprise/security/hardened-desktop/_index.md).
@z

@x
> [!NOTE]
>
> Docker Desktop automatically signs you out after 90 days, or after 30 days of inactivity. 
@y
> [!NOTE]
>
> Docker Desktop automatically signs you out after 90 days, or after 30 days of inactivity. 
@z

@x
## Signing in with Docker Desktop for Linux
@y
## Signing in with Docker Desktop for Linux
@z

@x
Docker Desktop for Linux relies on [`pass`](https://www.passwordstore.org/) to store credentials in GPG-encrypted files.
Before signing in to Docker Desktop with your [Docker ID](/accounts/create-account/), you must initialize `pass`.
Docker Desktop displays a warning if `pass` is not configured.
@y
Docker Desktop for Linux relies on [`pass`](https://www.passwordstore.org/) to store credentials in GPG-encrypted files.
Before signing in to Docker Desktop with your [Docker ID](__SUBDIR__/accounts/create-account/), you must initialize `pass`.
Docker Desktop displays a warning if `pass` is not configured.
@z

@x
1. Generate a GPG key. You can initialize pass by using a gpg key. To generate a gpg key, run:
@y
1. Generate a GPG key. You can initialize pass by using a gpg key. To generate a gpg key, run:
@z

@x
   ``` console
   $ gpg --generate-key
   ``` 
2. Enter your name and email once prompted. 
@y
   ``` console
   $ gpg --generate-key
   ``` 
2. Enter your name and email once prompted. 
@z

@x
   Once confirmed, GPG creates a key pair. Look for the `pub` line that contains your GPG ID, for example:
@y
   Once confirmed, GPG creates a key pair. Look for the `pub` line that contains your GPG ID, for example:
@z

@x
   ```text
   ...
   pubrsa3072 2022-03-31 [SC] [expires: 2024-03-30]
    3ABCD1234EF56G78
   uid          Molly <molly@example.com>
   ```
3. Copy the GPG ID and use it to initialize `pass`
@y
   ```text
   ...
   pubrsa3072 2022-03-31 [SC] [expires: 2024-03-30]
    3ABCD1234EF56G78
   uid          Molly <molly@example.com>
   ```
3. Copy the GPG ID and use it to initialize `pass`
@z

@x
   ```console
   $ pass init <your_generated_gpg-id_public_key>
   ``` 
@y
   ```console
   $ pass init <your_generated_gpg-id_public_key>
   ``` 
@z

@x
   You should see output similar to: 
@y
   You should see output similar to: 
@z

@x
   ```text
   mkdir: created directory '/home/molly/.password-store/'
   Password store initialized for <generated_gpg-id_public_key>
   ```
@y
   ```text
   mkdir: created directory '/home/molly/.password-store/'
   Password store initialized for <generated_gpg-id_public_key>
   ```
@z

@x
Once you initialize `pass`, you can sign in and pull your private images.
When Docker CLI or Docker Desktop use credentials, a user prompt may pop up for the password you set during the GPG key generation.
@y
Once you initialize `pass`, you can sign in and pull your private images.
When Docker CLI or Docker Desktop use credentials, a user prompt may pop up for the password you set during the GPG key generation.
@z

@x
```console
$ docker pull molly/privateimage
Using default tag: latest
latest: Pulling from molly/privateimage
3b9cc81c3203: Pull complete 
Digest: sha256:3c6b73ce467f04d4897d7a7439782721fd28ec9bf62ea2ad9e81a5fb7fb3ff96
Status: Downloaded newer image for molly/privateimage:latest
docker.io/molly/privateimage:latest
```
@y
```console
$ docker pull molly/privateimage
Using default tag: latest
latest: Pulling from molly/privateimage
3b9cc81c3203: Pull complete 
Digest: sha256:3c6b73ce467f04d4897d7a7439782721fd28ec9bf62ea2ad9e81a5fb7fb3ff96
Status: Downloaded newer image for molly/privateimage:latest
docker.io/molly/privateimage:latest
```
@z

@x
## What's next?
@y
## What's next?
@z

@x
- [Explore Docker Desktop](/manuals/desktop/use-desktop/_index.md) and its features. 
- Change your [Docker Desktop settings](/manuals/desktop/settings-and-maintenance/settings.md).
- [Browse common FAQs](/manuals/desktop/troubleshoot-and-support/faqs/general.md).
@y
- [Explore Docker Desktop](manuals/desktop/use-desktop/_index.md) and its features. 
- Change your [Docker Desktop settings](manuals/desktop/settings-and-maintenance/settings.md).
- [Browse common FAQs](manuals/desktop/troubleshoot-and-support/faqs/general.md).
@z
