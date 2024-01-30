%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
import docsearch from "@docsearch/js";
import * as params from "@params"; // hugo dict
@y
import docsearch from "@docsearch/js";
import * as params from "@params"; // hugo dict
@z

@x
const { appid, apikey, indexname } = params;
@y
const { appid, apikey, indexname } = params;
@z

@x
docsearch({
  container: "#docsearch",
  appId: appid,
  apiKey: apikey,
  indexName: indexname,
  transformItems(items) {
    return items.map((item) => ({
      ...item,
      url: item.url.replace("https://docs.docker.com", ""),
    }));
  },
});
@y
docsearch({
  container: "#docsearch",
  appId: appid,
  apiKey: apikey,
  indexName: indexname,
  transformItems(items) {
    return items.map((item) => ({
      ...item,
      url: item.url.replace("https://matsuand.github.io__SUBDIR__", ""),
    }));
  },
});
@z
