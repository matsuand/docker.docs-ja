%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x lang="ja"
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
  class="bg-background-light dark:bg-background-dark text-base divide-y divide-divider-light dark:divide-divider-dark flex flex-col h-max dark:text-white">
  {{ partial "header.html" . }}
  <main class="min-h-screen flex items-stretch">
    <div id="sidebar"
      class="z-10 flex flex-col items-end sticky top-16 h-[calc(100vh-theme(space.16))] overflow-y-scroll flex-shrink-0 flex-grow md:fixed md:w-screen md:hidden bg-background-light dark:bg-gray-dark-100">
      {{ block "left" . }}
      {{ end }}
    </div>
    <div class="w-[840px] flex flex-col lg:w-full lg:flex-grow px-8 pb-16 sm:px-4 overflow-hidden">
      {{ block "main" . }}
      {{ end }}
    </div>
    <div class="sticky w-[300px] top-16 p-5 h-[calc(100vh-theme(space.16))] flex-grow overflow-y-auto lg:hidden">
      {{ block "right" . }}
      {{ end }}
    </div>
  </main>
  <footer>
    {{ partialCached "footer.html" . }}
  </footer>
</body>
@y
<body
  class="bg-background-light dark:bg-background-dark text-base divide-y divide-divider-light dark:divide-divider-dark flex flex-col h-max dark:text-white">
  {{ partial "header.html" . }}
  <main class="min-h-screen flex items-stretch">
    <div id="sidebar"
      class="z-10 flex flex-col items-end sticky top-16 h-[calc(100vh-theme(space.16))] overflow-y-scroll flex-shrink-0 flex-grow md:fixed md:w-screen md:hidden bg-background-light dark:bg-gray-dark-100">
      {{ block "left" . }}
      {{ end }}
    </div>
    <div class="w-[840px] flex flex-col lg:w-full lg:flex-grow px-8 pb-16 sm:px-4 overflow-hidden">
      {{ block "main" . }}
      {{ end }}
    </div>
    <div class="sticky w-[300px] top-16 p-5 h-[calc(100vh-theme(space.16))] flex-grow overflow-y-auto lg:hidden">
      {{ block "right" . }}
      {{ end }}
    </div>
  </main>
  <footer>
    {{ partialCached "footer.html" . }}
  </footer>
</body>
@z

@x
</html>
@y
</html>
@z
