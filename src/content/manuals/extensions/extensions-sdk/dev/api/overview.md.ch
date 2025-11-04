%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Extension UI API
description: Docker extension development overview
keywords: Docker, extensions, sdk, development
@y
title: Extension UI API
description: Docker extension development overview
keywords: Docker, extensions, sdk, development
@z

@x
The extensions UI runs in a sandboxed environment and doesn't have access to any
electron or nodejs APIs.
@y
The extensions UI runs in a sandboxed environment and doesn't have access to any
electron or nodejs APIs.
@z

@x
The extension UI API provides a way for the frontend to perform different actions
and communicate with the Docker Desktop dashboard or the underlying system.
@y
The extension UI API provides a way for the frontend to perform different actions
and communicate with the Docker Desktop dashboard or the underlying system.
@z

@x
JavaScript API libraries, with Typescript support, are available in order to get all the API definitions in to your extension code.
@y
JavaScript API libraries, with Typescript support, are available in order to get all the API definitions in to your extension code.
@z

@x
- [@docker/extension-api-client](https://www.npmjs.com/package/@docker/extension-api-client) gives access to the extension API entrypoint `DockerDesktopClient`.
- [@docker/extension-api-client-types](https://www.npmjs.com/package/@docker/extension-api-client-types) can be added as a dev dependency in order to get types auto-completion in your IDE.
@y
- [@docker/extension-api-client](https://www.npmjs.com/package/@docker/extension-api-client) gives access to the extension API entrypoint `DockerDesktopClient`.
- [@docker/extension-api-client-types](https://www.npmjs.com/package/@docker/extension-api-client-types) can be added as a dev dependency in order to get types auto-completion in your IDE.
@z

@x
```Typescript
import { createDockerDesktopClient } from '@docker/extension-api-client';
@y
```Typescript
import { createDockerDesktopClient } from '@docker/extension-api-client';
@z

@x
export function App() {
  // obtain Docker Desktop client
  const ddClient = createDockerDesktopClient();
  // use ddClient to perform extension actions
}
```
@y
export function App() {
  // obtain Docker Desktop client
  const ddClient = createDockerDesktopClient();
  // use ddClient to perform extension actions
}
```
@z

@x
The `ddClient` object gives access to various APIs:
@y
The `ddClient` object gives access to various APIs:
@z

@x
- [Extension Backend](backend.md)
- [Docker](docker.md)
- [Dashboard](dashboard.md)
- [Navigation](dashboard-routes-navigation.md)
@y
- [Extension Backend](backend.md)
- [Docker](docker.md)
- [Dashboard](dashboard.md)
- [Navigation](dashboard-routes-navigation.md)
@z

@x
See also the [Extensions API reference](reference/api/extensions-sdk/_index.md).
@y
See also the [Extensions API reference](reference/api/extensions-sdk/_index.md).
@z
