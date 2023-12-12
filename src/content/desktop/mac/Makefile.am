##
## This is part of Japanese translation version for Docker's Documantation.
##
SUBDIRS = images

bases = \
	permission-requirements

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/main.mk

all: Makefile.orig

Makefile.orig: $(abs_origdir)/Makefile
	cp -p $^ $@
