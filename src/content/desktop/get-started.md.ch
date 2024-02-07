%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Explore the Learning center and understand the benefits of signing in
  to Docker Desktop
keywords: Docker Dashboard, manage, containers, gui, dashboard, images, user manual,
  learning center, guide, sign in
title: Sign in to Docker Desktop
aliases:
- /desktop/linux/
- /desktop/linux/index/
- /desktop/mac/
- /desktop/mac/index/
- /desktop/windows/
- /desktop/windows/index/
- /docker-for-mac/
- /docker-for-mac/index/
- /docker-for-mac/osx/
- /docker-for-mac/started/
- /docker-for-windows/
- /docker-for-windows/index/
- /docker-for-windows/started/
- /mac/
- /mac/started/
- /mackit/
- /mackit/getting-started/
- /win/
- /windows/
- /windows/started/
- /winkit/
- /winkit/getting-started/
---
@y
---
description: Explore the Learning center and understand the benefits of signing in
  to Docker Desktop
keywords: Docker Dashboard, manage, containers, gui, dashboard, images, user manual,
  learning center, guide, sign in
title: Docker Desktop へのサインイン
aliases:
- /desktop/linux/
- /desktop/linux/index/
- /desktop/mac/
- /desktop/mac/index/
- /desktop/windows/
- /desktop/windows/index/
- /docker-for-mac/
- /docker-for-mac/index/
- /docker-for-mac/osx/
- /docker-for-mac/started/
- /docker-for-windows/
- /docker-for-windows/index/
- /docker-for-windows/started/
- /mac/
- /mac/started/
- /mackit/
- /mackit/getting-started/
- /win/
- /windows/
- /windows/started/
- /winkit/
- /winkit/getting-started/
---
@z

@x
Docker recommends that you authenticate using the **Sign in** option in the top-right corner of the Docker Dashboard.
@y
Docker の利用にあたっては、Docker Dashboard の右上にある **サインイン** オプションを使って認証操作を行うことをお勧めします。
@z

@x
In large enterprises where admin access is restricted, administrators can [Configure registry.json to enforce sign-in](../security/for-admins/configure-sign-in.md). 
@y
In large enterprises where admin access is restricted, administrators can [Configure registry.json to enforce sign-in](../security/for-admins/configure-sign-in.md). 
@z

@x
> **Tip**
>
> Explore [Docker's core subscriptions](https://www.docker.com/pricing/) to see what else Docker can offer you.
@y
> **情報**
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
- Authenticated users also get a higher pull rate limit compared to anonymous users. For example, if you are authenticated, you get 200 pulls per 6 hour period, compared to 100 pulls per 6 hour period per IP address for anonymous users. For more information, see [Download rate limit](../docker-hub/download-rate-limit.md).
@y
- Authenticated users also get a higher pull rate limit compared to anonymous users. For example, if you are authenticated, you get 200 pulls per 6 hour period, compared to 100 pulls per 6 hour period per IP address for anonymous users. For more information, see [Download rate limit](../docker-hub/download-rate-limit.md).
@z

@x
- Improve your organization’s security posture for containerized development by taking advantage of [Hardened Desktop](hardened-desktop/index.md).
@y
- Improve your organization’s security posture for containerized development by taking advantage of [Hardened Desktop](hardened-desktop/index.md).
@z

@x
> **Note**
>
> Docker Desktop automatically signs you out after 90 days, or after 30 days of inactivity. 
@y
> **メモ**
>
> Docker Desktop automatically signs you out after 90 days, or after 30 days of inactivity. 
@z

@x
## Signing in with Docker Desktop for Linux
@y
## Docker Desktop for Linux におけるサインイン  {#signing-in-with-docker-desktop-for-linux}
@z

@x
Docker Desktop for Linux relies on [`pass`](https://www.passwordstore.org/) to store credentials in gpg2-encrypted files.
Before signing in to Docker Desktop with your [Docker ID](../docker-id/_index.md), you must initialize `pass`.
Docker Desktop displays a warning if you've not initialized `pass`.
@y
Docker Desktop for Linux relies on [`pass`](https://www.passwordstore.org/) to store credentials in gpg2-encrypted files.
Before signing in to Docker Desktop with your [Docker ID](../docker-id/_index.md), you must initialize `pass`.
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
## 次は何？ {#whats-next}
@z

@x
- [Explore Docker Desktop](use-desktop/index.md) and its features. 
- Change your Docker Desktop settings
- [Browse common FAQs](faqs/general.md)
@y
- [Docker Desktop の確認](use-desktop/index.md) とその機能。
- Docker Desktop 設定の変更
- [一般的な FAQ の確認](faqs/general.md)
@z
