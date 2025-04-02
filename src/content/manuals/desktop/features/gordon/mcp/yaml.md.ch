%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: YAML configuration
description: Learn how to use MCP servers with Gordon
keywords: ai, mcp, gordon
@y
title: YAML configuration
description: Learn how to use MCP servers with Gordon
keywords: ai, mcp, gordon
@z

@x
Docker has partnered with Anthropic to build container images for the [reference
implementations](https://github.com/modelcontextprotocol/servers/) of MCP
servers available on Docker Hub under [the mcp
namespace](https://hub.docker.com/u/mcp).
@y
Docker has partnered with Anthropic to build container images for the [reference
implementations](https://github.com/modelcontextprotocol/servers/) of MCP
servers available on Docker Hub under [the mcp
namespace](https://hub.docker.com/u/mcp).
@z

@x
When you run the `docker ai` command in your terminal to ask a question, Gordon
looks in the `gordon-mcp.yml` file in your working directory (if present) for a
list of MCP servers that should be used when in that context. The
`gordon-mcp.yml` file is a Docker Compose file that configures MCP servers as
Compose services for Gordon to access.
@y
When you run the `docker ai` command in your terminal to ask a question, Gordon
looks in the `gordon-mcp.yml` file in your working directory (if present) for a
list of MCP servers that should be used when in that context. The
`gordon-mcp.yml` file is a Docker Compose file that configures MCP servers as
Compose services for Gordon to access.
@z

@x
The following minimal example shows how you can use the [mcp-time
server](https://hub.docker.com/r/mcp/time) to provide temporal capabilities to
Gordon. For more information, you can check out the [source code and
documentation](https://github.com/modelcontextprotocol/servers/tree/main/src/time).
@y
The following minimal example shows how you can use the [mcp-time
server](https://hub.docker.com/r/mcp/time) to provide temporal capabilities to
Gordon. For more information, you can check out the [source code and
documentation](https://github.com/modelcontextprotocol/servers/tree/main/src/time).
@z

@x
Create the `gordon-mcp.yml` file in your working directory and add the time
   server:
@y
Create the `gordon-mcp.yml` file in your working directory and add the time
   server:
@z

@x
```yaml
services:
  time:
    image: mcp/time
```
@y
```yaml
services:
  time:
    image: mcp/time
```
@z

@x
With this file present, you can now ask Gordon to tell you the time in
   another timezone:
@y
With this file present, you can now ask Gordon to tell you the time in
   another timezone:
@z

@x
  ```bash
  $ docker ai 'what time is it now in kiribati?'
@y
  ```bash
  $ docker ai 'what time is it now in kiribati?'
@z

@x
      • Calling get_current_time
@y
      • Calling get_current_time
@z

@x
    The current time in Kiribati (Tarawa) is 9:38 PM on January 7, 2025.
@y
    The current time in Kiribati (Tarawa) is 9:38 PM on January 7, 2025.
@z

@x
  ```
@y
  ```
@z

@x
As you can see, Gordon found the MCP time server and called its tool when
needed.
@y
As you can see, Gordon found the MCP time server and called its tool when
needed.
@z

@x
## Advanced usage
@y
## Advanced usage
@z

@x
Some MCP servers need access to your filesystem or system environment variables.
Docker Compose can help with this. Since `gordon-mcp.yml` is a Compose file you
can add bind mounts using the regular Docker Compose syntax, which makes your
filesystem resources available to the container:
@y
Some MCP servers need access to your filesystem or system environment variables.
Docker Compose can help with this. Since `gordon-mcp.yml` is a Compose file you
can add bind mounts using the regular Docker Compose syntax, which makes your
filesystem resources available to the container:
@z

@x
```yaml
services:
  fs:
    image: mcp/filesystem
    command:
      - /rootfs
    volumes:
      - .:/rootfs
```
@y
```yaml
services:
  fs:
    image: mcp/filesystem
    command:
      - /rootfs
    volumes:
      - .:/rootfs
```
@z

@x
The `gordon-mcp.yml` file adds filesystem access capabilities to Gordon and
since everything runs inside a container Gordon only has access to the
directories you specify.
@y
The `gordon-mcp.yml` file adds filesystem access capabilities to Gordon and
since everything runs inside a container Gordon only has access to the
directories you specify.
@z

@x
Gordon can handle any number of MCP servers. For example, if you give Gordon
access to the internet with the `mcp/fetch` server:
@y
Gordon can handle any number of MCP servers. For example, if you give Gordon
access to the internet with the `mcp/fetch` server:
@z

@x
```yaml
services:
  fetch:
    image: mcp/fetch
  fs:
    image: mcp/filesystem
    command:
      - /rootfs
    volumes:
      - .:/rootfs
```
@y
```yaml
services:
  fetch:
    image: mcp/fetch
  fs:
    image: mcp/filesystem
    command:
      - /rootfs
    volumes:
      - .:/rootfs
```
@z

@x
You can now ask things like:
@y
You can now ask things like:
@z

@x
```bash
$ docker ai can you fetch rumpl.dev and write the summary to a file test.txt 
@y
```bash
$ docker ai can you fetch rumpl.dev and write the summary to a file test.txt 
@z

@x
    • Calling fetch ✔️
    • Calling write_file ✔️
@y
    • Calling fetch ✔️
    • Calling write_file ✔️
@z

@x
  The summary of the website rumpl.dev has been successfully written to the file test.txt in the allowed directory. Let me know if you need further assistance!
@y
  The summary of the website rumpl.dev has been successfully written to the file test.txt in the allowed directory. Let me know if you need further assistance!
@z

@x
$ cat test.txt 
The website rumpl.dev features a variety of blog posts and articles authored by the site owner. Here's a summary of the content:
@y
$ cat test.txt 
The website rumpl.dev features a variety of blog posts and articles authored by the site owner. Here's a summary of the content:
@z

@x
1. **Wasmio 2023 (March 25, 2023)**: A recap of the WasmIO 2023 conference held in Barcelona. The author shares their experience as a speaker and praises the organizers for a successful event.
@y
1. **Wasmio 2023 (March 25, 2023)**: A recap of the WasmIO 2023 conference held in Barcelona. The author shares their experience as a speaker and praises the organizers for a successful event.
@z

@x
2. **Writing a Window Manager in Rust - Part 2 (January 3, 2023)**: The second part of a series on creating a window manager in Rust. This installment focuses on enhancing the functionality to manage windows effectively.
@y
2. **Writing a Window Manager in Rust - Part 2 (January 3, 2023)**: The second part of a series on creating a window manager in Rust. This installment focuses on enhancing the functionality to manage windows effectively.
@z

@x
3. **2022 in Review (December 29, 2022)**: A personal and professional recap of the year 2022. The author reflects on the highs and lows of the year, emphasizing professional achievements.
@y
3. **2022 in Review (December 29, 2022)**: A personal and professional recap of the year 2022. The author reflects on the highs and lows of the year, emphasizing professional achievements.
@z

@x
4. **Writing a Window Manager in Rust - Part 1 (December 28, 2022)**: The first part of the series on building a window manager in Rust. The author discusses setting up a Linux machine and the challenges of working with X11 and Rust.
@y
4. **Writing a Window Manager in Rust - Part 1 (December 28, 2022)**: The first part of the series on building a window manager in Rust. The author discusses setting up a Linux machine and the challenges of working with X11 and Rust.
@z

@x
5. **Add docker/docker to your dependencies (May 10, 2020)**: A guide for Go developers on how to use the Docker client library in their projects. The post includes a code snippet demonstrating the integration.
@y
5. **Add docker/docker to your dependencies (May 10, 2020)**: A guide for Go developers on how to use the Docker client library in their projects. The post includes a code snippet demonstrating the integration.
@z

@x
6. **First (October 11, 2019)**: The inaugural post on the blog, featuring a simple "Hello World" program in Go.
```
@y
6. **First (October 11, 2019)**: The inaugural post on the blog, featuring a simple "Hello World" program in Go.
```
@z

@x
## What’s next?
@y
## What’s next?
@z

@x
Now that you’ve learned how to use MCP servers with Gordon, here are a few ways
you can get started:
@y
Now that you’ve learned how to use MCP servers with Gordon, here are a few ways
you can get started:
@z

@x
- Experiment: Try integrating one or more of the tested MCP servers into your
  `gordon-mcp.yml` file and explore their capabilities.
- Explore the ecosystem: Check out the [reference implementations on
   GitHub](https://github.com/modelcontextprotocol/servers/) or browse the
   [Docker Hub MCP namespace](https://hub.docker.com/u/mcp) for additional
   servers that might suit your needs.
- Build your own: If none of the existing servers meet your needs, or you’re
   curious about exploring how they work in more detail, consider developing a
   custom MCP server. Use the [MCP
   specification](https://www.anthropic.com/news/model-context-protocol) as a
   guide.
- Share your feedback: If you discover new servers that work well with Gordon
   or encounter issues with existing ones, [share your findings to help improve
   the ecosystem](https://docker.qualtrics.com/jfe/form/SV_9tT3kdgXfAa6cWa).
@y
- Experiment: Try integrating one or more of the tested MCP servers into your
  `gordon-mcp.yml` file and explore their capabilities.
- Explore the ecosystem: Check out the [reference implementations on
   GitHub](https://github.com/modelcontextprotocol/servers/) or browse the
   [Docker Hub MCP namespace](https://hub.docker.com/u/mcp) for additional
   servers that might suit your needs.
- Build your own: If none of the existing servers meet your needs, or you’re
   curious about exploring how they work in more detail, consider developing a
   custom MCP server. Use the [MCP
   specification](https://www.anthropic.com/news/model-context-protocol) as a
   guide.
- Share your feedback: If you discover new servers that work well with Gordon
   or encounter issues with existing ones, [share your findings to help improve
   the ecosystem](https://docker.qualtrics.com/jfe/form/SV_9tT3kdgXfAa6cWa).
@z

@x
With MCP support, Gordon offers powerful extensibility and flexibility to meet
your specific use cases whether you’re adding temporal awareness, file
management, or internet access.
@y
With MCP support, Gordon offers powerful extensibility and flexibility to meet
your specific use cases whether you’re adding temporal awareness, file
management, or internet access.
@z

@x
### Compatible MCP servers
@y
### Compatible MCP servers
@z

@x
These are MCP servers that have been tested with Gordon and are known to be
working:
@y
These are MCP servers that have been tested with Gordon and are known to be
working:
@z

@x
- `mcp/time`
- `mcp/fetch`
- `mcp/filesystem`
- `mcp/postgres`
- `mcp/git`
- `mcp/sqlite`
- `mcp/github`
@y
- `mcp/time`
- `mcp/fetch`
- `mcp/filesystem`
- `mcp/postgres`
- `mcp/git`
- `mcp/sqlite`
- `mcp/github`
@z

@x
### Untested (should work with appropriate API tokens)
@y
### Untested (should work with appropriate API tokens)
@z

@x
These are MCP servers that were not tested but should work if given the
appropriate API tokens:
@y
These are MCP servers that were not tested but should work if given the
appropriate API tokens:
@z

@x
- `mcp/brave-search`
- `mcp/gdrive`
- `mcp/slack`
- `mcp/google-maps`
- `mcp/gitlab`
- `mcp/everything`
- `mcp/aws-kb-retrieval-server`
- `mcp/sentry`
@y
- `mcp/brave-search`
- `mcp/gdrive`
- `mcp/slack`
- `mcp/google-maps`
- `mcp/gitlab`
- `mcp/everything`
- `mcp/aws-kb-retrieval-server`
- `mcp/sentry`
@z

@x
### Unsupported
@y
### Unsupported
@z

@x
These are MCP servers that are currently known to be unsupported:
@y
These are MCP servers that are currently known to be unsupported:
@z

@x
- `mcp/sequentialthinking` - (The tool description is too long)
- `mcp/puppeteer` - Puppeteer sends back images and Gordon doesn’t know how to
  handle them, it only handles text responses from tools
- `mcp/everart` - Everart sends back images and Gordon doesn’t know how to
  handle them, it only handles text responses from tools
- `mcp/memory` - There is no way to configure the server to use a custom path
  for its knowledge base
@y
- `mcp/sequentialthinking` - (The tool description is too long)
- `mcp/puppeteer` - Puppeteer sends back images and Gordon doesn’t know how to
  handle them, it only handles text responses from tools
- `mcp/everart` - Everart sends back images and Gordon doesn’t know how to
  handle them, it only handles text responses from tools
- `mcp/memory` - There is no way to configure the server to use a custom path
  for its knowledge base
@z
