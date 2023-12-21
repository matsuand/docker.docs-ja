%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ define "left" }}
{{ end }}
@y
{{ define "left" }}
{{ end }}
@z

@x
{{ define "main" }}
  <article class="prose max-w-none dark:prose-invert">
    <h1>404</h1>
    <p>
      There might be a mistake in the URL or you might've clicked a link to
      content that no longer exists. If you think it's the latter, please file
      an issue in our issue tracker on GitHub.
    </p>
@y
{{ define "main" }}
  <article class="prose max-w-none dark:prose-invert">
    <h1>404</h1>
    <p>
      There might be a mistake in the URL or you might've clicked a link to
      content that no longer exists. If you think it's the latter, please file
      an issue in our issue tracker on GitHub.
    </p>
@z

@x
    <a
      id="newissue"
      class="link"
      href="{{ site.Params.repo }}/issues/new"
    >
      <strong>Create a new issue</strong></a
    >
@y
    <a
      id="newissue"
      class="link"
      href="{{ site.Params.repo }}/issues/new"
    >
      <strong>Create a new issue</strong></a
    >
@z

@x __SUBDIR__
    <a href="{{ site.BaseURL }}">
      <figure>
        <img src="/assets/images/404-docs.png" alt="404 page not found" />
        <figcaption class="link">Go to the homepage</figcaption>
      </figure>
    </a>
@y
    <a href="{{ site.BaseURL }}">
      <figure>
        <img src="__SUBDIR__/assets/images/404-docs.png" alt="404 page not found" />
        <figcaption class="link">Go to the homepage</figcaption>
      </figure>
    </a>
@z

@x
    <script>
    let el = document.querySelector("#newissue");
    if (el) {
        let url = new URL("{{ site.Params.repo }}/issues/new");
        url.searchParams.set("title", "404 at " + window.location.pathname);
        let body = "I found a broken link : " + window.location.href;
        if (document.referrer !== "") {
            body += "\nI arrived on this page through: " + document.referrer
        }
        url.searchParams.set("body", body);
        url.searchParams.set("template", "broken_link.yml")
        url.searchParams.set("title", "[404]: " + window.location.pathname);
        url.searchParams.set("target", window.location.href);
        url.searchParams.set("location", document.referrer);
        url.searchParams.set("labels", "status/triage");
        el.setAttribute("href", url.toString());
    }
    </script>
  </article>
{{ end }}
@y
    <script>
    let el = document.querySelector("#newissue");
    if (el) {
        let url = new URL("{{ site.Params.repo }}/issues/new");
        url.searchParams.set("title", "404 at " + window.location.pathname);
        let body = "I found a broken link : " + window.location.href;
        if (document.referrer !== "") {
            body += "\nI arrived on this page through: " + document.referrer
        }
        url.searchParams.set("body", body);
        url.searchParams.set("template", "broken_link.yml")
        url.searchParams.set("title", "[404]: " + window.location.pathname);
        url.searchParams.set("target", window.location.href);
        url.searchParams.set("location", document.referrer);
        url.searchParams.set("labels", "status/triage");
        el.setAttribute("href", url.toString());
    }
    </script>
  </article>
{{ end }}
@z
