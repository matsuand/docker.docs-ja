%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x {{ define "renderChildren" }}
  {{- range .Params.sidebar.groups }}
    <!--  Main titles -->
    <div class="navbar-group">
      <li class="navbar-group-font-title">
        {{ . }}
@y
  {{- range .Params.sidebar.groups }}
    <!--  Main titles -->
    <div class="navbar-group">
      <li class="navbar-group-font-title">
        {{ T . }}
@z
