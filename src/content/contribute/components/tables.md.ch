%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: components and formatting examples used in Docker's docs
title: Tables
toc_max: 3
---
@y
---
description: components and formatting examples used in Docker's docs
title: Tables
toc_max: 3
---
@z

@x
## Example
@y
## Example
@z

@x
### Basic table
@y
### Basic table
@z

@x
| Permission level                                                         | Access                                                        |
| :----------------------------------------------------------------------- | :------------------------------------------------------------ |
| **Bold** or _italic_ within a table cell. Next cell is empty on purpose. |                                                               |
|                                                                          | Previous cell is empty. A `--flag` in mono text.              |
| Read                                                                     | Pull                                                          |
| Read/Write                                                               | Pull, push                                                    |
| Admin                                                                    | All of the above, plus update description, create, and delete |
@y
| Permission level                                                         | Access                                                        |
| :----------------------------------------------------------------------- | :------------------------------------------------------------ |
| **Bold** or _italic_ within a table cell. Next cell is empty on purpose. |                                                               |
|                                                                          | Previous cell is empty. A `--flag` in mono text.              |
| Read                                                                     | Pull                                                          |
| Read/Write                                                               | Pull, push                                                    |
| Admin                                                                    | All of the above, plus update description, create, and delete |
@z

@x
### Feature-support table
@y
### Feature-support table
@z

@x
| Platform   | x86_64 / amd64 |
| :--------- | :------------: |
| Ubuntu     |       ✅       |
| Debian     |       ✅       |
| Fedora     |                |
| Arch (btw) |       ✅       |
@y
| Platform   | x86_64 / amd64 |
| :--------- | :------------: |
| Ubuntu     |       ✅       |
| Debian     |       ✅       |
| Fedora     |                |
| Arch (btw) |       ✅       |
@z

@x
## Markdown
@y
## Markdown
@z

@x
### Basic table
@y
### Basic table
@z

@x
```md
| Permission level                                                         | Access                                                        |
| :----------------------------------------------------------------------- | :------------------------------------------------------------ |
| **Bold** or _italic_ within a table cell. Next cell is empty on purpose. |                                                               |
|                                                                          | Previous cell is empty. A `--flag` in mono text.              |
| Read                                                                     | Pull                                                          |
| Read/Write                                                               | Pull, push                                                    |
| Admin                                                                    | All of the above, plus update description, create, and delete |
```
@y
```md
| Permission level                                                         | Access                                                        |
| :----------------------------------------------------------------------- | :------------------------------------------------------------ |
| **Bold** or _italic_ within a table cell. Next cell is empty on purpose. |                                                               |
|                                                                          | Previous cell is empty. A `--flag` in mono text.              |
| Read                                                                     | Pull                                                          |
| Read/Write                                                               | Pull, push                                                    |
| Admin                                                                    | All of the above, plus update description, create, and delete |
```
@z

@x
The alignment of the cells in the source doesn't really matter. The ending pipe
character is optional (unless the last cell is supposed to be empty).
@y
The alignment of the cells in the source doesn't really matter. The ending pipe
character is optional (unless the last cell is supposed to be empty).
@z

@x
### Feature-support table
@y
### Feature-support table
@z

@x
```md
| Platform   | x86_64 / amd64 |
| :--------- | :------------: |
| Ubuntu     |       ✅       |
| Debian     |       ✅       |
| Fedora     |                |
| Arch (btw) |       ✅       |
```
@y
```md
| Platform   | x86_64 / amd64 |
| :--------- | :------------: |
| Ubuntu     |       ✅       |
| Debian     |       ✅       |
| Fedora     |                |
| Arch (btw) |       ✅       |
```
@z
