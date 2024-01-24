%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<!DOCTYPE html>
<html lang="en">
@y
<!DOCTYPE html>
<html lang="ja">
@z

@x
<head>
  {{ partial "head.html" . }}
</head>
@y
<head>
  {{ partial "head.html" . }}
</head>
@z

@x
<body
  class="flex h-max flex-col divide-y divide-divider-light bg-background-light text-base dark:divide-divider-dark dark:bg-background-dark dark:text-white">
  {{ partial "header.html" . }}
  <main class="flex w-full min-h-screen flex-col gap-4 items-stretch self-center">
    <div id="sidebar"
      class="hidden z-10 top-16 h-full md:fixed md:w-screen md:hidden bg-gray-light-100 dark:bg-gray-dark-100">
      {{ partial "sidebar.html" . }}
    </div>
    <div class="flex w-[1200px] flex-col gap-4 items-stretch self-center py-6 lg:w-full">
      <div class="flex flex-col items-center p-6">
        <h1 class="py-2 text-center text-3xl md:text-2xl">
          What can we help you find?
        </h1>
      </div>
@y
<body
  class="flex h-max flex-col divide-y divide-divider-light bg-background-light text-base dark:divide-divider-dark dark:bg-background-dark dark:text-white">
  {{ partial "header.html" . }}
  <main class="flex w-full min-h-screen flex-col gap-4 items-stretch self-center">
    <div id="sidebar"
      class="hidden z-10 top-16 h-full md:fixed md:w-screen md:hidden bg-gray-light-100 dark:bg-gray-dark-100">
      {{ partial "sidebar.html" . }}
    </div>
    <div class="flex w-[1200px] flex-col gap-4 items-stretch self-center py-6 lg:w-full">
      <div class="flex flex-col items-center p-6">
        <h1 class="py-2 text-center text-3xl md:text-2xl">
          お探しのものは何ですか？
        </h1><br/>
        <div align="center">暫定公開中 __THISDATE__<br/>(<a href="https://github.com/docker/docs/commit/__COMMITHASH__" target="_blank">github.com/docker/docs@__COMMITHASH__ 対応, __COMMITDATE__</a>)</div>
      </div>
@z

@x
      <div class="grid grid-cols-3 gap-4 p-6 sm:flex sm:flex-col xl:grid-cols-2">
        {{ range .Params.grid }}
        <div>
          <a class="h-full" href="{{ .link }}">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <img class="hidden w-[64px] dark:block" src="{{ .image.dark }}" />
                <img class="w-[64px] dark:hidden" src="{{ .image.light }}" />
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    {{ .title }}
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                {{ .description | markdownify }}
              </div>
            </div>
          </a>
        </div>
        {{ end }}
      </div>
@y
      <div class="grid grid-cols-3 gap-4 p-6 sm:flex sm:flex-col xl:grid-cols-2">
        {{ range .Params.grid }}
        <div>
          <a class="h-full" href="{{ .link }}">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <img class="hidden w-[64px] dark:block" src="{{ .image.dark }}" />
                <img class="w-[64px] dark:hidden" src="{{ .image.light }}" />
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    {{ .title }}
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                {{ .description | markdownify }}
              </div>
            </div>
          </a>
        </div>
        {{ end }}
      </div>
@z

@x
      <div class="mx-6 text-white border border-blue-light dark:border-blue-dark">
        {{ $banner := resources.Get "images/banner.webp" }}
        <div class="bg-cover" style="background-image: url('{{ $banner.Permalink }}')">
          <div class="grid p-12 gap-8 grid-cols-2 sm:grid-cols-1 items-center">
            {{ $dbcLogo := resources.Get "images/build-cloud-white.svg" }}
            <img class="w-full" src="{{ $dbcLogo.Permalink }}" />
            <div class="flex flex-col gap-4 text-base">
              <p>
                Docker Build Cloud is a next-generation build service that
                accelerates your builds using remote builders with
                end-to-end encryption, a shared build cache for teams, and
                native multi-platform builds. Get started today for free.
              </p>
              <div class="flex gap-4">
                <a href="https://build.docker.com/"
                  class="transition cursor-pointer duration-300 py-2 px-4 rounded bg-blue-dark hover:bg-blue-light-600 text-white">Dashboard</a>
                <a href="/build/cloud/"
                  class="transition cursor-pointer duration-300 py-2 px-4 rounded bg-blue-dark hover:bg-blue-light-600 text-white">Docs</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
@y
      <div class="mx-6 text-white border border-blue-light dark:border-blue-dark">
        {{ $banner := resources.Get "images/banner.webp" }}
        <div class="bg-cover" style="background-image: url('{{ $banner.Permalink }}')">
          <div class="grid p-12 gap-8 grid-cols-2 sm:grid-cols-1 items-center">
            {{ $dbcLogo := resources.Get "images/build-cloud-white.svg" }}
            <img class="w-full" src="{{ $dbcLogo.Permalink }}" />
            <div class="flex flex-col gap-4 text-base">
              <p>
                Docker Build Cloud は次世代のビルドサービスです。
                リモートビルダーを利用してエンドツーエンドの暗号化、チーム向けのビルドキャッシュ共有化、ネイティブなマルチプラットフォームといったビルド作業を支援します。
                今から無料ではじめましょう。
              </p>
              <div class="flex gap-4">
                <a href="https://build.docker.com/"
                  class="transition cursor-pointer duration-300 py-2 px-4 rounded bg-blue-dark hover:bg-blue-light-600 text-white">ダッシュボード</a>
                <a href="build/cloud/"
                  class="transition cursor-pointer duration-300 py-2 px-4 rounded bg-blue-dark hover:bg-blue-light-600 text-white">ドキュメント</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
@z

@x
    <div class="flex mx-auto w-[1200px] flex-col gap-4 p-6 lg:w-full">
      <div class="grid grid-cols-3 gap-4 sm:flex sm:flex-col xl:grid-cols-2">
        <div class="col-start-1 col-end-3 bg-white p-6 dark:bg-gray-dark-200">
          <div x-data="{ selected: 'explore' }" aria-role="tabpanel">
            <div aria-role="tablist" class="space-x-2">
              <button class="p-1" :class="selected === 'explore' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'explore'">
                Explore Docker
              </button>
              <button class="p-1" :class="selected === 'faq' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'faq'">
                Browse FAQs
              </button>
              <button class="p-1" :class="selected === 'support' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'support'">
                Get support
              </button>
            </div>
            <hr />
@y
    <div class="flex mx-auto w-[1200px] flex-col gap-4 p-6 lg:w-full">
      <div class="grid grid-cols-3 gap-4 sm:flex sm:flex-col xl:grid-cols-2">
        <div class="col-start-1 col-end-3 bg-white p-6 dark:bg-gray-dark-200">
          <div x-data="{ selected: 'explore' }" aria-role="tabpanel">
            <div aria-role="tablist" class="space-x-2">
              <button class="p-1" :class="selected === 'explore' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'explore'">
                Docker を知る
              </button>
              <button class="p-1" :class="selected === 'faq' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'faq'">
                FAQ
              </button>
              <button class="p-1" :class="selected === 'support' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'support'">
                サポート
              </button>
            </div>
            <hr />
@z

@x
            <div>
              <div class="flex justify-items-center py-4 sm:flex-col" aria-role="tab"
                :class="selected !== 'explore' && 'hidden'">
                <ul class="w-full space-y-3">
                  <li>
                    <a class="link" href="/engine/reference/builder/">Write a Dockerfile</a>
                  </li>
                  <li>
                    <a class="link" href="/network/">Manage container networking</a>
                  </li>
                  <li>
                    <a class="link" href="/compose/compose-file/">Write a Docker Compose file</a>
                  </li>
                  <li>
                    <a class="link" href="/storage/">Work with volumes and mounts</a>
                  </li>
                  <li>
                    <a class="link" href="/get-started/04_sharing_app/">Share images on Docker Hub</a>
                  </li>
                </ul>
@y
            <div>
              <div class="flex justify-items-center py-4 sm:flex-col" aria-role="tab"
                :class="selected !== 'explore' && 'hidden'">
                <ul class="w-full space-y-3">
                  <li>
                    <a class="link" href="engine/reference/builder/">Dockerfile の書き方</a>
                  </li>
                  <li>
                    <a class="link" href="network/">コンテナーネットワークの管理</a>
                  </li>
                  <li>
                    <a class="link" href="compose/compose-file/">Docker Compose ファイルの書き方</a>
                  </li>
                  <li>
                    <a class="link" href="storage/">ボリュームとマウントを使った作業</a>
                  </li>
                  <li>
                    <a class="link" href="get-started/04_sharing_app/">Docker Hub 上でのイメージ共有</a>
                  </li>
                </ul>
@z

@x
                <ul class="w-full space-y-3">
                  <li>
                    <a class="link" href="/config/daemon/">Configure the Docker daemon</a>
                  </li>
                  <li>
                    <a class="link" href="/get-started/02_our_app/">Build and run an image</a>
                  </li>
                  <li>
                    <a class="link" href="/config/labels-custom-metadata/">Manage Docker objects</a>
                  </li>
                  <li>
                    <a class="link" href="/build/building/multi-stage/">Multi-stage builds</a>
                  </li>
                </ul>
              </div>
@y
                <ul class="w-full space-y-3">
                  <li>
                    <a class="link" href="config/daemon/">Docker デーモンの設定</a>
                  </li>
                  <li>
                    <a class="link" href="get-started/02_our_app/">イメージのビルドと実行</a>
                  </li>
                  <li>
                    <a class="link" href="config/labels-custom-metadata/">Docker オブジェクトの管理</a>
                  </li>
                  <li>
                    <a class="link" href="build/building/multi-stage/">マルチステージビルド</a>
                  </li>
                </ul>
              </div>
@z

@x
              <div class="flex justify-items-center py-4 sm:flex-col" aria-role="tab"
                :class="selected !== 'faq' && 'hidden'">
                <div class="w-full">
                  <h2 class="text-lg mb-2">Common FAQs</h6>
                    <ul class="space-y-3">
                      <li>
                        <a class="link" href="https://github.com/docker/awesome-compose" target="_blank"
                          rel="noopener">Where can I find example Compose files?</a>
                      </li>
                      <li>
                        <a class="link"
                          href="/desktop/faqs/general/#how-do-i-connect-from-a-container-to-a-service-on-the-host">How
                          do I connect from a container to a service?</a>
                      </li>
                      <li>
                        <a class="link" href="/get-started/04_sharing_app/">How do I share images on Docker Hub?</a>
                      </li>
                    </ul>
                </div>
@y
              <div class="flex justify-items-center py-4 sm:flex-col" aria-role="tab"
                :class="selected !== 'faq' && 'hidden'">
                <div class="w-full">
                  <h2 class="text-lg mb-2">共通 FAQ</h6>
                    <ul class="space-y-3">
                      <li>
                        <a class="link" href="https://github.com/docker/awesome-compose" target="_blank"
                          rel="noopener">Compose ファイルのサンプルはどこに？</a>
                      </li>
                      <li>
                        <a class="link"
                          href="desktop/faqs/general/#how-do-i-connect-from-a-container-to-a-service-on-the-host">どうやってコンテナーからサービスにアクセスする？</a>
                      </li>
                      <li>
                        <a class="link" href="get-started/04_sharing_app/">Docker Hub にてどうやってイメージを共有する？</a>
                      </li>
                    </ul>
                </div>
@z

@x
                <div class="w-full">
                  <h2 class="text-lg mb-2">Products</h6>
                    <ul class="space-y-3">
                      <li>
                        <a class="link" href="/desktop/faqs/general/">Docker Desktop</a>
                      </li>
                      <li>
                        <a href="/desktop/faqs/macfaqs/" class="link">Docker Desktop for Mac</a>
                      </li>
                      <li>
                        <a class="link" href="/desktop/faqs/windowsfaqs/">Docker Desktop for Windows</a>
                      </li>
                      <li>
                        <a class="link" href="/desktop/faqs/linuxfaqs/">Docker Desktop for Linux</a>
                      </li>
                      <li>
                        <a class="link" href="/faq/security/single-sign-on/faqs/">Docker Single Sign-on</a>
                      </li>
                    </ul>
                </div>
              </div>
@y
                <div class="w-full">
                  <h2 class="text-lg mb-2">製品</h6>
                    <ul class="space-y-3">
                      <li>
                        <a class="link" href="desktop/faqs/general/">Docker Desktop</a>
                      </li>
                      <li>
                        <a href="desktop/faqs/macfaqs/" class="link">Docker Desktop for Mac</a>
                      </li>
                      <li>
                        <a class="link" href="desktop/faqs/windowsfaqs/">Docker Desktop for Windows</a>
                      </li>
                      <li>
                        <a class="link" href="desktop/faqs/linuxfaqs/">Docker Desktop for Linux</a>
                      </li>
                      <li>
                        <a class="link" href="faq/security/single-sign-on/faqs/">Docker Single Sign-on</a>
                      </li>
                    </ul>
                </div>
              </div>
@z

@x
              <div class="flex" aria-role="tab" :class="selected !== 'support' && 'hidden'">
                <div class="w-full">
                  <ul class="py-4 space-y-3">
                    <li>
                      <a class="link" href="/support/">Get support</a>
                    </li>
                    <li>
                      <a class="link" href="https://dockercommunity.slack.com/" target="_blank" rel="noopener">Docker
                        community Slack</a>
                    </li>
                    <li>
                      <a class="link" href="https://docker.com/company/contact/" target="_blank" rel="noopener">Contact
                        Docker</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
@y
              <div class="flex" aria-role="tab" :class="selected !== 'support' && 'hidden'">
                <div class="w-full">
                  <ul class="py-4 space-y-3">
                    <li>
                      <a class="link" href="support/">サポート</a>
                    </li>
                    <li>
                      <a class="link" href="https://dockercommunity.slack.com/" target="_blank" rel="noopener">Docker
                        コミュニティ Slack</a>
                    </li>
                    <li>
                      <a class="link" href="https://docker.com/company/contact/" target="_blank" rel="noopener">Docker への問い合わせ</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
@z

@x
        <div class="bg-white p-6 space-y-3 dark:bg-gray-dark-200">
          <h2 class="text-xl mb-2">Popular videos</h2>
          <p>Watch the most popular videos from DockerCon.</p>
          <a class="link flex gap-4 items-center" href="https://youtu.be/gAGEar5HQoU">
            <img src="/assets/images/video.svg" width="65" height="44" />
            <p>How to get started with Docker</p>
          </a>
          <a class="link flex gap-4 items-center" href="https://youtu.be/xmLVNpyJ530?t=30">
            <img src="/assets/images/video.svg" width="65" height="44" />
            <p>How to to build and test your Docker images in the Cloud</p>
          </a>
          <a class="link flex gap-4 items-center" href="https://youtu.be/QeQ2MH5f_BE?t=31">
            <img src="/assets/images/video.svg" width="65" height="44" />
            <p>Simplify all the things with Docker Compose</p>
          </a>
        </div>
      </div>
@y
        <div class="bg-white p-6 space-y-3 dark:bg-gray-dark-200">
          <h2 class="text-xl mb-2">人気のビデオ</h2>
          <p>DockerCon での最も人気のあるビデオをご覧ください。</p>
          <a class="link flex gap-4 items-center" href="https://youtu.be/gAGEar5HQoU">
            <img src="assets/images/video.svg" width="65" height="44" />
            <p>Docker のはじめ方</p>
          </a>
          <a class="link flex gap-4 items-center" href="https://youtu.be/xmLVNpyJ530?t=30">
            <img src="assets/images/video.svg" width="65" height="44" />
            <p>クラウド上での Docker イメージのビルドとテスト</p>
          </a>
          <a class="link flex gap-4 items-center" href="https://youtu.be/QeQ2MH5f_BE?t=31">
            <img src="assets/images/video.svg" width="65" height="44" />
            <p>Docker Compose を使ってあらゆるものを単純化する</p>
          </a>
        </div>
      </div>
@z

@x
      <div class="bg-white p-6 dark:bg-gray-dark-200">
        <div x-data="{ selected: 'desktop' }" aria-role="tabpanel">
          <div aria-role="tablist" class="space-x-2">
            <button class="p-1" :class="selected === 'desktop' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'desktop'">
              Desktop
            </button>
            <button class="p-1" :class="selected === 'engine' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'engine'">
              Engine
            </button>
            <button class="p-1" :class="selected === 'build' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'build'">
              Build
            </button>
            <button class="p-1" :class="selected === 'compose' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'compose'">
              Compose
            </button>
            <button class="p-1" :class="selected === 'hub' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'hub'">
              Hub
            </button>
          </div>
          <hr />
@y
      <div class="bg-white p-6 dark:bg-gray-dark-200">
        <div x-data="{ selected: 'desktop' }" aria-role="tabpanel">
          <div aria-role="tablist" class="space-x-2">
            <button class="p-1" :class="selected === 'desktop' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'desktop'">
              Desktop
            </button>
            <button class="p-1" :class="selected === 'engine' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'engine'">
              Engine
            </button>
            <button class="p-1" :class="selected === 'build' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'build'">
              Build
            </button>
            <button class="p-1" :class="selected === 'compose' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'compose'">
              Compose
            </button>
            <button class="p-1" :class="selected === 'hub' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'hub'">
              Hub
            </button>
          </div>
          <hr />
@z

@x
          <div>
            <div x-data="{os: 'windows'}" class="flex gap-6 py-8 md:flex-col" aria-role="tab"
              :class="selected !== 'desktop' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/laptop.svg">
                <h2 class="text-xl">Docker Desktop</h2>
                <select class="p-2 rounded-sm bg-gray-light-100 dark:bg-gray-dark-100"
                  x-on:change="os = $event.target.value">
                  <option value="windows">Windows</option>
                  <option value="mac">Mac</option>
                  <option value="linux">Linux</option>
                </select>
              </div>
@y
          <div>
            <div x-data="{os: 'windows'}" class="flex gap-6 py-8 md:flex-col" aria-role="tab"
              :class="selected !== 'desktop' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="assets/images/laptop.svg">
                <h2 class="text-xl">Docker Desktop</h2>
                <select class="p-2 rounded-sm bg-gray-light-100 dark:bg-gray-dark-100"
                  x-on:change="os = $event.target.value">
                  <option value="windows">Windows</option>
                  <option value="mac">Mac</option>
                  <option value="linux">Linux</option>
                </select>
              </div>
@z

@x
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Desktop</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
@y
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Docker Desktop を使ってはじめよう</h2>
                <p>初めてのアプリ記述、データストレージ、ネットワーク、Swarm を経験するウォークスルーをはじめましょう。最終的にクラウド上にある本番環境にアプリを動作させましょう。</p>
                <a class="link" href="get-started/">Docker について学ぶ</a>
              </div>
@z

@x
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3" x-show="os === 'windows'">
                  <li><a class="link" href="/desktop/windows/wsl/">Docker Desktop WSL 2 backend</a></li>
                  <li><a class="link" href="/desktop/use-desktop/">Explore Docker Desktop</a></li>
                  <li><a class="link" href="/desktop/vm-vdi/">VM and VDI support</a></li>
                  <li><a class="link" href="/desktop/windows/release-notes/">Release notes</a></li>
                  <li><a class="link" href="/desktop/containerd/">containerd image store</a></li>
                </ul>
                <ul class="space-y-3" x-show="os === 'mac'">
                  <li><a class="link" href="/desktop/use-desktop/">Explore Docker Desktop</a></li>
                  <li><a class="link" href="/desktop/install/mac-install/">Install Docker Desktop on Mac</a></li>
                  <li><a class="link" href="/desktop/release-notes/">Release notes</a></li>
                  <li><a class="link" href="/desktop/mac/permission-requirements/">Understand permission requirements</a></li>
                </ul>
                <ul class="space-y-3" x-show="os === 'linux'">
                  <li><a class="link" href="/desktop/use-desktop/">Explore Docker Desktop</a></li>
                <li><a class="link" href="/desktop/install/linux-install/">Install Docker Desktop on Linux</a></li>
                <li><a class="link" href="/desktop/release-notes/">Release notes</a></li>
              </ul>
              </div>
            </div>
@y
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">人気の記事</h2>
                <ul class="space-y-3" x-show="os === 'windows'">
                  <li><a class="link" href="desktop/windows/wsl/">Docker Desktop WSL 2 バックエンド</a></li>
                  <li><a class="link" href="desktop/use-desktop/">Docker Desktop を使ってみる</a></li>
                  <li><a class="link" href="desktop/vm-vdi/">VM および VDI サポート</a></li>
                  <li><a class="link" href="desktop/windows/release-notes/">リリースノート</a></li>
                  <li><a class="link" href="desktop/containerd/">コンテナー化イメージストア</a></li>
                </ul>
                <ul class="space-y-3" x-show="os === 'mac'">
                  <li><a class="link" href="desktop/use-desktop/">Docker Desktop を使ってみる</a></li>
                  <li><a class="link" href="desktop/install/mac-install/">Docker Desktop on Mac のインストール</a></li>
                  <li><a class="link" href="desktop/release-notes/">リリースノート</a></li>
                  <li><a class="link" href="desktop/mac/permission-requirements/">パーミッション要件の理解</a></li>
                </ul>
                <ul class="space-y-3" x-show="os === 'linux'">
                  <li><a class="link" href="desktop/use-desktop/">Docker Desktop を使ってみる</a></li>
                <li><a class="link" href="desktop/install/linux-install/">Docker Desktop on Linux のインストール</a></li>
                <li><a class="link" href="desktop/release-notes/">リリースノート</a></li>
              </ul>
              </div>
            </div>
@z

@x
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'engine' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/engine.svg">
                <h2 class="text-xl">Docker Engine</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Engine</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="/engine/install/ubuntu/">Install Docker Engine on
                      Ubuntu</a></li>
                  <li><a class="link" href="/engine/reference/commandline/run/">Run a command in
                      a container</a></li>
                  <li><a class="link" href="/engine/reference/builder/">Dockerfile reference</a>
                  </li>
                  <li><a class="link" href="/engine/reference/commandline/dockerd/#description">Docker daemon
                      reference</a></li>
                  <li><a class="link" href="/engine/reference/commandline/build/">Docker build
                      reference</a></li>
                </ul>
              </div>
            </div>
@y
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'engine' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="assets/images/engine.svg">
                <h2 class="text-xl">Docker Engine</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Docker Engine を使ってはじめよう</h2>
                <p>初めてのアプリ記述、データストレージ、ネットワーク、Swarm を経験するウォークスルーをはじめましょう。最終的にクラウド上にある本番環境にアプリを動作させましょう。</p>
                <a class="link" href="get-started/">Docker について学ぶ</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">人気の記事</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="engine/install/ubuntu/">Ubuntu への Docker Engine のインストール</a></li>
                  <li><a class="link" href="engine/reference/commandline/run/">コンテナー内でのコマンド実行</a></li>
                  <li><a class="link" href="engine/reference/builder/">Dockerfile リファレンス</a>
                  </li>
                  <li><a class="link" href="engine/reference/commandline/dockerd/#description">Docker デーモンリファレンス</a></li>
                  <li><a class="link" href="engine/reference/commandline/build/">Docker build リファレンス</a></li>
                </ul>
              </div>
            </div>
@z

@x
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'build' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/whale-car.png">
                <h2 class="text-xl">Docker Build</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Build</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="/build/">Overview of Docker Build</a></li>
                  <li><a class="link" href="/engine/reference/builder/">Dockerfile reference</a>
                  </li>
                  <li><a class="link" href="/build/building/packaging/">Packaging your
                      software</a></li>
                  <li><a class="link" href="/build/building/multi-stage/">Multi-stage builds</a>
                  </li>
                  <li><a class="link" href="/build/building/multi-platform/">Multi-platform
                      images</a></li>
                </ul>
              </div>
            </div>
@y
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'build' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="assets/images/whale-car.png">
                <h2 class="text-xl">Docker Build</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Docker Build を使ってはじめよう</h2>
                <p>初めてのアプリ記述、データストレージ、ネットワーク、Swarm を経験するウォークスルーをはじめましょう。最終的にクラウド上にある本番環境にアプリを動作させましょう。</p>
                <a class="link" href="get-started/">Docker について学ぶ</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">人気の記事</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="build/">Docker Build の概要</a></li>
                  <li><a class="link" href="engine/reference/builder/">Dockerfile リファレンス</a>
                  </li>
                  <li><a class="link" href="build/building/packaging/">ソフトウェアのパッケージング</a></li>
                  <li><a class="link" href="build/building/multi-stage/">マルチステージビルド</a>
                  </li>
                  <li><a class="link" href="build/building/multi-platform/">マルチプラットフォームイメージ</a></li>
                </ul>
              </div>
            </div>
@z

@x
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'compose' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/Compose.png">
                <h2 class="text-xl">Docker Compose</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Compose</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="/compose/install/">Install Docker Compose</a></li>
                  <li><a class="link" href="/compose/gettingstarted/">Getting started with Docker
                      Compose</a></li>
                  <li><a class="link" href="/compose/environment-variables/">Environment
                      variables in Compose</a>
                  </li>
                  <li><a class="link" href="/compose/networking/">Networking in Compose</a></li>
                  <li><a class="link" href="/compose/file-watch/">Use Compose Watch</a></li>
                </ul>
              </div>
            </div>
@y
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'compose' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="assets/images/Compose.png">
                <h2 class="text-xl">Docker Compose</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Docker Compose を使ってはじめよう</h2>
                <p>初めてのアプリ記述、データストレージ、ネットワーク、Swarm を経験するウォークスルーをはじめましょう。最終的にクラウド上にある本番環境にアプリを動作させましょう。</p>
                <a class="link" href="get-started/">Docker について学ぶ</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">人気の記事</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="compose/install/">Docker Compose のインストール</a></li>
                  <li><a class="link" href="compose/gettingstarted/">Docker Compose を使ってはじめよう</a></li>
                  <li><a class="link" href="compose/environment-variables/">Compose の環境変数</a>
                  </li>
                  <li><a class="link" href="compose/networking/">Compose のネットワーク</a></li>
                  <li><a class="link" href="compose/file-watch/">Compose Watch の利用</a></li>
                </ul>
              </div>
            </div>
@z

@x
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'hub' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/hub.svg">
                <h2 class="text-xl">Docker Hub</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Hub</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="/docker-hub/official_images/">Docker Hub official
                      images</a></li>
                  <li><a class="link" href="/docker-hub/repos/">Create Docker Hub
                      repositories</a></li>
                  <li><a class="link" href="/docker-hub/builds/">Set up automated builds</a>
                  </li>
                  <li><a class="link" href="/docker-hub/access-tokens/">Manage access tokens</a>
                  </li>
                  <li><a class="link" href="/docker-hub/webhooks/">Docker Hub webhooks</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
@y
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'hub' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="assets/images/hub.svg">
                <h2 class="text-xl">Docker Hub</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Docker Hub を使ってはじめよう</h2>
                <p>初めてのアプリ記述、データストレージ、ネットワーク、Swarm を経験するウォークスルーをはじめましょう。最終的にクラウド上にある本番環境にアプリを動作させましょう。</p>
                <a class="link" href="get-started/">Docker について学ぶ</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">人気の記事</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="docker-hub/official_images/">Docker Hub 公式イメージ</a></li>
                  <li><a class="link" href="docker-hub/repos/">Docker Hub リポジトリの生成</a></li>
                  <li><a class="link" href="docker-hub/builds/">自動ビルドの設定</a>
                  </li>
                  <li><a class="link" href="docker-hub/access-tokens/">アクセストークンの管理</a>
                  </li>
                  <li><a class="link" href="docker-hub/webhooks/">Docker Hub ウェブフック</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
@z

@x
    <div class="flex gap-4 mx-auto w-[1200px] lg:w-full p-6 sm:flex-col">
      <div class="w-full">
        <h2 class="text-3xl">Best practices</h2>
        <ul class="w-full space-y-3">
          <li>
            <a class="link" href="/develop/develop-images/dockerfile_best-practices/">Best
              practices for writing a Dockerfile</a>
          </li>
          <li>
            <a class="link" href="/develop/develop-images/dockerfile_best-practices/">Best
              practices for writing a Docker Compose file</a>
          </li>
          <li>
            <a class="link" href="/develop/dev-best-practices/">Docker development best
              practices</a>
          </li>
          <li>
            <a class="link" href="/engine/security/">Docker security best practices</a>
          </li>
        </ul>
      </div>
@y
    <div class="flex gap-4 mx-auto w-[1200px] lg:w-full p-6 sm:flex-col">
      <div class="w-full">
        <h2 class="text-3xl">ベストプラクティス</h2>
        <ul class="w-full space-y-3">
          <li>
            <a class="link" href="develop/develop-images/dockerfile_best-practices/">Dockerfile 記述のベストプラクティス</a>
          </li>
          <li>
            <a class="link" href="develop/develop-images/dockerfile_best-practices/">Docker Compose ファイル記述のベストプラクティス</a>
          </li>
          <li>
            <a class="link" href="develop/dev-best-practices/">Docker 開発のベストプラクティス</a>
          </li>
          <li>
            <a class="link" href="engine/security/">Docker セキュリティのベストプラクティス</a>
          </li>
        </ul>
      </div>
@z

@x
      <div class="w-full">
        <h2 class="text-3xl">Develop with Docker</h2>
        <ul class="w-full space-y-3">
          <li>
            <a class="link" href="/language/nodejs/">Containerize a Node.js app using Docker</a>
          </li>
          <li>
            <a class="link" href="/language/python/">Containerize a Python app using Docker</a>
          </li>
          <li>
            <a class="link" href="/language/java/">Containerize a Java app using Docker</a>
          </li>
          <li>
            <a class="link" href="/language/golang/">Containerize a Go app using Docker</a>
          </li>
          <li>
            <a class="link" href="/samples/">View more languages and frameworks in Docker
              samples</a>
          </li>
        </ul>
      </div>
    </div>
@y
      <div class="w-full">
        <h2 class="text-3xl">Docker を用いた開発</h2>
        <ul class="w-full space-y-3">
          <li>
            <a class="link" href="language/nodejs/">Docker による Node.js アプリのコンテナー化</a>
          </li>
          <li>
            <a class="link" href="language/python/">Docker による Python アプリのコンテナー化</a>
          </li>
          <li>
            <a class="link" href="language/java/">Docker による Java アプリのコンテナー化</a>
          </li>
          <li>
            <a class="link" href="language/golang/">Docker による Go アプリのコンテナー化</a>
          </li>
          <li>
            <a class="link" href="samples/">Docker サンプルの他の言語やフレームワーク</a>
          </li>
        </ul>
      </div>
    </div>
@z

@x
    <div class="flex mx-auto w-[1200px] flex-col p-6 lg:w-full">
      <h2 class="text-3xl">Play with Docker</h2>
      <div class="grid grid-cols-3 gap-4 p-6 sm:flex sm:flex-col xl:grid-cols-2">
        <div>
          <a class="h-full" href="/get-started/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Tutorial
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Self-paced tutorials to increase your Docker knowledge.
              </div>
            </div>
          </a>
        </div>
@y
    <div class="flex mx-auto w-[1200px] flex-col p-6 lg:w-full">
      <h2 class="text-3xl">Docker をさわってみる</h2>
      <div class="grid grid-cols-3 gap-4 p-6 sm:flex sm:flex-col xl:grid-cols-2">
        <div>
          <a class="h-full" href="get-started/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    チュートリアル
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                自己学習チュートリアルにより Docker の知識を向上させてください。
              </div>
            </div>
          </a>
        </div>
@z

@x
        <div>
          <a class="h-full" href="https://labs.play-with-docker.com/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Lab environment
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Complete a workshop without installing anything using this Docker playground.
              </div>
            </div>
          </a>
        </div>
@y
        <div>
          <a class="h-full" href="https://labs.play-with-docker.com/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    ラボ環境
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Docker 体験を通じて、何もインストールしないワークショップを完成させましょう。
              </div>
            </div>
          </a>
        </div>
@z

@x
        <div>
          <a class="h-full" href="/get-started/resources/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Community training
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Free and paid learning materials from Docker captains.
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
@y
        <div>
          <a class="h-full" href="get-started/resources/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    コミュニティトレーニング
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Docker キャプテンからの有償／無償の学習情報。
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
@z

@x
    <div class="flex mx-auto w-[1200px] flex-col p-6 lg:w-full">
      <h2 class="text-3xl">Community resources</h2>
      <div class="grid grid-cols-3 gap-4 p-6 sm:flex sm:flex-col xl:grid-cols-2">
        <div>
          <a class="h-full" href="https://www.meetup.com/pro/docker/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Find a local meetup
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Attend one of the 200+ Docker Meetups around the globe.
              </div>
            </div>
          </a>
        </div>
@y
    <div class="flex mx-auto w-[1200px] flex-col p-6 lg:w-full">
      <h2 class="text-3xl">コミュニティ情報</h2>
      <div class="grid grid-cols-3 gap-4 p-6 sm:flex sm:flex-col xl:grid-cols-2">
        <div>
          <a class="h-full" href="https://www.meetup.com/pro/docker/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    各地のミートアップ
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                世界中にある 200 以上の Docker ミートアップに参加しましょう。
              </div>
            </div>
          </a>
        </div>
@z

@x
        <div>
          <a class="h-full" href="https://www.docker.com/events/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Upcoming events
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Learn from experts and get to know Docker.
              </div>
            </div>
          </a>
        </div>
@y
        <div>
          <a class="h-full" href="https://www.docker.com/events/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    予定イベント
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                エキスパートから Docker について学びます。
              </div>
            </div>
          </a>
        </div>
@z

@x
        <div>
          <a class="h-full" href="https://www.meetup.com/pro/docker/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Tune in monthly
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Join the Virtual Docker Meetup Group and online meetups every month.
              </div>
            </div>
          </a>
        </div>
@y
        <div>
          <a class="h-full" href="https://www.meetup.com/pro/docker/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    毎月に向けて
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                毎月開催されるバーチャルな Docker ミートアップグループやオンラインミートアップに参加しましょう。
              </div>
            </div>
          </a>
        </div>
@z

@x
        <div>
          <a class="h-full" href="https://www.docker.com/newsletter-subscription">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Community news
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                The Docker Weekly is an email newsletter with the latest content on DOcker and the event agenda for
                the
                upcoming weeks.
              </div>
            </div>
          </a>
        </div>
@y
        <div>
          <a class="h-full" href="https://www.docker.com/newsletter-subscription">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    コミュニティニュース
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Docker Weekly は電子メールによるニュースレターです。
                Docker の最新情報や開催予定のイベント情報をお伝えします。
              </div>
            </div>
          </a>
        </div>
@z

@x
        <div>
          <a class="h-full" href="https://www.docker.com/community/captains/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Meet the captains
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Select members of the community that are both experts in their field and are passionate about sharing
                their Docker knowledge with others.
              </div>
            </div>
          </a>
        </div>
@y
        <div>
          <a class="h-full" href="https://www.docker.com/community/captains/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    キャプテンに会いにいこう
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                コミュニティメンバーには、この分野にたけた人、そして Docker の知識をみなさんと共有する意欲のある方がいます。
                そういったメンバーに会いにいきましょう。
              </div>
            </div>
          </a>
        </div>
@z

@x
        <div>
          <a class="h-full" href="/get-started/resources/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Educational resources
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Expand your understanding of Docker with these additional resources.
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
  </main>
  <footer>{{ partial "footer.html" . }}</footer>
</body>
@y
        <div>
          <a class="h-full" href="get-started/resources/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    学習情報
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                これらの情報から Docker への理解をより深めてください。
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
  </main>
  <footer>{{ partial "footer.html" . }}</footer>
</body>
@z

@x
</html>
@y
</html>
@z
