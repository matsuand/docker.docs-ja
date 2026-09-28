%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x {{ define "renderChildren" }}
    <!--  Main titles -->
    <div class="navbar-group">
      <li class="navbar-group-font-title">
        {{ . }}
@y
    <!--  Main titles -->
    <div class="navbar-group">
      <li class="navbar-group-font-title">
        {{ T . }}
@z

@x
        href="{{ .Params.sidebar.goto }}"
@y
        href="__SUBDIR__{{ .Params.sidebar.goto }}"
@z

@x
        href="{{ .Permalink }}"
@y
        href="{{ .Permalink }}"
@z
