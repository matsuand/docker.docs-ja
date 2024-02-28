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
history and manage builders using Docker Desktop.
@y
The **Builds** view is a simple interface that lets you inspect your build
history and manage builders using Docker Desktop.
@z

@x
Opening the **Builds** view in Docker Desktop displays a list of completed builds.
By default, the list is sorted by date, showing the most recent builds at the top.
You can switch to **Active builds** to view any ongoing builds.
@y
Opening the **Builds** view in Docker Desktop displays a list of completed builds.
By default, the list is sorted by date, showing the most recent builds at the top.
You can switch to **Active builds** to view any ongoing builds.
@z

@x
![Build UI screenshot active builds](../images/build-ui-active-builds.webp)
@y
![Build UI screenshot active builds](../images/build-ui-active-builds.webp)
@z

@x
If you're connected to a cloud builder through [Docker Build Cloud](../../build/cloud/_index.md),
the Builds view also lists any active or completed cloud builds by other team members
connected to the same cloud builder.
@y
If you're connected to a cloud builder through [Docker Build Cloud](../../build/cloud/_index.md),
the Builds view also lists any active or completed cloud builds by other team members
connected to the same cloud builder.
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
## Inspect builds
@y
## Inspect builds
@z

@x
To inspect a build, select the build that you want to view in the list.
The inspection view contains a number of tabs.
@y
To inspect a build, select the build that you want to view in the list.
The inspection view contains a number of tabs.
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
The **Source details** section shows information about the frontend
[frontend](../../build/dockerfile/frontend.md) and, if available,
the source code repository used for the build.
@y
The **Source details** section shows information about the frontend
[frontend](../../build/dockerfile/frontend.md) and, if available,
the source code repository used for the build.
@z

@x
### Build timing
@y
### Build timing
@z

@x
The **Build timing** section of the Info tab contains charts
showing a breakdown of the build execution from various angles.
@y
The **Build timing** section of the Info tab contains charts
showing a breakdown of the build execution from various angles.
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
### Build dependencies
@y
### Build dependencies
@z

@x
The **Dependencies** section shows images and remote resources used during
the build. Resources listed here include:
@y
The **Dependencies** section shows images and remote resources used during
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
### Arguments, secrets, and other parameters
@y
### Arguments, secrets, and other parameters
@z

@x
The **Configuration** section of the Info tab shows parameters passed to the build:
@y
The **Configuration** section of the Info tab shows parameters passed to the build:
@z

@x
- Build arguments, including the resolved value
- Secrets, including their IDs (but not their values)
- SSH sockets
- Labels
- [Additional contexts](/reference/cli/docker/buildx/build/#build-context)
@y
- Build arguments, including the resolved value
- Secrets, including their IDs (but not their values)
- SSH sockets
- Labels
- [Additional contexts](/reference/cli/docker/buildx/build/#build-context)
@z

@x
### Outputs and artifacts
@y
### Outputs and artifacts
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
### Dockerfile source and errors
@y
### Dockerfile source and errors
@z

@x
When inspecting a successful completed build or an ongoing active build,
the **Source** tab shows the [frontend](../../build/dockerfile/frontend.md)
used to create the build.
@y
When inspecting a successful completed build or an ongoing active build,
the **Source** tab shows the [frontend](../../build/dockerfile/frontend.md)
used to create the build.
@z

@x
If the build failed, an **Error** tab displays instead of the **Source** tab.
The error message is inlined in the Dockerfile source,
indicating where the failure happened and why.
@y
If the build failed, an **Error** tab displays instead of the **Source** tab.
The error message is inlined in the Dockerfile source,
indicating where the failure happened and why.
@z

@x
![Build error displayed inline in the Dockerfile](../images/build-ui-error.webp)
@y
![Build error displayed inline in the Dockerfile](../images/build-ui-error.webp)
@z

@x
### Build logs
@y
### Build logs
@z

@x
The **Logs** tab displays the build logs.
For active builds, the logs are updated in real-time.
@y
The **Logs** tab displays the build logs.
For active builds, the logs are updated in real-time.
@z

@x
You can toggle between a **List view** and a **Plain-text view** of a build log.
@y
You can toggle between a **List view** and a **Plain-text view** of a build log.
@z

@x
- The **List view** presents all build steps in a collapsible format,
  with a timeline for navigating the log along a time axis.
@y
- The **List view** presents all build steps in a collapsible format,
  with a timeline for navigating the log along a time axis.
@z

@x
- The **Plain-text view** displays the log as plain text.
@y
- The **Plain-text view** displays the log as plain text.
@z

@x
The **Copy** button lets you copy the plain-text version of the log to your clipboard.
@y
The **Copy** button lets you copy the plain-text version of the log to your clipboard.
@z

@x
### Build history
@y
### Build history
@z

@x
The **History** tab displays statistics data about completed builds.
@y
The **History** tab displays statistics data about completed builds.
@z

@x
The time series chart illustrates trends in duration, build steps, and cache usage for related builds,
helping you identify patterns and shifts in build operations over time.
For instance, significant spikes in build duration or a high number of cache misses
could signal opportunities for optimizing the Dockerfile.
@y
The time series chart illustrates trends in duration, build steps, and cache usage for related builds,
helping you identify patterns and shifts in build operations over time.
For instance, significant spikes in build duration or a high number of cache misses
could signal opportunities for optimizing the Dockerfile.
@z

@x
![Build history chart](../images/build-ui-history.webp)
@y
![Build history chart](../images/build-ui-history.webp)
@z

@x
You can navigate to and inspect a related build by selecting it in the chart,
or using the **Past builds** list below the chart.
@y
You can navigate to and inspect a related build by selecting it in the chart,
or using the **Past builds** list below the chart.
@z

@x
## Manage builders
@y
## Manage builders
@z

@x
The **Builder settings** view in the Docker Desktop settings lets you:
@y
The **Builder settings** view in the Docker Desktop settings lets you:
@z

@x
- Inspect the state and configuration of active builders
- Start and stop a builder
- Delete build history
- Add or remove builders (or connect and disconnect, in the case of cloud builders)
@y
- Inspect the state and configuration of active builders
- Start and stop a builder
- Delete build history
- Add or remove builders (or connect and disconnect, in the case of cloud builders)
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
