%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。
% snip 対応

@x
To start Docker Desktop for Linux:
@y
To start Docker Desktop for Linux:
@z

@x
1. Open your **Applications** menu in Gnome/KDE Desktop and search for **Docker Desktop**.
@y
1. Open your **Applications** menu in Gnome/KDE Desktop and search for **Docker Desktop**.
@z

@x
2. Select **Docker Desktop** to start Docker.
@y
2. Select **Docker Desktop** to start Docker.
@z

@x
   The Docker Subscription Service Agreement displays.
@y
   The Docker Subscription Service Agreement displays.
@z

@x
3. Select **Accept** to continue. Docker Desktop starts after you accept the terms.
@y
3. Select **Accept** to continue. Docker Desktop starts after you accept the terms.
@z

@x
   Note that Docker Desktop won't run if you do not agree to the terms. You can choose to accept the terms at a later date by opening Docker Desktop.
@y
   Note that Docker Desktop won't run if you do not agree to the terms. You can choose to accept the terms at a later date by opening Docker Desktop.
@z

@x
   For more information, see [Docker Desktop Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement). It is recommended that you also read the [FAQs](https://www.docker.com/pricing/faq).
@y
   For more information, see [Docker Desktop Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement). It is recommended that you also read the [FAQs](https://www.docker.com/pricing/faq).
@z

@x
Alternatively, open a terminal and run:
@y
Alternatively, open a terminal and run:
@z

% snip command...

@x
When Docker Desktop starts, it creates a dedicated [context](/engine/context/working-with-contexts) that the Docker CLI
can use as a target and sets it as the current context in use. This is to avoid
a clash with a local Docker Engine that may be running on the Linux host and
using the default context. On shutdown, Docker Desktop resets the current
context to the previous one.
@y
When Docker Desktop starts, it creates a dedicated [context](__SUBDIR__/engine/context/working-with-contexts) that the Docker CLI
can use as a target and sets it as the current context in use. This is to avoid
a clash with a local Docker Engine that may be running on the Linux host and
using the default context. On shutdown, Docker Desktop resets the current
context to the previous one.
@z

@x
The Docker Desktop installer updates Docker Compose and the Docker CLI binaries
on the host. It installs Docker Compose V2 and gives users the choice to
link it as docker-compose from the Settings panel. Docker Desktop installs
the new Docker CLI binary that includes cloud-integration capabilities in `/usr/local/bin/com.docker.cli`
and creates a symlink to the classic Docker CLI at `/usr/local/bin`.
@y
The Docker Desktop installer updates Docker Compose and the Docker CLI binaries
on the host. It installs Docker Compose V2 and gives users the choice to
link it as docker-compose from the Settings panel. Docker Desktop installs
the new Docker CLI binary that includes cloud-integration capabilities in `/usr/local/bin/com.docker.cli`
and creates a symlink to the classic Docker CLI at `/usr/local/bin`.
@z

@x
After you’ve successfully installed Docker Desktop, you can check the versions
of these binaries by running the following commands:
@y
After you’ve successfully installed Docker Desktop, you can check the versions
of these binaries by running the following commands:
@z

% snip command...

@x
To enable Docker Desktop to start on sign in, from the Docker menu, select
**Settings** > **General** > **Start Docker Desktop when you sign in to your computer**.
@y
To enable Docker Desktop to start on sign in, from the Docker menu, select
**Settings** > **General** > **Start Docker Desktop when you sign in to your computer**.
@z

@x
Alternatively, open a terminal and run:
@y
Alternatively, open a terminal and run:
@z

% snip command...

@x
To stop Docker Desktop, select the Docker menu icon to open the Docker menu and select **Quit Docker Desktop**.
@y
To stop Docker Desktop, select the Docker menu icon to open the Docker menu and select **Quit Docker Desktop**.
@z

@x
Alternatively, open a terminal and run:
@y
Alternatively, open a terminal and run:
@z

% snip command...
