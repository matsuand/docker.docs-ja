%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Continuous Integration (CI)
description: Automatically test and validate your extension.
keywords: Docker, Extensions, sdk, CI, test, regression
@y
title: Continuous Integration (CI)
description: Automatically test and validate your extension.
keywords: Docker, Extensions, sdk, CI, test, regression
@z

@x
In order to help validate your extension and ensure it's functional, the Extension SDK provides tools to help you setup continuous integration for your extension.
@y
In order to help validate your extension and ensure it's functional, the Extension SDK provides tools to help you setup continuous integration for your extension.
@z

@x
> [!IMPORTANT]
>
> The [Docker Desktop Action](https://github.com/docker/desktop-action) and the [extension-test-helper library](https://www.npmjs.com/package/@docker/extension-test-helper) are both [experimental](https://docs.docker.com/release-lifecycle/#experimental).
@y
> [!IMPORTANT]
>
> The [Docker Desktop Action](https://github.com/docker/desktop-action) and the [extension-test-helper library](https://www.npmjs.com/package/@docker/extension-test-helper) are both [experimental](https://docs.docker.com/release-lifecycle/#experimental).
@z

@x
## Setup CI environment with GitHub Actions
@y
## Setup CI environment with GitHub Actions
@z

@x
You need Docker Desktop to be able to install and validate your extension.
You can start Docker Desktop in GitHub Actions using the [Docker Desktop Action](https://github.com/docker/desktop-action), by adding the following to a workflow file:
@y
You need Docker Desktop to be able to install and validate your extension.
You can start Docker Desktop in GitHub Actions using the [Docker Desktop Action](https://github.com/docker/desktop-action), by adding the following to a workflow file:
@z

@x
```yaml
steps:
  - id: start_desktop
    uses: docker/desktop-action/start@v0.1.0
```
@y
```yaml
steps:
  - id: start_desktop
    uses: docker/desktop-action/start@v0.1.0
```
@z

@x
> [!NOTE]
>
> This action supports only Github Action macOS runners at the moment. You need to specify `runs-on: macOS-latest` for your end to end tests.
@y
> [!NOTE]
>
> This action supports only Github Action macOS runners at the moment. You need to specify `runs-on: macOS-latest` for your end to end tests.
@z

@x
Once the step has executed, the next steps use Docker Desktop and the Docker CLI to install and test the extension.
@y
Once the step has executed, the next steps use Docker Desktop and the Docker CLI to install and test the extension.
@z

@x
## Validating your extension with Puppeteer
@y
## Validating your extension with Puppeteer
@z

@x
Once Docker Desktop starts in CI, you can build, install, and validate your extension with Jest and Puppeteer.
@y
Once Docker Desktop starts in CI, you can build, install, and validate your extension with Jest and Puppeteer.
@z

@x
First, build and install the extension from your test:
@y
First, build and install the extension from your test:
@z

@x
```ts
import { DesktopUI } from "@docker/extension-test-helper";
import { exec as originalExec } from "child_process";
import * as util from "util";
@y
```ts
import { DesktopUI } from "@docker/extension-test-helper";
import { exec as originalExec } from "child_process";
import * as util from "util";
@z

@x
export const exec = util.promisify(originalExec);
@y
export const exec = util.promisify(originalExec);
@z

@x
// keep a handle on the app to stop it at the end of tests
let dashboard: DesktopUI;
@y
// keep a handle on the app to stop it at the end of tests
let dashboard: DesktopUI;
@z

@x
beforeAll(async () => {
  await exec(`docker build -t my/extension:latest .`, {
    cwd: "my-extension-src-root",
  });
@y
beforeAll(async () => {
  await exec(`docker build -t my/extension:latest .`, {
    cwd: "my-extension-src-root",
  });
@z

@x
  await exec(`docker extension install -f my/extension:latest`);
});
```
@y
  await exec(`docker extension install -f my/extension:latest`);
});
```
@z

@x
Then open the Docker Desktop Dashboard and run some tests in your extension's UI:
@y
Then open the Docker Desktop Dashboard and run some tests in your extension's UI:
@z

@x
```ts
describe("Test my extension", () => {
  test("should be functional", async () => {
    dashboard = await DesktopUI.start();
@y
```ts
describe("Test my extension", () => {
  test("should be functional", async () => {
    dashboard = await DesktopUI.start();
@z

@x
    const eFrame = await dashboard.navigateToExtension("my/extension");
@y
    const eFrame = await dashboard.navigateToExtension("my/extension");
@z

@x
    // use puppeteer APIs to manipulate the UI, click on buttons, expect visual display and validate your extension
    await eFrame.waitForSelector("#someElementId");
  });
});
```
@y
    // use puppeteer APIs to manipulate the UI, click on buttons, expect visual display and validate your extension
    await eFrame.waitForSelector("#someElementId");
  });
});
```
@z

@x
Finally, close the Docker Desktop Dashboard and uninstall your extension:
@y
Finally, close the Docker Desktop Dashboard and uninstall your extension:
@z

@x
```ts
afterAll(async () => {
  dashboard?.stop();
  await exec(`docker extension uninstall my/extension`);
});
```
@y
```ts
afterAll(async () => {
  dashboard?.stop();
  await exec(`docker extension uninstall my/extension`);
});
```
@z

@x
## What's next
@y
## What's next
@z

@x
- Build an [advanced frontend](/manuals/extensions/extensions-sdk/build/frontend-extension-tutorial.md) extension.
- Learn more about extensions [architecture](../architecture/_index.md).
- Learn how to [publish your extension](../extensions/_index.md).
@y
- Build an [advanced frontend](manuals/extensions/extensions-sdk/build/frontend-extension-tutorial.md) extension.
- Learn more about extensions [architecture](../architecture/_index.md).
- Learn how to [publish your extension](../extensions/_index.md).
@z
