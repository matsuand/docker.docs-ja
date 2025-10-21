%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Information about Docker Engine availability on SLES. Docker packages are no longer available for SLES s390x architecture.
keywords: sles, install, uninstall, upgrade, update, s390x, ibm-z, not supported, unavailable
title: Docker Engine on SLES (s390x)
linkTitle: SLES (s390x)
@y
description: Information about Docker Engine availability on SLES. Docker packages are no longer available for SLES s390x architecture.
keywords: sles, install, uninstall, upgrade, update, s390x, ibm-z, not supported, unavailable
title: SLES (s390x) における Docker Engine
linkTitle: SLES (s390x)
@z

@x
## Docker Engine is no longer available for SLES
@y
## SLES 向け Docker Engine は終了 {#docker-engine-is-no-longer-available-for-sles}
@z

@x
> [!IMPORTANT]
>
> Docker Engine packages are **no longer available** for SUSE Linux Enterprise Server (SLES) on the **s390x** architecture (IBM Z).
@y
> [!IMPORTANT]
>
> Docker Engine パッケージは、**s390x** アーキテクチャー (IBM Z) 用の SUSE Linux Enterprise Server (SLES) では利用できなくなりました。
@z

@x
IBM has made the decision to discontinue building and providing Docker Engine
packages for SLES s390x systems. Docker Inc. never directly built these packages
and was only involved in their deployment.
@y
IBM は SLES s390x システム上での Docker Engine パッケージのビルドと提供を行わない決定をしました。
Docker 社ではこれまでパッケージを直接ビルドすることを行っていませんので、デプロイされた中に含まれる形になっていただけでした。
@z

@x
## What this means
@y
## これは何を意味するか {#what-this-means}
@z

@x
- New Docker Engine installations are not available for SLES s390x
- Existing installations will continue to work but will not receive updates
- No new versions or security updates will be provided
- The Docker package repository for SLES s390x is no longer maintained
@y
- 今後 SLES s390x 向けの Docker Engine は提供されません。
- すでにインストール済みのものは動作しますが、パッケージ更新を受けることはありません。
- 新バージョンやセキュリティアップデートは今後提供されません。
- SLES s390x 向けの Docker パッケージリポジトリは今後メンテナンスされません。
@z

@x
## If you have Docker currently installed
@y
## すでに Docker をインストールしているなら {#if-you-have-docker-currently-installed}
@z

@x
If you currently have Docker Engine installed on a SLES s390x system:
@y
すでに SLES s390x システム上に Docker Engine をインストールしている場合は以下となります。
@z

@x
- Your existing Docker installation will continue to function
- No automatic updates will be available
- You should plan accordingly for your containerization needs
- Consider the security implications of running software without updates
@y
- すでにインストールしている Docker は今後も機能します。
- 自動アップデートは今後利用できません。
- コンテナー化の要件に応じて計画変更を必要とします。
- アップデートがないままソフトウェアを実行していくことになるため、セキュリティへの影響を考慮する必要があります。
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
For questions about this decision or alternative solutions, contact IBM support.
@y
上記の決定やそれに伴う別のソリューションに関しては IBM サポートへお問い合わせください。
@z
