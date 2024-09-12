%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
title: Containerize a Ruby on Rails application
linkTitle: Containerize your app
@y
title: Containerize a Ruby on Rails application
linkTitle: Containerize your app
@z

@x
keywords: ruby, flask, containerize, initialize
description: Learn how to containerize a Ruby on Rails application.
@y
keywords: ruby, flask, containerize, initialize
description: Learn how to containerize a Ruby on Rails application.
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
* You have installed the latest version of [Docker Desktop](/get-started/get-docker.md).
* You have a [Git client](https://git-scm.com/downloads). The examples in this section show the Git CLI, but you can use any client.
@y
* You have installed the latest version of [Docker Desktop](get-started/get-docker.md).
* You have a [Git client](https://git-scm.com/downloads). The examples in this section show the Git CLI, but you can use any client.
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
This section walks you through containerizing and running a Ruby on Rails application.
@y
This section walks you through containerizing and running a Ruby on Rails application.
@z

@x
## Get the sample application
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
The sample application uses the popular [Ruby on Rails](https://rubyonrails.org/) framework.
@y
サンプルアプリケーションでは、人気の [Ruby on Rails](https://rubyonrails.org/) フレームワークを利用しています。
@z

@x
Clone the sample application to use with this guide. Open a terminal, change directory to a directory that you want to work in, and run the following command to clone the repository:
@y
本ガイドにおいて利用するサンプルアプリケーションをクローンします。
端末画面を開いて、作業を行うディレクトリに移動します。
そして以下のコマンドを実行してリポジトリをクローンします。
@z

% snip command...

@x
## Initialize Docker assets
@y
## Docker アセットの初期化 {#initialize-docker-assets}
@z

@x
Now that you have an application, you can create the necessary Docker assets to
containerize your application. You can use Docker Desktop's built-in Docker Init
feature to help streamline the process, or you can manually create the assets.
@y
アプリケーションの入手はできました。
次はアプリケーションのコンテナー化に必要となる Docker アセットを生成します。
Docker Desktop にはビルトインの Docker Init 機能があるので、効率的に作業を進められます。
あるいは手動でアセットを生成することもできます。
@z

@x
`docker init`, the command for bootstrapping the Docker-related assets for a project, does not yet support the Ruby programming language. This means that if you are working with Ruby, you'll need to create Dockerfiles and other related configurations manually.
@y
`docker init`, the command for bootstrapping the Docker-related assets for a project, does not yet support the Ruby programming language. This means that if you are working with Ruby, you'll need to create Dockerfiles and other related configurations manually.
@z

@x
Inside the `docker-ruby-on-rails` directory, create the following files:
@y
Inside the `docker-ruby-on-rails` directory, create the following files:
@z

@x
Create a file named `Dockerfile` with the following contents.
@y
Create a file named `Dockerfile` with the following contents.
@z

@x コード内コメント
# Use the official Ruby image with version 3.2.0
@y
# Ruby の公式イメージ、バージョン 3.2.0 を利用
@z
@x
# Install dependencies
@y
# 依存パッケージのインストール
@z
@x
# Install rbenv
@y
# rbenv のインストール
@z
@x
# Install the specified Ruby version using rbenv
@y
# rbenv を用いた Ruby の指定バージョンのインストール
@z
@x
# Set the working directory
@y
# ワーキングディレクトリの設定
@z
@x
# Copy the Gemfile and Gemfile.lock
@y
# Gemfile と Gemfile.lock のコピー
@z
@x
# Install Gems dependencies
@y
# 依存 Gem のインストール
@z
@x
# Copy the application code
@y
# アプリケーションコードのコピー
@z
@x
# Precompile assets (optional, if using Rails with assets)
@y
# Precompile assets (optional, if using Rails with assets)
@z

@x
# Expose the port the app runs on
EXPOSE 3000
@y
# Expose the port the app runs on
EXPOSE 3000
@z

@x
# Command to run the server
CMD ["rails", "server", "-b", "0.0.0.0"]
```
@y
# Command to run the server
CMD ["rails", "server", "-b", "0.0.0.0"]
```
@z

@x
Create a file named `compose.yaml` with the following contents.
@y
Create a file named `compose.yaml` with the following contents.
@z

@x
```yaml {collapse=true,title=compose.yaml}
services:
  web:
    build: .
    command: bundle exec rails s -b '0.0.0.0'
    volumes:
      - .:/myapp
    ports:
      - "3000:3000"
```
@y
```yaml {collapse=true,title=compose.yaml}
services:
  web:
    build: .
    command: bundle exec rails s -b '0.0.0.0'
    volumes:
      - .:/myapp
    ports:
      - "3000:3000"
```
@z

@x
Create a file named `.dockerignore` with the following contents.
@y
Create a file named `.dockerignore` with the following contents.
@z

@x
```text {collapse=true,title=".dockerignore"}
git
.gitignore
@y
```text {collapse=true,title=".dockerignore"}
git
.gitignore
@z

@x
# Created by https://www.gitignore.io/api/git,ruby,rails,jetbrains+all
# Edit at https://www.gitignore.io/?templates=git,ruby,rails,jetbrains+all
@y
# Created by https://www.gitignore.io/api/git,ruby,rails,jetbrains+all
# Edit at https://www.gitignore.io/?templates=git,ruby,rails,jetbrains+all
@z

@x
### Git ###
# Created by git for backups. To disable backups in Git:
# $ git config --global mergetool.keepBackup false
*.orig
@y
### Git ###
# Created by git for backups. To disable backups in Git:
# $ git config --global mergetool.keepBackup false
*.orig
@z

@x
# Created by git when using merge tools for conflicts
*.BACKUP.*
*.BASE.*
*.LOCAL.*
*.REMOTE.*
*_BACKUP_*.txt
*_BASE_*.txt
*_LOCAL_*.txt
*_REMOTE_*.txt
@y
# Created by git when using merge tools for conflicts
*.BACKUP.*
*.BASE.*
*.LOCAL.*
*.REMOTE.*
*_BACKUP_*.txt
*_BASE_*.txt
*_LOCAL_*.txt
*_REMOTE_*.txt
@z

@x
### JetBrains+all ###
# Covers JetBrains IDEs: IntelliJ, RubyMine, PhpStorm, AppCode, PyCharm, CLion, Android Studio and WebStorm
# Reference: https://intellij-support.jetbrains.com/hc/en-us/articles/206544839
@y
### JetBrains+all ###
# Covers JetBrains IDEs: IntelliJ, RubyMine, PhpStorm, AppCode, PyCharm, CLion, Android Studio and WebStorm
# Reference: https://intellij-support.jetbrains.com/hc/en-us/articles/206544839
@z

@x
# User-specific stuff
.idea/**/workspace.xml
.idea/**/tasks.xml
.idea/**/usage.statistics.xml
.idea/**/dictionaries
.idea/**/shelf
@y
# User-specific stuff
.idea/**/workspace.xml
.idea/**/tasks.xml
.idea/**/usage.statistics.xml
.idea/**/dictionaries
.idea/**/shelf
@z

@x
# Generated files
.idea/**/contentModel.xml
@y
# Generated files
.idea/**/contentModel.xml
@z

@x
# Sensitive or high-churn files
.idea/**/dataSources/
.idea/**/dataSources.ids
.idea/**/dataSources.local.xml
.idea/**/sqlDataSources.xml
.idea/**/dynamic.xml
.idea/**/uiDesigner.xml
.idea/**/dbnavigator.xml
@y
# Sensitive or high-churn files
.idea/**/dataSources/
.idea/**/dataSources.ids
.idea/**/dataSources.local.xml
.idea/**/sqlDataSources.xml
.idea/**/dynamic.xml
.idea/**/uiDesigner.xml
.idea/**/dbnavigator.xml
@z

@x
# Gradle
.idea/**/gradle.xml
.idea/**/libraries
@y
# Gradle
.idea/**/gradle.xml
.idea/**/libraries
@z

@x
# Gradle and Maven with auto-import
# When using Gradle or Maven with auto-import, you should exclude module files,
# since they will be recreated, and may cause churn.  Uncomment if using
# auto-import.
# .idea/modules.xml
# .idea/*.iml
# .idea/modules
# *.iml
# *.ipr
@y
# Gradle and Maven with auto-import
# When using Gradle or Maven with auto-import, you should exclude module files,
# since they will be recreated, and may cause churn.  Uncomment if using
# auto-import.
# .idea/modules.xml
# .idea/*.iml
# .idea/modules
# *.iml
# *.ipr
@z

@x
# CMake
cmake-build-*/
@y
# CMake
cmake-build-*/
@z

@x
# Mongo Explorer plugin
.idea/**/mongoSettings.xml
@y
# Mongo Explorer plugin
.idea/**/mongoSettings.xml
@z

@x
# File-based project format
*.iws
@y
# File-based project format
*.iws
@z

@x
# IntelliJ
out/
@y
# IntelliJ
out/
@z

@x
# mpeltonen/sbt-idea plugin
.idea_modules/
@y
# mpeltonen/sbt-idea plugin
.idea_modules/
@z

@x
# JIRA plugin
atlassian-ide-plugin.xml
@y
# JIRA plugin
atlassian-ide-plugin.xml
@z

@x
# Cursive Clojure plugin
.idea/replstate.xml
@y
# Cursive Clojure plugin
.idea/replstate.xml
@z

@x
# Crashlytics plugin (for Android Studio and IntelliJ)
com_crashlytics_export_strings.xml
crashlytics.properties
crashlytics-build.properties
fabric.properties
@y
# Crashlytics plugin (for Android Studio and IntelliJ)
com_crashlytics_export_strings.xml
crashlytics.properties
crashlytics-build.properties
fabric.properties
@z

@x
# Editor-based Rest Client
.idea/httpRequests
@y
# Editor-based Rest Client
.idea/httpRequests
@z

@x
# Android studio 3.1+ serialized cache file
.idea/caches/build_file_checksums.ser
@y
# Android studio 3.1+ serialized cache file
.idea/caches/build_file_checksums.ser
@z

@x
### JetBrains+all Patch ###
# Ignores the whole .idea folder and all .iml files
# See https://github.com/joeblau/gitignore.io/issues/186 and https://github.com/joeblau/gitignore.io/issues/360
@y
### JetBrains+all Patch ###
# Ignores the whole .idea folder and all .iml files
# See https://github.com/joeblau/gitignore.io/issues/186 and https://github.com/joeblau/gitignore.io/issues/360
@z

@x
.idea/
@y
.idea/
@z

@x
# Reason: https://github.com/joeblau/gitignore.io/issues/186#issuecomment-249601023
@y
# Reason: https://github.com/joeblau/gitignore.io/issues/186#issuecomment-249601023
@z

@x
*.iml
modules.xml
.idea/misc.xml
*.ipr
@y
*.iml
modules.xml
.idea/misc.xml
*.ipr
@z

@x
# Sonarlint plugin
.idea/sonarlint
@y
# Sonarlint plugin
.idea/sonarlint
@z

@x
### Rails ###
*.rbc
capybara-*.html
.rspec
/db/*.sqlite3
/db/*.sqlite3-journal
/public/system
/coverage/
/spec/tmp
rerun.txt
pickle-email-*.html
@y
### Rails ###
*.rbc
capybara-*.html
.rspec
/db/*.sqlite3
/db/*.sqlite3-journal
/public/system
/coverage/
/spec/tmp
rerun.txt
pickle-email-*.html
@z

@x
# Ignore all logfiles and tempfiles.
/log/*
/tmp/*
!/log/.keep
!/tmp/.keep
@y
# Ignore all logfiles and tempfiles.
/log/*
/tmp/*
!/log/.keep
!/tmp/.keep
@z

@x
# TODO Comment out this rule if you are OK with secrets being uploaded to the repo
config/initializers/secret_token.rb
config/master.key
@y
# TODO Comment out this rule if you are OK with secrets being uploaded to the repo
config/initializers/secret_token.rb
config/master.key
@z

@x
# Only include if you have production secrets in this file, which is no longer a Rails default
# config/secrets.yml
@y
# Only include if you have production secrets in this file, which is no longer a Rails default
# config/secrets.yml
@z

@x
# dotenv
# TODO Comment out this rule if environment variables can be committed
.env
@y
# dotenv
# TODO Comment out this rule if environment variables can be committed
.env
@z

@x
## Environment normalization:
/.bundle
/vendor/bundle
@y
## Environment normalization:
/.bundle
/vendor/bundle
@z

@x
# these should all be checked in to normalize the environment:
# Gemfile.lock, .ruby-version, .ruby-gemset
@y
# these should all be checked in to normalize the environment:
# Gemfile.lock, .ruby-version, .ruby-gemset
@z

@x
# unless supporting rvm < 1.11.0 or doing something fancy, ignore this:
.rvmrc
@y
# unless supporting rvm < 1.11.0 or doing something fancy, ignore this:
.rvmrc
@z

@x
# if using bower-rails ignore default bower_components path bower.json files
/vendor/assets/bower_components
*.bowerrc
bower.json
@y
# if using bower-rails ignore default bower_components path bower.json files
/vendor/assets/bower_components
*.bowerrc
bower.json
@z

@x
# Ignore pow environment settings
.powenv
@y
# Ignore pow environment settings
.powenv
@z

@x
# Ignore Byebug command history file.
.byebug_history
@y
# Ignore Byebug command history file.
.byebug_history
@z

@x
# Ignore node_modules
node_modules/
@y
# Ignore node_modules
node_modules/
@z

@x
# Ignore precompiled javascript packs
/public/packs
/public/packs-test
/public/assets
@y
# Ignore precompiled javascript packs
/public/packs
/public/packs-test
/public/assets
@z

@x
# Ignore yarn files
/yarn-error.log
yarn-debug.log*
.yarn-integrity
@y
# Ignore yarn files
/yarn-error.log
yarn-debug.log*
.yarn-integrity
@z

@x
# Ignore uploaded files in development
/storage/*
!/storage/.keep
@y
# Ignore uploaded files in development
/storage/*
!/storage/.keep
@z

@x
### Ruby ###
*.gem
/.config
/InstalledFiles
/pkg/
/spec/reports/
/spec/examples.txt
/test/tmp/
/test/version_tmp/
/tmp/
@y
### Ruby ###
*.gem
/.config
/InstalledFiles
/pkg/
/spec/reports/
/spec/examples.txt
/test/tmp/
/test/version_tmp/
/tmp/
@z

@x
# Used by dotenv library to load environment variables.
# .env
@y
# Used by dotenv library to load environment variables.
# .env
@z

@x
# Ignore Byebug command history file.
@y
# Ignore Byebug command history file.
@z

@x
## Specific to RubyMotion:
.dat*
.repl_history
build/
*.bridgesupport
build-iPhoneOS/
build-iPhoneSimulator/
@y
## Specific to RubyMotion:
.dat*
.repl_history
build/
*.bridgesupport
build-iPhoneOS/
build-iPhoneSimulator/
@z

@x
## Specific to RubyMotion (use of CocoaPods):
#
# We recommend against adding the Pods directory to your .gitignore. However
# you should judge for yourself, the pros and cons are mentioned at:
# https://guides.cocoapods.org/using/using-cocoapods.html#should-i-check-the-pods-directory-into-source-control
# vendor/Pods/
@y
## Specific to RubyMotion (use of CocoaPods):
#
# We recommend against adding the Pods directory to your .gitignore. However
# you should judge for yourself, the pros and cons are mentioned at:
# https://guides.cocoapods.org/using/using-cocoapods.html#should-i-check-the-pods-directory-into-source-control
# vendor/Pods/
@z

@x
## Documentation cache and generated files:
/.yardoc/
/_yardoc/
/doc/
/rdoc/
@y
## Documentation cache and generated files:
/.yardoc/
/_yardoc/
/doc/
/rdoc/
@z

@x
/.bundle/
/lib/bundler/man/
@y
/.bundle/
/lib/bundler/man/
@z

@x
# for a library or gem, you might want to ignore these files since the code is
# intended to run in multiple environments; otherwise, check them in:
# Gemfile.lock
# .ruby-version
# .ruby-gemset
@y
# for a library or gem, you might want to ignore these files since the code is
# intended to run in multiple environments; otherwise, check them in:
# Gemfile.lock
# .ruby-version
# .ruby-gemset
@z

@x
# unless supporting rvm < 1.11.0 or doing something fancy, ignore this:
@y
# unless supporting rvm < 1.11.0 or doing something fancy, ignore this:
@z

@x
# End of https://www.gitignore.io/api/git,ruby,rails,jetbrains+all
```
@y
# End of https://www.gitignore.io/api/git,ruby,rails,jetbrains+all
```
@z

@x
You should now have the following three files in your `docker-ruby-on-rails`
directory.
@y
You should now have the following three files in your `docker-ruby-on-rails`
directory.
@z

@x
- .dockerignore
- compose.yaml
- Dockerfile
@y
- .dockerignore
- compose.yaml
- Dockerfile
@z

@x
To learn more about the files, see the following:
 - [Dockerfile](/reference/dockerfile.md)
 - [.dockerignore](/reference/dockerfile.md#dockerignore-file)
 - [compose.yaml](/reference/compose-file/_index.md)
@y
To learn more about the files, see the following:
 - [Dockerfile](reference/dockerfile.md)
 - [.dockerignore](reference/dockerfile.md#dockerignore-file)
 - [compose.yaml](reference/compose-file/_index.md)
@z

@x
## Run the application
@y
## Run the application
@z

@x
Inside the `docker-ruby-on-rails` directory, run the following command in a
terminal.
@y
Inside the `docker-ruby-on-rails` directory, run the following command in a
terminal.
@z

@x
```console
$ docker compose up --build
```
@y
```console
$ docker compose up --build
```
@z

@x
Open a browser and view the application at [http://localhost:3000](http://localhost:3000). You should see a simple Ruby on Rails application.
@y
Open a browser and view the application at [http://localhost:3000](http://localhost:3000). You should see a simple Ruby on Rails application.
@z

@x
In the terminal, press `ctrl`+`c` to stop the application.
@y
In the terminal, press `ctrl`+`c` to stop the application.
@z

@x
### Run the application in the background
@y
### Run the application in the background
@z

@x
You can run the application detached from the terminal by adding the `-d`
option. Inside the `docker-ruby-on-rails` directory, run the following command
in a terminal.
@y
You can run the application detached from the terminal by adding the `-d`
option. Inside the `docker-ruby-on-rails` directory, run the following command
in a terminal.
@z

@x
```console
$ docker compose up --build -d
```
@y
```console
$ docker compose up --build -d
```
@z

@x
Open a browser and view the application at [http://localhost:3000](http://localhost:3000).
@y
Open a browser and view the application at [http://localhost:3000](http://localhost:3000).
@z

@x
You should see a simple Ruby on Rails application.
@y
You should see a simple Ruby on Rails application.
@z

@x
In the terminal, run the following command to stop the application.
@y
In the terminal, run the following command to stop the application.
@z

@x
```console
$ docker compose down
```
@y
```console
$ docker compose down
```
@z

@x
For more information about Compose commands, see the [Compose CLI
reference](/reference/cli/docker/compose/_index.md).
@y
For more information about Compose commands, see the [Compose CLI
reference](reference/cli/docker/compose/_index.md).
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you learned how you can containerize and run your Ruby
application using Docker.
@y
In this section, you learned how you can containerize and run your Ruby
application using Docker.
@z

@x
Related information:
 - [Docker Compose overview](/manuals/compose/_index.md)
@y
Related information:
 - [Docker Compose overview](manuals/compose/_index.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll learn how you can develop your application using
containers.
@y
In the next section, you'll learn how you can develop your application using
containers.
@z

@x
{{< button text="Develop your application" url="develop.md" >}}
@y
{{< button text="Develop your application" url="develop.md" >}}
@z
