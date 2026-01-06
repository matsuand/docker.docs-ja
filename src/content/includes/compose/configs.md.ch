%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
Configs let services adapt their behaviour without the need to rebuild a Docker image. As with volumes, configs are mounted as files into a container's filesystem. The location of the mount point within the container defaults to `/<config-name>` in Linux containers and `C:\<config-name>` in Windows containers.
@y
config は Docker イメージの再ビルドを必要とせずに、サービスにおける動作を適用する機能です。
ボリュームと同様にして、config はコンテナー内のファイルシステムにおけるファイルとしてマウントされます。
コンテナー内のマウントポイントは、デフォルトで Linux コンテナーの場合 `/<config名>`、Windows コンテナーの場合 `C:\<config名>` です。
@z
