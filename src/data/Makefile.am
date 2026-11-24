##
## This is part of Japanese translation version for Docker's Documantation.
##

SUBDIRS = cli docsarchive navigation sbx_cli

bases = \
	api-reference.json           \
	custom_role_permissions.yaml \
	desktop_release.yaml         \
	frontmatter.yaml             \
	redirects.yml                \
	summary.yaml                 \
	tags.yaml                    \
	whats-new.json

include $(top_srcdir)/build-aux/common.mk
include $(top_srcdir)/build-aux/main.mk

#.PHONY: all
#all: api-reference.json
#
#api-reference.json: api-reference.tmp $(srcdir)/api-reference.json.ch
#	@echo Processing api-reference.json...
#	@$(top_builddir)/$(CTIE) -m $@ api-reference.tmp $(srcdir)/api-reference.json.ch >/dev/null
#	@rm -f api-reference.tmp
#api-reference.tmp: $(abs_origdir)/api-reference.json
#	@sed -e "s|\"url\": \"/reference|\"url\": \"/docker.docs-ja/reference|g" $^ >$@
