%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: components and formatting examples used in Docker's docs
title: Cards
toc_max: 3
grid:
- title: Docker Desktop
  description: Docker on your Desktop.
  icon: install_desktop
  link: /desktop/
- title: Docker Engine
  description: Vrrrrooooommm
  icon: developer_board
  link: /engine/
- title: Docker Build
  description: Clang bang
  icon: build
  link: /build/
- title: Docker Compose
  description: Figgy!
  icon: account_tree
  link: /compose/
- title: Docker Hub
  description: so much content, oh wow
  icon: hub
  link: /docker-hub/
---
@y
---
description: components and formatting examples used in Docker's docs
title: Cards
toc_max: 3
grid:
- title: Docker Desktop
  description: Docker on your Desktop.
  icon: install_desktop
  link: /desktop/
- title: Docker Engine
  description: Vrrrrooooommm
  icon: developer_board
  link: /engine/
- title: Docker Build
  description: Clang bang
  icon: build
  link: /build/
- title: Docker Compose
  description: Figgy!
  icon: account_tree
  link: /compose/
- title: Docker Hub
  description: so much content, oh wow
  icon: hub
  link: /docker-hub/
---
@z

@x
Cards can be added to a page using the `card` shortcode.
The parameters for this shortcode are:
@y
Cards can be added to a page using the `card` shortcode.
The parameters for this shortcode are:
@z

@x
| Parameter   | Description                                                          |
| ----------- | -------------------------------------------------------------------- |
| title       | The title of the card                                                |
| icon        | The icon slug of the card                                            |
| image       | Use a custom image instead of an icon (mutually exclusive with icon) |
| link        | (Optional) The link target of the card, when clicked                 |
| description | A description text, in Markdown                                      |
@y
| Parameter   | Description                                                          |
| ----------- | -------------------------------------------------------------------- |
| title       | The title of the card                                                |
| icon        | The icon slug of the card                                            |
| image       | Use a custom image instead of an icon (mutually exclusive with icon) |
| link        | (Optional) The link target of the card, when clicked                 |
| description | A description text, in Markdown                                      |
@z

@x
> **Note**
>
> There's a known limitation with the Markdown description of cards,
> in that they can't contain relative links, pointing to other .md documents.
> Such links won't render correctly. Instead, use an absolute link to the URL
> path of the page that you want to link to.
>
> For example, instead of linking to `../install/linux.md`, write:
> `/engine/install/linux/`.
@y
> **Note**
>
> There's a known limitation with the Markdown description of cards,
> in that they can't contain relative links, pointing to other .md documents.
> Such links won't render correctly. Instead, use an absolute link to the URL
> path of the page that you want to link to.
>
> For example, instead of linking to `../install/linux.md`, write:
> `/engine/install/linux/`.
@z

@x
## Example
@y
## Example
@z

@x
{{< card
  title="Get your Docker on"
  icon=favorite
  link=https://docs.docker.com/
  description="Build, share, and run your apps with Docker" >}}
@y
{{< card
  title="Get your Docker on"
  icon=favorite
  link=https://docs.docker.com/
  description="Build, share, and run your apps with Docker" >}}
@z

@x
## Markup
@y
## Markup
@z

@x
```go
{{</* card
  title="Get your Docker on"
  icon=favorite
  link=https://docs.docker.com/
  description="Build, share, and run your apps with Docker"
*/>}}
```
@y
```go
{{</* card
  title="Get your Docker on"
  icon=favorite
  link=https://docs.docker.com/
  description="Build, share, and run your apps with Docker"
*/>}}
```
@z

@x
### Grid
@y
### Grid
@z

@x
There's also a built-in `grid` shortcode that generates a... well, grid... of cards.
The grid size is 3x3 on large screens, 2x2 on medium, and single column on small.
@y
There's also a built-in `grid` shortcode that generates a... well, grid... of cards.
The grid size is 3x3 on large screens, 2x2 on medium, and single column on small.
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z

@x
Grid is a separate shortcode from `card`, but it implements the same component under the hood.
The markup you use to insert a grid is slightly unconventional. The grid shortcode takes no arguments.
All it does is let you specify where on a page you want your grid to appear.
@y
Grid is a separate shortcode from `card`, but it implements the same component under the hood.
The markup you use to insert a grid is slightly unconventional. The grid shortcode takes no arguments.
All it does is let you specify where on a page you want your grid to appear.
@z

@x
```go
{{</* grid */>}}
```
@y
```go
{{</* grid */>}}
```
@z

@x
The data for the grid is defined in the front matter of the page, under the `grid` key, as follows:
@y
The data for the grid is defined in the front matter of the page, under the `grid` key, as follows:
@z

@x
```yaml
# front matter section of a page
title: some page
grid:
  - title: "Docker Engine"
    description: Vrrrrooooommm
    icon: "developer_board"
    link: "/engine/"
  - title: "Docker Build"
    description: Clang bang
    icon: "build"
    link: "/build/"
```
@y
```yaml
# front matter section of a page
title: some page
grid:
  - title: "Docker Engine"
    description: Vrrrrooooommm
    icon: "developer_board"
    link: "/engine/"
  - title: "Docker Build"
    description: Clang bang
    icon: "build"
    link: "/build/"
```
@z
