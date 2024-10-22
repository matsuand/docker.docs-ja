%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Understand what you can do with the Containers view on Docker Dashboard
keywords: Docker Dashboard, manage, containers, gui, dashboard, images, user manual
title: Explore the Containers view in Docker Desktop
@y
description: Understand what you can do with the Containers view on Docker Dashboard
keywords: Docker Dashboard, manage, containers, gui, dashboard, images, user manual
title: Docker Desktop におけるコンテナー画面の確認
@z

@x
The **Containers** view lists all your running containers and applications. You must have running or stopped containers and applications to see them listed.
@y
**Containers** (コンテナー) 画面 は、実行中のコンテナーやアプリケーションをすべて一覧表示します。
逆にコンテナーやアプリケーションを一覧から確認するには、それらが実行中であるか停止状態となっていなければなりません。
@z

@x
## Container actions
@y
## Container actions {#container-actions}
@z

@x
Use the **Search** field to search for any specific container.
@y
Use the **Search** field to search for any specific container.
@z

@x
From the **Containers** view you can perform the following actions:
- Pause/Resume
- Stop/Start/Restart
- View image packages and CVEs
- Delete
- Open the application in VS code
- Open the port exposed by the container in a browser
- Copy docker run. This lets you share container run details or modify certain parameters.
@y
From the **Containers** view you can perform the following actions:
- Pause/Resume
- Stop/Start/Restart
- View image packages and CVEs
- Delete
- Open the application in VS code
- Open the port exposed by the container in a browser
- Copy docker run. This lets you share container run details or modify certain parameters.
@z

@x
## Resource usage
@y
## Resource usage {#Resource-usage}
@z

@x
From the **Containers** view you can monitor your containers' CPU and memory usage over time. This can help you understand if something is wrong with your containers or if you need to allocate additional resources. 
@y
From the **Containers** view you can monitor your containers' CPU and memory usage over time. This can help you understand if something is wrong with your containers or if you need to allocate additional resources. 
@z

@x
When you [inspect a container](#inspect-a-container), the **Stats** tab displays further information about a container's resource utilization. You can see how much CPU, memory, network and disk space your container is using over time.
@y
When you [inspect a container](#inspect-a-container), the **Stats** tab displays further information about a container's resource utilization. You can see how much CPU, memory, network and disk space your container is using over time.
@z

@x
## Inspect a container
@y
## コンテナーの詳細確認 {#inspect-a-container}
@z

@x
You can obtain detailed information about the container when you select it.
@y
You can obtain detailed information about the container when you select it.
@z

@x
From here, you can use the quick action buttons to perform various actions such as pause, resume, start or stop, or explore the **Logs**, **Inspect**, **Bind mounts**, **Exec**, **Files**, and **Stats** tabs. 
@y
From here, you can use the quick action buttons to perform various actions such as pause, resume, start or stop, or explore the **Logs**, **Inspect**, **Bind mounts**, **Exec**, **Files**, and **Stats** tabs. 
@z

@x
### Logs
@y
### ログ {#logs}
@z

@x
Select **Logs** to see logs from the container. You can also:
@y
Select **Logs** to see logs from the container. You can also:
@z

@x
- Use `Cmd + f`/`Ctrl + f` to open the search bar and find specific entries.
  Search matches are highlighted in yellow.
- Press `Enter` or `Shift + Enter` to jump to the next or previous search match
  respectively. 
- Use the **Copy** icon in the top right-hand corner to copy all the logs to
  your clipboard.
- Automatically copy any logs content by highlighting a few lines or a section
  of the logs.
- Use the **Clear terminal** icon in the top right-hand corner to clear the
  logs terminal. 
- Select and view external links that may be in your logs. 
@y
- Use `Cmd + f`/`Ctrl + f` to open the search bar and find specific entries.
  Search matches are highlighted in yellow.
- Press `Enter` or `Shift + Enter` to jump to the next or previous search match
  respectively. 
- Use the **Copy** icon in the top right-hand corner to copy all the logs to
  your clipboard.
- Automatically copy any logs content by highlighting a few lines or a section
  of the logs.
- Use the **Clear terminal** icon in the top right-hand corner to clear the
  logs terminal. 
- Select and view external links that may be in your logs. 
@z

@x
### Inspect
@y
### Inspect
@z

@x
Select **Inspect** to view low-level information about the container. It displays the local path, version number of the image, SHA-256, port mapping, and other details.
@y
Select **Inspect** to view low-level information about the container. It displays the local path, version number of the image, SHA-256, port mapping, and other details.
@z

@x
### Integrated terminal
@y
### Integrated terminal
@z

@x
From the **Exec** tab, you can use the integrated terminal, on a running
container, directly within Docker Desktop. You are able to quickly run commands
within your container so you can understand its current state or debug when
something goes wrong.
@y
From the **Exec** tab, you can use the integrated terminal, on a running
container, directly within Docker Desktop. You are able to quickly run commands
within your container so you can understand its current state or debug when
something goes wrong.
@z

@x
Using the integrated terminal is the same as running one of the following commands:
@y
Using the integrated terminal is the same as running one of the following commands:
@z

@x
- `docker exec -it <container-id> /bin/sh`
- `docker exec -it <container-id> cmd.exe` when accessing Windows containers
- `docker debug <container-id>` when using debug mode
@y
- `docker exec -it <container-id> /bin/sh`
- `docker exec -it <container-id> cmd.exe` when accessing Windows containers
- `docker debug <container-id>` when using debug mode
@z

@x
The integrated terminal:
@y
The integrated terminal:
@z

@x
- Persists your session and **Debug mode** setting if you navigate to another
  part of the Docker Desktop Dashboard and then return.
- Supports copy, paste, search, and clearing your session.
- When not using debug mode, it automatically detects the default user for a
  running container from the image's Dockerfile. If no user is specified, or
  you're using debug mode, it defaults to `root`.
@y
- Persists your session and **Debug mode** setting if you navigate to another
  part of the Docker Desktop Dashboard and then return.
- Supports copy, paste, search, and clearing your session.
- When not using debug mode, it automatically detects the default user for a
  running container from the image's Dockerfile. If no user is specified, or
  you're using debug mode, it defaults to `root`.
@z

@x
#### Open the integrated terminal
@y
#### Open the integrated terminal
@z

@x
To open the integrated terminal, either:
@y
To open the integrated terminal, either:
@z

@x
- Hover over your running container and under the **Actions** column, select the **Show container actions**
  menu. From the drop-down menu, select **Open in terminal**.
- Or, select the container and then select the **Exec** tab.
@y
- Hover over your running container and under the **Actions** column, select the **Show container actions**
  menu. From the drop-down menu, select **Open in terminal**.
- Or, select the container and then select the **Exec** tab.
@z

@x
To use your external terminal, navigate to the **General** tab in **Settings**
and select the **System default** option under **Choose your terminal**.
@y
To use your external terminal, navigate to the **General** tab in **Settings**
and select the **System default** option under **Choose your terminal**.
@z

@x
#### Open the integrated terminal in debug mode
@y
#### Open the integrated terminal in debug mode
@z

@x
Debug mode requires a [Pro, Team, or Business subcription](/subscription/details/). Debug mode has several advantages, such as:
@y
Debug mode requires a [Pro, Team, or Business subcription](__SUBDIR__/subscription/details/). Debug mode has several advantages, such as:
@z

@x
- A customizable toolbox. The toolbox comes with many standard Linux tools
  pre-installed, such as `vim`, `nano`, `htop`, and `curl`. For more details, see the [`docker debug` CLI reference](/reference/cli/docker/debug/).
- The ability to access containers that don't have a shell, for example, slim or
  distroless containers.
@y
- A customizable toolbox. The toolbox comes with many standard Linux tools
  pre-installed, such as `vim`, `nano`, `htop`, and `curl`. For more details, see the [`docker debug` CLI reference](__SUBDIR__/reference/cli/docker/debug/).
- The ability to access containers that don't have a shell, for example, slim or
  distroless containers.
@z

@x
To open the integrated terminal in debug mode:
@y
To open the integrated terminal in debug mode:
@z

@x
1. Sign in to Docker Desktop with an account that has a Pro, Team, or Business
   subscription.
2. After you're signed in, either:
@y
1. Sign in to Docker Desktop with an account that has a Pro, Team, or Business
   subscription.
2. After you're signed in, either:
@z

@x
   - Hover over your running container and under the **Actions** column, select the **Show container actions**
     menu. From the drop-down menu, select **Use Docker Debug**.
   - Or, select the container and then select the **Debug** tab. If the
     **Debug** tab isn't visible, select the **Exec** tab and then enable the
     **Debug mode** setting.
@y
   - Hover over your running container and under the **Actions** column, select the **Show container actions**
     menu. From the drop-down menu, select **Use Docker Debug**.
   - Or, select the container and then select the **Debug** tab. If the
     **Debug** tab isn't visible, select the **Exec** tab and then enable the
     **Debug mode** setting.
@z

@x
To use debug mode by default when accessing the integrated terminal, navigate to
the **General** tab in **Settings** and select the **Enable Docker Debug by
default** option.
@y
To use debug mode by default when accessing the integrated terminal, navigate to
the **General** tab in **Settings** and select the **Enable Docker Debug by
default** option.
@z

@x
### Files
@y
### ファイル {#files}
@z

@x
Select **Files** to explore the filesystem of running or stopped containers. You
can also:
@y
Select **Files** to explore the filesystem of running or stopped containers. You
can also:
@z

@x
- See which files have been recently added, modified, or deleted
- Edit a file straight from the built-in editor
- Drag and drop files and folders between the host and the container
- Delete unnecessary files when you right-click on a file
- Download files and folders from the container straight to the host
@y
- See which files have been recently added, modified, or deleted
- Edit a file straight from the built-in editor
- Drag and drop files and folders between the host and the container
- Delete unnecessary files when you right-click on a file
- Download files and folders from the container straight to the host
@z

@x
## Additional resources
@y
## さらなる情報 {#additional-resources}
@z

@x
- [What is a container](/get-started/docker-concepts/the-basics/what-is-a-container.md)
- [Run multi-container applications](/get-started/docker-concepts/running-containers/multi-container-applications.md)
@y
- [コンテナーとは何か](get-started/docker-concepts/the-basics/what-is-a-container.md)
- [マルチコンテナーアプリの実行](get-started/docker-concepts/running-containers/multi-container-applications.md)
@z
