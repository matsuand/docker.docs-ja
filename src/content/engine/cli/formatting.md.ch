%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: CLI and log output formatting reference
keywords: format, formatting, output, templates, log
title: Format command and log output
@y
description: CLI and log output formatting reference
keywords: format, formatting, output, templates, log
title: Format command and log output
@z

@x
Docker supports [Go templates](https://golang.org/pkg/text/template/) which you
can use to manipulate the output format of certain commands and log drivers.
@y
Docker supports [Go templates](https://golang.org/pkg/text/template/) which you
can use to manipulate the output format of certain commands and log drivers.
@z

@x
Docker provides a set of basic functions to manipulate template elements.
All of these examples use the `docker inspect` command, but many other CLI
commands have a `--format` flag, and many of the CLI command references
include examples of customizing the output format.
@y
Docker provides a set of basic functions to manipulate template elements.
All of these examples use the `docker inspect` command, but many other CLI
commands have a `--format` flag, and many of the CLI command references
include examples of customizing the output format.
@z

@x
> **Note**
>
> When using the `--format` flag, you need observe your shell environment.
> In a POSIX shell, you can run the following with a single quote:
>
> ```console
> $ docker inspect --format '{{join .Args " , "}}'
> ```
>
> Otherwise, in a Windows shell (for example, PowerShell), you need to use single quotes, but
> escape the double quotes inside the parameters as follows:
>
> ```console
> $ docker inspect --format '{{join .Args \" , \"}}'
> ```
>
{ .important }
@y
> **Note**
>
> When using the `--format` flag, you need observe your shell environment.
> In a POSIX shell, you can run the following with a single quote:
>
> ```console
> $ docker inspect --format '{{join .Args " , "}}'
> ```
>
> Otherwise, in a Windows shell (for example, PowerShell), you need to use single quotes, but
> escape the double quotes inside the parameters as follows:
>
> ```console
> $ docker inspect --format '{{join .Args \" , \"}}'
> ```
>
{ .important }
@z

@x
## join
@y
## join
@z

@x
`join` concatenates a list of strings to create a single string.
It puts a separator between each element in the list.
@y
`join` concatenates a list of strings to create a single string.
It puts a separator between each element in the list.
@z

@x
```console
$ docker inspect --format '{{join .Args " , "}}' container
```
@y
```console
$ docker inspect --format '{{join .Args " , "}}' container
```
@z

@x
## table
@y
## table
@z

@x
`table` specifies which fields you want to see its output.
@y
`table` specifies which fields you want to see its output.
@z

@x
```console
$ docker image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"
```
@y
```console
$ docker image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"
```
@z

@x
## json
@y
## json
@z

@x
`json` encodes an element as a json string.
@y
`json` encodes an element as a json string.
@z

@x
```console
$ docker inspect --format '{{json .Mounts}}' container
```
@y
```console
$ docker inspect --format '{{json .Mounts}}' container
```
@z

@x
## lower
@y
## lower
@z

@x
`lower` transforms a string into its lowercase representation.
@y
`lower` transforms a string into its lowercase representation.
@z

@x
```console
$ docker inspect --format "{{lower .Name}}" container
```
@y
```console
$ docker inspect --format "{{lower .Name}}" container
```
@z

@x
## split
@y
## split
@z

@x
`split` slices a string into a list of strings separated by a separator.
@y
`split` slices a string into a list of strings separated by a separator.
@z

@x
```console
$ docker inspect --format '{{split .Image ":"}}' container
```
@y
```console
$ docker inspect --format '{{split .Image ":"}}' container
```
@z

@x
## title
@y
## title
@z

@x
`title` capitalizes the first character of a string.
@y
`title` capitalizes the first character of a string.
@z

@x
```console
$ docker inspect --format "{{title .Name}}" container
```
@y
```console
$ docker inspect --format "{{title .Name}}" container
```
@z

@x
## upper
@y
## upper
@z

@x
`upper` transforms a string into its uppercase representation.
@y
`upper` transforms a string into its uppercase representation.
@z

@x
```console
$ docker inspect --format "{{upper .Name}}" container
```
@y
```console
$ docker inspect --format "{{upper .Name}}" container
```
@z

@x
## println
@y
## println
@z

@x
`println` prints each value on a new line.
@y
`println` prints each value on a new line.
@z

@x
```console
$ docker inspect --format='{{range .NetworkSettings.Networks}}{{println .IPAddress}}{{end}}' container
```
@y
```console
$ docker inspect --format='{{range .NetworkSettings.Networks}}{{println .IPAddress}}{{end}}' container
```
@z

@x
## Hint
@y
## Hint
@z

@x
To find out what data can be printed, show all content as json:
@y
To find out what data can be printed, show all content as json:
@z

@x
```console
$ docker container ls --format='{{json .}}'
```
@y
```console
$ docker container ls --format='{{json .}}'
```
@z
