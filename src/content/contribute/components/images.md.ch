%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
---
description: components and formatting examples used in Docker's docs
title: Images
toc_max: 3
---
@y
---
description: components and formatting examples used in Docker's docs
title: Images
toc_max: 3
---
@z

@x
## Example
@y
## Example
@z

@x
- A small image: ![a small image](/assets/images/footer_moby_icon.png)
@y
- A small image: ![a small image](__SUBDIR__/assets/images/footer_moby_icon.png)
@z

@x
- Large images occupy the full width of the reading column by default:
@y
- Large images occupy the full width of the reading column by default:
@z

@x
  ![a pretty wide image](/assets/images/banner_image_24512.png)
@y
  ![a pretty wide image](__SUBDIR__/assets/images/banner_image_24512.png)
@z

@x
- Image size can be set using query parameters: `?h=<height>&w=<width>`
@y
- Image size can be set using query parameters: `?h=<height>&w=<width>`
@z

@x
  ![a pretty wide image](/assets/images/banner_image_24512.png?w=100&h=50)
@y
  ![a pretty wide image](__SUBDIR__/assets/images/banner_image_24512.png?w=100&h=50)
@z

@x
- Image with a border, also set with a query parameter: `?border=true`
@y
- Image with a border, also set with a query parameter: `?border=true`
@z

@x
  ![a small image](/assets/images/footer_moby_icon.png?border=true)
@y
  ![a small image](__SUBDIR__/assets/images/footer_moby_icon.png?border=true)
@z

@x
## HTML and Markdown
@y
## HTML and Markdown
@z

@x
```markdown
- A small image: ![a small image](/assets/images/footer_moby_icon.png)
@y
```markdown
- A small image: ![a small image](__SUBDIR__/assets/images/footer_moby_icon.png)
@z

@x
- Large images occupy the full width of the reading column by default:
@y
- Large images occupy the full width of the reading column by default:
@z

@x
  ![a pretty wide image](/assets/images/banner_image_24512.png)
@y
  ![a pretty wide image](__SUBDIR__/assets/images/banner_image_24512.png)
@z

@x
- Image size can be set using query parameters: `?h=<height>&w=<width>`
@y
- Image size can be set using query parameters: `?h=<height>&w=<width>`
@z

@x
  ![a pretty wide image](/assets/images/banner_image_24512.png?w=100&h=50)
@y
  ![a pretty wide image](__SUBDIR__/assets/images/banner_image_24512.png?w=100&h=50)
@z

@x
- Image with a border, also set with a query parameter: `?border=true`
@y
- Image with a border, also set with a query parameter: `?border=true`
@z

@x
  ![a small image](/assets/images/footer_moby_icon.png?border=true)
```
@y
  ![a small image](__SUBDIR__/assets/images/footer_moby_icon.png?border=true)
```
@z
