##
## This is part of Japanese translation version for Docker's Documantation.
##
SUBDIRS = _markup _partials _shortcodes guides redirect samples \
	security-announcements tags

bases = \
	404.html         \
	api.html         \
	api.markdown.md  \
	baseof.html      \
	cli.html         \
	cli.markdown.md  \
	glossary.html    \
	list.markdown.md \
	scout-cli.html   \
	series.html

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
	@sed -i -e "s@__THISDATE__@$(thisdate)@" \
	        -e "s@__COMMITDATE__@$(commitdate)@" \
	        -e "s@__COMMITHASH__@$(commithash)@g" $@
	@echo "commitdate: $(commitdate)" > ../../commit.txt
	@echo "commithash: $(commithash)" >> ../../commit.txt

copyfiles = \
	home.llms.txt       \
	home.metadata.json  \
	home.redirects.json \
	home.robots.txt     \
	list.html           \
	single.html         \
	single.markdown.md  \
	sitemap.xml         \
	wide.html

include $(top_srcdir)/build-aux/copy.mk

_touch:
	@touch $(srcdir)/index.html.ch
