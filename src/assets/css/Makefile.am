##
## This is part of Japanese translation version for Docker's Documantation.
##

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/main.mk

bases = \
	utilities.css

copyfiles = \
	components.css   \
	global.css       \
	hack.css         \
	pagefind.css     \
	syntax-dark.css  \
	syntax-light.css \
	theme.css

include $(top_srcdir)/build-aux/copy.mk

.PHONY: all
all: style.css

style.css: $(abs_origdir)/style.css $(srcdir)/style.css.ch
	@sed -e "s/@import /#-#import /g" $(abs_origdir)/$@ > $@.orig
	@$(top_builddir)/$(CTIE) -m $@ $@.orig $(srcdir)/$@.ch >/dev/null
	@sed -i -e "s/#-#import /@import /g" -e "s/__SUBDIR__/\/docker.docs-ja/g" $@
	@rm -f $@.orig
