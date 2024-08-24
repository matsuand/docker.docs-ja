%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Find the answers to container security related FAQs
keywords: Docker, Docker Hub, Docker Desktop secuirty FAQs, platform, Docker Scout, admin, security
title: Container security FAQs
@y
description: Find the answers to container security related FAQs
keywords: Docker, Docker Hub, Docker Desktop secuirty FAQs, platform, Docker Scout, admin, security
title: Container security FAQs
@z

@x
### How are containers isolated from the host in Docker Desktop?
@y
### How are containers isolated from the host in Docker Desktop?
@z

@x
Docker Desktop runs all containers inside a customized / minimal Linux virtual
machine (except for native Windows containers). This adds a strong layer of
isolation between containers and the host the machine, even if containers are
running rootful.
@y
Docker Desktop runs all containers inside a customized / minimal Linux virtual
machine (except for native Windows containers). This adds a strong layer of
isolation between containers and the host the machine, even if containers are
running rootful.
@z

@x
However note the following:
@y
However note the following:
@z

@x
* Containers have access to host files configured for file sharing via Settings
  -> Resources -> File Sharing (see the next FAQ question below for more info).
@y
* Containers have access to host files configured for file sharing via Settings
  -> Resources -> File Sharing (see the next FAQ question below for more info).
@z

@x
* By default, containers run as root but with limited capabilities inside the
  Docker Desktop VM. Containers running with elevated privileges (e.g.,
  `--privileged`, `--pid=host`, `--cap-add`, etc.) run as root with elevated
  privileges inside the Docker Desktop VM which gives them access to Docker
  Desktop VM internals, including the Docker Engine. Thus, users must be careful
  which containers they run with such privileges to avoid security breaches by
  malicious container images.
@y
* By default, containers run as root but with limited capabilities inside the
  Docker Desktop VM. Containers running with elevated privileges (e.g.,
  `--privileged`, `--pid=host`, `--cap-add`, etc.) run as root with elevated
  privileges inside the Docker Desktop VM which gives them access to Docker
  Desktop VM internals, including the Docker Engine. Thus, users must be careful
  which containers they run with such privileges to avoid security breaches by
  malicious container images.
@z

@x
* If [Enhanced Container Isolation (ECI)](/security/for-admins/hardened-desktop/enhanced-container-isolation/_index.md)
  mode is enabled, then each container runs within a dedicated Linux User
  Namespace inside the Docker Desktop VM, which means the container has no
  privileges within the Docker Desktop VM. Even when using the `--privileged`
  flag or similar, the container processes will only be privileged within the
  container's logical boundary, but unprivileged otherwise. In addition, ECI protects
  uses other advanced techniques to ensure they can't easily breach
  the Docker Desktop VM and Docker Engine within (see the ECI section for more
  info). No changes to the containers or user workflows are required as the
  extra protection is added under the covers.
@y
* If [Enhanced Container Isolation (ECI)](security/for-admins/hardened-desktop/enhanced-container-isolation/_index.md)
  mode is enabled, then each container runs within a dedicated Linux User
  Namespace inside the Docker Desktop VM, which means the container has no
  privileges within the Docker Desktop VM. Even when using the `--privileged`
  flag or similar, the container processes will only be privileged within the
  container's logical boundary, but unprivileged otherwise. In addition, ECI protects
  uses other advanced techniques to ensure they can't easily breach
  the Docker Desktop VM and Docker Engine within (see the ECI section for more
  info). No changes to the containers or user workflows are required as the
  extra protection is added under the covers.
@z

@x
### To which portions of the host filesystem do containers have read and write access?
@y
### To which portions of the host filesystem do containers have read and write access?
@z

@x
Containers can only access host files if these are shared via Settings -> Resources -> File Sharing,
and only when such files are bind-mounted into the container (e.g., `docker run -v /path/to/host/file:/mnt ...`).
@y
Containers can only access host files if these are shared via Settings -> Resources -> File Sharing,
and only when such files are bind-mounted into the container (e.g., `docker run -v /path/to/host/file:/mnt ...`).
@z

@x
### Can containers running as root gain access to admin-owned files or directories on the host?
@y
### Can containers running as root gain access to admin-owned files or directories on the host?
@z

@x
No; host file sharing (bind mount from the host filesystem) uses a user-space crafted
file server (running in `com.docker.backend` as the user running Docker
Desktop), so containers can’t gain any access that the user on the host doesn’t
already have.
@y
No; host file sharing (bind mount from the host filesystem) uses a user-space crafted
file server (running in `com.docker.backend` as the user running Docker
Desktop), so containers can’t gain any access that the user on the host doesn’t
already have.
@z
