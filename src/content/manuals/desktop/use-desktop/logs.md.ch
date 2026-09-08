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
The **Logs** view provides a unified, real-time log stream from all containers and recent builds in Docker Desktop. Unlike the logs accessible from the [**Containers** view](container.md), the **Logs** view lets you monitor and search log output (up to a maximum of 100 000 entries) across your entire environment from a single interface. 
@y
The **Logs** view provides a unified, real-time log stream from all containers and recent builds in Docker Desktop. Unlike the logs accessible from the [**Containers** view](container.md), the **Logs** view lets you monitor and search log output (up to a maximum of 100 000 entries) across your entire environment from a single interface. 
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
| **Object**    | The container or build that produced the log line.                             |
| **Message**   | The full log message, including any status codes such as `[ OK ]`.             |
@y
| Column        | Description                                                                    |
| ------------- | ------------------------------------------------------------------------------ |
| **Timestamp** | The date and time the log line was emitted, for example `2026-02-26 11:18:53`. |
| **Object**    | The container or build that produced the log line.                             |
| **Message**   | The full log message, including any status codes such as `[ OK ]`.             |
@z

@x
Selecting the expand arrow to the right of a row reveals the full message for that entry.
@y
Selecting the expand arrow to the right of a row reveals the full message for that entry.
@z

@x
## Search, filter, and export logs
@y
## Search, filter, and export logs
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
You can save your current filters as a preset for easy access later. Presets capture your container selection, build log visibility, and case sensitivity settings, as well as any active search terms. If no containers are selected, the preset is named all; otherwise it is named after the first selected container.
@y
You can save your current filters as a preset for easy access later. Presets capture your container selection, build log visibility, and case sensitivity settings, as well as any active search terms. If no containers are selected, the preset is named all; otherwise it is named after the first selected container.
@z

@x
To refine the log stream further, select the **Filter** icon in the toolbar to open the container filter panel. From here you can:
@y
To refine the log stream further, select the **Filter** icon in the toolbar to open the container filter panel. From here you can:
@z

@x
- Check individual containers to show only their output
- Check Compose stacks to show or hide entire groups
- Toggle off **View build logs** to exclude build-related log output in the stream
- Use **Select all** or **Clear container filters** to quickly toggle every container at once
@y
- Check individual containers to show only their output
- Check Compose stacks to show or hide entire groups
- Toggle off **View build logs** to exclude build-related log output in the stream
- Use **Select all** or **Clear container filters** to quickly toggle every container at once
@z

@x
Use the **Export** button in the top-right corner (available with Docker Desktop version 4.77 and later) to export all logs or only the logs that match your filters.
@y
Use the **Export** button in the top-right corner (available with Docker Desktop version 4.77 and later) to export all logs or only the logs that match your filters.
@z

@x
## Display settings
@y
## Display settings
@z

@x
Select the **Display settings** icon in the toolbar to toggle the following:
- **Wrap lines**
- **Show timestamps**
@y
Select the **Display settings** icon in the toolbar to toggle the following:
- **Wrap lines**
- **Show timestamps**
@z

@x
You can also choose **Clear logs** to remove log entries from the view (available with Docker Desktop 4.79 and later). A dialog lets you choose between two options:
@y
You can also choose **Clear logs** to remove log entries from the view (available with Docker Desktop 4.79 and later). A dialog lets you choose between two options:
@z

@x
- **Clear all logs**: Immediately hides all current log entries.
- **Clear logs before**: Activates a date and time picker. Only entries at or before the selected timestamp are hidden.
@y
- **Clear all logs**: Immediately hides all current log entries.
- **Clear logs before**: Activates a date and time picker. Only entries at or before the selected timestamp are hidden.
@z

@x
The cleared state persists across Docker Desktop restarts. Once entries are cleared, they cannot be restored.
@y
The cleared state persists across Docker Desktop restarts. Once entries are cleared, they cannot be restored.
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
