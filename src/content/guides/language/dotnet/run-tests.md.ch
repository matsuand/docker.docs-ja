%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。

@x
title: Run .NET tests in a container
linkTitle: Run your tests
@y
title: Run .NET tests in a container
linkTitle: Run your tests
@z

@x
keywords: .NET, test
description: Learn how to run your .NET tests in a container.
@y
keywords: .NET, test
description: Learn how to run your .NET tests in a container.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize a .NET application](containerize.md).
@y
Complete all the previous sections of this guide, starting with [Containerize a .NET application](containerize.md).
@z

@x
## Overview
@y
## Overview
@z

@x
Testing is an essential part of modern software development. Testing can mean a
lot of things to different development teams. There are unit tests, integration
tests and end-to-end testing. In this guide you take a look at running your unit
tests in Docker when developing and when building.
@y
Testing is an essential part of modern software development. Testing can mean a
lot of things to different development teams. There are unit tests, integration
tests and end-to-end testing. In this guide you take a look at running your unit
tests in Docker when developing and when building.
@z

@x
## Run tests when developing locally
@y
## Run tests when developing locally
@z

@x
The sample application already has an xUnit test inside the `tests` directory. When developing locally, you can use Compose to run your tests.
@y
The sample application already has an xUnit test inside the `tests` directory. When developing locally, you can use Compose to run your tests.
@z

@x
Run the following command in the `docker-dotnet-sample` directory to run the tests inside a container.
@y
Run the following command in the `docker-dotnet-sample` directory to run the tests inside a container.
@z

@x
```console
$ docker compose run --build --rm server dotnet test /source/tests
```
@y
```console
$ docker compose run --build --rm server dotnet test /source/tests
```
@z

@x
You should see output that contains the following.
@y
You should see output that contains the following.
@z

@x
```console
Starting test execution, please wait...
A total of 1 test files matched the specified pattern.
@y
```console
Starting test execution, please wait...
A total of 1 test files matched the specified pattern.
@z

@x
Passed!  - Failed:     0, Passed:     1, Skipped:     0, Total:     1, Duration: < 1 ms - /source/tests/bin/Debug/net6.0/tests.dll (net6.0)
```
@y
Passed!  - Failed:     0, Passed:     1, Skipped:     0, Total:     1, Duration: < 1 ms - /source/tests/bin/Debug/net6.0/tests.dll (net6.0)
```
@z

@x
To learn more about the command, see [docker compose run](/reference/cli/docker/compose/run/).
@y
To learn more about the command, see [docker compose run](__SUBDIR__/reference/cli/docker/compose/run/).
@z

@x
## Run tests when building
@y
## Run tests when building
@z

@x
To run your tests when building, you need to update your Dockerfile. You can create a new test stage that runs the tests, or run the tests in the existing build stage. For this guide, update the Dockerfile to run the tests in the build stage.
@y
To run your tests when building, you need to update your Dockerfile. You can create a new test stage that runs the tests, or run the tests in the existing build stage. For this guide, update the Dockerfile to run the tests in the build stage.
@z

@x
The following is the updated Dockerfile.
@y
The following is the updated Dockerfile.
@z

% snip code...

@x
Run the following command to build an image using the build stage as the target and view the test results. Include `--progress=plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target build` to target the build stage.
@y
Run the following command to build an image using the build stage as the target and view the test results. Include `--progress=plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target build` to target the build stage.
@z

% snip command...

@x
You should see output containing the following.
@y
You should see output containing the following.
@z

% snip output...

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how to run tests when developing locally using Compose and how to run tests when building your image.
@y
In this section, you learned how to run tests when developing locally using Compose and how to run tests when building your image.
@z

@x
Related information:
 - [docker compose run](/reference/cli/docker/compose/run/)
@y
Related information:
 - [docker compose run](__SUBDIR__/reference/cli/docker/compose/run/)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Next, you’ll learn how to set up a CI/CD pipeline using GitHub Actions.
@y
Next, you’ll learn how to set up a CI/CD pipeline using GitHub Actions.
@z

@x
{{< button text="Configure CI/CD" url="configure-ci-cd.md" >}}
@y
{{< button text="Configure CI/CD" url="configure-ci-cd.md" >}}
@z
