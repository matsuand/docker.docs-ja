%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Explore Builds
description: Understand how to use the Builds view in Docker Desktop
keywords: Docker Dashboard, manage, gui, dashboard, builders, builds
---
@y
---
title: Explore Builds
description: Understand how to use the Builds view in Docker Desktop
keywords: Docker Dashboard, manage, gui, dashboard, builders, builds
---
@z

@x
![Builds view in Docker Desktop](../images/builds-view.webp)
@y
![Builds view in Docker Desktop](../images/builds-view.webp)
@z

@x
The **Builds** view is a simple interface that lets you inspect your build
history and manage builders using Docker Desktop. By default, it
displays a list of all your ongoing and completed builds.
@y
The **Builds** view is a simple interface that lets you inspect your build
history and manage builders using Docker Desktop. By default, it
displays a list of all your ongoing and completed builds.
@z

@x
## Show build list
@y
## Show build list
@z

@x
Select the **Builds** view in the Docker Dashboard to open the build list.
@y
Select the **Builds** view in the Docker Dashboard to open the build list.
@z

@x
The build list shows running and completed builds for your active builders. The
top-right corner shows the name of your currently selected builder, and the
**Builder settings** button lets you [manage builders](#manage-builders) in the
Docker Desktop settings.
@y
The build list shows running and completed builds for your active builders. The
top-right corner shows the name of your currently selected builder, and the
**Builder settings** button lets you [manage builders](#manage-builders) in the
Docker Desktop settings.
@z

@x
Running builds are displayed in the top section of this view, with information
about the build target and progress.
@y
Running builds are displayed in the top section of this view, with information
about the build target and progress.
@z

@x
The lower section of the view shows your recent builds. You can select any of
the builds from the active builds or completed builds section to view detailed
information, such as logs, a performance breakdown, cache utilization, and
more.
@y
The lower section of the view shows your recent builds. You can select any of
the builds from the active builds or completed builds section to view detailed
information, such as logs, a performance breakdown, cache utilization, and
more.
@z

@x
The build list doesn't include builds for inactive builders. That is, builders
that you've removed from your system, or builders that have been stopped.
@y
The build list doesn't include builds for inactive builders. That is, builders
that you've removed from your system, or builders that have been stopped.
@z

@x
## Inspect a build
@y
## Inspect a build
@z

@x
To inspect a build, select the build that you want to view in the list.
The inspection view contains a number of tabs:
@y
To inspect a build, select the build that you want to view in the list.
The inspection view contains a number of tabs:
@z

@x
### Info tab
@y
### Info tab
@z

@x
The **Info** tab displays details about the build.
@y
The **Info** tab displays details about the build.
@z

@x
If you're inspecting a multi-platform build, the drop-down menu in the
top-right of this tab lets you filter the information down to a specific
platform:
@y
If you're inspecting a multi-platform build, the drop-down menu in the
top-right of this tab lets you filter the information down to a specific
platform:
@z

@x
![Platform filter](../images/build-ui-platform-menu.webp?w=400)
@y
![Platform filter](../images/build-ui-platform-menu.webp?w=400)
@z

@x
The **Source details** section shows the filepath to the
[frontend](../../build/dockerfile/frontend.md) that was used and, if available,
information about the source code repository.
@y
The **Source details** section shows the filepath to the
[frontend](../../build/dockerfile/frontend.md) that was used and, if available,
information about the source code repository.
@z

@x
The **Build timing** section contains charts showing a breakdown of the build
execution from various angles.
@y
The **Build timing** section contains charts showing a breakdown of the build
execution from various angles.
@z

@x
- **Real time** refers to the wall-clock time that it took to complete the build.
- **Accumulated time** shows the total CPU time for all steps.
- **Cache usage** shows the extent to which build operations were cached.
- **Parallel execution** shows how much of the build execution time was spent running steps in parallel.
@y
- **Real time** refers to the wall-clock time that it took to complete the build.
- **Accumulated time** shows the total CPU time for all steps.
- **Cache usage** shows the extent to which build operations were cached.
- **Parallel execution** shows how much of the build execution time was spent running steps in parallel.
@z

@x
![Build timing charts](../images/build-ui-timing-chart.webp)
@y
![Build timing charts](../images/build-ui-timing-chart.webp)
@z

@x
The chart colors and legend keys describe the different build operations. Build
operations are defined as follows:
@y
The chart colors and legend keys describe the different build operations. Build
operations are defined as follows:
@z

@x
| Build operation      | Description                                                                                                                                                                     |
| :------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Local file transfers | Time spent transferring local files from the client to the builder.                                                                                                             |
| File operations      | Any operations that involve creating and copying files in the build. For example, the `COPY`, `WORKDIR`, `ADD` instructions in a Dockerfile frontend all incur file operations. |
| Image pulls          | Time spent pulling images.                                                                                                                                                      |
| Executions           | Container executions, for example commands defined as `RUN` instructions in a Dockerfile frontend.                                                                              |
| HTTP                 | Remote artifact downloads using `ADD`.                                                                                                                                          |
| Git                  | Same as **HTTP** but for Git URLs.                                                                                                                                              |
| Result exports       | Time spent exporting the build results.                                                                                                                                         |
| SBOM                 | Time spent generating the [SBOM attestation](../../build/attestations/sbom.md).                                                                                                 |
| Idle                 | Idle time for build workers, which can happen if you have configured a [max parallelism limit](../../build/buildkit/configure.md#max-parallelism).                              |
@y
| Build operation      | Description                                                                                                                                                                     |
| :------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Local file transfers | Time spent transferring local files from the client to the builder.                                                                                                             |
| File operations      | Any operations that involve creating and copying files in the build. For example, the `COPY`, `WORKDIR`, `ADD` instructions in a Dockerfile frontend all incur file operations. |
| Image pulls          | Time spent pulling images.                                                                                                                                                      |
| Executions           | Container executions, for example commands defined as `RUN` instructions in a Dockerfile frontend.                                                                              |
| HTTP                 | Remote artifact downloads using `ADD`.                                                                                                                                          |
| Git                  | Same as **HTTP** but for Git URLs.                                                                                                                                              |
| Result exports       | Time spent exporting the build results.                                                                                                                                         |
| SBOM                 | Time spent generating the [SBOM attestation](../../build/attestations/sbom.md).                                                                                                 |
| Idle                 | Idle time for build workers, which can happen if you have configured a [max parallelism limit](../../build/buildkit/configure.md#max-parallelism).                              |
@z

@x
The **Dependencies** section shows images and remote resources used to during
the build. Resources listed here include:
@y
The **Dependencies** section shows images and remote resources used to during
the build. Resources listed here include:
@z

@x
- Container images used during the build
- Git repositories included using the `ADD` Dockerfile instruction
- Remote HTTPS resources included using the `ADD` Dockerfile instruction
@y
- Container images used during the build
- Git repositories included using the `ADD` Dockerfile instruction
- Remote HTTPS resources included using the `ADD` Dockerfile instruction
@z

@x
The **Configuration** section shows parameters passed to the build:
@y
The **Configuration** section shows parameters passed to the build:
@z

@x
- Build arguments
- Secrets
- SSH sockets
- Labels
- Additional contexts
@y
- Build arguments
- Secrets
- SSH sockets
- Labels
- Additional contexts
@z

@x
The **Build results** section shows a summary of the generated build artifacts,
including the image manifest media type and digest, and information about build
attestations such as SBOM and provenance data.
@y
The **Build results** section shows a summary of the generated build artifacts,
including the image manifest media type and digest, and information about build
attestations such as SBOM and provenance data.
@z

@x
### Source tab
@y
### Source tab
@z

@x
The **Source** tab shows the [frontend](../../build/dockerfile/frontend.md)
used to create the build.
@y
The **Source** tab shows the [frontend](../../build/dockerfile/frontend.md)
used to create the build.
@z

@x
### Error tab
@y
### Error tab
@z

@x
The **Error** tab appears if the build finished with an error.
@y
The **Error** tab appears if the build finished with an error.
@z

@x
If the error was caused by an issue with the frontend, this tab displays the
frontend source with the error message inline where the build failed.
@y
If the error was caused by an issue with the frontend, this tab displays the
frontend source with the error message inline where the build failed.
@z

@x
### Logs tab
@y
### Logs tab
@z

@x
The **Logs** tab displays the build logs. If the build is currently running,
the logs are updated in real-time.
@y
The **Logs** tab displays the build logs. If the build is currently running,
the logs are updated in real-time.
@z

@x
### History tab
@y
### History tab
@z

@x
The **History** tab displays statistics data about completed builds.
@y
The **History** tab displays statistics data about completed builds.
@z

@x
The time series chart in the **Related history** section shows the duration,
build steps, and cache usage for related builds. This chart is useful for
identifying trends and changes in your build operations over time.
@y
The time series chart in the **Related history** section shows the duration,
build steps, and cache usage for related builds. This chart is useful for
identifying trends and changes in your build operations over time.
@z

@x
You can navigate to and inspect a related build by selecting it in the chart,
or in the **Past builds** list below the history tab.
@y
You can navigate to and inspect a related build by selecting it in the chart,
or in the **Past builds** list below the history tab.
@z

@x
## Manage builders
@y
## Manage builders
@z

@x
To inspect your builders, and change your default builder, select **Builder
settings** to open the settings menu.
@y
To inspect your builders, and change your default builder, select **Builder
settings** to open the settings menu.
@z

@x
![Builder settings drop-down](../images/build-ui-manage-builders.webp)
@y
![Builder settings drop-down](../images/build-ui-manage-builders.webp)
@z

@x
For more information about managing builders, see:
@y
For more information about managing builders, see:
@z

@x
- [Change settings, Windows](../settings/windows.md#builders)
- [Change settings, Mac](../settings/mac.md#builders)
- [Change settings, Linux](../settings/linux.md#builders)
@y
- [Change settings, Windows](../settings/windows.md#builders)
- [Change settings, Mac](../settings/mac.md#builders)
- [Change settings, Linux](../settings/linux.md#builders)
@z
