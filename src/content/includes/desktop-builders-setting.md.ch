%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。

@x
If you have turned on the
[Docker Desktop Builds view](/desktop/use-desktop/builds/), you can use the
**Builders** tab to inspect and manage builders in the Docker Desktop settings.
@y
If you have turned on the
[Docker Desktop Builds view](__SUBDIR__/desktop/use-desktop/builds/), you can use the
**Builders** tab to inspect and manage builders in the Docker Desktop settings.
@z

@x
### Inspect
@y
### Inspect
@z

@x
To inspect builders, find the builder that you want to inspect and select the
expand icon. You can only inspect active builders.
@y
To inspect builders, find the builder that you want to inspect and select the
expand icon. You can only inspect active builders.
@z

@x
Inspecting an active builder shows:
@y
Inspecting an active builder shows:
@z

@x
- BuildKit version
- Status
- Driver type
- Supported capabilities and platforms
- Disk usage
- Endpoint address
@y
- BuildKit version
- Status
- Driver type
- Supported capabilities and platforms
- Disk usage
- Endpoint address
@z

@x
### Select a different builder
@y
### Select a different builder
@z

@x
The **Selected builder** section displays the selected builder.
To select a different builder:
@y
The **Selected builder** section displays the selected builder.
To select a different builder:
@z

@x
1. Find the builder that you want to use under **Available builders**
2. Open the drop-down menu next to the builder's name.
3. Select **Use** to switch to this builder.
@y
1. Find the builder that you want to use under **Available builders**
2. Open the drop-down menu next to the builder's name.
3. Select **Use** to switch to this builder.
@z

@x
Your build commands now use the selected builder by default.
@y
Your build commands now use the selected builder by default.
@z

@x
### Create a builder
@y
### Create a builder
@z

@x
To create a builder, use the Docker CLI. See
[Create a new builder](/build/builders/manage/#create-a-new-builder)
@y
To create a builder, use the Docker CLI. See
[Create a new builder](__SUBDIR__/build/builders/manage/#create-a-new-builder)
@z

@x
### Remove a builder
@y
### Remove a builder
@z

@x
You can remove a builder if:
@y
You can remove a builder if:
@z

@x
- The builder isn't your [selected builder](/build/builders/#selected-builder)
- The builder isn't [associated with a Docker context](/build/builders/#default-builder).
@y
- The builder isn't your [selected builder](__SUBDIR__/build/builders/#selected-builder)
- The builder isn't [associated with a Docker context](__SUBDIR__/build/builders/#default-builder).
@z

@x
  To remove builders associated with a Docker context, remove the context using
  the `docker context rm` command.
@y
  To remove builders associated with a Docker context, remove the context using
  the `docker context rm` command.
@z

@x
To remove a builder:
@y
To remove a builder:
@z

@x
1. Find the builder that you want to remove under **Available builders**
2. Open the drop-down menu.
3. Select **Remove** to remove this builder.
@y
1. Find the builder that you want to remove under **Available builders**
2. Open the drop-down menu.
3. Select **Remove** to remove this builder.
@z

@x
If the builder uses the `docker-container` or `kubernetes` driver,
the build cache is also removed, along with the builder.
@y
If the builder uses the `docker-container` or `kubernetes` driver,
the build cache is also removed, along with the builder.
@z

@x
### Stop and start a builder
@y
### Stop and start a builder
@z

@x
Builders that use the
[`docker-container` driver](/build/builders/drivers/docker-container/)
run the BuildKit daemon in a container.
You can start and stop the BuildKit container using the drop-down menu.
@y
Builders that use the
[`docker-container` driver](__SUBDIR__/build/builders/drivers/docker-container/)
run the BuildKit daemon in a container.
You can start and stop the BuildKit container using the drop-down menu.
@z

@x
Running a build automatically starts the container if it's stopped.
@y
Running a build automatically starts the container if it's stopped.
@z

@x
You can only start and stop builders using the `docker-container` driver.
@y
You can only start and stop builders using the `docker-container` driver.
@z
