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
Docker recommends that you authenticate using the **Sign in** option in the top-right corner of the Docker Dashboard. 
@y
Docker recommends that you authenticate using the **Sign in** option in the top-right corner of the Docker Dashboard. 
@z

@x
In large enterprises where admin access is restricted, administrators can [enforce sign-in](/manuals/security/for-admins/enforce-sign-in/_index.md). 
@y
In large enterprises where admin access is restricted, administrators can [enforce sign-in](manuals/security/for-admins/enforce-sign-in/_index.md). 
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
- You can access your Docker Hub repositories directly from Docker Desktop.
@y
- You can access your Docker Hub repositories directly from Docker Desktop.
@z

@x
- Authenticated users also get a higher pull rate limit compared to anonymous users. For more information, see [Usage and limits](/manuals/docker-hub/usage/_index.md).
@y
- Authenticated users also get a higher pull rate limit compared to anonymous users. For more information, see [Usage and limits](manuals/docker-hub/usage/_index.md).
@z

@x
- Improve your organization’s security posture for containerized development by taking advantage of [Hardened Desktop](/manuals/security/for-admins/hardened-desktop/_index.md).
@y
- Improve your organization’s security posture for containerized development by taking advantage of [Hardened Desktop](manuals/security/for-admins/hardened-desktop/_index.md).
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
Docker Desktop for Linux relies on [`pass`](https://www.passwordstore.org/) to store credentials in gpg2-encrypted files.
Before signing in to Docker Desktop with your [Docker ID](/accounts/create-account/), you must initialize `pass`.
Docker Desktop displays a warning if you've not initialized `pass`.
@y
Docker Desktop for Linux relies on [`pass`](https://www.passwordstore.org/) to store credentials in gpg2-encrypted files.
Before signing in to Docker Desktop with your [Docker ID](__SUBDIR__/accounts/create-account/), you must initialize `pass`.
Docker Desktop displays a warning if you've not initialized `pass`.
@z

@x
You can initialize pass by using a gpg key. To generate a gpg key, run:
@y
You can initialize pass by using a gpg key. To generate a gpg key, run:
@z

@x
``` console
$ gpg --generate-key
``` 
@y
``` console
$ gpg --generate-key
``` 
@z

@x
The following is an example similar to what you see once you run the previous command:
@y
The following is an example similar to what you see once you run the previous command:
@z

@x
```console {hl_lines=12}
...
GnuPG needs to construct a user ID to identify your key.
@y
```console {hl_lines=12}
...
GnuPG needs to construct a user ID to identify your key.
@z

@x
Real name: Molly
Email address: molly@example.com
You selected this USER-ID:
   "Molly <molly@example.com>"
@y
Real name: Molly
Email address: molly@example.com
You selected this USER-ID:
   "Molly <molly@example.com>"
@z

@x
Change (N)ame, (E)mail, or (O)kay/(Q)uit? O
...
pubrsa3072 2022-03-31 [SC] [expires: 2024-03-30]
 <generated gpg-id public key>
uid          Molly <molly@example.com>
subrsa3072  2022-03-31 [E] [expires: 2024-03-30]
```
@y
Change (N)ame, (E)mail, or (O)kay/(Q)uit? O
...
pubrsa3072 2022-03-31 [SC] [expires: 2024-03-30]
 <generated gpg-id public key>
uid          Molly <molly@example.com>
subrsa3072  2022-03-31 [E] [expires: 2024-03-30]
```
@z

@x
To initialize `pass`, run the following command using the public key generated from the previous command:
@y
To initialize `pass`, run the following command using the public key generated from the previous command:
@z

@x
```console
$ pass init <your_generated_gpg-id_public_key>
``` 
The following is an example similar to what you see once you run the previous command:
@y
```console
$ pass init <your_generated_gpg-id_public_key>
``` 
The following is an example similar to what you see once you run the previous command:
@z

@x
```console
mkdir: created directory '/home/molly/.password-store/'
Password store initialized for <generated_gpg-id_public_key>
```
@y
```console
mkdir: created directory '/home/molly/.password-store/'
Password store initialized for <generated_gpg-id_public_key>
```
@z

@x
Once you initialize `pass`, you can sign in and pull your private images.
When Docker CLI or Docker Desktop use credentials, a user prompt may pop up for the password you set during the gpg key generation.
@y
Once you initialize `pass`, you can sign in and pull your private images.
When Docker CLI or Docker Desktop use credentials, a user prompt may pop up for the password you set during the gpg key generation.
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
- Change your Docker Desktop settings
- [Browse common FAQs](/manuals/desktop/troubleshoot-and-support/faqs/general.md)
@y
- [Explore Docker Desktop](manuals/desktop/use-desktop/_index.md) and its features. 
- Change your Docker Desktop settings
- [Browse common FAQs](manuals/desktop/troubleshoot-and-support/faqs/general.md)
@z
