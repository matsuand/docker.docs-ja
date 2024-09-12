##
## This is part of Japanese translation version for Docker's Documantation.
##
SUBDIRS = images

thisdir = ${shell echo $(subdir) | sed -e "s|^src/||"}

all: Makefile.orig

Makefile.orig: $(abs_origdir)/$(thisdir)/Makefile
	cp -p $^ $@
