#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_INIT([dev-box],
        [m4_esyscmd([build-aux/git-version-gen .tarball-version])],
        [mike@detwiler.io], [],
        [https://github.com/detwiler/dev-box])

AC_PREREQ([2.64])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_SRCDIR([Vagrantfile.in])

AM_INIT_AUTOMAKE([-Wall -Wno-portability -Werror foreign])
AM_SILENT_RULES([yes])

AC_ARG_VAR([FLATPAK_SPAWN], [path to flatpak-spawn])
AC_PATH_PROG([FLATPAK_SPAWN], [flatpak-spawn], [no],
             [$PATH$PATH_SEPARATOR/usr/libexec/flatpak-xdg-utils])
AM_CONDITIONAL([HAVE_FLATPAK_SPAWN], [test "x$FLATPAK_SPAWN" != xno])
AM_COND_IF([HAVE_FLATPAK_SPAWN],
           [AM_EXTRA_RECURSIVE_TARGETS([container-image])])

AC_SUBST([pkgboxdir], ["\$(pkgdatadir)/\$(VM_BOX_OWNER)-\$(VM_BOX_NAME)"])

QH_VAR_ENSURE([CONAN_USERNAME],
              [User name required by conan-package-tools],
              [$USER])

QH_VAR_ENSURE([CONTAINER_BASE_IMAGE],
              [Container base image],
              [centos])

QH_VAR_ENSURE([CONTAINER_BASE_TAG],
              [Container base image tag],
              [stream9])

AS_CASE([$CONTAINER_BASE_IMAGE],
        [*alpine*], [CONTAINER_DISTRO=alpine],
        [*centos*|*stream*], [CONTAINER_DISTRO=centos],
        [*fedora*], [CONTAINER_DISTRO=fedora],
        [*ubuntu*], [CONTAINER_DISTRO=ubuntu])
AC_SUBST([CONTAINER_DISTRO])
AC_SUBST([CONTAINER_NAME], [$CONTAINER_DISTRO-toolbox])

QH_VAR_ENSURE([CONTAINER_REGISTRY],
              [Container image registry],
              [quay.io])

QH_VAR_ENSURE([REGISTRY_ACCOUNT],
              [Registry account],
              [$USER])

QH_VAR_ENSURE([CONTAINER_REPO],
              [Container image repository],
              [$CONTAINER_NAME])

QH_VAR_ENSURE([CONTAINER_TAG],
              [Container image tag],
              [$CONTAINER_BASE_TAG])

QH_VAR_ENSURE([DETUTILS_RELEASE_URL],
              [GitHub API URL for detutils releases],
              ['https://api.github.com/repos/detwiler/detutils/releases/latest'])

QH_VAR_ENSURE([ENVCONF_RELEASE_URL],
              [GitHub API URL for envconf releases],
              ['https://api.github.com/repos/detwiler/envconf/releases/latest'])

QH_VAR_ENSURE([GIT_AUTHOR_NAME],
              [human-readable name for git author],
              [$USER])

QH_VAR_ENSURE([GIT_AUTHOR_EMAIL],
              [git author email],
              [$USER@$HOSTNAME])

QH_VAR_ENSURE([SSH_PRIVATE_KEY_PATH],
              [SSH private key path],
              ['~/.ssh/id_ed25519'])

QH_VAR_ENSURE([SSH_PUBLIC_KEY_PATH],
              [SSH public key path],
              ['~/.ssh/id_ed25519.pub'])

QH_VAR_ENSURE([VM_BOX_OWNER],
              [VM box owner],
              [generic])

QH_VAR_ENSURE([VM_BOX_NAME],
              [VM box name],
              [centos9s])

QH_VAR_ENSURE([VM_CPUS],
              [Number of CPUs dedicated to VM],
              [2])

QH_VAR_ENSURE([VM_MEMORY],
              [Memory (MiB) dedicated to VM],
              [4096])

QH_VAR_ENSURE([VM_SYNCED_FOLDER_MOUNT],
              [Syncded folder guest mount point],
              [/vagrant])

AS_CASE([$VM_BOX_NAME],
        [alpine*], [VM_DISTRO=alpine],
        [centos*|stream*], [VM_DISTRO=centos],
        [fedora*|*-cloud-base], [VM_DISTRO=fedora],
        [ubuntu*], [VM_DISTRO=ubuntu])
AC_SUBST([VM_DISTRO])

AC_CONFIG_FILES([Makefile
                 Containerfile
                 Vagrantfile
                 provision/Makefile
                 provision/detutils-install
                 provision/envconf-install
                 ])
AC_OUTPUT
