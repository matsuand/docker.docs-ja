%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
  {{ partial "heading.html" (dict "text" "Modules" "level" 2) }}
@y
  {{ partial "heading.html" (dict "text" "モジュール" "level" 2) }}
@z

@x
    {{ $b := fmt.Printf "%s\n\n{{< button url=`%s` text=`%s` >}}" $e.Summary $e.Permalink "Start" }}
@y
    {{ $b := fmt.Printf "%s\n\n{{< button url=`%s` text=`%s` >}}" $e.Summary $e.Permalink "スタート" }}
@z
