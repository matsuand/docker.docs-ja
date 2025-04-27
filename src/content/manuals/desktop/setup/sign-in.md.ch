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
- Enhance your organization’s security posture for containerized development with [Hardened Desktop](/manuals/security/for-admins/hardened-desktop/_index.md).
@y
- Enhance your organization’s security posture for containerized development with [Hardened Desktop](manuals/security/for-admins/hardened-desktop/_index.md).
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

% snip command...

@x
2. Enter your name and email once prompted. 
@y
2. Enter your name and email once prompted. 
@z

@x
   Once confirmed, GPG creates a key pair. Look for the `pub` line that contains your GPG ID, for example:
@y
   Once confirmed, GPG creates a key pair. Look for the `pub` line that contains your GPG ID, for example:
@z

% snip output...

@x
3. Copy the GPG ID and use it to initialize `pass`
@y
3. Copy the GPG ID and use it to initialize `pass`
@z

% snip command...

@x
   You should see output similar to: 
@y
   You should see output similar to: 
@z

% snip output...

@x
Once you initialize `pass`, you can sign in and pull your private images.
When Docker CLI or Docker Desktop use credentials, a user prompt may pop up for the password you set during the GPG key generation.
@y
Once you initialize `pass`, you can sign in and pull your private images.
When Docker CLI or Docker Desktop use credentials, a user prompt may pop up for the password you set during the GPG key generation.
@z

% snip output...

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
