%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Understand what you can do with the Logs view on Docker Dashboard
keywords: Docker Dashboard, manage, logs, gui, build logs, container logs, debugging, dashboard
title: Explore the Logs view in Docker Desktop
linkTitle: Logs
@y
description: Understand what you can do with the Logs view on Docker Dashboard
keywords: Docker Dashboard, manage, logs, gui, build logs, container logs, debugging, dashboard
title: Explore the Logs view in Docker Desktop
linkTitle: Logs
@z

@x
{{< summary-bar feature_name="Desktop logs" >}}
@y
{{< summary-bar feature_name="Desktop logs" >}}
@z

@x
The **Logs** view provides a unified, real-time log stream from all running containers and Kubernetes nodes in Docker Desktop. Unlike the logs accessible from the [**Containers** view](container.md), the **Logs** view lets you monitor and search log output across your entire environment from a single interface.
@y
The **Logs** view provides a unified, real-time log stream from all running containers and Kubernetes nodes in Docker Desktop. Unlike the logs accessible from the [**Containers** view](container.md), the **Logs** view lets you monitor and search log output across your entire environment from a single interface.
@z

@x
## Log entries
@y
## Log entries
@z

@x
Each log entry in the table view shows:
@y
Each log entry in the table view shows:
@z

@x
| Column        | Description                                                                    |
| ------------- | ------------------------------------------------------------------------------ |
| **Timestamp** | The date and time the log line was emitted, for example `2026-02-26 11:18:53`. |
| **Object**    | The container or node that produced the log line.                              |
| **Message**   | The full log message, including any status codes such as `[ OK ]`.             |
@y
| Column        | Description                                                                    |
| ------------- | ------------------------------------------------------------------------------ |
| **Timestamp** | The date and time the log line was emitted, for example `2026-02-26 11:18:53`. |
| **Object**    | The container or node that produced the log line.                              |
| **Message**   | The full log message, including any status codes such as `[ OK ]`.             |
@z

@x
Selecting the expand arrow to the left of a row reveals the full message for that entry.
@y
Selecting the expand arrow to the left of a row reveals the full message for that entry.
@z

@x
## Search and filter logs
@y
## Search and filter logs
@z

@x
Use the **Search** field at the top of the Logs view to find specific entries. The search bar supports:
@y
Use the **Search** field at the top of the Logs view to find specific entries. The search bar supports:
@z

@x
- Plain-text terms for exact match searches
- Regular expressions (for example, `/error|warn/`)
@y
- Plain-text terms for exact match searches
- Regular expressions (for example, `/error|warn/`)
@z

@x
You can save your search terms for easy-access later.
@y
You can save your search terms for easy-access later.
@z

@x
To refine the log stream further, select the **Filter** icon in the toolbar to open the container filter panel. From here you can:
@y
To refine the log stream further, select the **Filter** icon in the toolbar to open the container filter panel. From here you can:
@z

@x
- Check individual running containers to show only their output
- Check **Running containers** or **Stopped containers** to show or hide entire groups
- Use **Select all** or **Clear all** to quickly toggle every container at once
@y
- Check individual running containers to show only their output
- Check **Running containers** or **Stopped containers** to show or hide entire groups
- Use **Select all** or **Clear all** to quickly toggle every container at once
@z

@x
## Display options
@y
## Display options
@z

@x
Select the **Display options** icon in the toolbar to toggle the following:
@y
Select the **Display options** icon in the toolbar to toggle the following:
@z

@x
- **View build logs**: Include or exclude build-related log output in the stream
- **Table view**: Switch between a structured table layout and a plain log stream
@y
- **View build logs**: Include or exclude build-related log output in the stream
- **Table view**: Switch between a structured table layout and a plain log stream
@z

@x
The table view is useful when you need to correlate events across multiple containers because each row clearly shows which container emitted a given message and when.
@y
The table view is useful when you need to correlate events across multiple containers because each row clearly shows which container emitted a given message and when.
@z

@x
## Feedback
@y
## Feedback
@z

@x
Select **Give feedback** at the top of the view to share suggestions or report issues.
@y
Select **Give feedback** at the top of the view to share suggestions or report issues.
@z
