%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Understand what you can do with the Containers view on Docker Dashboard
keywords: Docker Dashboard, manage, containers, gui, dashboard, images, user manual
title: Explore the Containers view in Docker Desktop
linkTitle: Containers
@y
description: Understand what you can do with the Containers view on Docker Dashboard
keywords: Docker Dashboard, manage, containers, gui, dashboard, images, user manual
title: Docker Desktop におけるコンテナー画面の確認
linkTitle: コンテナー
@z

@x
The **Containers** view lists all running and stopped containers and applications. It provides a clean interface to manage the lifecycle of your containers, interact with running applications, and inspect Docker objects窶琶ncluding Docker Compose apps.
@y
The **Containers** view lists all running and stopped containers and applications. It provides a clean interface to manage the lifecycle of your containers, interact with running applications, and inspect Docker objects窶琶ncluding Docker Compose apps.
@z

@x
## Toolbar and grid
@y
## Toolbar and grid
@z

@x
Use the **Search** field to find a specific container or Compose project by name.
@y
Use the **Search** field to find a specific container or Compose project by name.
@z

@x
The toolbar also lets you:
@y
The toolbar also lets you:
@z

@x
- Toggle **Only show running containers** to hide stopped containers from the grid.
- Customize the grid using the **Columns** button. You can show, hide, or reorder columns, including live stats like CPU %, memory usage/limit, memory %, disk read/write, network I/O, PIDs, and last-started time. Column choices persist between sessions.
- Select multiple containers or Compose projects using the row checkboxes, then use the bulk actions toolbar to start, pause, stop, or delete everything selected at once.
@y
- Toggle **Only show running containers** to hide stopped containers from the grid.
- Customize the grid using the **Columns** button. You can show, hide, or reorder columns, including live stats like CPU %, memory usage/limit, memory %, disk read/write, network I/O, PIDs, and last-started time. Column choices persist between sessions.
- Select multiple containers or Compose projects using the row checkboxes, then use the bulk actions toolbar to start, pause, stop, or delete everything selected at once.
@z

@x
Compose apps are grouped in the grid with an expand/collapse control. Selecting a project's checkbox selects or deselects all of its containers together.
@y
Compose apps are grouped in the grid with an expand/collapse control. Selecting a project's checkbox selects or deselects all of its containers together.
@z

@x
## Container actions
@y
## Container actions
@z

@x
Use the **Search** field to find a specific container by name.
@y
Use the **Search** field to find a specific container by name.
@z

@x
From the **Containers** view you can:
- Start, stop, pause, resume, or restart containers
- View image packages and CVEs
- Delete containers
- Open a terminal in the container
- Open the port exposed by the container in a browser
- Copy the `docker run` command for reuse or modification
- Use [Docker Debug](#execdebug)
@y
From the **Containers** view you can:
- Start, stop, pause, resume, or restart containers
- View image packages and CVEs
- Delete containers
- Open a terminal in the container
- Open the port exposed by the container in a browser
- Copy the `docker run` command for reuse or modification
- Use [Docker Debug](#execdebug)
@z

@x
From a Compose project's row, you get a similar set of actions scoped to the whole project: start/stop, pause, restart, view details, delete, and if [VS Code](https://code.visualstudio.com/) is set as your default editor, **Open in VS Code**.
@y
From a Compose project's row, you get a similar set of actions scoped to the whole project: start/stop, pause, restart, view details, delete, and if [VS Code](https://code.visualstudio.com/) is set as your default editor, **Open in VS Code**.
@z

@x
If [Gordon](/manuals/ai/gordon/_index.md) is available, each row can surface AI-suggested diagnostic questions and flag detected issues, such as "Container exited with an error" or "Container keeps restarting."
@y
If [Gordon](manuals/ai/gordon/_index.md) is available, each row can surface AI-suggested diagnostic questions and flag detected issues, such as "Container exited with an error" or "Container keeps restarting."
@z

@x
## Resource usage
@y
## Resource usage
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
From here, you can use the quick action buttons to perform various actions such as pause, resume, start or stop, or explore the **Logs**, **Inspect**, **Bind mounts**, **Debug**, **Files**, and **Stats** tabs. 
@y
From here, you can use the quick action buttons to perform various actions such as pause, resume, start or stop, or explore the **Logs**, **Inspect**, **Bind mounts**, **Debug**, **Files**, and **Stats** tabs. 
@z

@x
### Logs
@y
### ログ {#logs}
@z

@x
Select **Logs** to view output from the container in real time. While viewing logs, you can:
@y
Select **Logs** to view output from the container in real time. While viewing logs, you can:
@z

@x
- Use `Cmd + f`/`Ctrl + f` to open the search bar and find specific entries.
  Search matches are highlighted in yellow.
- Press `Enter` or `Shift + Enter` to jump to the next or previous search match
  respectively. 
- Use the **Copy** icon in the top right-hand corner to copy all the logs to
  your clipboard.
- Show timestamps
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
- Show timestamps
- Use the **Clear terminal** icon in the top right-hand corner to clear the
  logs terminal. 
- Select and view external links that may be in your logs. 
@z

@x
You can refine your view by:
@y
You can refine your view by:
@z

@x
- Filtering logs for specific containers, if you're running a multi-container application.
- Using regular expressions or exact match search terms
@y
- Filtering logs for specific containers, if you're running a multi-container application.
- Using regular expressions or exact match search terms
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
### Exec/Debug
@y
### Exec/Debug
@z

@x
If you have not enabled Docker Debug in settings, the **Exec** tab displays. It lets you quickly run commands within your running container.
@y
If you have not enabled Docker Debug in settings, the **Exec** tab displays. It lets you quickly run commands within your running container.
@z

@x
Using the **Exec** tab is the same as running one of the following commands:
@y
Using the **Exec** tab is the same as running one of the following commands:
@z

@x
- `docker exec -it <container-id> /bin/sh`
- `docker exec -it <container-id> cmd.exe` when accessing Windows containers
@y
- `docker exec -it <container-id> /bin/sh`
- `docker exec -it <container-id> cmd.exe` when accessing Windows containers
@z

@x
For more details, see the [`docker exec` CLI reference](/reference/cli/docker/container/exec/).
@y
For more details, see the [`docker exec` CLI reference](__SUBDIR__/reference/cli/docker/container/exec/).
@z

@x
If you have enabled Docker Debug in settings, or toggled on **Debug mode** to the right of the tab options, the **Debug** tab displays. 
@y
If you have enabled Docker Debug in settings, or toggled on **Debug mode** to the right of the tab options, the **Debug** tab displays. 
@z

@x
Debug mode has several advantages, such as:
@y
Debug mode has several advantages, such as:
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
To use debug mode:
@y
To use debug mode:
@z

@x
- Hover over your running container and under the **Actions** column, select the **Show container actions**
menu. From the drop-down menu, select **Use Docker Debug**.
- Or, select the container and then select the **Debug** tab. 
@y
- Hover over your running container and under the **Actions** column, select the **Show container actions**
menu. From the drop-down menu, select **Use Docker Debug**.
- Or, select the container and then select the **Debug** tab. 
@z

@x
To use debug mode by default, navigate to
the **General** tab in **Settings** and select the **Enable Docker Debug by
default** option.
@y
To use debug mode by default, navigate to
the **General** tab in **Settings** and select the **Enable Docker Debug by
default** option.
@z

@x
### Files
@y
### Files
@z

@x
Select **Files** to explore the filesystem of running containers. You
can also:
@y
Select **Files** to explore the filesystem of running containers. You
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
## Additional resources
@z

@x
- [What is a container](/get-started/docker-concepts/the-basics/what-is-a-container.md)
- [Run multi-container applications](/get-started/docker-concepts/running-containers/multi-container-applications.md)
@y
- [What is a container](get-started/docker-concepts/the-basics/what-is-a-container.md)
- [Run multi-container applications](get-started/docker-concepts/running-containers/multi-container-applications.md)
@z
