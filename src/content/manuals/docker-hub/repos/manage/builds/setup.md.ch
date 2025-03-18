%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Set up automated builds
keywords: automated, build, images, Docker Hub
title: Set up automated builds
linkTitle: Set up
@y
description: 自動ビルドを設定します。
keywords: automated, build, images, Docker Hub
title: 自動ビルドの設定
linkTitle: 設定
@z

@x
> [!NOTE]
>
> Automated builds require a
> Docker Pro, Team, or Business subscription.
@y
> [!NOTE]
>
> 自動ビルドを利用するには Docker Pro, Team, Business のいずれかのサブスクリプションが必要です。
@z

@x
## Configure automated builds
@y
## 自動ビルドの設定 {#configure-automated-builds}
@z

@x
You can configure repositories in Docker Hub so that they automatically
build an image each time you push new code to your source provider. If you have
[automated tests](automated-testing.md) configured, the new image is only pushed
when the tests succeed.
@y
Docker Hub のリポジトリにおいては、ソースプロバイダーへのコードプッシュを行うたびに、イメージビルドを自動的に行うように設定することができます。
[自動テスト](automated-testing.md) を設定済みである場合、新たなイメージのプッシュは、テストが成功した場合にのみ行われます。
@z

@x
1. In [Docker Hub](https://hub.docker.com), go to **My Hub** > **Repositories**, and select a repository to view its details.
@y
1. [Docker Hub](https://hub.docker.com) において **My Hub** > **Repositories** (リポジトリ) セクションから、詳細を確認するリポジトリを選択します。
@z

@x
2. Select the **Builds** tab.
@y
2. **Builds** (ビルド) タブを選択します。
@z

@x
3. Select either GitHub or Bitbucket to connect where the image's source code is stored.
@y
3. イメージのソースコードを保存している GitHub か Bitbucket のいずれかを選択します。
@z

@x
   > [!NOTE]
   >
   > You may be redirected to the settings page to [link](link-source.md) the
   > code repository service. Otherwise, if you are editing the build settings
   > for an existing automated build, select **Configure automated builds**.
@y
   > [!NOTE]
   >
   > コードリポジトリサービスに [リンク](link-source.md) する設定ページにリダイレクトされる場合があります。
   > そうではない場合であって、既存の自動ビルドに対する設定を修正しようとしている場合は **Configure automated builds** (自動ビルドの設定) を選びます。
@z

@x
4. Select the **source repository** to build the Docker images from.
@y
4. Docker イメージをビルドする **source repository** (ソースリポジトリ) を選択します。
@z

@x
   > [!NOTE]
   >
   > You might need to specify an organization or user from
   > the source code provider. Once you select a user, source code
   > repositories appear in the **Select repository** drop-down list.
@y
   > [!NOTE]
   >
   > ソースプロバイダーが、組織あるいはユーザーの指定を要求してくるかもしれません。
   > ユーザーを選択すれば、**Select repository** (リポジトリ選択) のドロップダウンリスト内にソースコードリポジトリの一覧が表示されるようになります。
@z

@x
5. Optional. Enable [autotests](automated-testing.md#enable-automated-tests-on-a-repository).
@y
5. 必要に応じて [自動テスト](automated-testing.md#enable-automated-tests-on-a-repository) を有効にします。
@z

@x
6. Review the default **Build Rules**.
@y
6. デフォルトの **Build Rules** (ビルドルール) を確認します。
@z

@x
    Build rules control what Docker Hub builds into images from the contents
    of the source code repository, and how the resulting images are tagged
    within the Docker repository.
@y
    Build rules control what Docker Hub builds into images from the contents
    of the source code repository, and how the resulting images are tagged
    within the Docker repository.
@z

@x
    A default build rule is set up for you, which you can edit or delete. This
    default rule sets builds from the `Branch` in your source code repository
    called `master` or `main`, and creates a Docker image tagged with `latest`.
    For more information, see [set up build rules](#set-up-build-rules).
@y
    A default build rule is set up for you, which you can edit or delete. This
    default rule sets builds from the `Branch` in your source code repository
    called `master` or `main`, and creates a Docker image tagged with `latest`.
    For more information, see [set up build rules](#set-up-build-rules).
@z

@x
7. Optional. Select the **plus** icon to add and [configure more build rules](#set-up-build-rules).
@y
7. Optional. Select the **plus** icon to add and [configure more build rules](#set-up-build-rules).
@z

@x
8. For each branch or tag, enable or disable the **Autobuild** toggle.
@y
8. For each branch or tag, enable or disable the **Autobuild** toggle.
@z

@x
    Only branches or tags with autobuild enabled are built, tested, and have
    the resulting image pushed to the repository. Branches with autobuild
    disabled are built for test purposes (if enabled at the repository
    level), but the built Docker image isn't pushed to the repository.
@y
    Only branches or tags with autobuild enabled are built, tested, and have
    the resulting image pushed to the repository. Branches with autobuild
    disabled are built for test purposes (if enabled at the repository
    level), but the built Docker image isn't pushed to the repository.
@z

@x
9. For each branch or tag, enable or disable the **Build Caching** toggle.
@y
9. For each branch or tag, enable or disable the **Build Caching** toggle.
@z

@x
    [Build caching](/manuals/build/building/best-practices.md#leverage-build-cache)
    can save time if you are building a large image frequently or have
    many dependencies. Leave the build caching disabled to
    make sure all of your dependencies are resolved at build time, or if
    you have a large layer that's quicker to build locally.
@y
    [Build caching](manuals/build/building/best-practices.md#leverage-build-cache)
    can save time if you are building a large image frequently or have
    many dependencies. Leave the build caching disabled to
    make sure all of your dependencies are resolved at build time, or if
    you have a large layer that's quicker to build locally.
@z

@x
10. Select **Save** to save the settings, or select **Save and build** to save and
   run an initial test.
@y
10. Select **Save** to save the settings, or select **Save and build** to save and
   run an initial test.
@z

@x
    > [!NOTE]
    >
    > A webhook is automatically added to your source code repository to notify
    > Docker Hub on every push. Only pushes to branches that are listed as the
    > source for one or more tags, trigger a build.
@y
    > [!NOTE]
    >
    > A webhook is automatically added to your source code repository to notify
    > Docker Hub on every push. Only pushes to branches that are listed as the
    > source for one or more tags, trigger a build.
@z

@x
### Set up build rules
@y
### Set up build rules
@z

@x
By default when you set up automated builds, a basic build rule is created for you.
This default rule watches for changes to the `master` or `main` branch in your source code
repository, and builds the `master` or `main` branch into a Docker image tagged with
`latest`.
@y
By default when you set up automated builds, a basic build rule is created for you.
This default rule watches for changes to the `master` or `main` branch in your source code
repository, and builds the `master` or `main` branch into a Docker image tagged with
`latest`.
@z

@x
In the **Build Rules** section, enter one or more sources to build.
@y
In the **Build Rules** section, enter one or more sources to build.
@z

@x
For each source:
@y
For each source:
@z

@x
* Select the **Source type** to build either a tag or a branch. This
  tells the build system what to look for in the source code repository.
@y
* Select the **Source type** to build either a tag or a branch. This
  tells the build system what to look for in the source code repository.
@z

@x
* Enter the name of the **Source** branch or tag you want to build.
@y
* Enter the name of the **Source** branch or tag you want to build.
@z

@x
  The first time you configure automated builds, a default build rule is set up
  for you. This default set builds from the `Branch` in your source code called
  `master`, and creates a Docker image tagged with `latest`.
@y
  The first time you configure automated builds, a default build rule is set up
  for you. This default set builds from the `Branch` in your source code called
  `master`, and creates a Docker image tagged with `latest`.
@z

@x
  You can also use a regex to select which source branches or tags to build.
  To learn more, see
  [regexes](#regexes-and-automated-builds).
@y
  You can also use a regex to select which source branches or tags to build.
  To learn more, see
  [regexes](#regexes-and-automated-builds).
@z

@x
* Enter the tag to apply to Docker images built from this source.
@y
* Enter the tag to apply to Docker images built from this source.
@z

@x
  If you configured a regex to select the source, you can reference the
  capture groups and use its result as part of the tag. To learn more, see
  [regexes](#regexes-and-automated-builds).
@y
  If you configured a regex to select the source, you can reference the
  capture groups and use its result as part of the tag. To learn more, see
  [regexes](#regexes-and-automated-builds).
@z

@x
* Specify the **Dockerfile location** as a path relative to the root of the source code repository. If the Dockerfile is at the repository root, leave this path set to `/`.
@y
* Specify the **Dockerfile location** as a path relative to the root of the source code repository. If the Dockerfile is at the repository root, leave this path set to `/`.
@z

@x
> [!NOTE]
>
> When Docker Hub pulls a branch from a source code repository, it performs a
> shallow clone - only the tip of the specified branch. Refer to
> [Advanced options for autobuild and autotest](advanced.md#source-repository-or-branch-clones)
> for more information.
@y
> [!NOTE]
>
> When Docker Hub pulls a branch from a source code repository, it performs a
> shallow clone - only the tip of the specified branch. Refer to
> [Advanced options for autobuild and autotest](advanced.md#source-repository-or-branch-clones)
> for more information.
@z

@x
### Environment variables for builds
@y
### Environment variables for builds
@z

@x
You can set the values for environment variables used in your build processes
when you configure an automated build. Add your build environment variables by
selecting the **plus** icon next to the **Build environment variables** section, and
then entering a variable name and the value.
@y
You can set the values for environment variables used in your build processes
when you configure an automated build. Add your build environment variables by
selecting the **plus** icon next to the **Build environment variables** section, and
then entering a variable name and the value.
@z

@x
When you set variable values from the Docker Hub UI, you can use them by the
commands you set in `hooks` files. However, they're stored so that only users who have `admin` access to the Docker Hub repository can see their values. This
means you can use them to store access tokens or other information that
should remain secret.
@y
When you set variable values from the Docker Hub UI, you can use them by the
commands you set in `hooks` files. However, they're stored so that only users who have `admin` access to the Docker Hub repository can see their values. This
means you can use them to store access tokens or other information that
should remain secret.
@z

@x
> [!NOTE]
>
> The variables set on the build configuration screen are used during
> the build processes only and shouldn't get confused with the environment
> values used by your service, for example to create service links.
@y
> [!NOTE]
>
> The variables set on the build configuration screen are used during
> the build processes only and shouldn't get confused with the environment
> values used by your service, for example to create service links.
@z

@x
## Advanced automated build options
@y
## Advanced automated build options
@z

@x
At the minimum you need a build rule composed of a source branch, or tag, and a
destination Docker tag to set up an automated build. You can also:
@y
At the minimum you need a build rule composed of a source branch, or tag, and a
destination Docker tag to set up an automated build. You can also:
@z

@x
- Change where the build looks for the Dockerfile
- Set a path to the files the build should use (the build context)
- Set up multiple static tags or branches to build from
- Use regular expressions (regexes) to dynamically select source code to build and
create dynamic tags
@y
- Change where the build looks for the Dockerfile
- Set a path to the files the build should use (the build context)
- Set up multiple static tags or branches to build from
- Use regular expressions (regexes) to dynamically select source code to build and
create dynamic tags
@z

@x
All of these options are available from the **Build configuration** screen for
each repository. In [Docker Hub](https://hub.docker.com), select **My Hub** > **Repositories**, and select the name of the repository you want to edit. Select the **Builds** tab, and then select **Configure Automated builds**.
@y
All of these options are available from the **Build configuration** screen for
each repository. In [Docker Hub](https://hub.docker.com), select **My Hub** > **Repositories**, and select the name of the repository you want to edit. Select the **Builds** tab, and then select **Configure Automated builds**.
@z

@x
### Tag and branch builds
@y
### Tag and branch builds
@z

@x
You can configure your automated builds so that pushes to specific branches or tags triggers a build.
@y
You can configure your automated builds so that pushes to specific branches or tags triggers a build.
@z

@x
1. In the **Build Rules** section, select the **plus** icon to add more sources to build.
@y
1. In the **Build Rules** section, select the **plus** icon to add more sources to build.
@z

@x
2.  Select the **Source type** to build either a tag or a branch.
@y
2.  Select the **Source type** to build either a tag or a branch.
@z

@x
    > [!NOTE]
    >
    > This tells the build system what type of source to look for in the code
    > repository.
@y
    > [!NOTE]
    >
    > This tells the build system what type of source to look for in the code
    > repository.
@z

@x
3. Enter the name of the **Source** branch or tag you want to build.
@y
3. Enter the name of the **Source** branch or tag you want to build.
@z

@x
    > [!NOTE]
    >
    > You can enter a name, or use a regex to match which source branch or tag
    > names to build. To learn more, see [regexes](index.md#regexes-and-automated-builds).
@y
    > [!NOTE]
    >
    > You can enter a name, or use a regex to match which source branch or tag
    > names to build. To learn more, see [regexes](index.md#regexes-and-automated-builds).
@z

@x
4. Enter the tag to apply to Docker images built from this source.
@y
4. Enter the tag to apply to Docker images built from this source.
@z

@x
   > [!NOTE]
   >
   > If you configured a regex to select the source, you can reference the
   > capture groups and use its result as part of the tag. To learn more, see
   > [regexes](index.md#regexes-and-automated-builds).
@y
   > [!NOTE]
   >
   > If you configured a regex to select the source, you can reference the
   > capture groups and use its result as part of the tag. To learn more, see
   > [regexes](index.md#regexes-and-automated-builds).
@z

@x
5. Repeat steps 2 through 4 for each new build rule you set up.
@y
5. Repeat steps 2 through 4 for each new build rule you set up.
@z

@x
### Set the build context and Dockerfile location
@y
### Set the build context and Dockerfile location
@z

@x
Depending on how you arrange the files in your source code repository, the
files required to build your images may not be at the repository root. If that's
the case, you can specify a path where the build looks for the files.
@y
Depending on how you arrange the files in your source code repository, the
files required to build your images may not be at the repository root. If that's
the case, you can specify a path where the build looks for the files.
@z

@x
The build context is the path to the files needed for the build, relative to
the root of the repository. Enter the path to these files in the **Build context** field. Enter `/` to set the build context as the root of the source code repository.
@y
The build context is the path to the files needed for the build, relative to
the root of the repository. Enter the path to these files in the **Build context** field. Enter `/` to set the build context as the root of the source code repository.
@z

@x
> [!NOTE]
>
> If you delete the default path `/` from the **Build context** field and leave
> it blank, the build system uses the path to the Dockerfile as the build
> context. However, to avoid confusion it's recommended that you specify the
> complete path.
@y
> [!NOTE]
>
> If you delete the default path `/` from the **Build context** field and leave
> it blank, the build system uses the path to the Dockerfile as the build
> context. However, to avoid confusion it's recommended that you specify the
> complete path.
@z

@x
You can specify the **Dockerfile location** as a path relative to the build
context. If the Dockerfile is at the root of the build context path, leave the
Dockerfile path set to `/`. If the build context field is blank, set the path
to the Dockerfile from the root of the source repository.
@y
You can specify the **Dockerfile location** as a path relative to the build
context. If the Dockerfile is at the root of the build context path, leave the
Dockerfile path set to `/`. If the build context field is blank, set the path
to the Dockerfile from the root of the source repository.
@z

@x
### Regexes and automated builds
@y
### Regexes and automated builds
@z

@x
You can specify a regular expression (regex) so that only matching branches or
tags are built. You can also use the results of the regex to create the Docker
tag that's applied to the built image.
@y
You can specify a regular expression (regex) so that only matching branches or
tags are built. You can also use the results of the regex to create the Docker
tag that's applied to the built image.
@z

@x
You can use up to nine regular expression capture groups, or expressions enclosed in parentheses, to select a source to build, and reference
these in the **Docker Tag** field using `{\1}` through `{\9}`.
@y
You can use up to nine regular expression capture groups, or expressions enclosed in parentheses, to select a source to build, and reference
these in the **Docker Tag** field using `{\1}` through `{\9}`.
@z

@x
<!-- Capture groups Not a priority
#### Regex example: build from version number branch and tag with version number
@y
<!-- Capture groups Not a priority
#### Regex example: build from version number branch and tag with version number
@z

@x
You could also use capture groups to build and label images that come from various
sources. For example, you might have
@y
You could also use capture groups to build and label images that come from various
sources. For example, you might have
@z

@x
`/(alice|bob)-v([0-9.]+)/` -->
@y
`/(alice|bob)-v([0-9.]+)/` -->
@z

@x
### Build images with BuildKit
@y
### Build images with BuildKit
@z

@x
Autobuilds use the BuildKit build system by default. If you want to use the legacy
Docker build system, add the [environment variable](index.md#environment-variables-for-builds)
`DOCKER_BUILDKIT=0`. Refer to the [BuildKit](/manuals/build/buildkit/_index.md)
page for more information on BuildKit.
@y
Autobuilds use the BuildKit build system by default. If you want to use the legacy
Docker build system, add the [environment variable](index.md#environment-variables-for-builds)
`DOCKER_BUILDKIT=0`. Refer to the [BuildKit](manuals/build/buildkit/_index.md)
page for more information on BuildKit.
@z

@x
## Autobuild for teams
@y
## Autobuild for teams
@z

@x
When you create an automated build repository in your own user account, you
can start, cancel, and retry builds, and edit and delete your own repositories.
@y
When you create an automated build repository in your own user account, you
can start, cancel, and retry builds, and edit and delete your own repositories.
@z

@x
These same actions are also available for team repositories from Docker Hub if
you are an owner. If you are a member of a
team with `write` permissions you can start, cancel, and retry builds in your
team's repositories, but you cannot edit the team repository settings or delete
the team repositories. If your user account has `read` permission, or if you're
a member of a team with `read` permission, you can view the build configuration
including any testing settings.
@y
These same actions are also available for team repositories from Docker Hub if
you are an owner. If you are a member of a
team with `write` permissions you can start, cancel, and retry builds in your
team's repositories, but you cannot edit the team repository settings or delete
the team repositories. If your user account has `read` permission, or if you're
a member of a team with `read` permission, you can view the build configuration
including any testing settings.
@z

@x
| Action/Permission     | Read | Write | Admin | Owner |
| --------------------- | ---- | ----- | ----- | ----- |
| view build details    |  x   |   x   |   x   |   x   |
| start, cancel, retry  |      |   x   |   x   |   x   |
| edit build settings   |      |       |   x   |   x   |
| delete build          |      |       |       |   x   |
@y
| Action/Permission     | Read | Write | Admin | Owner |
| --------------------- | ---- | ----- | ----- | ----- |
| view build details    |  x   |   x   |   x   |   x   |
| start, cancel, retry  |      |   x   |   x   |   x   |
| edit build settings   |      |       |   x   |   x   |
| delete build          |      |       |       |   x   |
@z

@x
### Service users for team autobuilds
@y
### Service users for team autobuilds
@z

@x
> [!NOTE]
>
> Only owners can set up automated builds for teams.
@y
> [!NOTE]
>
> Only owners can set up automated builds for teams.
@z

@x
When you set up automated builds for teams, you grant Docker Hub access to
your source code repositories using OAuth tied to a specific user account. This
means that Docker Hub has access to everything that the linked source provider
account can access.
@y
When you set up automated builds for teams, you grant Docker Hub access to
your source code repositories using OAuth tied to a specific user account. This
means that Docker Hub has access to everything that the linked source provider
account can access.
@z

@x
For organizations and teams, it's recommended you create a dedicated service account to grant access to the source provider. This ensures that no
builds break as individual users' access permissions change, and that an
individual user's personal projects aren't exposed to an entire organization.
@y
For organizations and teams, it's recommended you create a dedicated service account to grant access to the source provider. This ensures that no
builds break as individual users' access permissions change, and that an
individual user's personal projects aren't exposed to an entire organization.
@z

@x
This service account should have access to any repositories to be built,
and must have administrative access to the source code repositories so it can
manage deploy keys. If needed, you can limit this account to only a specific
set of repositories required for a specific build.
@y
This service account should have access to any repositories to be built,
and must have administrative access to the source code repositories so it can
manage deploy keys. If needed, you can limit this account to only a specific
set of repositories required for a specific build.
@z

@x
If you are building repositories with linked private submodules (private
dependencies), you also need to add an override `SSH_PRIVATE` environment
variable to automated builds associated with the account. For more information, see [Troubleshoot](troubleshoot.md#build-repositories-with-linked-private-submodules)
@y
If you are building repositories with linked private submodules (private
dependencies), you also need to add an override `SSH_PRIVATE` environment
variable to automated builds associated with the account. For more information, see [Troubleshoot](troubleshoot.md#build-repositories-with-linked-private-submodules)
@z

@x
1. Create a service user account on your source provider, and generate SSH keys for it.
2. Create a "build" team in your organization.
3. Ensure that the new "build" team has access to each repository and submodule you need to build.
@y
1. Create a service user account on your source provider, and generate SSH keys for it.
2. Create a "build" team in your organization.
3. Ensure that the new "build" team has access to each repository and submodule you need to build.
@z

@x
    1. On GitHub or Bitbucket, go to the repository's **Settings** page.
    2. Add the new "build" team to the list of approved users.
@y
    1. On GitHub or Bitbucket, go to the repository's **Settings** page.
    2. Add the new "build" team to the list of approved users.
@z

@x
        - GitHub: Add the team in **Collaborators and Teams**.
        - Bitbucket: Add the team in  **Access management**.
@y
        - GitHub: Add the team in **Collaborators and Teams**.
        - Bitbucket: Add the team in  **Access management**.
@z

@x
4. Add the service user to the "build" team on the source provider.
@y
4. Add the service user to the "build" team on the source provider.
@z

@x
5. Sign in to Docker Hub as an owner, switch to the organization, and follow the instructions to [link to source code repository](link-source.md) using the service account.
@y
5. Sign in to Docker Hub as an owner, switch to the organization, and follow the instructions to [link to source code repository](link-source.md) using the service account.
@z

@x
    > [!NOTE]
    >
    > You may need to sign out of your individual account on the source code provider to create the link to the service account.
@y
    > [!NOTE]
    >
    > You may need to sign out of your individual account on the source code provider to create the link to the service account.
@z

@x
6. Optional. Use the SSH keys you generated to set up any builds with private submodules, using the service account and [the previous instructions](troubleshoot.md#build-repositories-with-linked-private-submodules).
@y
6. Optional. Use the SSH keys you generated to set up any builds with private submodules, using the service account and [the previous instructions](troubleshoot.md#build-repositories-with-linked-private-submodules).
@z

@x
## What's Next?
@y
## What's Next?
@z

@x
- [Customize your build process](advanced.md) with environment variables, hooks, and more
- [Add automated tests](automated-testing.md)
- [Manage your builds](manage-builds.md)
- [Troubleshoot](troubleshoot.md)
@y
- [Customize your build process](advanced.md) with environment variables, hooks, and more
- [Add automated tests](automated-testing.md)
- [Manage your builds](manage-builds.md)
- [Troubleshoot](troubleshoot.md)
@z
