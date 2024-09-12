%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Share built image between jobs with GitHub Actions
linkTitle: Share image between jobs
description: Share an image between runners without pushing to a registry
keywords: ci, github actions, gha, buildkit, buildx
@y
title: Share built image between jobs with GitHub Actions
linkTitle: Share image between jobs
description: Share an image between runners without pushing to a registry
keywords: ci, github actions, gha, buildkit, buildx
@z

@x
As each job is isolated in its own runner, you can't use your built image
between jobs, except if you're using [self-hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners)
However, you can [pass data between jobs](https://docs.github.com/en/actions/using-workflows/storing-workflow-data-as-artifacts#passing-data-between-jobs-in-a-workflow)
in a workflow using the [actions/upload-artifact](https://github.com/actions/upload-artifact)
and [actions/download-artifact](https://github.com/actions/download-artifact)
actions:
@y
As each job is isolated in its own runner, you can't use your built image
between jobs, except if you're using [self-hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners)
However, you can [pass data between jobs](https://docs.github.com/en/actions/using-workflows/storing-workflow-data-as-artifacts#passing-data-between-jobs-in-a-workflow)
in a workflow using the [actions/upload-artifact](https://github.com/actions/upload-artifact)
and [actions/download-artifact](https://github.com/actions/download-artifact)
actions:
@z

% snip code...
