%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: UI elements in content
description: How to refer to and write about UI elements in technical documentation.
keywords: ui, contribute, style guide, docker docs
weight: 40
---
@y
---
title: UI elements in content
description: How to refer to and write about UI elements in technical documentation.
keywords: ui, contribute, style guide, docker docs
weight: 40
---
@z

@x
Use this guide when writing documentation that refers to buttons, fields, menus, dialogs, or other user interface (UI) elements. It explains how to format UI terms, write task-focused instructions, and refer to common UI patterns consistently and clearly.
@y
Use this guide when writing documentation that refers to buttons, fields, menus, dialogs, or other user interface (UI) elements. It explains how to format UI terms, write task-focused instructions, and refer to common UI patterns consistently and clearly.
@z

@x
## Format UI element names
@y
## Format UI element names
@z

@x
Use bold formatting for the visible names of UI elements:
@y
Use bold formatting for the visible names of UI elements:
@z

@x
- Buttons  
- Dialogs  
- Windows  
- Tabs  
- Menu items  
- List items  
- Form labels  
- Section headings
@y
- Buttons  
- Dialogs  
- Windows  
- Tabs  
- Menu items  
- List items  
- Form labels  
- Section headings
@z

@x
For example: 
@y
For example: 
@z

@x
*Select **Create**, then fill out the **Name** field.*
@y
*Select **Create**, then fill out the **Name** field.*
@z

@x
Do not bold product names or features unless they appear exactly as a label in the UI.
@y
Do not bold product names or features unless they appear exactly as a label in the UI.
@z

@x
### Capitalization
@y
### Capitalization
@z

@x
- Follow the capitalization as it appears in the UI.
- If UI labels are all uppercase or inconsistent, use sentence case in your docs for readability.
@y
- Follow the capitalization as it appears in the UI.
- If UI labels are all uppercase or inconsistent, use sentence case in your docs for readability.
@z

@x
## Write task-focused instructions
@y
## Write task-focused instructions
@z

@x
When possible, guide users based on what they’re trying to do, not just what they should select. This makes docs more goal-oriented and adaptable to UI changes.
@y
When possible, guide users based on what they’re trying to do, not just what they should select. This makes docs more goal-oriented and adaptable to UI changes.
@z

@x
| Do this                        | Avoid this                             |
|----------------------------------|-------------------------------------------|
| Expand the **Advanced options** section. | Select the zippy to expand the **Advanced options** section. |
| Choose a base image for your container. | Select a dropdown and pick something.    |
@y
| Do this                        | Avoid this                             |
|----------------------------------|-------------------------------------------|
| Expand the **Advanced options** section. | Select the zippy to expand the **Advanced options** section. |
| Choose a base image for your container. | Select a dropdown and pick something.    |
@z

@x
## Use correct prepositions with UI elements
@y
## Use correct prepositions with UI elements
@z

@x
Choose the right preposition based on the type of UI element you're referencing.
@y
Choose the right preposition based on the type of UI element you're referencing.
@z

@x
| Preposition | Use with...                    | Example |
|-------------|--------------------------------|---------|
| **in**      | dialogs, fields, lists, menus, panes, windows | In the **Name** field, enter your project name. |
| **on**      | pages, tabs, toolbars          | On the **Settings** tab, select **General**. |
@y
| Preposition | Use with...                    | Example |
|-------------|--------------------------------|---------|
| **in**      | dialogs, fields, lists, menus, panes, windows | In the **Name** field, enter your project name. |
| **on**      | pages, tabs, toolbars          | On the **Settings** tab, select **General**. |
@z

@x
## Use consistent UI element terms
@y
## Use consistent UI element terms
@z

@x
Use these standard terms when referring to elements in Docker products:
@y
Use these standard terms when referring to elements in Docker products:
@z

@x
| Preferred Term      | Use When Referring To...                     |
|---------------------|----------------------------------------------|
| **button**          | A clickable action element (e.g., **Start**) |
| **field**           | A place to enter text or select a value      |
| **menu** / **menu item** | A drop-down or navigation option         |
| **drop-down**       | A drop-down menu  item                             |
| **context switcher** | Specific to toggling on cloud mode          |
| **tab**             | A selectable view within a window or page    |
| **dialog**          | A popup window for confirmations or options  |
| **section**         | A logical grouping of content on a page      |
| **list** / **list item** | A scrollable list of selectable entries |
| **toggle**  | A binary control (on/off)               |
| **checkbox**        | A multi-select control                      |
| **tooltip**         | Text that appears on hover                  |
@y
| Preferred Term      | Use When Referring To...                     |
|---------------------|----------------------------------------------|
| **button**          | A clickable action element (e.g., **Start**) |
| **field**           | A place to enter text or select a value      |
| **menu** / **menu item** | A drop-down or navigation option         |
| **drop-down**       | A drop-down menu  item                             |
| **context switcher** | Specific to toggling on cloud mode          |
| **tab**             | A selectable view within a window or page    |
| **dialog**          | A popup window for confirmations or options  |
| **section**         | A logical grouping of content on a page      |
| **list** / **list item** | A scrollable list of selectable entries |
| **toggle**  | A binary control (on/off)               |
| **checkbox**        | A multi-select control                      |
| **tooltip**         | Text that appears on hover                  |
@z

@x
Finally, instead of saying “click the control,” say “select the **Create** button.”
@y
Finally, instead of saying “click the control,” say “select the **Create** button.”
@z
