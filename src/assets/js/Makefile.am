##
## This is part of Japanese translation version for Docker's Documantation.
##

THISDIR = assets/js

bases = \
	code-copy.js     \
	docs-search.js   \
	page-actions.js  \
	quick-install.js

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/main.mk

copyfiles = \
	interactive-diagram.js \
	main.js                \
	mermaid.js             \
	theme.js

include $(top_srcdir)/build-aux/copy.mk

copydirs = \
	gordon-cards \
	src

.PHONY: all _copydirs
all: _copydirs

_copydirs:
	@for d in $(copydirs); do \
	  if test ! -d $$d; then \
	    cp -pR $(absORIGDIR)/$(THISDIR)/$$d .; \
	  fi \
	done
