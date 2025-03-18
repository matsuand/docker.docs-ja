%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Automated tests
keywords: Automated, testing, repository
title: Automated repository tests
@y
description: Automated tests
keywords: Automated, testing, repository
title: Automated repository tests
@z

@x
> [!NOTE]
>
> Automated builds require a
> Docker Pro, Team, or Business subscription.
@y
> [!NOTE]
>
> Automated builds require a
> Docker Pro, Team, or Business subscription.
@z

@x
Docker Hub can automatically test changes to your source code repositories
using containers. You can enable `Autotest` on any Docker Hub repository
to run tests on each pull request to the source code repository to create a
continuous integration testing service.
@y
Docker Hub can automatically test changes to your source code repositories
using containers. You can enable `Autotest` on any Docker Hub repository
to run tests on each pull request to the source code repository to create a
continuous integration testing service.
@z

@x
Enabling `Autotest` builds an image for testing purposes, but does not
automatically push the built image to the Docker repository. If you want to push
built images to your Docker Hub repository, enable [Automated Builds](index.md).
@y
Enabling `Autotest` builds an image for testing purposes, but does not
automatically push the built image to the Docker repository. If you want to push
built images to your Docker Hub repository, enable [Automated Builds](index.md).
@z

@x
## Set up automated test files
@y
## Set up automated test files
@z

@x
To set up your automated tests, create a `docker-compose.test.yml` file which
defines a `sut` service that lists the tests to be run.
The `docker-compose.test.yml` file should be located in the same directory that
contains the Dockerfile used to build the image.
@y
To set up your automated tests, create a `docker-compose.test.yml` file which
defines a `sut` service that lists the tests to be run.
The `docker-compose.test.yml` file should be located in the same directory that
contains the Dockerfile used to build the image.
@z

@x
For example:
@y
For example:
@z

@x
```yaml
services:
  sut:
    build: .
    command: run_tests.sh
```
@y
```yaml
services:
  sut:
    build: .
    command: run_tests.sh
```
@z

@x
The previous example builds the repository, and runs the `run_tests.sh` file inside
a container using the built image.
@y
The previous example builds the repository, and runs the `run_tests.sh` file inside
a container using the built image.
@z

@x
You can define any number of linked services in this file. The only requirement
is that `sut` is defined. Its return code determines if tests passed or not.
Tests pass if the `sut` service returns `0`, and fail otherwise.
@y
You can define any number of linked services in this file. The only requirement
is that `sut` is defined. Its return code determines if tests passed or not.
Tests pass if the `sut` service returns `0`, and fail otherwise.
@z

@x
> [!NOTE]
> 
> Only the `sut` service and all other services listed in
> [`depends_on`](/reference/compose-file/services.md#depends_on) are
> started. If you have services that poll for changes in other services, be sure
> to include the polling services in the [`depends_on`](/reference/compose-file/services.md#depends_on)
> list to make sure all of your services start.
@y
> [!NOTE]
> 
> Only the `sut` service and all other services listed in
> [`depends_on`](reference/compose-file/services.md#depends_on) are
> started. If you have services that poll for changes in other services, be sure
> to include the polling services in the [`depends_on`](reference/compose-file/services.md#depends_on)
> list to make sure all of your services start.
@z

@x
You can define more than one `docker-compose.test.yml` file if needed. Any file
that ends in `.test.yml` is used for testing, and the tests run sequentially.
You can also use [custom build hooks](advanced.md#override-build-test-or-push-commands)
to further customize your test behavior.
@y
You can define more than one `docker-compose.test.yml` file if needed. Any file
that ends in `.test.yml` is used for testing, and the tests run sequentially.
You can also use [custom build hooks](advanced.md#override-build-test-or-push-commands)
to further customize your test behavior.
@z

@x
> [!NOTE]
>
> If you enable automated builds, they also run any tests defined
in the `test.yml` files.
@y
> [!NOTE]
>
> If you enable automated builds, they also run any tests defined
in the `test.yml` files.
@z

@x
## Enable automated tests on a repository
@y
## Enable automated tests on a repository
@z

@x
To enable testing on a source code repository, you must first create an
associated build-repository in Docker Hub. Your `Autotest` settings are
configured on the same page as [automated builds](index.md), however
you do not need to enable autobuilds to use autotest. Autobuild is enabled per
branch or tag, and you do not need to enable it at all.
@y
To enable testing on a source code repository, you must first create an
associated build-repository in Docker Hub. Your `Autotest` settings are
configured on the same page as [automated builds](index.md), however
you do not need to enable autobuilds to use autotest. Autobuild is enabled per
branch or tag, and you do not need to enable it at all.
@z

@x
Only branches that are configured to use autobuild push images to the
Docker repository, regardless of the Autotest settings.
@y
Only branches that are configured to use autobuild push images to the
Docker repository, regardless of the Autotest settings.
@z

@x
1. Sign in to Docker Hub and select **My Hub** > **Repositories**.
@y
1. Sign in to Docker Hub and select **My Hub** > **Repositories**.
@z

@x
2. Select the repository you want to enable `Autotest` on.
@y
2. Select the repository you want to enable `Autotest` on.
@z

@x
3. From the repository view, select the **Builds** tab.
@y
3. From the repository view, select the **Builds** tab.
@z

@x
4. Select **Configure automated builds**.
@y
4. Select **Configure automated builds**.
@z

@x
5. Configure the automated build settings as explained in [Automated builds](index.md).
@y
5. Configure the automated build settings as explained in [Automated builds](index.md).
@z

@x
    At minimum you must configure:
@y
    At minimum you must configure:
@z

@x
    * The source code repository
    * The build location
    * At least one build rule
@y
    * The source code repository
    * The build location
    * At least one build rule
@z

@x
6. Choose your **Autotest** option.
@y
6. Choose your **Autotest** option.
@z

@x
    The following options are available:
@y
    The following options are available:
@z

@x
    * `Off`: No additional test builds. Tests only run if they're configured
    as part of an automated build.
@y
    * `Off`: No additional test builds. Tests only run if they're configured
    as part of an automated build.
@z

@x
    * `Internal pull requests`: Run a test build for any pull requests
    to branches that match a build rule, but only when the pull request comes
    from the same source repository.
@y
    * `Internal pull requests`: Run a test build for any pull requests
    to branches that match a build rule, but only when the pull request comes
    from the same source repository.
@z

@x
    * `Internal and external pull requests`: Run a test build for any
    pull requests to branches that match a build rule, including when the
    pull request originated in an external source repository.
@y
    * `Internal and external pull requests`: Run a test build for any
    pull requests to branches that match a build rule, including when the
    pull request originated in an external source repository.
@z

@x
    > [!IMPORTANT]
    >
    >For security purposes, autotest on external pull requests is
    limited on public repositories. Private images are not pulled and
    environment variables defined in Docker Hub are not
    available. Automated builds continue to work as usual.
@y
    > [!IMPORTANT]
    >
    >For security purposes, autotest on external pull requests is
    limited on public repositories. Private images are not pulled and
    environment variables defined in Docker Hub are not
    available. Automated builds continue to work as usual.
@z

@x
7. Select **Save** to save the settings, or select **Save and build** to save and
run an initial test.
@y
7. Select **Save** to save the settings, or select **Save and build** to save and
run an initial test.
@z

@x
## Check your test results
@y
## Check your test results
@z

@x
From the repository's details page, select **Timeline**.
@y
From the repository's details page, select **Timeline**.
@z

@x
From this tab you can see any pending, in-progress, successful, and failed
builds and test runs for the repository.
@y
From this tab you can see any pending, in-progress, successful, and failed
builds and test runs for the repository.
@z

@x
You can choose any timeline entry to view the logs for each test run.
@y
You can choose any timeline entry to view the logs for each test run.
@z
