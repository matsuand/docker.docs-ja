%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Create a Docker account
linkTitle: Create an account
@y
title: Docker アカウントの生成
linkTitle: アカウントの生成
@z

@x
description: Learn how to register for a Docker ID and sign in to your account
keywords: accounts, docker ID, billing, paid plans, support, Hub, Store, Forums, knowledge
  base, beta access, email, activation, verification
@y
description: Learn how to register for a Docker ID and sign in to your account
keywords: accounts, docker ID, billing, paid plans, support, Hub, Store, Forums, knowledge
  base, beta access, email, activation, verification
@z

@x
You can create a free Docker account with your email address or by signing up
with your Google or GitHub account. After creating a unique Docker ID, you can
access all Docker products, including Docker Hub, Docker Desktop, and Docker Scout.
@y
You can create a free Docker account with your email address or by signing up
with your Google or GitHub account. After creating a unique Docker ID, you can
access all Docker products, including Docker Hub, Docker Desktop, and Docker Scout.
@z

@x
Your Docker ID becomes your username for hosted Docker services, and
[Docker forums](https://forums.docker.com/).
@y
Your Docker ID becomes your username for hosted Docker services, and
[Docker forums](https://forums.docker.com/).
@z

@x
> [!TIP]
>
> Explore [Docker's subscriptions](https://www.docker.com/pricing/) to see what else Docker can offer you.
@y
> [!TIP]
>
> Explore [Docker's subscriptions](https://www.docker.com/pricing/) to see what else Docker can offer you.
@z

@x
## Create an account
@y
## アカウントの生成 {#create-an-account}
@z

@x
Signing up with an email address, Google, or GitHub account requires additional verification to complete account creation:
@y
Signing up with an email address, Google, or GitHub account requires additional verification to complete account creation:
@z

@x
- If you sign up with Google or GitHub, you must first verify your email address with that provider.
- If you sign up with an email address, Docker sends a verification email. Follow the procedures in that email to verify your account and complete the sign-up process.
@y
- If you sign up with Google or GitHub, you must first verify your email address with that provider.
- If you sign up with an email address, Docker sends a verification email. Follow the procedures in that email to verify your account and complete the sign-up process.
@z

@x
Docker blocks sign-in until you've verified your account. 
@y
Docker blocks sign-in until you've verified your account. 
@z

@x
### Sign up with your email
@y
### メールを使ったサインアップ {#sign-up-with-your-email}
@z

@x
1. Go to the [Docker sign-up page](https://app.docker.com/signup/) and enter a unique, valid email address.
1. Enter a username to use as your Docker ID. Once you create your Docker ID
you can't reuse it in the future if you deactivate this account. Your username:
    - Must be between 4 and 30 characters long
    - Can only contain numbers and lowercase letters
1. Choose a password that's at least 9 characters long, then select **Sign Up**.
1. Verify your email address when you receive the Docker verification email. This completes the registration process.
@y
1. Go to the [Docker sign-up page](https://app.docker.com/signup/) and enter a unique, valid email address.
1. Enter a username to use as your Docker ID. Once you create your Docker ID
you can't reuse it in the future if you deactivate this account. Your username:
    - Must be between 4 and 30 characters long
    - Can only contain numbers and lowercase letters
1. Choose a password that's at least 9 characters long, then select **Sign Up**.
1. Verify your email address when you receive the Docker verification email. This completes the registration process.
@z

@x
### Sign up with Google or GitHub
@y
### Google または GitHub を使ったサインアップ {#sign-up-with-google-or-github}
@z

@x
1. Go to the [Docker sign-up page](https://app.docker.com/signup/).
1. Select your social provider, Google or GitHub.
1. Select the social account you want to link to your Docker account.
1. Select **Authorize Docker** to let Docker access your social account
information. You will be re-routed to the sign-up page.
1. Enter a username to use as your Docker ID. Your username:
    - Must be between 4 and 30 characters long
    - Can only contain numbers and lowercase letters
1. Select **Sign up**.
@y
1. Go to the [Docker sign-up page](https://app.docker.com/signup/).
1. Select your social provider, Google or GitHub.
1. Select the social account you want to link to your Docker account.
1. Select **Authorize Docker** to let Docker access your social account
information. You will be re-routed to the sign-up page.
1. Enter a username to use as your Docker ID. Your username:
    - Must be between 4 and 30 characters long
    - Can only contain numbers and lowercase letters
1. Select **Sign up**.
@z

@x
## Sign in to your account
@y
## Sign in to your account
@z

@x
You can sign in with your email, Google or GitHub account, or from
the Docker CLI.
@y
You can sign in with your email, Google or GitHub account, or from
the Docker CLI.
@z

@x
### Sign in with email or Docker ID
@y
### Sign in with email or Docker ID
@z

@x
1. Go to the [Docker sign in page](https://login.docker.com).
1. Enter your email address or Docker ID and select **Continue**.
1. Enter your password and select **Continue**.
@y
1. Go to the [Docker sign in page](https://login.docker.com).
1. Enter your email address or Docker ID and select **Continue**.
1. Enter your password and select **Continue**.
@z

@x
To reset your password, see [Reset your password](#reset-your-password).
@y
To reset your password, see [Reset your password](#reset-your-password).
@z

@x
### Sign in with Google or GitHub
@y
### Sign in with Google or GitHub
@z

@x
You can sign in using your Google or GitHub credentials. If your social
account uses the same email address as an existing Docker ID, the
accounts are automatically linked.
@y
You can sign in using your Google or GitHub credentials. If your social
account uses the same email address as an existing Docker ID, the
accounts are automatically linked.
@z

@x
If no Docker ID exists, Docker creates a new account for you.
@y
If no Docker ID exists, Docker creates a new account for you.
@z

@x
Docker doesn't currently support linking multiple sign-in methods
to the same Docker ID.
@y
Docker doesn't currently support linking multiple sign-in methods
to the same Docker ID.
@z

@x
### Sign in using the CLI
@y
### Sign in using the CLI
@z

@x
Use the `docker login` command to authenticate from the command line. For
details, see [`docker login`](/reference/cli/docker/login/).
@y
Use the `docker login` command to authenticate from the command line. For
details, see [`docker login`](reference/cli/docker/login/).
@z

@x
> [!WARNING]
>
> The `docker login` command stores credentials in your home directory under
> `.docker/config.json`. The password is base64-encoded.
>
> To improve security, use
> [Docker credential helpers](https://github.com/docker/docker-credential-helpers).
> For even stronger protection, use a [personal access token](../security/access-tokens.md)
> instead of a password. This is especially useful in CI/CD environments
> or when credential helpers aren't available.
@y
> [!WARNING]
>
> The `docker login` command stores credentials in your home directory under
> `.docker/config.json`. The password is base64-encoded.
>
> To improve security, use
> [Docker credential helpers](https://github.com/docker/docker-credential-helpers).
> For even stronger protection, use a [personal access token](../security/access-tokens.md)
> instead of a password. This is especially useful in CI/CD environments
> or when credential helpers aren't available.
@z

@x
## Reset your password
@y
## Reset your password
@z

@x
To reset your password:
@y
To reset your password:
@z

@x
1. Go to the [Docker sign in page](https://login.docker.com/).
1. Enter your email address.
1. When prompted for your password, select **Forgot password?**.
@y
1. Go to the [Docker sign in page](https://login.docker.com/).
1. Enter your email address.
1. When prompted for your password, select **Forgot password?**.
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
If you have a paid Docker subscription,
[contact the Support team](https://hub.docker.com/support/contact/) for assistance.
@y
If you have a paid Docker subscription,
[contact the Support team](https://hub.docker.com/support/contact/) for assistance.
@z

@x
All Docker users can seek troubleshooting information and support through the
following resources, where Docker or the community respond on a best effort
basis:
   - [Docker Community Forums](https://forums.docker.com/)
   - [Docker Community Slack](http://dockr.ly/comm-slack)
@y
All Docker users can seek troubleshooting information and support through the
following resources, where Docker or the community respond on a best effort
basis:
   - [Docker Community Forums](https://forums.docker.com/)
   - [Docker Community Slack](http://dockr.ly/comm-slack)
@z
