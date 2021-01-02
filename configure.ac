#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_INIT([dev-vms],
        [m4_esyscmd([build-aux/git-version-gen .tarball-version])],
        [mike@detwiler.io])

AC_PREREQ([2.64])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_SRCDIR([Vagrantfile.in])

AM_INIT_AUTOMAKE([-Wall -Wno-portability -Werror foreign])
AM_SILENT_RULES([yes])

AC_SUBST([pkgboxdir], ["\$(pkgdatadir)/\$(VM_BOX_OWNER)/\$(VM_BOX_NAME)"])

QH_VAR_ENSURE([VM_BOX_OWNER],
              [VM box owner],
              [generic])

QH_VAR_ENSURE([VM_BOX_NAME],
              [VM box name],
              [fedora33])

QH_VAR_ENSURE([VM_MEMORY],
              [Memory (MiB) dedicated to VM],
              [4096])

QH_VAR_ENSURE([VM_CPUS],
              [Number of CPUs dedicated to VM],
              [2])

AS_CASE([$VM_BOX_NAME],
        [alpine*], [VM_DISTRO=alpine],
        [fedora*|*-cloud-base], [VM_DISTRO=fedora],
        [ubuntu*], [VM_DISTRO=ubuntu])
AC_SUBST([VM_DISTRO])

AC_CONFIG_FILES([Makefile
                 Vagrantfile
                 provision/Makefile
                 ])
AC_OUTPUT
