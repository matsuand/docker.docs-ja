%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
Networks let services communicate with each other. By default Compose sets up a single network for your app. Each container for a service joins the default network and is both reachable by other containers on that network, and discoverable by the service's name. The top-level `networks` element lets you configure named networks that can be reused across multiple services. 
@y
ネットワークはサービス間のコミュニケーションを可能にします。
デフォルトで Compose はアプリケーションに対して一つのネットワークを用意します。
一つのサービスの元にある複数コンテナーは、互いにデフォルトのネットワークによって結びついています。
そして双方向に、それぞれから他方へネットワーク到達可能であり、サービス名を使って検出可能になっています。
トップレベルの `networks` 要素は、ネットワークへの名前づけを行い、複数サービス間でのネットワーク利用を可能とします。
@z
