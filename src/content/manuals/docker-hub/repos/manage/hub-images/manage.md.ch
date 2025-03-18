%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Discover how to delete image tags.
keywords: Docker Hub, Hub, tags, delete
title: Image Management
linktitle: Image Management
@y
description: Discover how to delete image tags.
keywords: Docker Hub, Hub, tags, delete
title: Image Management
linktitle: Image Management
@z

@x
{{< summary-bar feature_name="Image management" >}}
@y
{{< summary-bar feature_name="Image management" >}}
@z

@x
Images and image indexes are the foundation of container images within a
repository. The following diagram shows the relationship between images and
image indexes.
@y
Images and image indexes are the foundation of container images within a
repository. The following diagram shows the relationship between images and
image indexes.
@z

@x
  ![a pretty wide image](./images/image-index.svg)
@y
  ![a pretty wide image](./images/image-index.svg)
@z

@x
This structure enables multi-architecture support through a single reference. It
is important to note that images are not always referenced by an image index.
The following objects are shown in the diagram.
@y
This structure enables multi-architecture support through a single reference. It
is important to note that images are not always referenced by an image index.
The following objects are shown in the diagram.
@z

@x
- Image index: An image that points to multiple architecture-specific images
  (like AMD and ARM), letting a single reference work across different
  platforms.
- Image: Individual container images that contain the actual configuration and
  layers for a specific architecture and operating system.
@y
- Image index: An image that points to multiple architecture-specific images
  (like AMD and ARM), letting a single reference work across different
  platforms.
- Image: Individual container images that contain the actual configuration and
  layers for a specific architecture and operating system.
@z

@x
## Manage repository images and image indexes
@y
## Manage repository images and image indexes
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
3. In the list, select a repository.
4. Select **Image Management**.
5. Search, filter, or sort the items.
   - Search: In the search box above the list, specify your search.
   - Filter: In the **Filter by** drop-down, select **Tagged**, **Image index**,
     or **Image**.
   - Sort: Select the column title for **Size**, **Last pushed**, or **Last
     pulled**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
3. In the list, select a repository.
4. Select **Image Management**.
5. Search, filter, or sort the items.
   - Search: In the search box above the list, specify your search.
   - Filter: In the **Filter by** drop-down, select **Tagged**, **Image index**,
     or **Image**.
   - Sort: Select the column title for **Size**, **Last pushed**, or **Last
     pulled**.
@z

@x
   > [!NOTE]
   >
   > Images that haven't been pulled in over 6 months are marked as **Stale** in
   > the **Status** column.
@y
   > [!NOTE]
   >
   > Images that haven't been pulled in over 6 months are marked as **Stale** in
   > the **Status** column.
@z

@x
6. Optional. Delete one or more items.
   1. Select the checkboxes next to the items in the list. Selecting any
      top-level index also removes any underlying images that aren't referenced
      elsewhere.
   2. Select **Preview and delete**.
   3. In the window that appears, verify the items that will be deleted and the
      amount of storage you will reclaim.
   4. Select **Delete forever**.
@y
6. Optional. Delete one or more items.
   1. Select the checkboxes next to the items in the list. Selecting any
      top-level index also removes any underlying images that aren't referenced
      elsewhere.
   2. Select **Preview and delete**.
   3. In the window that appears, verify the items that will be deleted and the
      amount of storage you will reclaim.
   4. Select **Delete forever**.
@z
