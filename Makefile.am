# Makefile.am

SUBDIRS = provision

containerfile = Containerfile
gvg_version = $(top_srcdir)/.version
image_tag = $(CONTAINER_REGISTRY)/$(REGISTRY_ACCOUNT)/$(CONTAINER_REPO):$(CONTAINER_TAG)
pkg_name = $(top_srcdir)/.package-name
pkg_release = $(PACKAGE)-release
vagrantfile = Vagrantfile

ACLOCAL_AMFLAGS = -I m4 -I .quickhatch/m4

BUILT_SOURCES = $(gvg_version) \
		$(pkg_name)

pkgbox_DATA = $(pkg_release) \
	      $(vagrantfile)

CLEANFILES = $(gvg_version) \
	     $(pkg_name) \
	     $(pkg_release)

EXTRA_DIST = $(gvg_version) \
	     m4/gnulib-cache.m4 \
	     $(pkg_name) \
	     README.md

$(gvg_version):
	$(AM_V_GEN)echo $(VERSION) > $@-t && mv $@-t $@

$(pkg_name):
	$(AM_V_GEN)echo $(PACKAGE_NAME) > $@-t && mv $@-t $@

$(pkg_release): $(gvg_version)
	$(AM_V_GEN)echo "$(PACKAGE) release $(VERSION)" > $@-t && mv $@-t $@

if HAVE_FLATPAK_SPAWN
container-image-local: $(containerfile) Makefile
	$(AM_V_GEN)$(FLATPAK_SPAWN) --host podman build --tag $(image_tag) .

publish-image:
	$(AM_V_GEN)$(FLATPAK_SPAWN) --host podman push $(image_tag)
endif

.PHONY: gen-ChangeLog
gen-ChangeLog:
	$(AM_V_GEN)if test -d .git; then				\
	  $(top_srcdir)/build-aux/gitlog-to-changelog > $(distdir)/cl-t;\
	  rm -f $(distdir)/ChangeLog;					\
	  mv $(distdir)/cl-t $(distdir)/ChangeLog;			\
	fi

.PHONY: gen-tarball-version
gen-tarball-version:
	$(AM_V_GEN)echo $(VERSION) > $(distdir)/.tarball-version

dist-hook: gen-ChangeLog gen-tarball-version
