%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Formatting guide
description: Formatting guidelines for technical documentation
keywords: formatting, style guide, contribute
toc_max: 2
---
@y
---
title: Formatting guide
description: Formatting guidelines for technical documentation
keywords: formatting, style guide, contribute
toc_max: 2
---
@z

@x
## Headings and subheadings
@y
## Headings and subheadings
@z

@x
Readers pay fractionally more attention to headings, bulleted lists, and links, so it's important to ensure the first two to three words in those items "front load" information as much as possible.
@y
Readers pay fractionally more attention to headings, bulleted lists, and links, so it's important to ensure the first two to three words in those items "front load" information as much as possible.
@z

@x
### Best practice
@y
### Best practice
@z

@x
- Headings and subheadings should let the reader know what they will find on the page.
- They should describe succinctly and accurately what the content is about.
- Headings should be short (no more than eight words), to the point and written in plain, active language.
- You should avoid puns, teasers, and cultural references.
- Skip leading articles (a, the, etc.)
@y
- Headings and subheadings should let the reader know what they will find on the page.
- They should describe succinctly and accurately what the content is about.
- Headings should be short (no more than eight words), to the point and written in plain, active language.
- You should avoid puns, teasers, and cultural references.
- Skip leading articles (a, the, etc.)
@z

@x
## Page title
@y
## Page title
@z

@x
Page titles should be action orientated. For example: - _Enable SCIM_ - _Install Docker Desktop_
@y
Page titles should be action orientated. For example: - _Enable SCIM_ - _Install Docker Desktop_
@z

@x
### Best practice
@y
### Best practice
@z

@x
- Make sure the title of your page and the table of contents (TOC) entry matches.
- If you want to use a ‘:’ in a page title in the table of contents (\_toc.yaml), you must wrap the entire title in “” to avoid breaking the build.
- If you add a new entry to the TOC file, make sure it ends in a trailing slash (/). If you don't, the page won't show the side navigation.
@y
- Make sure the title of your page and the table of contents (TOC) entry matches.
- If you want to use a ‘:’ in a page title in the table of contents (\_toc.yaml), you must wrap the entire title in “” to avoid breaking the build.
- If you add a new entry to the TOC file, make sure it ends in a trailing slash (/). If you don't, the page won't show the side navigation.
@z

@x
## Images
@y
## Images
@z

@x
Images, including screenshots, can help a reader better understand a concept. However, you should use them sparingly as they tend to go out-of-date.
@y
Images, including screenshots, can help a reader better understand a concept. However, you should use them sparingly as they tend to go out-of-date.
@z

@x
### Best practice
@y
### Best practice
@z

@x
- When you take screenshots:
  - Don’t use lorem ipsum text. Try to replicate how someone would use the feature in a real-world scenario, and use realistic text.
  - Capture only the relevant UI. Don’t include unnecessary white space or areas of the UI that don’t help illustrate the point.
  - Keep it small. If you don’t need to show the full width of the screen, don’t.
  - Review how the image renders on the page. Make sure the image isn’t blurry or overwhelming.
  - Be consistent. Coordinate screenshots with the other screenshots already on a documentation page for a consistent reading experience.
  - To keep the Git repository light, compress the images (losslessly). Be sure to compress the images before adding them to the repository. Compressing images after adding them to the repository actually worsens the impact on the Git repository (however, it still optimizes the bandwidth during browsing).
  - Don't forget to remove images from the repository that are no longer used.
@y
- When you take screenshots:
  - Don’t use lorem ipsum text. Try to replicate how someone would use the feature in a real-world scenario, and use realistic text.
  - Capture only the relevant UI. Don’t include unnecessary white space or areas of the UI that don’t help illustrate the point.
  - Keep it small. If you don’t need to show the full width of the screen, don’t.
  - Review how the image renders on the page. Make sure the image isn’t blurry or overwhelming.
  - Be consistent. Coordinate screenshots with the other screenshots already on a documentation page for a consistent reading experience.
  - To keep the Git repository light, compress the images (losslessly). Be sure to compress the images before adding them to the repository. Compressing images after adding them to the repository actually worsens the impact on the Git repository (however, it still optimizes the bandwidth during browsing).
  - Don't forget to remove images from the repository that are no longer used.
@z

@x
For information on how to add images to your content, see [Useful component and formatting examples](../components/images.md).
@y
For information on how to add images to your content, see [Useful component and formatting examples](../components/images.md).
@z

@x
## Links
@y
## Links
@z

@x
Be careful not to create too many links, especially within body copy. Excess links can be distracting or send readers away from the current page.
@y
Be careful not to create too many links, especially within body copy. Excess links can be distracting or send readers away from the current page.
@z

@x
When people follow links, they can often lose their train of thought and fail to return to the original page, despite not having absorbed all the information it contains.
@y
When people follow links, they can often lose their train of thought and fail to return to the original page, despite not having absorbed all the information it contains.
@z

@x
The best links offer readers another way to scan information.
@y
The best links offer readers another way to scan information.
@z

@x
### Best practice
@y
### Best practice
@z

@x
- Use plain language that doesn't mislead or promise too much.
- Be short and descriptive (around five words is best).
- Allow people to predict (with a fair degree of confidence) what they will get if they select a link. Mirror the heading text on the destination page in links whenever possible.
- Front-load user-and-action-oriented terms at the beginning of the link (Download our app).
- Avoid generic calls to action (such as click here, find out more).
- Don't include any end punctuation when you hyperlink text (for example, periods, question marks, or exclamation points).
- Don't make link text italics or bold, unless it would be so as normal body copy.
@y
- Use plain language that doesn't mislead or promise too much.
- Be short and descriptive (around five words is best).
- Allow people to predict (with a fair degree of confidence) what they will get if they select a link. Mirror the heading text on the destination page in links whenever possible.
- Front-load user-and-action-oriented terms at the beginning of the link (Download our app).
- Avoid generic calls to action (such as click here, find out more).
- Don't include any end punctuation when you hyperlink text (for example, periods, question marks, or exclamation points).
- Don't make link text italics or bold, unless it would be so as normal body copy.
@z

@x
For information on how to add links to your content, see [Useful component and formatting examples](../components/links.md).
@y
For information on how to add links to your content, see [Useful component and formatting examples](../components/links.md).
@z

@x
## Code and code samples
@y
## Code and code samples
@z

@x
Format the following as code: Docker commands, instructions, and filenames (package names).
@y
Format the following as code: Docker commands, instructions, and filenames (package names).
@z

@x
To apply inline code style, wrap the text in a single backtick (`).
@y
To apply inline code style, wrap the text in a single backtick (`).
@z

@x
For information on how to add code blocks to your content, see [Useful component and formatting examples](../components/code-blocks.md).
@y
For information on how to add code blocks to your content, see [Useful component and formatting examples](../components/code-blocks.md).
@z

@x
### Best practice for commands
@y
### Best practice for commands
@z

@x
- Command prompt and shell:
  - For a non-privileged shell, prefix commands in code blocks with the $ prompt symbol.
  - For a privileged shell, prefix commands in code blocks with the # prompt symbol.
  - For a remote shell, add the context of the remote machine and exclude the path. For example, `user@host $`.
  - Specify the Windows shell (Command Prompt, PowerShell, or Git Bash), when you add any Windows-specific command. It's not necessary to include a command for each Windows shell.
  - Use tabs when you add commands for multiple operating systems or shells. For information on how to add tabs to your content, see [Tabs](../components/tabs.md).
- Commands that users will copy and run:
  - Add a single command per code block if a command produces output or requires the user to verify the results.
  - Add command output to a separate code block from the command.
- Commands that users won't copy and run:
  - Use POSIX-compatible syntax. It's not necessary to include Windows syntax.
  - Wrap optional arguments in square brackets ( [ ] ).
  - Use pipes ( \| ) between mutually exclusive arguments.
  - Use three dots ( ... ) after repeated arguments.
@y
- Command prompt and shell:
  - For a non-privileged shell, prefix commands in code blocks with the $ prompt symbol.
  - For a privileged shell, prefix commands in code blocks with the # prompt symbol.
  - For a remote shell, add the context of the remote machine and exclude the path. For example, `user@host $`.
  - Specify the Windows shell (Command Prompt, PowerShell, or Git Bash), when you add any Windows-specific command. It's not necessary to include a command for each Windows shell.
  - Use tabs when you add commands for multiple operating systems or shells. For information on how to add tabs to your content, see [Tabs](../components/tabs.md).
- Commands that users will copy and run:
  - Add a single command per code block if a command produces output or requires the user to verify the results.
  - Add command output to a separate code block from the command.
- Commands that users won't copy and run:
  - Use POSIX-compatible syntax. It's not necessary to include Windows syntax.
  - Wrap optional arguments in square brackets ( [ ] ).
  - Use pipes ( \| ) between mutually exclusive arguments.
  - Use three dots ( ... ) after repeated arguments.
@z

@x
### Best practice for code
@y
### Best practice for code
@z

@x
- Indent code blocks by 3 spaces when you nest a code block under a list item.
- Use three dots ( ... ) when you omit code.
@y
- Indent code blocks by 3 spaces when you nest a code block under a list item.
- Use three dots ( ... ) when you omit code.
@z

@x
## Callouts
@y
## Callouts
@z

@x
Use callouts to emphasize selected information on a page.
@y
Use callouts to emphasize selected information on a page.
@z

@x
### Best practice
@y
### Best practice
@z

@x
- Format the word Warning, Important, or Note in bold. Don't bold the content within the callout.
- It's good practice to avoid placing a lot of text callouts on one page. They can create a cluttered appearance if used to excess, and you'll diminish their impact.
@y
- Format the word Warning, Important, or Note in bold. Don't bold the content within the callout.
- It's good practice to avoid placing a lot of text callouts on one page. They can create a cluttered appearance if used to excess, and you'll diminish their impact.
@z

@x
| Text callout | Use case scenario                                                                                                                                                                   | Color or callout box |
| ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------- |
| Warning      | Use a Warning tag to signal to the reader where actions may cause damage to hardware or software loss of data.                                                                      | Red                  |
|              | ✅ Example: Warning: When you use the docker login command, your credentials are stored in your home directory in .docker/config.json. The password is base64-encoded in this file. |                      |
| Important    | Use an Important tag to signal to the reader where actions may cause issues of a lower magnitude.                                                                                   | Yellow               |
|              | ✅ Example: Update to the Docker Desktop terms                                                                                                                                      |                      |
| Note         | Use the Note tag for information that may not apply to all readers, or if the information is tangential to a topic.                                                                 | Blue                 |
|              | ✅ Example: Deleting a repository deletes all the images it contains and its build settings. This action cannot be undone.                                                          |                      |
@y
| Text callout | Use case scenario                                                                                                                                                                   | Color or callout box |
| ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------- |
| Warning      | Use a Warning tag to signal to the reader where actions may cause damage to hardware or software loss of data.                                                                      | Red                  |
|              | ✅ Example: Warning: When you use the docker login command, your credentials are stored in your home directory in .docker/config.json. The password is base64-encoded in this file. |                      |
| Important    | Use an Important tag to signal to the reader where actions may cause issues of a lower magnitude.                                                                                   | Yellow               |
|              | ✅ Example: Update to the Docker Desktop terms                                                                                                                                      |                      |
| Note         | Use the Note tag for information that may not apply to all readers, or if the information is tangential to a topic.                                                                 | Blue                 |
|              | ✅ Example: Deleting a repository deletes all the images it contains and its build settings. This action cannot be undone.                                                          |                      |
@z

@x
For information on how to add callouts to your content, see [Useful component and formatting examples](../components/call-outs.md).
@y
For information on how to add callouts to your content, see [Useful component and formatting examples](../components/call-outs.md).
@z

@x
## Navigation
@y
## Navigation
@z

@x
When documenting how to navigate through the Docker Desktop or Docker Hub UI:
@y
When documenting how to navigate through the Docker Desktop or Docker Hub UI:
@z

@x
- Always use location, then action. For example:
  _From the **Visibility** drop-down list (location), select Public (action)._
- Be brief and specific. For example:
  Do: _Select **Save**._
  Don't: _Select **Save** for the changes to take effect._
- If a step must include a reason, start the step with it. This helps the user scan more quickly.
  Do: _To view the changes, in the merge request, select the link._
  Don't: _Select the link in the merge request to view the changes_
@y
- Always use location, then action. For example:
  _From the **Visibility** drop-down list (location), select Public (action)._
- Be brief and specific. For example:
  Do: _Select **Save**._
  Don't: _Select **Save** for the changes to take effect._
- If a step must include a reason, start the step with it. This helps the user scan more quickly.
  Do: _To view the changes, in the merge request, select the link._
  Don't: _Select the link in the merge request to view the changes_
@z

@x
## Optional steps
@y
## Optional steps
@z

@x
If a step is optional, start the step with the word Optional followed by a period.
@y
If a step is optional, start the step with the word Optional followed by a period.
@z

@x
For example:
@y
For example:
@z

@x
_1. Optional. Enter a description for the job._
@y
_1. Optional. Enter a description for the job._
@z

@x
## Placeholder text
@y
## Placeholder text
@z

@x
You might want to provide a command or configuration that uses specific values.
@y
You might want to provide a command or configuration that uses specific values.
@z

@x
In these cases, use < and > to call out where a reader must replace text with their own value. For example:
@y
In these cases, use < and > to call out where a reader must replace text with their own value. For example:
@z

@x
`docker extension install <name-of-your-extension>`
@y
`docker extension install <name-of-your-extension>`
@z

@x
## Tables
@y
## Tables
@z

@x
Use tables to describe complex information in a straightforward manner.
@y
Use tables to describe complex information in a straightforward manner.
@z

@x
Note that in many cases, an unordered list is enough to describe a list of items with a single, simple description per item. But, if you have data that’s best described by a matrix, tables are the best choice.
@y
Note that in many cases, an unordered list is enough to describe a list of items with a single, simple description per item. But, if you have data that’s best described by a matrix, tables are the best choice.
@z

@x
### Best practice
@y
### Best practice
@z

@x
- Use sentence case for table headings.
- To keep tables accessible and scannable, tables shouldn't have any empty cells. If there is no otherwise meaningful value for a cell, consider entering N/A for ‘not applicable’ or None.
@y
- Use sentence case for table headings.
- To keep tables accessible and scannable, tables shouldn't have any empty cells. If there is no otherwise meaningful value for a cell, consider entering N/A for ‘not applicable’ or None.
@z

@x
For information on how to add tables to your content, see [Useful component and formatting examples](../components/tables.md).
@y
For information on how to add tables to your content, see [Useful component and formatting examples](../components/tables.md).
@z

@x
## Referring to file types
@y
## Referring to file types
@z

@x
When you're discussing a file type, use the formal name of the type. Don't use the filename extension to refer generically to the file type.
@y
When you're discussing a file type, use the formal name of the type. Don't use the filename extension to refer generically to the file type.
@z

@x
    | Correct | Incorrect |
    | --- | --- |
    | a PNG file | a .png file |
    | a Bash file | an .sh file |
@y
    | Correct | Incorrect |
    | --- | --- |
    | a PNG file | a .png file |
    | a Bash file | an .sh file |
@z

@x
## Referring to units
@y
## Referring to units
@z

@x
When you're referring to units of measurement, use the abbreviated form in all caps, with a space between the value and the unit. For example:
@y
When you're referring to units of measurement, use the abbreviated form in all caps, with a space between the value and the unit. For example:
@z

@x
    | Correct | Incorrect |
    | --- | --- |
    | 10 GB | 10GB |
    | 10 GB | 10 gb |
    | 10 GB | 10 gigabytes |
@y
    | Correct | Incorrect |
    | --- | --- |
    | 10 GB | 10GB |
    | 10 GB | 10 gb |
    | 10 GB | 10 gigabytes |
@z
