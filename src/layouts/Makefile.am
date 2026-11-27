##
## This is part of Japanese translation version for Docker's Documantation.
##

SUBDIRS = _markup _partials _shortcodes

bases = \
	404.html                       \
	api.html                       \
	api.markdown.md                \
	api-docs.html                  \
	api-docs.markdown.md           \
	baseof.html                    \
	cli.html                       \
	cli.markdown.md                \
	list.markdown.md               \
	sbx-cli.html                   \
	sbx-cli.markdown.md            \
	security-announcements.rss.xml

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/main.mk

thisdate = `date +'%Y/%m/%d'`
commitdate = `(cd @abs_origdir@ && git log -1 --pretty=format:"%ad" --date=short) | sed "s|\-|/|g"`
commithash = `(cd @abs_origdir@ && git log -1 --pretty=format:"%h") | sed "s|\-|/|g"`

.PHONY: _touch
all: _touch home.html
home.html: $(abs_origdir)/home.html $(srcdir)/home.html.ch
	@echo Processing home.html...
	@$(top_builddir)/$(CTIE) -m $@ $(abs_origdir)/home.html $(srcdir)/home.html.ch >/dev/null
	@sed -i -e "s@__THISDATE__@$(thisdate)@"      \
	        -e "s@__COMMITDATE__@$(commitdate)@"  \
	        -e "s@__COMMITHASH__@$(commithash)@g" \
		-e "s@__SUBDIR__@/docker.docs-ja@g"   \
		-e "s@__HOSTURL__@$(HOSTURL)@g" $@
	@echo "commitdate: $(commitdate)" > ../../commit.txt
	@echo "commithash: $(commithash)" >> ../../commit.txt

copyfiles = \
	category-directory.html         \
	category-directory.markdown.md  \
	category.html                   \
	category.markdown.md            \
	home.llms.txt                   \
	home.llmsfull.txt               \
	home.metadata.json              \
	home.redirects.json             \
	home.robots.txt                 \
	installation.html               \
	installation.markdown.md        \
	list.html                       \
	reference-directory.html        \
	reference-directory.markdown.md \
	single.html                     \
	single.markdown.md              \
	sitemap.xml                     \
	wide.html

include $(top_srcdir)/build-aux/copy.mk

_touch:
	@touch $(srcdir)/home.html.ch
