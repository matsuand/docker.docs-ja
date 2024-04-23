%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Troubleshoot your autobuilds
description: How to troubleshoot Automated builds
keywords: docker hub, troubleshoot, automated builds, autobuilds
tags: [ Troubleshooting ]
---
@y
---
title: Troubleshoot your autobuilds
description: How to troubleshoot Automated builds
keywords: docker hub, troubleshoot, automated builds, autobuilds
tags: [ Troubleshooting ]
---
@z

@x
> **Note**
>
> Automated builds require a
> [Docker Pro, Team, or Business subscription](../../subscription/index.md).
@y
> **Note**
>
> Automated builds require a
> [Docker Pro, Team, or Business subscription](../../subscription/index.md).
@z

@x
## Failing builds
@y
## Failing builds
@z

@x
If a build fails, a **Retry** icon appears next to the build report line on the
**General** and **Builds** tabs. The **Build report** page and **Timeline logs** also display a **Retry** button.
@y
If a build fails, a **Retry** icon appears next to the build report line on the
**General** and **Builds** tabs. The **Build report** page and **Timeline logs** also display a **Retry** button.
@z

@x
![Timeline view showing the retry build button](images/retry-build.png)
@y
![Timeline view showing the retry build button](images/retry-build.png)
@z

@x
> **Note**
>
> If you are viewing the build details for a repository that belongs to an
> organization, the **Cancel** and **Retry** buttons only appear if you have `Read & Write` access to the repository.
@y
> **Note**
>
> If you are viewing the build details for a repository that belongs to an
> organization, the **Cancel** and **Retry** buttons only appear if you have `Read & Write` access to the repository.
@z

@x
Automated builds have a 4-hour execution time limit. If a build reaches this time limit, it's
automatically cancelled, and the build logs display the following message:
@y
Automated builds have a 4-hour execution time limit. If a build reaches this time limit, it's
automatically cancelled, and the build logs display the following message:
@z

@x
```text
2022-11-02T17:42:27Z The build was cancelled or exceeded the maximum execution time.
```
@y
```text
2022-11-02T17:42:27Z The build was cancelled or exceeded the maximum execution time.
```
@z

@x
This log message is the same as when you actively cancel a build. To identify
whether a build was automatically cancelled, check the build duration.
@y
This log message is the same as when you actively cancel a build. To identify
whether a build was automatically cancelled, check the build duration.
@z

@x
## Build repositories with linked private submodules
@y
## Build repositories with linked private submodules
@z

@x
Docker Hub sets up a deploy key in your source code repository that allows it
to clone the repository and build it. This key only works for a single,
specific code repository. If your source code repository uses private Git
submodules, or requires that you clone other private repositories to build,
Docker Hub cannot access these additional repositories, your build cannot complete,
and an error is logged in your build timeline.
@y
Docker Hub sets up a deploy key in your source code repository that allows it
to clone the repository and build it. This key only works for a single,
specific code repository. If your source code repository uses private Git
submodules, or requires that you clone other private repositories to build,
Docker Hub cannot access these additional repositories, your build cannot complete,
and an error is logged in your build timeline.
@z

@x
To work around this, you can set up your automated build using the `SSH_PRIVATE`
environment variable to override the deployment key and grant Docker Hub's build
system access to the repositories.
@y
To work around this, you can set up your automated build using the `SSH_PRIVATE`
environment variable to override the deployment key and grant Docker Hub's build
system access to the repositories.
@z

@x
> **Note**
>
> If you are using autobuild for teams, use the process below
> instead, and configure a service user for your source code provider. You can
> also do this for an individual account to limit Docker Hub's access to your
> source repositories.
@y
> **Note**
>
> If you are using autobuild for teams, use the process below
> instead, and configure a service user for your source code provider. You can
> also do this for an individual account to limit Docker Hub's access to your
> source repositories.
@z

@x
1. Generate a SSH keypair that you use for builds only, and add the public key to your source code provider account.
@y
1. Generate a SSH keypair that you use for builds only, and add the public key to your source code provider account.
@z

@x
    This step is optional, but allows you to revoke the build-only keypair without removing other access.
@y
    This step is optional, but allows you to revoke the build-only keypair without removing other access.
@z

@x
2. Copy the private half of the keypair to your clipboard.
3. In Docker Hub, navigate to the build page for the repository that has linked private submodules. (If necessary, follow the steps [here](index.md#configure-automated-builds) to configure the automated build.)
4. At the bottom of the screen, select the **plus** icon next to **Build Environment variables**.
5. Enter `SSH_PRIVATE` as the name for the new environment variable.
6. Paste the private half of the keypair into the **Value** field.
7. Select **Save**, or **Save and Build** to validate that the build now completes.
@y
2. Copy the private half of the keypair to your clipboard.
3. In Docker Hub, navigate to the build page for the repository that has linked private submodules. (If necessary, follow the steps [here](index.md#configure-automated-builds) to configure the automated build.)
4. At the bottom of the screen, select the **plus** icon next to **Build Environment variables**.
5. Enter `SSH_PRIVATE` as the name for the new environment variable.
6. Paste the private half of the keypair into the **Value** field.
7. Select **Save**, or **Save and Build** to validate that the build now completes.
@z

@x
> **Note**
>
> You must configure your private git submodules using git clone over SSH
> (`git@submodule.tld:some-submodule.git`) rather than HTTPS.
@y
> **Note**
>
> You must configure your private git submodules using git clone over SSH
> (`git@submodule.tld:some-submodule.git`) rather than HTTPS.
@z
