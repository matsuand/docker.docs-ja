%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Understand the process of creating an extension.
title: The build and publish process
keyword: Docker Extensions, sdk, build, create, publish
---
@y
---
description: Understand the process of creating an extension.
title: The build and publish process
keyword: Docker Extensions, sdk, build, create, publish
---
@z

@x
This documentation is structured so that it matches the steps you need to take when creating your extension. 
@y
This documentation is structured so that it matches the steps you need to take when creating your extension. 
@z

@x
There are two main parts to creating a Docker Extension:
@y
There are two main parts to creating a Docker Extension:
@z

@x
1. Build the foundations
2. Publish the extension
@y
1. Build the foundations
2. Publish the extension
@z

@x
## Part one: Build the foundations
@y
## Part one: Build the foundations
@z

@x
The build process consists of:
@y
The build process consists of:
@z

@x
- Installing the latest version of Docker Desktop.
- Setting up the directory with files, including the extension’s source code and the required extension-specific files.
- Creating the `Dockerfile` to build, publish, and run your extension in Docker Desktop.
- Configuring the metadata file which is required at the root of the image filesystem.
- Building and installing the extension.
@y
- Installing the latest version of Docker Desktop.
- Setting up the directory with files, including the extension’s source code and the required extension-specific files.
- Creating the `Dockerfile` to build, publish, and run your extension in Docker Desktop.
- Configuring the metadata file which is required at the root of the image filesystem.
- Building and installing the extension.
@z

@x
> **Tip**
>
> Whilst creating your extension, make sure you follow the [design](design/design-guidelines.md) and [UI styling](design/index.md) guidelines to ensure visual consistency and [level AA accessibility standards](https://www.w3.org/WAI/WCAG2AA-Conformance).
{ .tip }
@y
> **Tip**
>
> Whilst creating your extension, make sure you follow the [design](design/design-guidelines.md) and [UI styling](design/index.md) guidelines to ensure visual consistency and [level AA accessibility standards](https://www.w3.org/WAI/WCAG2AA-Conformance).
{ .tip }
@z

@x
For further inspiration, see the other examples in the [samples folder](https://github.com/docker/extensions-sdk/tree/main/samples).
@y
For further inspiration, see the other examples in the [samples folder](https://github.com/docker/extensions-sdk/tree/main/samples).
@z

@x
## Part two: Publish and distribute your extension
@y
## Part two: Publish and distribute your extension
@z

@x
Docker Desktop displays published extensions in the Extensions Marketplace. The Extensions Marketplace is a curated space where developers can discover extensions to improve their developer experience and upload their own extension to share with the world.
@y
Docker Desktop displays published extensions in the Extensions Marketplace. The Extensions Marketplace is a curated space where developers can discover extensions to improve their developer experience and upload their own extension to share with the world.
@z

@x
If you want your extension published in the Marketplace, read the [publish documentation](./extensions/publish.md).
@y
If you want your extension published in the Marketplace, read the [publish documentation](./extensions/publish.md).
@z

@x
{{< include "extensions-form.md" >}}
@y
{{< include "extensions-form.md" >}}
@z

@x
## What’s next?
@y
## What’s next?
@z

@x
If you want to get up and running with creating a Docker Extension, see the [Quickstart guide](quickstart.md).
@y
If you want to get up and running with creating a Docker Extension, see the [Quickstart guide](quickstart.md).
@z

@x
Alternatively, get started with reading the "Part one: Build" section for more in-depth information about each step of the extension creation process.
@y
Alternatively, get started with reading the "Part one: Build" section for more in-depth information about each step of the extension creation process.
@z

@x
For an in-depth tutorial of the entire build process, we recommend the following video walkthrough from DockerCon 2022.
@y
For an in-depth tutorial of the entire build process, we recommend the following video walkthrough from DockerCon 2022.
@z

@x
<iframe width="560" height="315" src="https://www.youtube.com/embed/Yv7OG-EGJsg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
@y
<iframe width="560" height="315" src="https://www.youtube.com/embed/Yv7OG-EGJsg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
@z
