##
## This is part of Japanese translation version for Docker's Documantation.
##
SUBDIRS = buildx debug-cli docsarchive engine-cli init-cli

bases = \
	frontmatter.yaml \
	glossary.yaml    \
	samples.yaml

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/main.mk

copyfiles = \
	redirects.yml

include $(top_srcdir)/build-aux/copy.mk
