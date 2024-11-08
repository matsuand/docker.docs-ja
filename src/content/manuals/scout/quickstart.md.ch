%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Docker Scout quickstart
linkTitle: Quickstart
@y
title: Docker Scout クイックスタート
linkTitle: Quickstart
@z

@x
keywords: scout, supply chain, vulnerabilities, packages, cves, scan, analysis, analyze
description: Learn how to get started with Docker Scout to analyze images and fix vulnerabilities
@y
keywords: scout, supply chain, vulnerabilities, packages, cves, scan, analysis, analyze
description: Learn how to get started with Docker Scout to analyze images and fix vulnerabilities
@z

@x
Docker Scout analyzes image contents and generates a detailed report of packages
and vulnerabilities that it detects. It can provide you with
suggestions for how to remediate issues discovered by image analysis.
@y
Docker Scout はイメージ内容を分析し、そこから検出されるパッケージ内容やぜい弱性に関するレポートを生成します。
イメージの分析により問題が発見された場合には、これに対する修正提案が提供されます。
@z

@x
This guide takes a vulnerable container image and shows you how to use Docker
Scout to identify and fix the vulnerabilities, compare image versions over time,
and share the results with your team.
@y
This guide takes a vulnerable container image and shows you how to use Docker
Scout to identify and fix the vulnerabilities, compare image versions over time,
and share the results with your team.
@z

@x
## Step 1: Setup
@y
## 手順 1: セットアップ {#step-1-setup}
@z

@x
[This example project](https://github.com/docker/scout-demo-service) contains
a vulnerable Node.js application that you can use to follow along.
@y
[This example project](https://github.com/docker/scout-demo-service) contains
a vulnerable Node.js application that you can use to follow along.
@z

@x
1. Clone its repository:
@y
1. このリポジトリをクローンします。
@z

% snip command...

@x
2. Move into the directory:
@y
2. ディレクトリに移動します。
@z

% snip command...

@x
3. Make sure you're signed in to your Docker account,
   either by running the `docker login` command or by signing in with Docker Desktop.
@y
3. Docker アカウントにサインインできているかどうかを確認します。
   `docker login` コマンドを実行するか、Docker Desktop を使ってサインインします。
@z

@x
4. Build the image and push it to a `<ORG_NAME>/scout-demo:v1`,
   where `<ORG_NAME>` is the Docker Hub namespace you push to.
@y
4. イメージをビルドして、これを `<ORG_NAME>/scout-demo:v1` にプッシュします。
   `<ORG_NAME>` はプッシュする対象の Docker Hub 名前空間のことです。
@z

% snip command...

@x
## Step 2: Enable Docker Scout
@y
## 手順 2: Docker Scout の有効化 {#step-2-enable-docker-scout}
@z

@x (no slash) 対応
Docker Scout analyzes all local images by default. To analyze images in
remote repositories, you need to enable it first.
You can do this from Docker Hub, the Docker Scout Dashboard, and CLI.
[Find out how in the overview guide](/scout).
@y
Docker Scout analyzes all local images by default. To analyze images in
remote repositories, you need to enable it first.
You can do this from Docker Hub, the Docker Scout Dashboard, and CLI.
[Find out how in the overview guide](__SUBDIR__/scout).
@z

@x
1. Sign in to your Docker account with the `docker login` command or use the
   **Sign in** button in Docker Desktop.
@y
1. Sign in to your Docker account with the `docker login` command or use the
   **Sign in** button in Docker Desktop.
@z

@x
2. Next, enroll your organization with Docker Scout, using the `docker scout enroll` command.
@y
2. Next, enroll your organization with Docker Scout, using the `docker scout enroll` command.
@z

% snip command...

@x
3. Enable Docker Scout for your image repository with the `docker scout repo enable` command.
@y
3. Enable Docker Scout for your image repository with the `docker scout repo enable` command.
@z

% snip command...

@x
## Step 3: Analyze image vulnerabilities
@y
## 手順 3: イメージぜい弱性の分析 {#step-3-analyze-image-vulnerabilities}
@z

@x
After building, use the `docker scout` CLI command to see vulnerabilities
detected by Docker Scout.
@y
After building, use the `docker scout` CLI command to see vulnerabilities
detected by Docker Scout.
@z

@x
The example application for this guide uses a vulnerable version of Express.
The following command shows all CVEs affecting Express in the image you just
built:
@y
The example application for this guide uses a vulnerable version of Express.
The following command shows all CVEs affecting Express in the image you just
built:
@z

% snip command...

@x
Docker Scout analyzes the image you built most recently by default,
so there's no need to specify the name of the image in this case.
@y
Docker Scout analyzes the image you built most recently by default,
so there's no need to specify the name of the image in this case.
@z

@x (no slash) 対応
Learn more about the `docker scout cves` command in the
[`CLI reference documentation`](/reference/cli/docker/scout/cves).
@y
Learn more about the `docker scout cves` command in the
[`CLI reference documentation`](__SUBDIR__/reference/cli/docker/scout/cves).
@z

@x
## Step 4: Fix application vulnerabilities
@y
## 手順 4: アプリケーションのぜい弱性修正 {#step-4-fix-application-vulnerabilities}
@z

@x
The fix suggested by Docker Scout is to update
the underlying vulnerable express version to 4.17.3 or later.
@y
The fix suggested by Docker Scout is to update
the underlying vulnerable express version to 4.17.3 or later.
@z

@x
1. Update the `package.json` file with the new package version.
@y
1. パッケージバージョンを新たなものとなるように `package.json` ファイルを修正します。
@z

% snip code...

@x
2. Rebuild the image with a new tag and push it to your Docker Hub repository:
@y
2. 新しいタグをつけてイメージを再ビルドします。
   そして Docker Hub リポジトリにプッシュします。
@z

% snip command...

@x
Now, viewing the latest tag of the image in Docker Desktop, the Docker Scout
Dashboard, or CLI, you can see that you have fixed the vulnerability.
@y
Now, viewing the latest tag of the image in Docker Desktop, the Docker Scout
Dashboard, or CLI, you can see that you have fixed the vulnerability.
@z

% snip command...
% snip output...

@x
## Step 5: Evaluate policy compliance
@y
## 手順 5: Evaluate policy compliance {#step-5-evaluate-policy-compliance}
@z

@x
While inspecting vulnerabilities based on specific packages can be useful,
it isn't the most effective way to improve your supply chain conduct.
@y
While inspecting vulnerabilities based on specific packages can be useful,
it isn't the most effective way to improve your supply chain conduct.
@z

@x
Docker Scout also supports policy evaluation,
a higher-level concept for detecting and fixing issues in your images.
Policies are a set of customizable rules that let organizations track whether
images are compliant with their supply chain requirements.
@y
Docker Scout also supports policy evaluation,
a higher-level concept for detecting and fixing issues in your images.
Policies are a set of customizable rules that let organizations track whether
images are compliant with their supply chain requirements.
@z

@x
Because policy rules are specific to each organization,
you must specify which organization's policy you're evaluating against.
Use the `docker scout config` command to configure your Docker organization.
@y
Because policy rules are specific to each organization,
you must specify which organization's policy you're evaluating against.
Use the `docker scout config` command to configure your Docker organization.
@z

% snip command...

@x
Now you can run the `quickview` command to get an overview
of the compliance status for the image you just built.
The image is evaluated against the default policy configurations.
@y
Now you can run the `quickview` command to get an overview
of the compliance status for the image you just built.
The image is evaluated against the default policy configurations.
@z

% snip command...

% snip output...

@x
Exclamation marks in the status column indicate a violated policy.
Question marks indicate that there isn't enough metadata to complete the evaluation.
A check mark indicates compliance.
@y
Exclamation marks in the status column indicate a violated policy.
Question marks indicate that there isn't enough metadata to complete the evaluation.
A check mark indicates compliance.
@z

@x
## Step 6: Improve compliance
@y
## 手順 6: Improve compliance {#step-6-improve-compliance}
@z

@x
The output of the `quickview` command shows that there's room for improvement.
Some of the policies couldn't evaluate successfully (`No data`)
because the image lacks provenance and SBOM attestations.
The image also failed the check on a few of the evaluations.
@y
The output of the `quickview` command shows that there's room for improvement.
Some of the policies couldn't evaluate successfully (`No data`)
because the image lacks provenance and SBOM attestations.
The image also failed the check on a few of the evaluations.
@z

@x
Policy evaluation does more than just check for vulnerabilities.
Take the `Default non-root user` policy for example.
This policy helps improve runtime security by ensuring that
images aren't set to run as the `root` superuser by default.
@y
Policy evaluation does more than just check for vulnerabilities.
Take the `Default non-root user` policy for example.
This policy helps improve runtime security by ensuring that
images aren't set to run as the `root` superuser by default.
@z

@x
To address this policy violation, edit the Dockerfile by adding a `USER`
instruction, specifying a non-root user:
@y
To address this policy violation, edit the Dockerfile by adding a `USER`
instruction, specifying a non-root user:
@z

% snip output...

@x
Additionally, to get a more complete policy evaluation result,
your image should have SBOM and provenance attestations attached to it.
Docker Scout uses the provenance attestations to determine how the image was
built so that it can provide a better evaluation result.
@y
Additionally, to get a more complete policy evaluation result,
your image should have SBOM and provenance attestations attached to it.
Docker Scout uses the provenance attestations to determine how the image was
built so that it can provide a better evaluation result.
@z

@x
Before you can build an image with attestations,
you must enable the [containerd image store](/manuals/desktop/features/containerd.md)
(or create a custom builder using the `docker-container` driver).
The classic image store doesn't support manifest lists,
which is how the provenance attestations are attached to an image.
@y
Before you can build an image with attestations,
you must enable the [containerd image store](manuals/desktop/features/containerd.md)
(or create a custom builder using the `docker-container` driver).
The classic image store doesn't support manifest lists,
which is how the provenance attestations are attached to an image.
@z

@x
Open **Settings** in Docker Desktop. Under the **General** section, make sure
that the **Use containerd for pulling and storing images** option is checked.
Note that changing image stores temporarily hides images and containers of the
inactive image store until you switch back.
@y
Open **Settings** in Docker Desktop. Under the **General** section, make sure
that the **Use containerd for pulling and storing images** option is checked.
Note that changing image stores temporarily hides images and containers of the
inactive image store until you switch back.
@z

@x
With the containerd image store enabled, rebuild the image with a new `v3` tag.
This time, add the `--provenance=true` and `--sbom=true` flags.
@y
With the containerd image store enabled, rebuild the image with a new `v3` tag.
This time, add the `--provenance=true` and `--sbom=true` flags.
@z

% snip command...

@x
## Step 7: View in Dashboard
@y
## 手順 7: View in Dashboard {#step-7-view-in-dashboard}
@z

@x
After pushing the updated image with attestations, it's time to view the
results through a different lens: the Docker Scout Dashboard.
@y
After pushing the updated image with attestations, it's time to view the
results through a different lens: the Docker Scout Dashboard.
@z

@x
1. Open the [Docker Scout Dashboard](https://scout.docker.com/).
2. Sign in with your Docker account.
3. Select **Images** in the left-hand navigation.
@y
1. Open the [Docker Scout Dashboard](https://scout.docker.com/).
2. Sign in with your Docker account.
3. Select **Images** in the left-hand navigation.
@z

@x
The images page lists your Scout-enabled repositories.
Select the image in the list to open the **Image details** sidebar.
The sidebar shows a compliance overview for the last pushed tag of a repository.
@y
The images page lists your Scout-enabled repositories.
Select the image in the list to open the **Image details** sidebar.
The sidebar shows a compliance overview for the last pushed tag of a repository.
@z

@x
> [!NOTE]
>
> If policy results haven't appeared yet, try refreshing the page.
> It might take a few minutes before the results appear if this is your
> first time using the Docker Scout Dashboard.
@y
> [!NOTE]
>
> If policy results haven't appeared yet, try refreshing the page.
> It might take a few minutes before the results appear if this is your
> first time using the Docker Scout Dashboard.
@z

@x
Inspect the **Up-to-Date Base Images** policy.
This policy checks whether base images you use are up-to-date.
It currently has a non-compliant status,
because the example image uses an old version `alpine` as a base image.
@y
Inspect the **Up-to-Date Base Images** policy.
This policy checks whether base images you use are up-to-date.
It currently has a non-compliant status,
because the example image uses an old version `alpine` as a base image.
@z

@x
Select the **View fix** button next to the policy name for details about the violation,
and recommendations on how to address it.
In this case, the recommended action is to enable
[Docker Scout's GitHub integration](./integrations/source-code-management/github.md),
which helps keep your base images up-to-date automatically.
@y
Select the **View fix** button next to the policy name for details about the violation,
and recommendations on how to address it.
In this case, the recommended action is to enable
[Docker Scout's GitHub integration](./integrations/source-code-management/github.md),
which helps keep your base images up-to-date automatically.
@z

@x
> [!TIP]
>
> You can't enable this integration for the demo app used in this guide.
> Feel free to push the code to a GitHub repository that you own,
> and try out the integration there!
@y
> [!TIP]
>
> You can't enable this integration for the demo app used in this guide.
> Feel free to push the code to a GitHub repository that you own,
> and try out the integration there!
@z

@x
## Summary
@y
## まとめ {#summary}
@z

@x
This quickstart guide has scratched the surface on some of the ways
Docker Scout can support software supply chain management:
@y
This quickstart guide has scratched the surface on some of the ways
Docker Scout can support software supply chain management:
@z

@x
- How to enable Docker Scout for your repositories
- Analyzing images for vulnerabilities
- Policy and compliance
- Fixing vulnerabilities and improving compliance
@y
- How to enable Docker Scout for your repositories
- Analyzing images for vulnerabilities
- Policy and compliance
- Fixing vulnerabilities and improving compliance
@z

@x
## What's next?
@y
## What's next? {#whats-next}
@z

@x
There's lots more to discover, from third-party integrations,
to policy customization, and runtime environment monitoring in real-time.
@y
There's lots more to discover, from third-party integrations,
to policy customization, and runtime environment monitoring in real-time.
@z

@x
Check out the following sections:
@y
Check out the following sections:
@z

@x
- [Image analysis](/manuals/scout/explore/analysis.md)
- [Data sources](/scout/advisory-db-sources)
- [Docker Scout Dashboard](/scout/dashboard)
- [Integrations](./integrations/_index.md)
- [Policy evaluation](./policy/_index.md)
@y
- [Image analysis](manuals/scout/explore/analysis.md)
- [Data sources](__SUBDIR__/scout/advisory-db-sources)
- [Docker Scout Dashboard](__SUBDIR__/scout/dashboard)
- [Integrations](./integrations/_index.md)
- [Policy evaluation](./policy/_index.md)
@z
