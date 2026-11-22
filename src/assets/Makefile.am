##
## This is part of Japanese translation version for Docker's Documantation.
##

SUBDIRS = css js
THISDIR = assets

copydirs = \
	api-reference \
	icons         \
	images

.PHONY: all _copydirs
all: _copydirs

_copydirs:
	@for d in $(copydirs); do \
	  if test ! -d $$d; then \
	    cp -pR $(absORIGDIR)/$(THISDIR)/$$d .; \
	  fi \
	done
