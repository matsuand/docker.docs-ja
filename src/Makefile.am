##
## This is part of Japanese translation version for Docker's Documantation.
##
SUBDIRS = content

copydirs = \
	_releaser \
	_vendor   \
	assets    \
	data      \
	i18n      \
	layouts   \
	scripts   \
	static

copyfiles = \
	.dockerignore      \
	.htmltest.yml      \
	.markdownlint.json \
	.prettierrc        \
	.vale.ini          \
	CONTRIBUTING.md    \
	Dockerfile         \
	LICENSE            \
	README.md          \
	compose.yaml       \
	docker-bake.hcl    \
	go.mod             \
	go.sum             \
	hugo.yaml          \
	netlify.toml       \
	package-lock.json  \
	package.json       \
	postcss.config.js  \
	tailwind.config.js

.PHONY: all _copydirs _copyfiles
all: _copydirs _copyfiles

_copydirs:
	@for d in $(copydirs); do \
	  if test ! -d $$d; then \
	    cp -pR $(ORIGDIR)/$$d .; \
	  fi \
	done

_copyfiles:
	@for f in $(copyfiles); do \
	  if test ! -e $$f; then \
	    cp -p $(ORIGDIR)/$$f .; \
	    case $$f in \
              "hugo.yaml") \
		sed -i -e "/^enableGitInfo/s/true/false/" $$f; \
		sed -i -e "/languageName: English/a\ \ ja:\n    languageName: Japanese" $$f; \
	      ;; \
	    esac \
	  fi \
	done
