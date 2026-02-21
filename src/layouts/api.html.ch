%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<html lang="en">
@y
<html lang="ja">
@z

@x
  {{ $specURL := urls.Parse (printf "/%s%s.yaml" .File.Dir .File.ContentBaseName) }}
@y
  {{ $specURL := urls.Parse (printf "__SUBDIR__/%s%s.yaml" .File.Dir .File.ContentBaseName) }}
@z
