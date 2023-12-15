%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: components and formatting examples used in Docker's docs
title: Lists
toc_max: 3
---
@y
---
description: components and formatting examples used in Docker's docs
title: Lists
toc_max: 3
---
@z

@x
## Examples
@y
## Examples
@z

@x
Use dashes (`-`) or asterisks (`*`) for bullet points.
@y
Use dashes (`-`) or asterisks (`*`) for bullet points.
@z

@x
- Bullet list item 1
- Bullet list item 2
- Bullet list item 3
@y
- Bullet list item 1
- Bullet list item 2
- Bullet list item 3
@z

@x
1.  Numbered list item 1. Two spaces between the period and the first letter
    helps with alignment.
@y
1.  Numbered list item 1. Two spaces between the period and the first letter
    helps with alignment.
@z

@x
2.  Numbered list item 2. Let's put a note in it.
@y
2.  Numbered list item 2. Let's put a note in it.
@z

@x
    > **Note**: We did it!
@y
    > **Note**: We did it!
@z

@x
3.  Numbered list item 3 with a code block in it. You need the blank line before
    the code block happens.
@y
3.  Numbered list item 3 with a code block in it. You need the blank line before
    the code block happens.
@z

@x
    ```bash
    $ docker run hello-world
    ```
@y
    ```bash
    $ docker run hello-world
    ```
@z

@x
4.  Numbered list item 4 with a bullet list inside it and a numbered list
    inside that.
@y
4.  Numbered list item 4 with a bullet list inside it and a numbered list
    inside that.
@z

@x
    - Sub-item 1
    - Sub-item 2
@y
    - Sub-item 1
    - Sub-item 2
@z

@x
      1.  Sub-sub-item 1
      2.  Sub-sub-item-2 with a table inside it because we like to party!
          Indentation is super important.
@y
      1.  Sub-sub-item 1
      2.  Sub-sub-item-2 with a table inside it because we like to party!
          Indentation is super important.
@z

@x
          | Header 1 | Header 2 |
          | -------- | -------- |
          | Thing 1  | Thing 2  |
          | Thing 3  | Thing 4  |
@y
          | Header 1 | Header 2 |
          | -------- | -------- |
          | Thing 1  | Thing 2  |
          | Thing 3  | Thing 4  |
@z

@x
## Markdown
@y
## Markdown
@z

@x
````md
- Bullet list item 1
- Bullet list item 2
- Bullet list item 3
@y
````md
- Bullet list item 1
- Bullet list item 2
- Bullet list item 3
@z

@x
1.  Numbered list item 1. Two spaces between the period and the first letter
    helps with alignment.
@y
1.  Numbered list item 1. Two spaces between the period and the first letter
    helps with alignment.
@z

@x
2.  Numbered list item 2. Let's put a note in it.
@y
2.  Numbered list item 2. Let's put a note in it.
@z

@x
    > **Note**: We did it!
@y
    > **Note**: We did it!
@z

@x
3.  Numbered list item 3 with a code block in it. You need the blank line before
    the code block happens.
@y
3.  Numbered list item 3 with a code block in it. You need the blank line before
    the code block happens.
@z

@x
    ```bash
    $ docker run hello-world
    ```
@y
    ```bash
    $ docker run hello-world
    ```
@z

@x
4.  Numbered list item 4 with a bullet list inside it and a numbered list
    inside that.
@y
4.  Numbered list item 4 with a bullet list inside it and a numbered list
    inside that.
@z

@x
    - Sub-item 1
    - Sub-item 2
@y
    - Sub-item 1
    - Sub-item 2
@z

@x
      1.  Sub-sub-item 1
      2.  Sub-sub-item-2 with a table inside it.
          Indentation is super important.
@y
      1.  Sub-sub-item 1
      2.  Sub-sub-item-2 with a table inside it.
          Indentation is super important.
@z

@x
          | Header 1 | Header 2 |
          | -------- | -------- |
          | Thing 1  | Thing 2  |
          | Thing 3  | Thing 4  |
````
@y
          | Header 1 | Header 2 |
          | -------- | -------- |
          | Thing 1  | Thing 2  |
          | Thing 3  | Thing 4  |
````
@z
