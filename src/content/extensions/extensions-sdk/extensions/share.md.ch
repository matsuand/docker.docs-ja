%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Share your extension
description: Share your extension with a share link
keywords: Docker, extensions, share
aliases: 
 - /desktop/extensions-sdk/extensions/share/
---
@y
---
title: Share your extension
description: Share your extension with a share link
keywords: Docker, extensions, share
aliases: 
 - /desktop/extensions-sdk/extensions/share/
---
@z

@x
Once your extension image is accessible on Docker Hub, anyone with access to the image can install the extension.
@y
Once your extension image is accessible on Docker Hub, anyone with access to the image can install the extension.
@z

@x
People can install your extension by typing `docker extension install my/awesome-extension:latest` in to the terminal.
@y
People can install your extension by typing `docker extension install my/awesome-extension:latest` in to the terminal.
@z

@x
However, this option doesn't provide a preview of the extension before it's installed.
@y
However, this option doesn't provide a preview of the extension before it's installed.
@z

@x
## Createa a share URL
@y
## Createa a share URL
@z

@x
Docker lets you share your extensions using a URL.
@y
Docker lets you share your extensions using a URL.
@z

@x
When people navigate to this URL, it opens Docker Desktop and displays a preview of your extension in the same way as an extension in the Marketplace. From the preview, users can then select **Install**.
@y
When people navigate to this URL, it opens Docker Desktop and displays a preview of your extension in the same way as an extension in the Marketplace. From the preview, users can then select **Install**.
@z

@x
![Navigate to extension link](images/open-share.png)
@y
![Navigate to extension link](images/open-share.png)
@z

@x
To generate this link you can either:
@y
To generate this link you can either:
@z

@x
- Run the following command:
@y
- Run the following command:
@z

@x
  ```console
  $ docker extension share my/awesome-extension:0.0.1
  ```
@y
  ```console
  $ docker extension share my/awesome-extension:0.0.1
  ```
@z

@x
- Once you have installed your extension locally, navigate to the **Manage** tab and select **Share**.
@y
- Once you have installed your extension locally, navigate to the **Manage** tab and select **Share**.
@z

@x
  ![Share button](images/list-preview.png)
@y
  ![Share button](images/list-preview.png)
@z

@x
> **Note**
>
> Previews of the extension description or screenshots, for example, are created using [extension labels](labels.md).
@y
> **Note**
>
> Previews of the extension description or screenshots, for example, are created using [extension labels](labels.md).
@z
