##
## This is part of Japanese translation version for Docker's Documantation.
##
bases = \
	README.md

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/main.mk

copyfiles = \
	Dockerfile    \
	make_certs.sh \
	parsedocs.sh

include $(top_srcdir)/build-aux/copy.mk

all: Makefile.orig

Makefile.orig: $(abs_origdir)/Makefile
	cp -p $^ $@
