%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Use containers for Deno development
linkTitle: Develop your app
@y
title: Use containers for Deno development
linkTitle: Develop your app
@z

@x
keywords: deno, local, development
description: Learn how to develop your Deno application locally.
@y
keywords: deno, local, development
description: Learn how to develop your Deno application locally.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete [Containerize a Deno application](containerize.md).
@y
Complete [Containerize a Deno application](containerize.md).
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
@y
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
@z

@x
- Configuring Compose to automatically update your running Compose services as you edit and save your code
@y
- Configuring Compose to automatically update your running Compose services as you edit and save your code
@z

@x
## Get the sample application
@y
## Get the sample application
@z

@x
Clone the sample application to use with this guide. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@y
Clone the sample application to use with this guide. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@z

% snip command...

@x
## Automatically update services
@y
## Automatically update services
@z

@x
Use Compose Watch to automatically update your running Compose services as you
edit and save your code. For more details about Compose Watch, see [Use Compose
Watch](/manuals/compose/how-tos/file-watch.md).
@y
Use Compose Watch to automatically update your running Compose services as you
edit and save your code. For more details about Compose Watch, see [Use Compose
Watch](manuals/compose/how-tos/file-watch.md).
@z

@x
Open your `compose.yml` file in an IDE or text editor and then add the Compose Watch instructions. The following example shows how to add Compose Watch to your `compose.yml` file.
@y
Open your `compose.yml` file in an IDE or text editor and then add the Compose Watch instructions. The following example shows how to add Compose Watch to your `compose.yml` file.
@z

% snip code...

@x
Run the following command to run your application with Compose Watch.
@y
Run the following command to run your application with Compose Watch.
@z

% snip command...

@x
Now, if you modify your `server.ts` you will see the changes in real time without re-building the image.
@y
Now, if you modify your `server.ts` you will see the changes in real time without re-building the image.
@z

@x
To test it out, open the `server.ts` file in your favorite text editor and change the message from `{"Status" : "OK"}` to `{"Status" : "Updated"}`. Save the file and refresh your browser at `http://localhost:8000`. You should see the updated message.
@y
To test it out, open the `server.ts` file in your favorite text editor and change the message from `{"Status" : "OK"}` to `{"Status" : "Updated"}`. Save the file and refresh your browser at `http://localhost:8000`. You should see the updated message.
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you also learned how to use Compose Watch to automatically rebuild and run your container when you update your code.
@y
In this section, you also learned how to use Compose Watch to automatically rebuild and run your container when you update your code.
@z

@x
Related information:
 - [Compose file reference](/reference/compose-file/)
 - [Compose file watch](/manuals/compose/how-tos/file-watch.md)
 - [Multi-stage builds](/manuals/build/building/multi-stage.md)
@y
Related information:
 - [Compose file reference](__SUBDIR__/reference/compose-file/)
 - [Compose file watch](manuals/compose/how-tos/file-watch.md)
 - [Multi-stage builds](manuals/build/building/multi-stage.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll take a look at how to set up a CI/CD pipeline using GitHub Actions.
@y
In the next section, you'll take a look at how to set up a CI/CD pipeline using GitHub Actions.
@z
