%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Volumes top-level elements
description: Explore all the attributes the volumes top-level element can have.
keywords: compose, compose specification, volumes, compose file reference
---
@y
---
title: Volumes top-level elements
description: Explore all the attributes the volumes top-level element can have.
keywords: compose, compose specification, volumes, compose file reference
---
@z

@x
{{< include "compose/volumes.md" >}}
@y
{{< include "compose/volumes.md" >}}
@z

@x
To use a volume across multiple services, you must explicitly grant each service access by using the [volumes](05-services.md#volumes) attribute within the `services` top-level element. The `volumes` attribute has additional syntax that provides more granular control.
@y
To use a volume across multiple services, you must explicitly grant each service access by using the [volumes](05-services.md#volumes) attribute within the `services` top-level element. The `volumes` attribute has additional syntax that provides more granular control.
@z

@x
> **Tip**
>
> Working with large repositories or monorepos, or with virtual file systems that are no longer scaling with your codebase? 
> Compose now takes advantage of [Synchronized file shares](../../desktop/synchronized-file-sharing.md) and automatically creates file shares for bind mounts. 
> Ensure you're signed in to Docker with a paid subscription and have enabled both **Access experimental features** and **Manage Synchronized file shares with Compose** in Docker Desktop's settings.
{ .tip }
@y
> **Tip**
>
> Working with large repositories or monorepos, or with virtual file systems that are no longer scaling with your codebase? 
> Compose now takes advantage of [Synchronized file shares](../../desktop/synchronized-file-sharing.md) and automatically creates file shares for bind mounts. 
> Ensure you're signed in to Docker with a paid subscription and have enabled both **Access experimental features** and **Manage Synchronized file shares with Compose** in Docker Desktop's settings.
{ .tip }
@z

@x
## Example
@y
## Example
@z

@x
The following example shows a two-service setup where a database's data directory is shared with another service as a volume, named
`db-data`, so that it can be periodically backed up.
@y
The following example shows a two-service setup where a database's data directory is shared with another service as a volume, named
`db-data`, so that it can be periodically backed up.
@z

@x
```yml
services:
  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
@y
```yml
services:
  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
@z

@x
  backup:
    image: backup-service
    volumes:
      - db-data:/var/lib/backup/data
@y
  backup:
    image: backup-service
    volumes:
      - db-data:/var/lib/backup/data
@z

@x
volumes:
  db-data:
```
@y
volumes:
  db-data:
```
@z

@x
The `db-data` volume is mounted at the `/var/lib/backup/data` and `/etc/data` container paths for backup and backend respectively.
@y
The `db-data` volume is mounted at the `/var/lib/backup/data` and `/etc/data` container paths for backup and backend respectively.
@z

@x
Running `docker compose up` creates the volume if it doesn't already exist. Otherwise, the existing volume is used and is recreated if it's manually deleted outside of Compose.
@y
Running `docker compose up` creates the volume if it doesn't already exist. Otherwise, the existing volume is used and is recreated if it's manually deleted outside of Compose.
@z

@x
## Attributes
@y
## Attributes
@z

@x
An entry under the top-level `volumes` section can be empty, in which case it uses the container engine's default configuration for
creating a volume. Optionally, you can configure it with the following keys:
@y
An entry under the top-level `volumes` section can be empty, in which case it uses the container engine's default configuration for
creating a volume. Optionally, you can configure it with the following keys:
@z

@x
### driver
@y
### driver
@z

@x
Specifies which volume driver should be used. If the driver is not available, Compose returns an error and doesn't deploy the application.
@y
Specifies which volume driver should be used. If the driver is not available, Compose returns an error and doesn't deploy the application.
@z

@x
```yml
volumes:
  db-data:
    driver: foobar
```
@y
```yml
volumes:
  db-data:
    driver: foobar
```
@z

@x
### driver_opts
@y
### driver_opts
@z

@x
`driver_opts` specifies a list of options as key-value pairs to pass to the driver for this volume. The options are driver-dependent.
@y
`driver_opts` specifies a list of options as key-value pairs to pass to the driver for this volume. The options are driver-dependent.
@z

@x
```yml
volumes:
  example:
    driver_opts:
      type: "nfs"
      o: "addr=10.40.0.199,nolock,soft,rw"
      device: ":/docker/example"
```
@y
```yml
volumes:
  example:
    driver_opts:
      type: "nfs"
      o: "addr=10.40.0.199,nolock,soft,rw"
      device: ":/docker/example"
```
@z

@x
### external
@y
### external
@z

@x
If set to `true`:
 - `external` specifies that this volume already exists on the platform and its lifecycle is managed outside
of that of the application. Compose doesn't then create the volume, and returns an error if the volume doesn't  exist.
 - All other attributes apart from `name` are irrelevant. If Compose detects any other attribute, it rejects the Compose file as invalid.
@y
If set to `true`:
 - `external` specifies that this volume already exists on the platform and its lifecycle is managed outside
of that of the application. Compose doesn't then create the volume, and returns an error if the volume doesn't  exist.
 - All other attributes apart from `name` are irrelevant. If Compose detects any other attribute, it rejects the Compose file as invalid.
@z

@x
In the example below, instead of attempting to create a volume called
`{project_name}_db-data`, Compose looks for an existing volume simply
called `db-data` and mounts it into the `backend` service's containers.
@y
In the example below, instead of attempting to create a volume called
`{project_name}_db-data`, Compose looks for an existing volume simply
called `db-data` and mounts it into the `backend` service's containers.
@z

@x
```yml
services:
  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
@y
```yml
services:
  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
@z

@x
volumes:
  db-data:
    external: true
```
@y
volumes:
  db-data:
    external: true
```
@z

@x
### labels
@y
### labels
@z

@x
`labels` are used to add metadata to volumes. You can use either an array or a dictionary.
@y
`labels` are used to add metadata to volumes. You can use either an array or a dictionary.
@z

@x
It's recommended that you use reverse-DNS notation to prevent your labels from conflicting with those used by other software.
@y
It's recommended that you use reverse-DNS notation to prevent your labels from conflicting with those used by other software.
@z

@x
```yml
volumes:
  db-data:
    labels:
      com.example.description: "Database volume"
      com.example.department: "IT/Ops"
      com.example.label-with-empty-value: ""
```
@y
```yml
volumes:
  db-data:
    labels:
      com.example.description: "Database volume"
      com.example.department: "IT/Ops"
      com.example.label-with-empty-value: ""
```
@z

@x
```yml
volumes:
  db-data:
    labels:
      - "com.example.description=Database volume"
      - "com.example.department=IT/Ops"
      - "com.example.label-with-empty-value"
```
@y
```yml
volumes:
  db-data:
    labels:
      - "com.example.description=Database volume"
      - "com.example.department=IT/Ops"
      - "com.example.label-with-empty-value"
```
@z

@x
Compose sets `com.docker.compose.project` and `com.docker.compose.volume` labels.
@y
Compose sets `com.docker.compose.project` and `com.docker.compose.volume` labels.
@z

@x
### name
@y
### name
@z

@x
`name` sets a custom name for a volume. The name field can be used to reference volumes that contain special
characters. The name is used as is and is not scoped with the stack name.
@y
`name` sets a custom name for a volume. The name field can be used to reference volumes that contain special
characters. The name is used as is and is not scoped with the stack name.
@z

@x
```yml
volumes:
  db-data:
    name: "my-app-data"
```
@y
```yml
volumes:
  db-data:
    name: "my-app-data"
```
@z

@x
This makes it possible to make this lookup name a parameter of the Compose file, so that the model ID for the volume is hard-coded but the actual volume ID on the platform is set at runtime during deployment. 
@y
This makes it possible to make this lookup name a parameter of the Compose file, so that the model ID for the volume is hard-coded but the actual volume ID on the platform is set at runtime during deployment. 
@z

@x
For example, if `DATABASE_VOLUME=my_volume_001` in your `.env` file:
@y
For example, if `DATABASE_VOLUME=my_volume_001` in your `.env` file:
@z

@x
```yml
volumes:
  db-data:
    name: ${DATABASE_VOLUME}
```
@y
```yml
volumes:
  db-data:
    name: ${DATABASE_VOLUME}
```
@z

@x
Running `docker compose up` uses the volume called `my_volume_001`. 
@y
Running `docker compose up` uses the volume called `my_volume_001`. 
@z

@x
It can also be used in conjunction with the `external` property. This means the name of the volume used to lookup the actual volume on the platform is set separately from the name used to refer to it within the Compose file:
@y
It can also be used in conjunction with the `external` property. This means the name of the volume used to lookup the actual volume on the platform is set separately from the name used to refer to it within the Compose file:
@z

@x
```yml
volumes:
  db-data:
    external:
      name: actual-name-of-volume
```
@y
```yml
volumes:
  db-data:
    external:
      name: actual-name-of-volume
```
@z
