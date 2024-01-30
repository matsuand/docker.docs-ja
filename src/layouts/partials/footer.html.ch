%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<div class="flex justify-center py-20 px-4 bg-gray-light-200/50 dark:bg-gray-dark-300/50">
  <div class="flex w-[1200px] flex-col gap-10">
    <div class="flex sm:flex-col gap-4 items-center justify-evenly">
      <a class="underline-offset-2 hover:underline" href="https://www.docker.com/">Product offerings</a>
      <a class="underline-offset-2 hover:underline" href="https://www.docker.com/pricing/">Pricing</a>
      <a class="underline-offset-2 hover:underline" href="https://www.docker.com/company/">About us</a>
      <a class="underline-offset-2 hover:underline" href="https://www.docker.com/support/">Support</a>
      <a class="underline-offset-2 hover:underline" href="https://github.com/docker/docs/blob/main/CONTRIBUTING.md">Contribute</a>
    </div>
@y
<div class="flex justify-center py-20 px-4 bg-gray-light-200/50 dark:bg-gray-dark-300/50">
  <div class="flex w-[1200px] flex-col gap-10">
    <div class="flex sm:flex-col gap-4 items-center justify-evenly">
      <a class="underline-offset-2 hover:underline" href="https://www.docker.com/">提供製品</a>
      <a class="underline-offset-2 hover:underline" href="https://www.docker.com/pricing/">価格</a>
      <a class="underline-offset-2 hover:underline" href="https://www.docker.com/company/">会社情報</a>
      <a class="underline-offset-2 hover:underline" href="https://www.docker.com/support/">サポート</a>
      <a class="underline-offset-2 hover:underline" href="https://github.com/docker/docs/blob/main/CONTRIBUTING.md">貢献</a>
    </div>
@z

@x
    <hr class="text-divider-light dark:text-divider-dark" />
    <div class="grid grid-cols-3 place-items-center gap-8 md:grid-cols-1">
      <p class="text-sm">
        Copyright © 2013-{{ time.Now.Year}} Docker Inc. All rights reserved.
      </p>
@y
    <hr class="text-divider-light dark:text-divider-dark" />
    <div class="grid grid-cols-3 place-items-center gap-8 md:grid-cols-1">
      <p class="text-sm">
        Copyright © 2013-{{ time.Now.Year}} Docker Inc. All rights reserved.
      </p>
@z

@x
      <div class="flex gap-4">
        <a
          class="h-8 w-8 rounded-full fill-blue-light dark:fill-blue-dark"
          href="http://twitter.com/docker/">
          {{ (resources.Get "images/TwitterCircle.svg").Content | safe.HTML }}
        </a>
@y
      <div class="flex gap-4">
        <a
          class="h-8 w-8 rounded-full fill-blue-light dark:fill-blue-dark"
          href="http://twitter.com/docker/">
          {{ (resources.Get "images/TwitterCircle.svg").Content | safe.HTML }}
        </a>
@z

@x
        <a
          class="h-8 w-8 rounded-full fill-blue-light dark:fill-blue-dark"
          href="https://www.linkedin.com/company/docker">
          {{ (resources.Get "images/LinkedinCircle.svg").Content | safe.HTML }}
        </a>
@y
        <a
          class="h-8 w-8 rounded-full fill-blue-light dark:fill-blue-dark"
          href="https://www.linkedin.com/company/docker">
          {{ (resources.Get "images/LinkedinCircle.svg").Content | safe.HTML }}
        </a>
@z

@x
        <a
          class="h-8 w-8 rounded-full fill-blue-light dark:fill-blue-dark"
          href="https://www.instagram.com/dockerinc/">
          {{ (resources.Get "images/InstagramCircle.svg").Content | safe.HTML }}
        </a>
@y
        <a
          class="h-8 w-8 rounded-full fill-blue-light dark:fill-blue-dark"
          href="https://www.instagram.com/dockerinc/">
          {{ (resources.Get "images/InstagramCircle.svg").Content | safe.HTML }}
        </a>
@z

@x
        <a
          class="h-8 w-8 rounded-full fill-blue-light dark:fill-blue-dark"
          href="http://www.youtube.com/user/dockerrun">
          {{ (resources.Get "images/YoutubeCircle.svg").Content | safe.HTML }}
        </a>
@y
        <a
          class="h-8 w-8 rounded-full fill-blue-light dark:fill-blue-dark"
          href="http://www.youtube.com/user/dockerrun">
          {{ (resources.Get "images/YoutubeCircle.svg").Content | safe.HTML }}
        </a>
@z

@x
        <a
          class="h-8 w-8 rounded-full fill-blue-light dark:fill-blue-dark"
          href="https://www.facebook.com/docker.run">
          {{ (resources.Get "images/FacebookCircle.svg").Content | safe.HTML }}
        </a>
      </div>
@y
        <a
          class="h-8 w-8 rounded-full fill-blue-light dark:fill-blue-dark"
          href="https://www.facebook.com/docker.run">
          {{ (resources.Get "images/FacebookCircle.svg").Content | safe.HTML }}
        </a>
      </div>
@z

@x
      <div class="flex items-center gap-4">
        <a class="underline-offset-2 hover:underline" href="https://www.docker.com/legal/docker-terms-service">Terms of Service</a>
        <a class="underline-offset-2 hover:underline" href="https://www.dockerstatus.com/">Status</a>
        <a class="underline-offset-2 hover:underline" href="https://www.docker.com/legal">Legal</a>
      </div>
    </div>
  </div>
</div>
@y
      <div class="flex items-center gap-4">
        <a class="underline-offset-2 hover:underline" href="https://www.docker.com/legal/docker-terms-service">利用規約</a>
        <a class="underline-offset-2 hover:underline" href="https://www.dockerstatus.com/">ステータス</a>
        <a class="underline-offset-2 hover:underline" href="https://www.docker.com/legal">法的関連</a>
      </div>
    </div>
  </div>
</div>
@z
