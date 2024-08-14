%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: UI styling overview for Docker extensions
description: Docker extension design
keywords: Docker, extensions, design
aliases:
 - /desktop/extensions-sdk/design/design-overview/
 - /desktop/extensions-sdk/design/overview/
 - /desktop/extensions-sdk/design/
---
@y
---
title: UI styling overview for Docker extensions
description: Docker extension design
keywords: Docker, extensions, design
aliases:
 - /desktop/extensions-sdk/design/design-overview/
 - /desktop/extensions-sdk/design/overview/
 - /desktop/extensions-sdk/design/
---
@z

@x
Our Design System is a constantly evolving set of specifications that aim to ensure visual consistency across Docker products, and meet [level AA accessibility standards](https://www.w3.org/WAI/WCAG2AA-Conformance). We've opened parts of it to extension authors, documenting basic styles (color, typography) and components. See: [Docker Extensions Styleguide](https://www.figma.com/file/U7pLWfEf6IQKUHLhdateBI/Docker-Design-Guidelines?node-id=1%3A28771).
@y
Our Design System is a constantly evolving set of specifications that aim to ensure visual consistency across Docker products, and meet [level AA accessibility standards](https://www.w3.org/WAI/WCAG2AA-Conformance). We've opened parts of it to extension authors, documenting basic styles (color, typography) and components. See: [Docker Extensions Styleguide](https://www.figma.com/file/U7pLWfEf6IQKUHLhdateBI/Docker-Design-Guidelines?node-id=1%3A28771).
@z

@x
We require extensions to match the wider Docker Desktop UI to a certain degree, and reserve the right to make this stricter in the future.
@y
We require extensions to match the wider Docker Desktop UI to a certain degree, and reserve the right to make this stricter in the future.
@z

@x
To get started on your UI, follow the steps below.
@y
To get started on your UI, follow the steps below.
@z

@x
## Step one: Choose your framework
@y
## Step one: Choose your framework
@z

@x
### Recommended: React+MUI, using our theme
@y
### Recommended: React+MUI, using our theme
@z

@x
Docker Desktop's UI is written in React and [MUI](https://mui.com/) (using Material UI to specific). This is the only officially supported framework for building extensions, and the one that our `init` command automatically configures for you. Using it brings significant benefits to authors:
@y
Docker Desktop's UI is written in React and [MUI](https://mui.com/) (using Material UI to specific). This is the only officially supported framework for building extensions, and the one that our `init` command automatically configures for you. Using it brings significant benefits to authors:
@z

@x
- You can use our [Material UI theme](https://www.npmjs.com/package/@docker/docker-mui-theme) to automatically replicate Docker Desktop's look and feel.
- In future, we'll release utilities and components specifically targeting this combination (e.g. custom MUI components, or React hooks for interacting with Docker).
@y
- You can use our [Material UI theme](https://www.npmjs.com/package/@docker/docker-mui-theme) to automatically replicate Docker Desktop's look and feel.
- In future, we'll release utilities and components specifically targeting this combination (e.g. custom MUI components, or React hooks for interacting with Docker).
@z

@x
Read our [MUI best practices](mui-best-practices.md) guide to learn future-proof ways to use MUI with Docker Desktop.
@y
Read our [MUI best practices](mui-best-practices.md) guide to learn future-proof ways to use MUI with Docker Desktop.
@z

@x
### Not recommended: Some other framework
@y
### Not recommended: Some other framework
@z

@x
You may prefer to use another framework, perhaps because you or your team are more familiar with it or because you have existing assets you want to reuse. This is possible, but highly discouraged. It means that:
@y
You may prefer to use another framework, perhaps because you or your team are more familiar with it or because you have existing assets you want to reuse. This is possible, but highly discouraged. It means that:
@z

@x
- You'll need to manually replicate the look and feel of Docker Desktop. This takes a lot of effort, and if you don't match our theme closely enough, users will find your extension jarring and we may ask you to make changes during a review process.
- You'll have a higher maintenance burden. Whenever Docker Desktop's theme changes (which could happen in any release), you'll need to manually change your extension to match it.
- If your extension is open-source, deliberately avoiding common conventions will make it harder for the community to contribute to it.
@y
- You'll need to manually replicate the look and feel of Docker Desktop. This takes a lot of effort, and if you don't match our theme closely enough, users will find your extension jarring and we may ask you to make changes during a review process.
- You'll have a higher maintenance burden. Whenever Docker Desktop's theme changes (which could happen in any release), you'll need to manually change your extension to match it.
- If your extension is open-source, deliberately avoiding common conventions will make it harder for the community to contribute to it.
@z

@x
## Step two: Follow the below recommendations
@y
## Step two: Follow the below recommendations
@z

@x
### Follow our MUI best practices (if applicable)
@y
### Follow our MUI best practices (if applicable)
@z

@x
See our [MUI best practices](mui-best-practices.md) article.
@y
See our [MUI best practices](mui-best-practices.md) article.
@z

@x
### Only use colors from our palette
@y
### Only use colors from our palette
@z

@x
With minor exceptions, displaying your logo for example, you should only use colors from our palette. These can be found in our [style guide document](https://www.figma.com/file/U7pLWfEf6IQKUHLhdateBI/Docker-Design-Guidelines?node-id=1%3A28771), and will also soon be available in our MUI theme and via CSS variables.
@y
With minor exceptions, displaying your logo for example, you should only use colors from our palette. These can be found in our [style guide document](https://www.figma.com/file/U7pLWfEf6IQKUHLhdateBI/Docker-Design-Guidelines?node-id=1%3A28771), and will also soon be available in our MUI theme and via CSS variables.
@z

@x
### Use counterpart colors in light/dark mode
@y
### Use counterpart colors in light/dark mode
@z

@x
Our colors have been chosen so that the counterpart colors in each variant of the palette should have the same essential characteristics. Anywhere you use `red-300` in light mode, you should use `red-300` in dark mode too.
@y
Our colors have been chosen so that the counterpart colors in each variant of the palette should have the same essential characteristics. Anywhere you use `red-300` in light mode, you should use `red-300` in dark mode too.
@z

@x
## What's next?
@y
## What's next?
@z

@x
- Take a look at our [MUI best practices](mui-best-practices.md).
- Learn how to [publish your extension](../extensions/index.md).
@y
- Take a look at our [MUI best practices](mui-best-practices.md).
- Learn how to [publish your extension](../extensions/index.md).
@z
