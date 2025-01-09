%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: how automated builds work
keywords: docker hub, automated builds
title: Automated builds
@y
description: how automated builds work
keywords: docker hub, automated builds
title: Automated builds
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
Docker Hub can automatically build images from source code in an external
repository and automatically push the built image to your Docker repositories.
@y
Docker Hub can automatically build images from source code in an external
repository and automatically push the built image to your Docker repositories.
@z

@x
![An automated build dashboard](images/index-dashboard.png)
@y
![An automated build dashboard](images/index-dashboard.png)
@z

@x
When you set up automated builds, also called autobuilds, you create a list of
branches and tags that you want to build into Docker images. When you push code
to a source-code branch, for example in GitHub, for one of those listed image
tags, the push uses a webhook to trigger a new build, which produces a Docker
image. The built image is then pushed to Docker Hub.
@y
When you set up automated builds, also called autobuilds, you create a list of
branches and tags that you want to build into Docker images. When you push code
to a source-code branch, for example in GitHub, for one of those listed image
tags, the push uses a webhook to trigger a new build, which produces a Docker
image. The built image is then pushed to Docker Hub.
@z

@x
> [!NOTE]
>
> You can still use `docker push` to push pre-built images to
repositories with automated builds configured.
@y
> [!NOTE]
>
> You can still use `docker push` to push pre-built images to
repositories with automated builds configured.
@z

@x
If you have automated tests configured, these run after building, but before
pushing to the registry. You can use these tests to create a continuous
integration workflow where a build that fails its tests doesn't push the built
image. Automated tests don't push images to the registry on their own. [Learn about automated image testing](automated-testing.md).
@y
If you have automated tests configured, these run after building, but before
pushing to the registry. You can use these tests to create a continuous
integration workflow where a build that fails its tests doesn't push the built
image. Automated tests don't push images to the registry on their own. [Learn about automated image testing](automated-testing.md).
@z

@x
Depending on your [subscription](https://www.docker.com/pricing),
you may get concurrent builds, which means that `N` autobuilds can be run at the
same time. `N` is configured according to your subscription. Once `N+1` builds
are running, any additional builds go into a queue to be run later.
@y
Depending on your [subscription](https://www.docker.com/pricing),
you may get concurrent builds, which means that `N` autobuilds can be run at the
same time. `N` is configured according to your subscription. Once `N+1` builds
are running, any additional builds go into a queue to be run later.
@z

@x
The maximum number of pending builds in the queue is 30 and Docker Hub discards further
requests. The number of concurrent builds for Pro is 5 and
for Team and Business is 15.
Automated builds can handle images of up to 10 GB in size.
@y
The maximum number of pending builds in the queue is 30 and Docker Hub discards further
requests. The number of concurrent builds for Pro is 5 and
for Team and Business is 15.
Automated builds can handle images of up to 10 GB in size.
@z
