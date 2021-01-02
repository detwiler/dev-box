# Makefile.am

SUBDIRS = provision

gvg_version = $(top_srcdir)/.version
pkg_release = $(PACKAGE)-release
vagrantfile = Vagrantfile

ACLOCAL_AMFLAGS = -I m4 -I .quickhatch/m4

BUILT_SOURCES = $(gvg_version)

pkgdata_DATA = $(pkg_release)

pkgbox_DATA = $(vagrantfile)

CLEANFILES = $(gvg_version) \
	     $(pkg_release)

EXTRA_DIST = $(gvg_version) \
	     m4/gnulib-cache.m4 \
	     README.md

$(gvg_version):
	$(AM_V_GEN)echo $(VERSION) > $@-t && mv $@-t $@

$(pkg_release): $(gvg_version)
	$(AM_V_GEN)echo "$(PACKAGE) release $(VERSION)" > $@-t && mv $@-t $@

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
