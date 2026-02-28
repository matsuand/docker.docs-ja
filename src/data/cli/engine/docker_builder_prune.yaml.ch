%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker builder prune
short: Remove build cache
long: Remove build cache
usage: docker builder prune
@y
command: docker builder prune
short: ビルドキャッシュを削除します。
long: ビルドキャッシュを削除します。
usage: docker builder prune
@z

% options:

@x all
      description: Remove all unused build cache, not just dangling ones
@y
      description: 未使用のビルドキャッシュを削除します。ぶら下がっているもの (dangling) は削除しません。
@z

@x filter
      description: Provide filter values (e.g. `until=24h`)
@y
      description: フィルター値を設定します。(たとえば `until=24h`)
@z

@x force
      description: Do not prompt for confirmation
@y
      description: 確認プロンプトを表示しません。
@z

@x keep-storage
      description: Amount of disk space to keep for cache
@y
      description: キャッシュを保持するディスク容量を設定します。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

% snip directives...
