%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Extension metadata
description: Docker extension metadata
keywords: Docker, extensions, sdk, metadata
aliases:
- /desktop/extensions-sdk/extensions/METADATA
---
@y
---
title: Extension metadata
description: Docker extension metadata
keywords: Docker, extensions, sdk, metadata
aliases:
- /desktop/extensions-sdk/extensions/METADATA
---
@z

@x
## The metadata.json file
@y
## The metadata.json file
@z

@x
The `metadata.json` file is the entry point for your extension. It contains the metadata for your extension, such as the
name, version, and description. It also contains the information needed to build and run your extension. The image for
a Docker extension must include a `metadata.json` file at the root of its filesystem.
@y
The `metadata.json` file is the entry point for your extension. It contains the metadata for your extension, such as the
name, version, and description. It also contains the information needed to build and run your extension. The image for
a Docker extension must include a `metadata.json` file at the root of its filesystem.
@z

@x
The format of the `metadata.json` file must be:
@y
The format of the `metadata.json` file must be:
@z

@x
```json
{
    "icon": "extension-icon.svg",
    "ui": ...
    "vm": ...
    "host": ...
}
```
@y
```json
{
    "icon": "extension-icon.svg",
    "ui": ...
    "vm": ...
    "host": ...
}
```
@z

@x
The `ui`, `vm`, and `host` sections are optional and depend on what a given extension provides. They describe the extension content to be installed.
@y
The `ui`, `vm`, and `host` sections are optional and depend on what a given extension provides. They describe the extension content to be installed.
@z

@x
### UI section
@y
### UI section
@z

@x
The `ui` section defines a new tab that's added to the dashboard in Docker Desktop. It follows the form:
@y
The `ui` section defines a new tab that's added to the dashboard in Docker Desktop. It follows the form:
@z

@x
```json
"ui":{
    "dashboard-tab":
    {
        "title":"MyTitle",
        "root":"/ui",
        "src":"index.html"
    }
}
```
@y
```json
"ui":{
    "dashboard-tab":
    {
        "title":"MyTitle",
        "root":"/ui",
        "src":"index.html"
    }
}
```
@z

@x
`root` specifies the folder where the UI code is within the extension image filesystem.
`src` specifies the entrypoint that should be loaded in the extension tab.
@y
`root` specifies the folder where the UI code is within the extension image filesystem.
`src` specifies the entrypoint that should be loaded in the extension tab.
@z

@x
Other UI extension points will be available in the future.
@y
Other UI extension points will be available in the future.
@z

@x
### VM section
@y
### VM section
@z

@x
The `vm` section defines a backend service that runs inside the Desktop VM. It must define either an `image` or a
`docker-compose.yaml` file that specifies what service to run in the Desktop VM.
@y
The `vm` section defines a backend service that runs inside the Desktop VM. It must define either an `image` or a
`docker-compose.yaml` file that specifies what service to run in the Desktop VM.
@z

@x
```json
"vm": {
    "image":"${DESKTOP_PLUGIN_IMAGE}"
},
```
@y
```json
"vm": {
    "image":"${DESKTOP_PLUGIN_IMAGE}"
},
```
@z

@x
When you use `image`, a default compose file is generated for the extension.
@y
When you use `image`, a default compose file is generated for the extension.
@z

@x
> `${DESKTOP_PLUGIN_IMAGE}` is a specific keyword that allows an easy way to refer to the image packaging the extension.
> It is also possible to specify any other full image name here. However, in many cases using the same image makes
> things easier for extension development.
@y
> `${DESKTOP_PLUGIN_IMAGE}` is a specific keyword that allows an easy way to refer to the image packaging the extension.
> It is also possible to specify any other full image name here. However, in many cases using the same image makes
> things easier for extension development.
@z

@x
```json
"vm": {
    "composefile": "docker-compose.yaml"
},
```
@y
```json
"vm": {
    "composefile": "docker-compose.yaml"
},
```
@z

@x
The Compose file, with a volume definition for example, would look like:
@y
The Compose file, with a volume definition for example, would look like:
@z

@x
```yaml
services:
  myExtension:
    image: ${DESKTOP_PLUGIN_IMAGE}
    volumes:
      - /host/path:/container/path
```
@y
```yaml
services:
  myExtension:
    image: ${DESKTOP_PLUGIN_IMAGE}
    volumes:
      - /host/path:/container/path
```
@z

@x
### Host section
@y
### Host section
@z

@x
The `host` section defines executables that Docker Desktop copies on the host.
@y
The `host` section defines executables that Docker Desktop copies on the host.
@z

@x
```json
  "host": {
    "binaries": [
      {
        "darwin": [
          {
            "path": "/darwin/myBinary"
          },
        ],
        "windows": [
          {
            "path": "/windows/myBinary.exe"
          },
        ],
        "linux": [
          {
            "path": "/linux/myBinary"
          },
        ]
      }
    ]
  }
```
@y
```json
  "host": {
    "binaries": [
      {
        "darwin": [
          {
            "path": "/darwin/myBinary"
          },
        ],
        "windows": [
          {
            "path": "/windows/myBinary.exe"
          },
        ],
        "linux": [
          {
            "path": "/linux/myBinary"
          },
        ]
      }
    ]
  }
```
@z

@x
`binaries` defines a list of binaries Docker Desktop copies from the extension image to the host.
@y
`binaries` defines a list of binaries Docker Desktop copies from the extension image to the host.
@z

@x
`path` specifies the binary path in the image filesystem. Docker Desktop is responsible for copying these files in its own location, and the JavaScript API allows invokes these binaries.
@y
`path` specifies the binary path in the image filesystem. Docker Desktop is responsible for copying these files in its own location, and the JavaScript API allows invokes these binaries.
@z

@x
Learn how to [invoke executables](../guides/invoke-host-binaries.md).
@y
Learn how to [invoke executables](../guides/invoke-host-binaries.md).
@z
