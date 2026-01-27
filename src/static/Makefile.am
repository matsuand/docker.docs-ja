##
## This is part of Japanese translation version for Docker's Documantation.
##
absORIGDIR=@absORIGDIR@/static

copyfiles = \
	apple-touch-icon.png \
	favicon.ico          \
	sitemap.xsl

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/copy.mk

copydirs = \
	assets      \
	get-started

.PHONY: _copydirs
all: _copydirs

_copydirs:
	@for d in $(copydirs); do \
	  if test ! -d $$d; then \
	    cp -pR $(absORIGDIR)/$$d .; \
	  fi \
	done
	@if test ! -f $(abs_builddir)/google56ef73f0410965e8.html; then \
	  cp -p $(srcdir)/google56ef73f0410965e8.html $(abs_builddir); \
	fi
