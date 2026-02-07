##
## This is part of Japanese translation version for Docker's Documantation.
##
absORIGDIR=@absORIGDIR@

SUBDIRS = _vendor assets content data i18n layouts static

bases = \
	hugo.yaml    \
	package.json

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/main.mk

copydirs = \
	_vale      \
	archetypes

copyfiles = \
	.dockerignore      \
	.htmltest.yml      \
	.markdownlint.json \
	.prettierrc        \
	.vale.ini          \
	COMPONENTS.md      \
	CONTRIBUTING.md    \
	Dockerfile         \
	LICENSE            \
	README.md          \
	STYLE.md           \
	compose.yaml       \
	docker-bake.hcl    \
	go.mod             \
	go.sum             \
	netlify.toml       \
	package-lock.json  \
	pagefind.yml

.PHONY: all _copydirs _copyfiles _npminstall
all: _copydirs _copyfiles _npminstall

_copydirs:
	@for d in $(copydirs); do \
	  if test ! -d $$d; then \
	    cp -pR $(absORIGDIR)/$$d .; \
	  fi \
	done

_copyfiles:
	@for f in $(copyfiles); do \
	  if test ! -e $$f; then \
	    cp -p $(absORIGDIR)/$$f .; \
	  fi \
	done

_npminstall:
	@if test ! -d node_modules; then \
	  npm install; \
	  npm cache clean --force; \
	fi
