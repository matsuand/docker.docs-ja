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
<body class="min-w-fit bg-background-light text-base dark:bg-background-dark dark:text-white">
  {{ partial "header.html" . }}
  <main class="grid grid-cols-main md:flex xl:grid-cols-main-xl">
    <div id="sidebar"
      class="sticky top-16 h-[calc(100lvh-theme(space.16))] overflow-y-scroll flex flex-row-reverse bg-background-light dark:bg-gray-dark-100 md:fixed md:z-10 md:hidden md:h-screen md:w-screen">
      {{ block "left" . }}
      {{ end }}
    </div>
    <div class="p-6 pt-0 md:w-screen overflow-clip">
      {{ block "main" . }}
      {{ end }}
    </div>
    <div class="sticky top-16 h-[calc(100lvh-theme(space.16))] overflow-y-scroll lg:hidden">
      {{ block "right" . }}
      {{ end }}
    </div>
  </main>
  <footer>{{ partialCached "footer.html" . }}</footer>
</body>
@y
<body class="min-w-fit bg-background-light text-base dark:bg-background-dark dark:text-white">
  {{ partial "header.html" . }}
  <main class="grid grid-cols-main md:flex xl:grid-cols-main-xl">
    <div id="sidebar"
      class="sticky top-16 h-[calc(100lvh-theme(space.16))] overflow-y-scroll flex flex-row-reverse bg-background-light dark:bg-gray-dark-100 md:fixed md:z-10 md:hidden md:h-screen md:w-screen">
      {{ block "left" . }}
      {{ end }}
    </div>
    <div class="p-6 pt-0 md:w-screen overflow-clip">
      {{ block "main" . }}
      {{ end }}
    </div>
    <div class="sticky top-16 h-[calc(100lvh-theme(space.16))] overflow-y-scroll lg:hidden">
      {{ block "right" . }}
      {{ end }}
    </div>
  </main>
  <footer>{{ partialCached "footer.html" . }}</footer>
</body>
@z

@x
</html>
@y
</html>
@z
