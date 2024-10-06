##
## This is part of Japanese translation version for Docker's Documantation.
##
SUBDIRS = _default guides partials samples shortcodes tag

bases = \
	404.html

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/main.mk

thisdate = `date +'%Y/%m/%d'`
commitdate = `(cd @abs_origdir@ && git log -1 --pretty=format:"%ad" --date=short) | sed "s|\-|/|g"`
commithash = `(cd @abs_origdir@ && git log -1 --pretty=format:"%h") | sed "s|\-|/|g"`

.PHONY: _touch
all: _touch index.html
index.html: $(abs_origdir)/index.html $(srcdir)/index.html.ch
	@echo Processing index.html...
	@$(top_builddir)/$(CTIE) -m $@ $(abs_origdir)/index.html $(srcdir)/index.html.ch >/dev/null
	@sed -i -e "s@__THISDATE__@$(thisdate)@" \
	        -e "s@__COMMITDATE__@$(commitdate)@" \
	        -e "s@__COMMITHASH__@$(commithash)@g" $@
	@echo "commitdate: $(commitdate)" > ../../commit.txt
	@echo "commithash: $(commithash)" >> ../../commit.txt

copyfiles = \
	index.metadata.json  \
	index.redirects.json \
	index.robots.txt     \
	sitemap.xml

include $(top_srcdir)/build-aux/copy.mk

_touch:
	@touch $(srcdir)/index.html.ch
