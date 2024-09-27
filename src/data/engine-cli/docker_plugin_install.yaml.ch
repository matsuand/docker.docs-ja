%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker plugin install
short: Install a plugin
long: |-
    Installs and enables a plugin. Docker looks first for the plugin on your Docker
    host. If the plugin does not exist locally, then the plugin is pulled from
    the registry. Note that the minimum required registry version to distribute
    plugins is 2.3.0.
@y
command: docker plugin install
short: プラグインをインストールします。
long: |-
    プラグインをインストールして有効化します。
    Docker は初めに Docker ホスト内のプラグインを探しにいきます。
    ローカルにプラグインが存在していなかった場合は、レジストリからプルされます。
    プラグインを提供するために必要となるレジストリの最低バージョンは 2.3.0 です。
@z

@x
usage: docker plugin install [OPTIONS] PLUGIN [KEY=VALUE...]
@y
usage: docker plugin install [OPTIONS] PLUGIN [KEY=VALUE...]
@z

% options:

@x alias
      description: Local name for plugin
@y
      description: プラグインのローカル名。
@z

@x disable
      description: Do not enable the plugin on install
@y
      description: インストール後にプラグインを有効にしません。
@z

@x disable-content-trust
      description: Skip image verification
@y
      description: イメージの検証を省略します。
@z

@x grant-all-permissions
      description: Grant all permissions necessary to run the plugin
@y
      description: プラグイン実行に必要となる権限をすべて許可します。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    The following example installs `vieus/sshfs` plugin and [sets](/reference/cli/docker/plugin/set/) its
    `DEBUG` environment variable to `1`. To install, `pull` the plugin from Docker
    Hub and prompt the user to accept the list of privileges that the plugin needs,
    set the plugin's parameters and enable the plugin.
@y
examples: |-
  以下の例ではプラグイン`vieus/sshfs`をインストールし、環境変数`DEBUG`を`1`に [設定](__SUBDIR__/reference/cli/docker/plugin/set/) します。
  インストールの際には Docker Hub からプラグインを`pull`し、プラグインに必要となる権限一覧を示してユーザーへの許可を求めます。
  そしてプラグインへのパラメーターを設定した上で、このプラグインを有効にします。
@z

% snip command...

@x
    After the plugin is installed, it appears in the list of plugins:
@y
    プラグインをインストールすれば、プラグイン一覧に表示されるようになります。
@z

% snip command...
% snip directives...
