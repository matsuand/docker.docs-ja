%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Antivirus software and Docker
description: General guidelines for using antivirus software with Docker
keywords: antivirus, security
---
@y
---
title: Antivirus software and Docker
description: General guidelines for using antivirus software with Docker
keywords: antivirus, security
---
@z

@x
When antivirus software scans files used by Docker, these files may be locked
in a way that causes Docker commands to hang.
@y
When antivirus software scans files used by Docker, these files may be locked
in a way that causes Docker commands to hang.
@z

@x
One way to reduce these problems is to add the Docker data directory
(`/var/lib/docker` on Linux, `%ProgramData%\docker` on Windows Server, or `$HOME/Library/Containers/com.docker.docker/` on Mac) to the
antivirus's exclusion list. However, this comes with the trade-off that viruses
or malware in Docker images, writable layers of containers, or volumes are not
detected. If you do choose to exclude Docker's data directory from background
virus scanning, you may want to schedule a recurring task that stops Docker,
scans the data directory, and restarts Docker.
@y
One way to reduce these problems is to add the Docker data directory
(`/var/lib/docker` on Linux, `%ProgramData%\docker` on Windows Server, or `$HOME/Library/Containers/com.docker.docker/` on Mac) to the
antivirus's exclusion list. However, this comes with the trade-off that viruses
or malware in Docker images, writable layers of containers, or volumes are not
detected. If you do choose to exclude Docker's data directory from background
virus scanning, you may want to schedule a recurring task that stops Docker,
scans the data directory, and restarts Docker.
@z
