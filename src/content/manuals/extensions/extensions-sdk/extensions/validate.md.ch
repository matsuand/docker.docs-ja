%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Validate your extension
linkTitle: Validate
description: Step three in the extension creation process
keywords: Docker, Extensions, sdk, validate, install
@y
title: Validate your extension
linkTitle: Validate
description: Step three in the extension creation process
keywords: Docker, Extensions, sdk, validate, install
@z

@x
Validate your extension before you share or publish it. Validating the extension ensures that the extension:
@y
Validate your extension before you share or publish it. Validating the extension ensures that the extension:
@z

@x
- Is built with the [image labels](labels.md) it requires to display correctly in the marketplace
- Installs and runs without problems
@y
- Is built with the [image labels](labels.md) it requires to display correctly in the marketplace
- Installs and runs without problems
@z

@x
The Extensions CLI lets you validate your extension before installing and running it locally.
@y
The Extensions CLI lets you validate your extension before installing and running it locally.
@z

@x
The validation checks if the extension’s `Dockerfile` specifies all the required labels and if the metadata file is valid against the JSON schema file.
@y
The validation checks if the extension’s `Dockerfile` specifies all the required labels and if the metadata file is valid against the JSON schema file.
@z

@x
To validate, run:
@y
To validate, run:
@z

@x
```console
$ docker extension validate <name-of-your-extension>
```
@y
```console
$ docker extension validate <name-of-your-extension>
```
@z

@x
If your extension is valid, the following message displays:
@y
If your extension is valid, the following message displays:
@z

@x
```console
The extension image "name-of-your-extension" is valid
```
@y
```console
The extension image "name-of-your-extension" is valid
```
@z

@x
Before the image is built, it's also possible to validate only the `metadata.json` file:
@y
Before the image is built, it's also possible to validate only the `metadata.json` file:
@z

@x
```console
$ docker extension validate /path/to/metadata.json
```
@y
```console
$ docker extension validate /path/to/metadata.json
```
@z

@x
The JSON schema used to validate the `metadata.json` file against can be found under the [releases page](https://github.com/docker/extensions-sdk/releases/latest).
@y
The JSON schema used to validate the `metadata.json` file against can be found under the [releases page](https://github.com/docker/extensions-sdk/releases/latest).
@z
