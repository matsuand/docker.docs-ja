%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Create an account
@y
title: アカウントの生成
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
You can create a free Docker account with your email address or by signing up with your Google or GitHub account. Once you've created your account with a unique Docker ID, you can access all Docker products, including Docker Hub. With Docker Hub, you can access repositories and explore images that are available from the community and verified publishers.
@y
You can create a free Docker account with your email address or by signing up with your Google or GitHub account. Once you've created your account with a unique Docker ID, you can access all Docker products, including Docker Hub. With Docker Hub, you can access repositories and explore images that are available from the community and verified publishers.
@z

@x
Your Docker ID becomes your username for hosted Docker services, and [Docker forums](https://forums.docker.com/).
@y
Your Docker ID becomes your username for hosted Docker services, and [Docker forums](https://forums.docker.com/).
@z

@x
## Create a Docker ID
@y
## Docker ID の生成 {#create-a-docker-id}
@z

@x
### Sign up with your email address
@y
### メールアドレスを使ったサインアップ {#sign-up-with-your-email-address}
@z

@x
1. Go to the [Docker sign-up page](https://app.docker.com/signup/).
@y
1. [Docker サインアップページ](https://app.docker.com/signup/) にアクセスします。
@z

@x
2. Enter a unique, valid email address.
@y
2. 適切なメールアドレスを入力します。
@z

@x
3. Enter a username to use as your Docker ID. Once you create your Docker ID you can't reuse it in the future if you deactivate this account.
@y
3. Docker ID として利用するユーザー名を入力します。
   Once you create your Docker ID you can't reuse it in the future if you deactivate this account.
@z

@x
    Your username:
    - Must be between 4 and 30 characters long
    - Can only contain numbers and lowercase letters
@y
    Your username:
    - Must be between 4 and 30 characters long
    - Can only contain numbers and lowercase letters
@z

@x
4. Enter a password that's at least 9 characters long.
@y
4. パスワードを入力します。最低 9 文字が必要です。
@z

@x
5. Select **Sign Up**.
@y
5. **Sign Up** (サインアップ) をクリックします。
@z

@x
6. Open your email client. Docker sends a verification email to the address you provided.
@y
6. Open your email client. Docker sends a verification email to the address you provided.
@z

@x
7. Verify your email address to complete the registration process.
@y
7. メールアドレスを確認して登録操作を終了します。
@z

@x
> [!NOTE]
>
> You must verify your email address before you have full access to Docker's features.
@y
> [!NOTE]
>
> Docker 機能へのアクセスをすべて行うために、メールアドレスを確認しておく必要があります。
@z

@x
### Sign up with Google or GitHub
@y
### Google または GitHub を使ったサインアップ {#sign-up-with-google-or-github}
@z

@x
> [!IMPORTANT]
>
> To sign up with your social provider, you must verify your email address with your provider before you begin.
@y
> [!IMPORTANT]
>
> To sign up with your social provider, you must verify your email address with your provider before you begin.
@z

@x
1. Go to the [Docker sign-up page](https://app.docker.com/signup/).
@y
1. [Docker サインアップページ](https://app.docker.com/signup/) にアクセスします。
@z

@x
2. Select your social provider, Google or GitHub.
@y
2. ソーシャルプロバイダーである Google または GitHub のいずれかを選択します。
@z

@x
3. Select the social account you want to link to your Docker account.
@y
3. Docker アカウントへのリンクづけを行いたいソーシャルアカウントを選びます。
@z

@x
4. Select **Authorize Docker** to let Docker to access your social account information. You will be re-routed to the sign-up page.
@y
4. Select **Authorize Docker** to let Docker to access your social account information. You will be re-routed to the sign-up page.
@z

@x
5. Enter a username to use as your Docker ID.
@y
5. Docker ID として利用するユーザー名を入力します。
@z

@x
    Your username:
    - Must be between 4 and 30 characters long
    - Can only contain numbers and lowercase letters
@y
    Your username:
    - Must be between 4 and 30 characters long
    - Can only contain numbers and lowercase letters
@z

@x
6. Select **Sign up**.
@y
6. **Sign Up** (サインアップ) をクリックします。
@z

@x
## Sign in
@y
## サインイン {#sign-in}
@z

@x
Once you register your Docker ID and verify your email address, you can sign in to [your Docker account](https://login.docker.com/u/login/). You can either:
@y
Once you register your Docker ID and verify your email address, you can sign in to [your Docker account](https://login.docker.com/u/login/). You can either:
@z

@x
- Sign in with your email address (or username) and password.
- Sign in with your social provider. For more information, see [Sign in with your social provider](#sign-in-with-your-social-provider).
- Sign in through the CLI using the `docker login` command. For more information, see [`docker login`](/reference/cli/docker/login.md).
@y
- Sign in with your email address (or username) and password.
- Sign in with your social provider. For more information, see [Sign in with your social provider](#sign-in-with-your-social-provider).
- Sign in through the CLI using the `docker login` command. For more information, see [`docker login`](reference/cli/docker/login.md).
@z

@x
> [!WARNING]
>
> When you use the `docker login` command, your credentials are
stored in your home directory in `.docker/config.json`. The password is base64-encoded in this file.
>
> We recommend using one of the [Docker credential helpers](https://github.com/docker/docker-credential-helpers) for secure storage of passwords. For extra security, you can also use a [personal access token](../security/for-developers/access-tokens.md) to sign in instead, which is still encoded in this file (without a Docker credential helper) but doesn't permit administrator actions (such as changing the password).
@y
> [!WARNING]
>
> When you use the `docker login` command, your credentials are
stored in your home directory in `.docker/config.json`. The password is base64-encoded in this file.
>
> We recommend using one of the [Docker credential helpers](https://github.com/docker/docker-credential-helpers) for secure storage of passwords. For extra security, you can also use a [personal access token](../security/for-developers/access-tokens.md) to sign in instead, which is still encoded in this file (without a Docker credential helper) but doesn't permit administrator actions (such as changing the password).
@z

@x
### Sign in with your social provider
@y
### Sign in with your social provider {#sign-in-with-your-social-provider}
@z

@x
> [!IMPORTANT]
>
> To sign in with your social provider, you must verify your email address with your provider before you begin.
@y
> [!IMPORTANT]
>
> To sign in with your social provider, you must verify your email address with your provider before you begin.
@z

@x
You can also sign in to your Docker account with your Google or GitHub account. If a Docker account exists with the same email address as the primary email for your social provider, your Docker account will automatically be linked to the social profile. This lets you sign in with your social provider.
@y
You can also sign in to your Docker account with your Google or GitHub account. If a Docker account exists with the same email address as the primary email for your social provider, your Docker account will automatically be linked to the social profile. This lets you sign in with your social provider.
@z

@x
If you try to sign in with your social provider and don't have a Docker account yet, a new account will be created for you. Follow the on-screen instructions to create a Docker ID using your social provider.
@y
If you try to sign in with your social provider and don't have a Docker account yet, a new account will be created for you. Follow the on-screen instructions to create a Docker ID using your social provider.
@z

@x
## Reset your password at sign in
@y
## Reset your password at sign in {#reset-your-password-at-sign-in}
@z

@x
To reset your password, enter your email address on the [Sign in](https://login.docker.com/u/login) page and continue to sign in. When prompted for your password, select **Forgot password?**.
@y
To reset your password, enter your email address on the [Sign in](https://login.docker.com/u/login) page and continue to sign in. When prompted for your password, select **Forgot password?**.
@z

@x
## Troubleshooting
@y
## Troubleshooting {#troubleshooting}
@z

@x
If you have a paid Docker subscription, you can [contact the Support team](https://hub.docker.com/support/contact/) for assistance.
@y
If you have a paid Docker subscription, you can [contact the Support team](https://hub.docker.com/support/contact/) for assistance.
@z

@x
All Docker users can seek troubleshooting information and support through the following resources, where Docker or the community respond on a best effort basis:
   - [Docker Community Forums](https://forums.docker.com/)
   - [Docker Community Slack](http://dockr.ly/comm-slack)
@y
All Docker users can seek troubleshooting information and support through the following resources, where Docker or the community respond on a best effort basis:
   - [Docker Community Forums](https://forums.docker.com/)
   - [Docker Community Slack](http://dockr.ly/comm-slack)
@z
