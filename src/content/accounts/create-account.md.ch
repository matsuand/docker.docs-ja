%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Learn how to register for a Docker ID and sign in to your account
keywords: accounts, docker ID, billing, paid plans, support, Hub, Store, Forums, knowledge
  base, beta access, email, activation, verification
title: Create an account
@y
description: Learn how to register for a Docker ID and sign in to your account
keywords: accounts, docker ID, billing, paid plans, support, Hub, Store, Forums, knowledge
  base, beta access, email, activation, verification
title: アカウントの生成
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
3. Enter a username.
@y
3. ユーザー名を入力します。
@z

@x
    Your Docker ID must be between 4 and 30 characters long, and can only contain numbers and lowercase letters. Once you create your Docker ID you can't reuse it in the future if you deactivate this account.
@y
    Your Docker ID must be between 4 and 30 characters long, and can only contain numbers and lowercase letters. Once you create your Docker ID you can't reuse it in the future if you deactivate this account.
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
   Docker sends a verification email to the address you provided.
@y
   Docker sends a verification email to the address you provided.
@z

@x
6. Verify your email address to complete the registration process.
@y
6. メールアドレスを確認して登録操作を終了します。
@z

@x
> [!NOTE]
>
> You have limited actions available until you verify your email address.
@y
> [!NOTE]
>
> メールアドレスを確認しないでおくと、利用できる操作が限定されます。
@z

@x
### Sign up with Google or GitHub
@y
### Google または GitHub を使ったサインアップ {#sign-up-with-google-or-github}
@z

@x
> [!IMPORTANT]
>
> To sign up with your social provider, make sure you verify your email address with your provider before you begin.
@y
> [!IMPORTANT]
>
> To sign up with your social provider, make sure you verify your email address with your provider before you begin.
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
4. Select **Authorize Docker** to allow Docker to access your social account information and be re-routed to the sign-up page.
@y
4. Select **Authorize Docker** to allow Docker to access your social account information and be re-routed to the sign-up page.
@z

@x
5. Enter a username.
@y
5. ユーザー名を入力します。
@z

@x
    Your Docker ID must be between 4 and 30 characters long, and can only contain numbers and lowercase letters. Once you create your Docker ID you can't reuse it in the future if you deactivate this account.
@y
    Your Docker ID must be between 4 and 30 characters long, and can only contain numbers and lowercase letters. Once you create your Docker ID you can't reuse it in the future if you deactivate this account.
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
Once you register and verify your Docker ID email address, you can sign in to [your Docker account](https://login.docker.com/u/login/). You can sign in with your email address (or username) and password. Or, you can sign in with your social provider. See [Sign in with your social provider](#sign-in-with-your-social-provider).
@y
Once you register and verify your Docker ID email address, you can sign in to [your Docker account](https://login.docker.com/u/login/). You can sign in with your email address (or username) and password. Or, you can sign in with your social provider. See [Sign in with your social provider](#sign-in-with-your-social-provider).
@z

@x
You can also sign in through the CLI using the `docker login` command. For more information, see [`docker login`](../reference/cli/docker/login.md).
@y
You can also sign in through the CLI using the `docker login` command. For more information, see [`docker login`](../reference/cli/docker/login.md).
@z

@x
> [!WARNING]
>
> When you use the `docker login` command, your credentials are
stored in your home directory in `.docker/config.json`. The password is base64-encoded in this file.
>
> We recommend using one of the [Docker credential helpers](https://github.com/docker/docker-credential-helpers) for secure storage of passwords. For extra security, you can also use a [personal access token](../security/for-developers/access-tokens.md) to log in instead, which is still encoded in this file (without a Docker credential helper) but doesn't allow admin actions (such as changing the password).
@y
> [!WARNING]
>
> When you use the `docker login` command, your credentials are
stored in your home directory in `.docker/config.json`. The password is base64-encoded in this file.
>
> We recommend using one of the [Docker credential helpers](https://github.com/docker/docker-credential-helpers) for secure storage of passwords. For extra security, you can also use a [personal access token](../security/for-developers/access-tokens.md) to log in instead, which is still encoded in this file (without a Docker credential helper) but doesn't allow admin actions (such as changing the password).
@z

@x
### Sign in with your social provider
@y
### Sign in with your social provider {#sign-in-with-your-social-provider}
@z

@x
> [!IMPORTANT]
>
> To sign in with your social provider, make sure you verify your email address with your provider before you begin.
@y
> [!IMPORTANT]
>
> To sign in with your social provider, make sure you verify your email address with your provider before you begin.
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
For support and troubleshooting information, see [Get support](../support.md).
@y
For support and troubleshooting information, see [Get support](../support.md).
@z
