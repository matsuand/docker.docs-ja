%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Get started
keywords: Docker, get started, containers, AI agents, sandboxes, administration
description: Choose a tutorial to build and run an application, work with an AI agent safely, or set up Docker for your organization.
@y
title: はじめよう
keywords: Docker, get started, containers, AI agents, sandboxes, administration
description: チュートリアルを選んでアプリケーションをビルドし実行しましょう。また AI エージェントを安全に動作させたり、組織向けの Docker を設定しましょう。
@z

% installs:

@x
    - eyebrow: Docker
      title: Install Docker
      description: Get Docker Desktop or Docker Engine for your operating system.
      link: /get-started/get-docker/
@y
    - eyebrow: Docker
      title: Docker のインストール
      description: OS 向けの Docker Desktop や Docker Engine を入手します。
      link: __SUBDIR__/get-started/get-docker/
@z

@x
    - eyebrow: Docker Sandboxes
      title: Install Docker Sandboxes
      description: Install the sbx command to run coding agents in isolated environments.
      link: /ai/sandboxes/install/
@y
    - eyebrow: Docker サンドボックス
      title: Docker Sandbox のインストール
      description: sbx コマンドをインストールして、隔離された環境内でコーディングエージェントを実行しましょう。
      link: __SUBDIR__/ai/sandboxes/install/
@z

% tutorials:

@x
    - audience: New to Docker
      title: Build and share a containerized application
      description: Run a container and an application stack, build an image, and share it through Docker Hub.
      link: /get-started/tutorials/run-an-app/
@y
    - audience: Docker 入門
      title: コンテナー化アプリケーションのビルドと共有
      description: コンテナーとアプリケーションスタックの実行、イメージのビルドと共有、これらを Docker Hub を通じて行います。
      link: __SUBDIR__/get-started/tutorials/run-an-app/
@z

@x
    - audience: AI developers
      title: Run your coding agent in a sandbox
      description: Move your existing full-autonomy coding-agent workflow into a disposable Docker Sandbox.
      link: /get-started/tutorials/run-an-agent/
@y
    - audience: AI 開発者
      title: サンドボックス上でのコーディングエージェントの実行
      description: 完全自立型に組み上げた既存のコーディングエージェントワークフローを、使い捨て可能な Docker Sandobox に移行します。
      link: __SUBDIR__/get-started/tutorials/run-an-agent/
@z

@x
    - audience: Administrators
      title: Roll out Docker to a pilot group
      description: Invite a pilot user, apply a Docker Desktop policy, and verify the managed experience.
      link: /get-started/tutorials/admin-set-up/
@y
    - audience: 管理者
      title: パイロットグループへの移行
      description: パイロットユーザーの招待、Docker Desktop ポリシーの適用を通じて、管理作業を実践します。
      link: __SUBDIR__/get-started/tutorials/admin-set-up/
@z
