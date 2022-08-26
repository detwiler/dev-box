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

QH_VAR_ENSURE([CONAN_USERNAME],
              [User name required by conan-package-tools],
              [$USER])

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
              [fedora33])

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
                 Vagrantfile
                 provision/Makefile
                 provision/detutils-install
                 provision/envconf-install
                 ])
AC_OUTPUT
