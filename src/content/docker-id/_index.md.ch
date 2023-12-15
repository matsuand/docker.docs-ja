%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to register for a Docker ID and log in to your account
keywords: accounts, docker ID, billing, paid plans, support, Hub, Store, Forums, knowledge
  base, beta access, email, activation, verification
title: Create an account
aliases:
- /docker-cloud/dockerid/
- /docker-hub/accounts/
---
@y
---
description: Learn how to register for a Docker ID and log in to your account
keywords: accounts, docker ID, billing, paid plans, support, Hub, Store, Forums, knowledge
  base, beta access, email, activation, verification
title: Create an account
aliases:
- /docker-cloud/dockerid/
- /docker-hub/accounts/
---
@z

@x
You can create a Docker account with your email address or by signing up with your Google or GitHub account. Once you've created your account with a unique Docker ID, you can access all Docker products, including Docker Hub. With Docker Hub, you can access repositories and explore images that are available from the community and verified publishers.
@y
You can create a Docker account with your email address or by signing up with your Google or GitHub account. Once you've created your account with a unique Docker ID, you can access all Docker products, including Docker Hub. With Docker Hub, you can access repositories and explore images that are available from the community and verified publishers.
@z

@x
Your Docker ID becomes your username for hosted Docker services, and [Docker forums](https://forums.docker.com/).
@y
Your Docker ID becomes your username for hosted Docker services, and [Docker forums](https://forums.docker.com/).
@z

@x
## Create a Docker ID
@y
## Create a Docker ID
@z

@x
### Sign up with your email address
@y
### Sign up with your email address
@z

@x
1. Go to the [Docker sign-up page](https://hub.docker.com/signup/).
@y
1. Go to the [Docker sign-up page](https://hub.docker.com/signup/).
@z

@x
2. Enter a unique, valid email address.
@y
2. Enter a unique, valid email address.
@z

@x
3. Enter a username.
@y
3. Enter a username.
@z

@x
    Your Docker ID must be between 4 and 30 characters long, and can only contain numbers and lowercase letters. Once you create your Docker ID you can't reuse it in the future if you deactivate this account.
@y
    Your Docker ID must be between 4 and 30 characters long, and can only contain numbers and lowercase letters. Once you create your Docker ID you can't reuse it in the future if you deactivate this account.
@z

@x
4. Enter a password that's at least 9 characters long.
@y
4. Enter a password that's at least 9 characters long.
@z

@x
5. Select **Sign Up**.
@y
5. Select **Sign Up**.
@z

@x
   Docker sends a verification email to the address you provided.
@y
   Docker sends a verification email to the address you provided.
@z

@x
6. Verify your email address to complete the registration process.
@y
6. Verify your email address to complete the registration process.
@z

@x
> **Note**
>
> You have limited actions available until you verify your email address.
@y
> **Note**
>
> You have limited actions available until you verify your email address.
@z

@x
### Sign up with Google or GitHub
@y
### Sign up with Google or GitHub
@z

@x
> **Important**
>
> To sign up with your social provider, make sure you verify your email address with your provider before you begin.
{ .important }
@y
> **Important**
>
> To sign up with your social provider, make sure you verify your email address with your provider before you begin.
{ .important }
@z

@x
1. Go to the [Docker sign-up page](https://hub.docker.com/signup/).
@y
1. Go to the [Docker sign-up page](https://hub.docker.com/signup/).
@z

@x
2. Select your social provider, Google or GitHub.
@y
2. Select your social provider, Google or GitHub.
@z

@x
3. Select the social account you want to link to your Docker account.
@y
3. Select the social account you want to link to your Docker account.
@z

@x
4. Select **Authorize Docker** to allow Docker to access your social account information and be re-routed to the sign-up page.
@y
4. Select **Authorize Docker** to allow Docker to access your social account information and be re-routed to the sign-up page.
@z

@x
5. Enter a username.
@y
5. Enter a username.
@z

@x
    Your Docker ID must be between 4 and 30 characters long, and can only contain numbers and lowercase letters. Once you create your Docker ID you can't reuse it in the future if you deactivate this account.
@y
    Your Docker ID must be between 4 and 30 characters long, and can only contain numbers and lowercase letters. Once you create your Docker ID you can't reuse it in the future if you deactivate this account.
@z

@x
6. Select **Sign up**.
@y
6. Select **Sign up**.
@z

@x
## Sign in
@y
## Sign in
@z

@x
Once you register and verify your Docker ID email address, you can sign in to [your Docker account](https://login.docker.com/u/login/). You can sign in with your email address (or username) and password. Or, you can sign in with your social provider. See [Sign in with your social provider](#sign-in-with-your-social-provider).
@y
Once you register and verify your Docker ID email address, you can sign in to [your Docker account](https://login.docker.com/u/login/). You can sign in with your email address (or username) and password. Or, you can sign in with your social provider. See [Sign in with your social provider](#sign-in-with-your-social-provider).
@z

@x
You can also sign in through the CLI using the `docker login` command. For more information, see [`docker login`](../engine/reference/commandline/login.md).
@y
You can also sign in through the CLI using the `docker login` command. For more information, see [`docker login`](../engine/reference/commandline/login.md).
@z

@x
> **Warning**
>
> When you use the `docker login` command, your credentials are
stored in your home directory in `.docker/config.json`. The password is base64-encoded in this file.
>
> We recommend using one of the [Docker credential helpers](https://github.com/docker/docker-credential-helpers) for secure storage of passwords. For extra security, you can also use a [personal access token](../security/for-developers/access-tokens.md) to log in instead, which is still encoded in this file (without a Docker credential helper) but doesn't allow admin actions (such as changing the password).
{ .warning }
@y
> **Warning**
>
> When you use the `docker login` command, your credentials are
stored in your home directory in `.docker/config.json`. The password is base64-encoded in this file.
>
> We recommend using one of the [Docker credential helpers](https://github.com/docker/docker-credential-helpers) for secure storage of passwords. For extra security, you can also use a [personal access token](../security/for-developers/access-tokens.md) to log in instead, which is still encoded in this file (without a Docker credential helper) but doesn't allow admin actions (such as changing the password).
{ .warning }
@z

@x
### Sign in with your social provider
@y
### Sign in with your social provider
@z

@x
> **Important**
>
> To sign in with your social provider, make sure you verify your email address with your provider before you begin.
{ .important }
@y
> **Important**
>
> To sign in with your social provider, make sure you verify your email address with your provider before you begin.
{ .important }
@z

@x
Optionally, you can sign in to an existing Docker account with your Google or GitHub account. If a Docker account exists with the same email address as the primary email for your social provider, your Docker account will automatically be linked to the social profile. This lets you sign in with your social provider.
@y
Optionally, you can sign in to an existing Docker account with your Google or GitHub account. If a Docker account exists with the same email address as the primary email for your social provider, your Docker account will automatically be linked to the social profile. This lets you sign in with your social provider.
@z

@x
If you try to sign in with your social provider and don't have a Docker account yet, a new account will be created for you. Follow the on-screen instructions to create a Docker ID using your social provider.
@y
If you try to sign in with your social provider and don't have a Docker account yet, a new account will be created for you. Follow the on-screen instructions to create a Docker ID using your social provider.
@z

@x
## Reset your password at sign in
@y
## Reset your password at sign in
@z

@x
To reset your password, enter your email address on the [Sign in](https://login.docker.com/u/login) page and continue to sign in. When prompted for your password, select **Forgot password?**.
@y
To reset your password, enter your email address on the [Sign in](https://login.docker.com/u/login) page and continue to sign in. When prompted for your password, select **Forgot password?**.
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
For support and troubleshooting information, see [Get support](../support.md).
@y
For support and troubleshooting information, see [Get support](../support.md).
@z
