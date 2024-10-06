%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Run your Java tests
linkTitle: Run your tests
@y
title: Java テストの実行
linkTitle: テストの実行
@z

@x
keywords: Java, build, test
description: How to build and run your Java tests
@y
keywords: Java, build, test
description: How to build and run your Java tests
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize a Java application](containerize.md).
@y
Complete all the previous sections of this guide, starting with [Containerize a Java application](containerize.md).
@z

@x
## Overview
@y
## Overview
@z

@x
Testing is an essential part of modern software development. Testing can mean a lot of things to different development teams. There are unit tests, integration tests and end-to-end testing. In this guide you'll take a look at running your unit tests in Docker.
@y
Testing is an essential part of modern software development. Testing can mean a lot of things to different development teams. There are unit tests, integration tests and end-to-end testing. In this guide you'll take a look at running your unit tests in Docker.
@z

@x
### Multi-stage Dockerfile for testing
@y
### Multi-stage Dockerfile for testing
@z

@x
In the following example, you'll pull the testing commands into your Dockerfile.
Replace the contents of your Dockerfile with the following.
@y
In the following example, you'll pull the testing commands into your Dockerfile.
Replace the contents of your Dockerfile with the following.
@z

% snip code...

@x
First, you added a new base stage. In the base stage, you added common instructions that both the test and deps stage will need.
@y
First, you added a new base stage. In the base stage, you added common instructions that both the test and deps stage will need.
@z

@x
Next, you added a new test stage labeled `test` based on the base stage. In this
stage you copied in the necessary source files and then specified `RUN` to run
`./mvnw test`. Instead of using `CMD`, you used `RUN` to run the tests. The
reason is that the `CMD` instruction runs when the container runs, and the `RUN`
instruction runs when the image is being built. When using `RUN`, the build will
fail if the tests fail.
@y
Next, you added a new test stage labeled `test` based on the base stage. In this
stage you copied in the necessary source files and then specified `RUN` to run
`./mvnw test`. Instead of using `CMD`, you used `RUN` to run the tests. The
reason is that the `CMD` instruction runs when the container runs, and the `RUN`
instruction runs when the image is being built. When using `RUN`, the build will
fail if the tests fail.
@z

@x
Finally, you updated the deps stage to be based on the base stage and removed
the instructions that are now in the base stage.
@y
Finally, you updated the deps stage to be based on the base stage and removed
the instructions that are now in the base stage.
@z

@x
Run the following command to build a new image using the test stage as the target and view the test results. Include `--progress=plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target-test` to target the test stage.
@y
Run the following command to build a new image using the test stage as the target and view the test results. Include `--progress=plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target-test` to target the test stage.
@z

@x
Now, build your image and run your tests. You'll run the `docker build` command and add the `--target test` flag so that you specifically run the test build stage.
@y
Now, build your image and run your tests. You'll run the `docker build` command and add the `--target test` flag so that you specifically run the test build stage.
@z

% snip command...

@x
You should see output containing the following
@y
You should see output containing the following
@z

% snip output...

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you’ll take a look at how to set up a CI/CD pipeline using
GitHub Actions.
@y
In the next section, you’ll take a look at how to set up a CI/CD pipeline using
GitHub Actions.
@z
