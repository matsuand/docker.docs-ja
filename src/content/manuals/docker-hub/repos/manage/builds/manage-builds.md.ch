%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Manage autobuilds
description: How to manage autobuilds in Docker Hub
keywords: autobuilds, automated, docker hub, registry
@y
title: Manage autobuilds
description: How to manage autobuilds in Docker Hub
keywords: autobuilds, automated, docker hub, registry
@z

@x
> [!NOTE]
>
> Automated builds require a Docker Pro, Team, or Business subscription.
@y
> [!NOTE]
>
> Automated builds require a Docker Pro, Team, or Business subscription.
@z

@x
## Cancel or retry a build
@y
## Cancel or retry a build
@z

@x
While a build is in queue or running, a **Cancel** icon appears next to its build
report link on the **General** tab and on the **Builds** tab. You can also select
**Cancel** on the **Build report** page, or from the **Timeline** tab's logs
display for the build.
@y
While a build is in queue or running, a **Cancel** icon appears next to its build
report link on the **General** tab and on the **Builds** tab. You can also select
**Cancel** on the **Build report** page, or from the **Timeline** tab's logs
display for the build.
@z

@x
![List of builds showing the cancel icon](images/build-cancelicon.png)
@y
![List of builds showing the cancel icon](images/build-cancelicon.png)
@z

@x
## Check your active builds
@y
## Check your active builds
@z

@x
A summary of a repository's builds appears both on the repository **General**
tab, and in the **Builds** tab. The **Builds** tab also displays a color coded
bar chart of the build queue times and durations. Both views display the
pending, in progress, successful, and failed builds for any tag of the
repository.
@y
A summary of a repository's builds appears both on the repository **General**
tab, and in the **Builds** tab. The **Builds** tab also displays a color coded
bar chart of the build queue times and durations. Both views display the
pending, in progress, successful, and failed builds for any tag of the
repository.
@z

@x
![Active builds](images/index-active.png)
@y
![Active builds](images/index-active.png)
@z

@x
From either location, you can select a build job to view its build report. The
build report shows information about the build job. This includes the source
repository and branch, or tag, the build logs, the build duration, creation time and location, and the user account the build occurred in.
@y
From either location, you can select a build job to view its build report. The
build report shows information about the build job. This includes the source
repository and branch, or tag, the build logs, the build duration, creation time and location, and the user account the build occurred in.
@z

@x
> [!NOTE]
>
> You can now view the progress of your builds every 30 seconds when you refresh the **Builds** page. With the in-progress build logs, you can debug your builds before they're finished.
@y
> [!NOTE]
>
> You can now view the progress of your builds every 30 seconds when you refresh the **Builds** page. With the in-progress build logs, you can debug your builds before they're finished.
@z

@x
![Build report](./images/index-report.png)
@y
![Build report](./images/index-report.png)
@z

@x
## Disable an automated build
@y
## Disable an automated build
@z

@x
Automated builds are enabled per branch or tag, and can be disabled and
re-enabled. You might do this when you want to only build manually for
a while, for example when you are doing major refactoring in your code. Disabling autobuilds doesn't disable [autotests](automated-testing.md).
@y
Automated builds are enabled per branch or tag, and can be disabled and
re-enabled. You might do this when you want to only build manually for
a while, for example when you are doing major refactoring in your code. Disabling autobuilds doesn't disable [autotests](automated-testing.md).
@z

@x
To disable an automated build:
@y
To disable an automated build:
@z

@x
1. From the **Repositories** page, select a repository, and select the **Builds** tab.
@y
1. From the **Repositories** page, select a repository, and select the **Builds** tab.
@z

@x
2. Select **Configure automated builds** to edit the repository's build settings.
@y
2. Select **Configure automated builds** to edit the repository's build settings.
@z

@x
3. In the **Build Rules** section, locate the branch or tag you no longer want
to automatically build.
@y
3. In the **Build Rules** section, locate the branch or tag you no longer want
to automatically build.
@z

@x
4. Select the **Autobuild** toggle next to the configuration line. When disabled the toggle is gray.
@y
4. Select the **Autobuild** toggle next to the configuration line. When disabled the toggle is gray.
@z

@x
5. Select **Save**.
@y
5. Select **Save**.
@z
