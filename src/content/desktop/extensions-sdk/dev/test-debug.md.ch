%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Test and debug
description: Test and debug your extension.
keywords: Docker, Extensions, sdk, preview, update, Chrome DevTools
aliases:
- /desktop/extensions-sdk/build/test-debug/
---
@y
---
title: Test and debug
description: Test and debug your extension.
keywords: Docker, Extensions, sdk, preview, update, Chrome DevTools
aliases:
- /desktop/extensions-sdk/build/test-debug/
---
@z

@x
In order to improve the developer experience, Docker Desktop provides a set of tools to help you test and debug your extension.
@y
In order to improve the developer experience, Docker Desktop provides a set of tools to help you test and debug your extension.
@z

@x
### Open Chrome DevTools
@y
### Open Chrome DevTools
@z

@x
In order to open the Chrome DevTools for your extension when you click on the extension tab, run:
@y
In order to open the Chrome DevTools for your extension when you click on the extension tab, run:
@z

@x
```console
$ docker extension dev debug <name-of-your-extensions>
```
@y
```console
$ docker extension dev debug <name-of-your-extensions>
```
@z

@x
Each subsequent click on the extension tab also opens Chrome DevTools. To stop this behaviour, run:
@y
Each subsequent click on the extension tab also opens Chrome DevTools. To stop this behaviour, run:
@z

@x
```console
$ docker extension dev reset <name-of-your-extensions>
```
@y
```console
$ docker extension dev reset <name-of-your-extensions>
```
@z

@x
After an extension is deployed, it is also possible to open Chrome DevTools from the UI extension part using a variation of the [Konami Code](https://en.wikipedia.org/wiki/Konami_Code). Click on the extension tab, and then hit the key sequence `up, up, down, down, left, right, left, right, p, d, t`.
@y
After an extension is deployed, it is also possible to open Chrome DevTools from the UI extension part using a variation of the [Konami Code](https://en.wikipedia.org/wiki/Konami_Code). Click on the extension tab, and then hit the key sequence `up, up, down, down, left, right, left, right, p, d, t`.
@z

@x
### Hot reloading whilst developing the UI
@y
### Hot reloading whilst developing the UI
@z

@x
During UI development, it’s helpful to use hot reloading to test your changes without rebuilding your entire
extension. To do this, you can configure Docker Desktop to load your UI from a development server, such as the one
[Vite](https://vitejs.dev/) starts when invoked with `npm start`.
@y
During UI development, it’s helpful to use hot reloading to test your changes without rebuilding your entire
extension. To do this, you can configure Docker Desktop to load your UI from a development server, such as the one
[Vite](https://vitejs.dev/) starts when invoked with `npm start`.
@z

@x
Assuming your app runs on the default port, start your UI app and then run:
@y
Assuming your app runs on the default port, start your UI app and then run:
@z

@x
```console
$ cd ui
$ npm run dev
```
@y
```console
$ cd ui
$ npm run dev
```
@z

@x
This starts a development server that listens on port 3000.
@y
This starts a development server that listens on port 3000.
@z

@x
You can now tell Docker Desktop to use this as the frontend source. In another terminal run:
@y
You can now tell Docker Desktop to use this as the frontend source. In another terminal run:
@z

@x
```console
$ docker extension dev ui-source <name-of-your-extensions> http://localhost:3000
```
@y
```console
$ docker extension dev ui-source <name-of-your-extensions> http://localhost:3000
```
@z

@x
Close and reopen the Docker Desktop dashboard and go to your extension. All the changes to the frontend code are immediately visible.
@y
Close and reopen the Docker Desktop dashboard and go to your extension. All the changes to the frontend code are immediately visible.
@z

@x
Once finished, you can reset the extension configuration to the original settings. This will also reset opening Chrome DevTools if you used `docker extension dev debug <name-of-your-extensions>`:
@y
Once finished, you can reset the extension configuration to the original settings. This will also reset opening Chrome DevTools if you used `docker extension dev debug <name-of-your-extensions>`:
@z

@x
```console
$ docker extension dev reset <name-of-your-extensions>
```
@y
```console
$ docker extension dev reset <name-of-your-extensions>
```
@z

@x
## Show the extension containers
@y
## Show the extension containers
@z

@x
If your extension is composed of one or more services running as containers in the Docker Desktop VM, you can access them easily from the dashboard in Docker Desktop.
@y
If your extension is composed of one or more services running as containers in the Docker Desktop VM, you can access them easily from the dashboard in Docker Desktop.
@z

@x
1. In Docker Desktop, navigate to **Settings**.
2. Under the **Extensions** tab, select the **Show Docker Desktop Extensions system containers** option. You can now view your extension containers and their logs.
@y
1. In Docker Desktop, navigate to **Settings**.
2. Under the **Extensions** tab, select the **Show Docker Desktop Extensions system containers** option. You can now view your extension containers and their logs.
@z

@x
## Clean up
@y
## Clean up
@z

@x
To remove the extension, run:
@y
To remove the extension, run:
@z

@x
```console
$ docker extension rm <name-of-your-extension>
```
@y
```console
$ docker extension rm <name-of-your-extension>
```
@z

@x
## What's next
@y
## What's next
@z

@x
- Build an [advanced frontend](../build/frontend-extension-tutorial.md) extension.
- Learn more about extensions [architecture](../architecture/index.md).
- Explore our [design principles](../design/design-principles.md).
- Take a look at our [UI styling guidelines](../design/index.md).
- Learn how to [setup CI for your extension](./continuous-integration.md).
@y
- Build an [advanced frontend](../build/frontend-extension-tutorial.md) extension.
- Learn more about extensions [architecture](../architecture/index.md).
- Explore our [design principles](../design/design-principles.md).
- Take a look at our [UI styling guidelines](../design/index.md).
- Learn how to [setup CI for your extension](./continuous-integration.md).
@z
