%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Containerize Go apps using Docker
keywords: docker, getting started, go, golang, language, dockerfile
title: Go language-specific guide
@y
description: Containerize Go apps using Docker
keywords: docker, getting started, go, golang, language, dockerfile
title: Go 向けガイド
@z

@x
This guide will show you how to create, test, and deploy containerized Go applications using Docker.
@y
このガイドでは、Docker を使ってコンテナー化した Go アプリケーションの生成、テストデプロイについて説明していきます。
@z

@x
> **Acknowledgment**
>
> Docker would like to thank [Oliver Frolovs](https://www.linkedin.com/in/ofr/) for his contribution to this guide.
@y
> **Acknowledgment**
>
> Docker would like to thank [Oliver Frolovs](https://www.linkedin.com/in/ofr/) for his contribution to this guide.
@z

@x
## What will you learn?
@y
## What will you learn?
@z

@x
In this guide, you’ll learn how to:
@y
In this guide, you’ll learn how to:
@z

@x
* Create a `Dockerfile` which contains the instructions for building a container image for a program written in Go.
* Run the image as a container in your local Docker instance and manage the container's lifecycle.
* Use multi-stage builds for building small images efficiently while keeping your Dockerfiles easy to read and maintain.
* Use Docker Compose to orchestrate running of multiple related containers together in a development environment.
* Configure a CI/CD pipeline for your application using [GitHub Actions](https://docs.github.com/en/actions)
* Deploy your containerized Go application.
@y
* Create a `Dockerfile` which contains the instructions for building a container image for a program written in Go.
* Run the image as a container in your local Docker instance and manage the container's lifecycle.
* Use multi-stage builds for building small images efficiently while keeping your Dockerfiles easy to read and maintain.
* Use Docker Compose to orchestrate running of multiple related containers together in a development environment.
* Configure a CI/CD pipeline for your application using [GitHub Actions](https://docs.github.com/en/actions)
* Deploy your containerized Go application.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Some basic understanding of Go and its toolchain is assumed. This isn't a Go tutorial. If you are new to the language, 
the [Go website](https://golang.org/) is a great place to explore, 
so *go* (pun intended) check it out!
@y
Some basic understanding of Go and its toolchain is assumed. This isn't a Go tutorial. If you are new to the language, 
the [Go website](https://golang.org/) is a great place to explore, 
so *go* (pun intended) check it out!
@z

@x
You also must know some basic [Docker concepts](../../guides/docker-concepts/the-basics/what-is-a-container.md) as well as to 
be at least vaguely familiar with the [Dockerfile format](../../build/building/packaging.md#dockerfile).
@y
You also must know some basic [Docker concepts](../../guides/docker-concepts/the-basics/what-is-a-container.md) as well as to 
be at least vaguely familiar with the [Dockerfile format](../../build/building/packaging.md#dockerfile).
@z

@x
Your Docker set-up must have BuildKit enabled. BuildKit is enabled by default for all users on [Docker Desktop](../../desktop/index.md). 
If you have installed Docker Desktop, you don’t have to manually enable BuildKit. If you are running Docker on Linux, 
please check out BuildKit [getting started](../../build/buildkit/index.md#getting-started) page.
@y
Your Docker set-up must have BuildKit enabled. BuildKit is enabled by default for all users on [Docker Desktop](../../desktop/index.md). 
If you have installed Docker Desktop, you don’t have to manually enable BuildKit. If you are running Docker on Linux, 
please check out BuildKit [getting started](../../build/buildkit/index.md#getting-started) page.
@z

@x
Some familiarity with the command line is also expected.
@y
Some familiarity with the command line is also expected.
@z

@x
## What's next?
@y
## What's next?
@z

@x
The aim of this guide is to provide enough examples and instructions for you to containerize your own Go application and deploy it into the Cloud.
@y
The aim of this guide is to provide enough examples and instructions for you to containerize your own Go application and deploy it into the Cloud.
@z

@x
Start by building your first Go image.
@y
Start by building your first Go image.
@z

@x
{{< button text="Build your Go image" url="build-images.md" >}}
@y
{{< button text="Go イメージのビルド" url="build-images.md" >}}
@z
