%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Understand what you can do with the Volumes view on Docker Dashboard
keywords: Docker Dashboard, manage, containers, gui, dashboard, volumes, user manual
title: Explore Volumes
---
@y
---
description: Understand what you can do with the Volumes view on Docker Dashboard
keywords: Docker Dashboard, manage, containers, gui, dashboard, volumes, user manual
title: Explore Volumes
---
@z

@x
The **Volumes** view in Docker Dashboard enables you to easily create and delete volumes and see which ones are being used. You can also see which container is using a specific volume and explore the files and folders in your volumes.
@y
The **Volumes** view in Docker Dashboard enables you to easily create and delete volumes and see which ones are being used. You can also see which container is using a specific volume and explore the files and folders in your volumes.
@z

@x
For more information about volumes, see [Use volumes](../../storage/volumes.md). For examples of how to use volumes in the GUI, see [Persiting the DB](../../get-started/05_persisting_data.md) and [Use bind mounts](../../get-started/06_bind_mounts.md).
@y
For more information about volumes, see [Use volumes](../../storage/volumes.md). For examples of how to use volumes in the GUI, see [Persiting the DB](../../get-started/05_persisting_data.md) and [Use bind mounts](../../get-started/06_bind_mounts.md).
@z

@x
By default, the **Volumes** view displays a list of all the volumes. Volumes that are currently used by a container display the **In Use** badge.
@y
By default, the **Volumes** view displays a list of all the volumes. Volumes that are currently used by a container display the **In Use** badge.
@z

@x
## Manage your volumes
@y
## Manage your volumes
@z

@x
Use the **Search** field to search for any specific volume. 
@y
Use the **Search** field to search for any specific volume. 
@z

@x
You can sort volumes by:
- Name
- Date created
- Size
@y
You can sort volumes by:
- Name
- Date created
- Size
@z

@x
From the **More options** menu to the right of the search bar, you can choose what volume information to display.
@y
From the **More options** menu to the right of the search bar, you can choose what volume information to display.
@z

@x
## Inspect a volume
@y
## Inspect a volume
@z

@x
To explore the details of a specific volume, select a volume from the list. This opens the detailed view.
@y
To explore the details of a specific volume, select a volume from the list. This opens the detailed view.
@z

@x
The **In Use** tab displays the name of the container using the volume, the image name, the port number used by the container, and the target. A target is a path inside a container that gives access to the files in the volume.
@y
The **In Use** tab displays the name of the container using the volume, the image name, the port number used by the container, and the target. A target is a path inside a container that gives access to the files in the volume.
@z

@x
The **Data** tab displays the files and folders in the volume and the file size. To save a file or a folder, hover over the file or folder and select on the more options menu. Select **Save As** and then specify a location to download the file.
@y
The **Data** tab displays the files and folders in the volume and the file size. To save a file or a folder, hover over the file or folder and select on the more options menu. Select **Save As** and then specify a location to download the file.
@z

@x
To delete a file or a folder from the volume, select **Remove** from the **More options** menu.
@y
To delete a file or a folder from the volume, select **Remove** from the **More options** menu.
@z

@x
## Remove a volume
@y
## Remove a volume
@z

@x
Removing a volume deletes the volume and all its data. 
@y
Removing a volume deletes the volume and all its data. 
@z

@x
To remove a volume, hover over the volume and then select the **Delete** icon. Alternatively, select the volume from the list and then select the **Delete** button.
@y
To remove a volume, hover over the volume and then select the **Delete** icon. Alternatively, select the volume from the list and then select the **Delete** button.
@z
