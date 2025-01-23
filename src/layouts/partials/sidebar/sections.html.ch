%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x {{ define "renderChildren" }}
  {{- range .Params.sidebar.groups }}
    <li class="px-2 py-2 pb-2 text-gray-light dark:text-gray-dark uppercase
      text-xs font-semibold">{{ . }}</li>
@y
  {{- range .Params.sidebar.groups }}
    <li class="px-2 py-2 pb-2 text-gray-light dark:text-gray-dark
      text-xs font-semibold">{{ T . }}</li>
@z
