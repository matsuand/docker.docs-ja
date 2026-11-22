%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x enableGitInfo to false
title: Docker Docs
baseURL: https://docs.docker.com
refLinksErrorLevel: ERROR
enableGitInfo: true
disablePathToLower: true
enableInlineShortcodes: true
@y
title: Docker Docs
baseURL: https://docs.docker.com
#canonicalURLs: true
refLinksErrorLevel: ERROR
enableGitInfo: false
disablePathToLower: true
enableInlineShortcodes: true
ignoreFiles:
  - ".*Makefile$"
  - ".*Makefile\\.sub$"
  - ".*copyfiles\\.sub$"
defaultContentLanguage: ja
locale: 'ja-JP'
@z

@x
languages:
  en:
    label: English
@y
languages:
  ja:
    label: 日本語
@z

@x
  repo: https://github.com/docker/docs
@y
  repo: https://github.com/docker/docs
@z

------------------------------
suburldir 追加
------------------------------
@x
  example_node_version: "24"
@y
  example_node_version: "24"

  suburldir: /docker.docs-ja
@z

@x
      target: assets/css/highlight-github-dark.css
@y
      target: assets/css/highlight-github-dark.css

    - source: layouts
      target: layouts
      files:
        - "! **/Makefile"
        - "! **/Makefile.sub"
        - "! **/copyfiles.sub"
        - "**"
@z
