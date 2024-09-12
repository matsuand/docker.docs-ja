%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Persisting container data
@y
title: Persisting container data
@z

@x
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you the significance of data persistence in Docker
@y
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you the significance of data persistence in Docker
@z

@x
{{< youtube-embed 10_2BjqB_Ls >}}
@y
{{< youtube-embed 10_2BjqB_Ls >}}
@z

@x
## Explanation
@y
## Explanation
@z

@x
When a container starts, it uses the files and configuration provided by the image. Each container is able to create, modify, and delete files and does so without affecting any other containers. When the container is deleted, these file changes are also deleted.
@y
When a container starts, it uses the files and configuration provided by the image. Each container is able to create, modify, and delete files and does so without affecting any other containers. When the container is deleted, these file changes are also deleted.
@z

@x
While this ephemeral nature of containers is great, it poses a challenge when you want to persist the data. For example, if you restart a database container, you might not want to start with an empty database. So, how do you persist files?
@y
While this ephemeral nature of containers is great, it poses a challenge when you want to persist the data. For example, if you restart a database container, you might not want to start with an empty database. So, how do you persist files?
@z

@x
### Container volumes
@y
### Container volumes
@z

@x
Volumes are a storage mechanism that provide the ability to persist data beyond the lifecycle of an individual container. Think of it like providing a shortcut or symlink from inside the container to outside the container. 
@y
Volumes are a storage mechanism that provide the ability to persist data beyond the lifecycle of an individual container. Think of it like providing a shortcut or symlink from inside the container to outside the container. 
@z

@x
As an example, imagine you create a volume named `log-data`. 
@y
As an example, imagine you create a volume named `log-data`. 
@z

@x
```console
$ docker volume create log-data
```
@y
```console
$ docker volume create log-data
```
@z

@x
When starting a container with the following command, the volume will be mounted (or attached) into the container at `/logs`:
@y
When starting a container with the following command, the volume will be mounted (or attached) into the container at `/logs`:
@z

@x
```console
$ docker run -d -p 80:80 -v log-data:/logs docker/welcome-to-docker
```
@y
```console
$ docker run -d -p 80:80 -v log-data:/logs docker/welcome-to-docker
```
@z

@x
If the volume `log-data` doesn't exist, Docker will automatically create it for you. 
@y
If the volume `log-data` doesn't exist, Docker will automatically create it for you. 
@z

@x
When the container runs, all files it writes into the `/logs` folder will be saved in this volume, outside of the container. If you delete the container and start a new container using the same volume, the files will still be there.
@y
When the container runs, all files it writes into the `/logs` folder will be saved in this volume, outside of the container. If you delete the container and start a new container using the same volume, the files will still be there.
@z

@x
> **Sharing files using volumes**
>
> You can attach the same volume to multiple containers to share files between containers. This might be helpful in scenarios such as log aggregation, data pipelines, or other event-driven applications.
@y
> **Sharing files using volumes**
>
> You can attach the same volume to multiple containers to share files between containers. This might be helpful in scenarios such as log aggregation, data pipelines, or other event-driven applications.
@z

@x
### Managing volumes
@y
### Managing volumes
@z

@x
Volumes have their own lifecycle beyond that of containers and can grow quite large depending on the type of data and applications you’re using. The following commands will be helpful to manage volumes:
@y
Volumes have their own lifecycle beyond that of containers and can grow quite large depending on the type of data and applications you’re using. The following commands will be helpful to manage volumes:
@z

@x
- `docker volume ls` - list all volumes
- `docker volume rm <volume-name-or-id>` - remove a volume (only works when the volume is not attached to any containers)
- `docker volume prune` - remove all unused (unattached) volumes
@y
- `docker volume ls` - list all volumes
- `docker volume rm <volume-name-or-id>` - remove a volume (only works when the volume is not attached to any containers)
- `docker volume prune` - remove all unused (unattached) volumes
@z

@x
## Try it out
@y
## Try it out
@z

@x
In this guide, you’ll practice creating and using volumes to persist data created by a Postgres container. When the database runs, it stores files into the `/var/lib/postgresql/data` directory. By attaching the volume here, you will be able to restart the container multiple times while keeping the data.
@y
In this guide, you’ll practice creating and using volumes to persist data created by a Postgres container. When the database runs, it stores files into the `/var/lib/postgresql/data` directory. By attaching the volume here, you will be able to restart the container multiple times while keeping the data.
@z

@x
### Use volumes
@y
### Use volumes
@z

@x
1. [Download and install](/get-started/get-docker/) Docker Desktop.
@y
1. [Download and install](__SUBDIR__/get-started/get-docker/) Docker Desktop.
@z

@x
2. Start a container using the [Postgres image](https://hub.docker.com/_/postgres) with the following command:
@y
2. Start a container using the [Postgres image](https://hub.docker.com/_/postgres) with the following command:
@z

@x
    ```console
    $ docker run --name=db -e POSTGRES_PASSWORD=secret -d -v postgres_data:/var/lib/postgresql/data postgres
    ```
@y
    ```console
    $ docker run --name=db -e POSTGRES_PASSWORD=secret -d -v postgres_data:/var/lib/postgresql/data postgres
    ```
@z

@x
    This will start the database in the background, configure it with a password, and attach a volume to the directory PostgreSQL will persist the database files.
@y
    This will start the database in the background, configure it with a password, and attach a volume to the directory PostgreSQL will persist the database files.
@z

@x
3. Connect to the database by using the following command:
@y
3. Connect to the database by using the following command:
@z

@x
    ```console
    $ docker exec -ti db psql -U postgres
    ```
@y
    ```console
    $ docker exec -ti db psql -U postgres
    ```
@z

@x
4. In the PostgreSQL command line, run the following to create a database table and insert two records:
@y
4. In the PostgreSQL command line, run the following to create a database table and insert two records:
@z

@x
    ```text
    CREATE TABLE tasks (
        id SERIAL PRIMARY KEY,
        description VARCHAR(100)
    );
    INSERT INTO tasks (description) VALUES ('Finish work'), ('Have fun');
    ```
@y
    ```text
    CREATE TABLE tasks (
        id SERIAL PRIMARY KEY,
        description VARCHAR(100)
    );
    INSERT INTO tasks (description) VALUES ('Finish work'), ('Have fun');
    ```
@z

@x
5. Verify the data is in the database by running the following in the PostgreSQL command line:
@y
5. Verify the data is in the database by running the following in the PostgreSQL command line:
@z

@x
    ```text
    SELECT * FROM tasks;
    ```
@y
    ```text
    SELECT * FROM tasks;
    ```
@z

@x
    You should get output that looks like the following:
@y
    You should get output that looks like the following:
@z

@x
    ```text
     id | description
    ----+-------------
      1 | Finish work
      2 | Have fun
    (2 rows)
    ```
@y
    ```text
     id | description
    ----+-------------
      1 | Finish work
      2 | Have fun
    (2 rows)
    ```
@z

@x
6. Exit out of the PostgreSQL shell by running the following command:
@y
6. Exit out of the PostgreSQL shell by running the following command:
@z

@x
    ```console
    \q
    ```
@y
    ```console
    \q
    ```
@z

@x
7. Stop and remove the database container. Remember that, even though the container has been deleted, the data is persisted in the `postgres_data` volume.
@y
7. Stop and remove the database container. Remember that, even though the container has been deleted, the data is persisted in the `postgres_data` volume.
@z

@x
    ```console
    $ docker stop db
    $ docker rm db
    ```
@y
    ```console
    $ docker stop db
    $ docker rm db
    ```
@z

@x
8. Start a new container by running the following command, attaching the same volume with the persisted data:
@y
8. Start a new container by running the following command, attaching the same volume with the persisted data:
@z

@x
    ```console
    $ docker run --name=new-db -d -v postgres_data:/var/lib/postgresql/data postgres 
    ```
@y
    ```console
    $ docker run --name=new-db -d -v postgres_data:/var/lib/postgresql/data postgres 
    ```
@z

@x
    You might have noticed that the `POSTGRES_PASSWORD` environment variable has been omitted. That’s because that variable is only used when bootstrapping a new database.
@y
    You might have noticed that the `POSTGRES_PASSWORD` environment variable has been omitted. That’s because that variable is only used when bootstrapping a new database.
@z

@x
9. Verify the database still has the records by running the following command:
@y
9. Verify the database still has the records by running the following command:
@z

@x
    ```console
    $ docker exec -ti new-db psql -U postgres -c "SELECT * FROM tasks"
    ```
@y
    ```console
    $ docker exec -ti new-db psql -U postgres -c "SELECT * FROM tasks"
    ```
@z

@x
### View volume contents
@y
### View volume contents
@z

@x
The Docker Dashboard provides the ability to view the contents of any volume, as well as the ability to export, import, and clone volumes.
@y
The Docker Dashboard provides the ability to view the contents of any volume, as well as the ability to export, import, and clone volumes.
@z

@x
1. Open the Docker Dashboard and navigate to the **Volumes** view. In this view, you should see the **postgres_data** volume.
@y
1. Open the Docker Dashboard and navigate to the **Volumes** view. In this view, you should see the **postgres_data** volume.
@z

@x
2. Select the **postgres_data** volume’s name.
@y
2. Select the **postgres_data** volume’s name.
@z

@x
3. The **Data** tab shows the contents of the volume and provides the ability to navigate the files. Double-clicking on a file will let you see the contents and make changes.
@y
3. The **Data** tab shows the contents of the volume and provides the ability to navigate the files. Double-clicking on a file will let you see the contents and make changes.
@z

@x
4. Right-click on any file to save it or delete it.
@y
4. Right-click on any file to save it or delete it.
@z

@x
### Remove volumes
@y
### Remove volumes
@z

@x
Before removing a volume, it must not be attached to any containers. If you haven’t removed the previous container, do so with the following command (the `-f` will stop the container first and then remove it):
@y
Before removing a volume, it must not be attached to any containers. If you haven’t removed the previous container, do so with the following command (the `-f` will stop the container first and then remove it):
@z

@x
```console
$ docker rm -f new-db
```
@y
```console
$ docker rm -f new-db
```
@z

@x
There are a few methods to remove volumes, including the following:
@y
There are a few methods to remove volumes, including the following:
@z

@x
- Select the **Delete Volume** option on a volume in the Docker Dashboard.
- Use the `docker volume rm` command:
@y
- Select the **Delete Volume** option on a volume in the Docker Dashboard.
- Use the `docker volume rm` command:
@z

@x
    ```console
    $ docker volume rm postgres_data
    ```
- Use the `docker volume prune` command to remove all unused volumes:
@y
    ```console
    $ docker volume rm postgres_data
    ```
- Use the `docker volume prune` command to remove all unused volumes:
@z

@x
    ```console
    $ docker volume prune
    ```
@y
    ```console
    $ docker volume prune
    ```
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
The following resources will help you learn more about volumes:
@y
The following resources will help you learn more about volumes:
@z

@x
- [Manage data in Docker](/engine/storage)
- [Volumes](/engine/storage/volumes)
- [Volume mounts](/engine/containers/run/#volume-mounts)
@y
- [Manage data in Docker](__SUBDIR__/engine/storage)
- [Volumes](__SUBDIR__/engine/storage/volumes)
- [Volume mounts](__SUBDIR__/engine/containers/run/#volume-mounts)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Now that you have learned about persisting container data, it’s time to learn about sharing local files with containers.
@y
Now that you have learned about persisting container data, it’s time to learn about sharing local files with containers.
@z

@x
{{< button text="Sharing local files with containers" url="sharing-local-files" >}}
@y
{{< button text="Sharing local files with containers" url="sharing-local-files" >}}
@z
