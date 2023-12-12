%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
skip_read_time: true
---
@y
---
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
skip_read_time: true
---
@z

@x
# Interface: OpenDialogResult
@y
# Interface: OpenDialogResult
@z

@x
**`Since`**
@y
**`Since`**
@z

@x
0.2.3
@y
0.2.3
@z

@x
## Properties
@y
## Properties
@z

@x
### canceled
@y
### canceled
@z

@x
• `Readonly` **canceled**: `boolean`
@y
• `Readonly` **canceled**: `boolean`
@z

@x
Whether the dialog was canceled.
@y
Whether the dialog was canceled.
@z

@x
___
@y
___
@z

@x
### filePaths
@y
### filePaths
@z

@x
• `Readonly` **filePaths**: `string`[]
@y
• `Readonly` **filePaths**: `string`[]
@z

@x
An array of file paths chosen by the user. If the dialog is cancelled this will be an empty array.
@y
An array of file paths chosen by the user. If the dialog is cancelled this will be an empty array.
@z

@x
___
@y
___
@z

@x
### bookmarks
@y
### bookmarks
@z

@x
• `Optional` `Readonly` **bookmarks**: `string`[]
@y
• `Optional` `Readonly` **bookmarks**: `string`[]
@z

@x
macOS only- An array matching the filePaths array of base64 encoded strings which contains security scoped bookmark data. securityScopedBookmarks must be enabled for this to be populated
@y
macOS only- An array matching the filePaths array of base64 encoded strings which contains security scoped bookmark data. securityScopedBookmarks must be enabled for this to be populated
@z
