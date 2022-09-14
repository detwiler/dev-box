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

AC_ARG_VAR([BUILDAH], [path to buildah])
AC_CACHE_CHECK(
        [for buildah],
        [ac_cv_path_BUILDAH],
        [AC_PATH_PROGS_FEATURE_CHECK(
                [BUILDAH],
                [buildah flatpak-spawn],
                [if echo $ac_path_BUILDAH | grep -q flatpak-spawn; then
                        BUILDAH_ARGS=' --host buildah'
                 fi
                 if $ac_path_BUILDAH$BUILDAH_ARGS ls &> /dev/null; then
                        ac_cv_path_BUILDAH="$ac_path_BUILDAH$BUILDAH_ARGS"
                        ac_path_BUILDAH_found=:
                 fi],
                [AC_MSG_WARN([Could not find podman. Disabling Toolbx image build.])],
                [$PATH$PATH_SEPARATOR/usr/libexec/flatpak-xdg-utils])])
AM_CONDITIONAL([HAVE_BUILDAH], [test "x$ac_cv_path_BUILDAH" != x])
AM_COND_IF([HAVE_BUILDAH],
           [AC_SUBST([BUILDAH], [$ac_cv_path_BUILDAH])
            AM_EXTRA_RECURSIVE_TARGETS([build-toolbox-image])])

AC_ARG_VAR([PODMAN], [path to podman])
AC_CACHE_CHECK(
        [for podman],
        [ac_cv_path_PODMAN],
        [AC_PATH_PROGS_FEATURE_CHECK(
                [PODMAN],
                [podman flatpak-spawn],
                [if echo $ac_path_PODMAN | grep -q flatpak-spawn; then
                        PODMAN_ARGS=' --host podman'
                 fi
                 if eval $ac_path_PODMAN$PODMAN_ARGS images &> /dev/null; then
                        ac_cv_path_PODMAN="$ac_path_PODMAN$PODMAN_ARGS"
                        ac_path_PODMAN_found=:
                 fi],
                [AC_MSG_WARN([Could not find podman. Disabling Toolbx image push.])],
                [$PATH$PATH_SEPARATOR/usr/libexec/flatpak-xdg-utils])])
AM_CONDITIONAL([HAVE_PODMAN], [test "x$ac_cv_path_PODMAN" != x])
AM_COND_IF([HAVE_PODMAN],
           [AC_SUBST([PODMAN], [$ac_cv_path_PODMAN])])

AC_SUBST([pkgboxdir], ["\$(pkgdatadir)/\$(VM_BOX_OWNER)-\$(VM_BOX_NAME)"])

QH_VAR_ENSURE([CONAN_USERNAME],
              [User name required by conan-package-tools],
              [$USER])

QH_VAR_ENSURE([TOOLBOX_BASE_IMAGE],
              [Toolbx base image],
              [centos])

QH_VAR_ENSURE([TOOLBOX_BASE_TAG],
              [Toolbx base image tag],
              [stream9])

AS_CASE([$TOOLBOX_BASE_IMAGE],
        [*alpine*],          [TOOLBOX_DISTRO=alpine],
        [*centos*|*stream*], [TOOLBOX_DISTRO=centos],
        [*debian*],          [TOOLBOX_DISTRO=debian],
        [*fedora*],          [TOOLBOX_DISTRO=fedora],
        [*rhel*|*ubi*],      [TOOLBOX_DISTRO=rhel],
        [*ubuntu*],          [TOOLBOX_DISTRO=ubuntu])
AC_SUBST([TOOLBOX_DISTRO])
AC_SUBST([TOOLBOX_NAME], [$TOOLBOX_DISTRO-toolbox])

QH_VAR_ENSURE([TOOLBOX_REGISTRY],
              [Toolbx image registry],
              [quay.io])

QH_VAR_ENSURE([REGISTRY_ACCOUNT],
              [Registry account],
              [$USER])

QH_VAR_ENSURE([TOOLBOX_REPO],
              [Toolbx image repository],
              [$TOOLBOX_NAME])

QH_VAR_ENSURE([TOOLBOX_TAG],
              [Toolbx image tag],
              [$TOOLBOX_BASE_TAG-$PACKAGE_NAME-$PACKAGE_VERSION])

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
        [alpine*],              [VM_DISTRO=alpine],
        [centos*|stream*],      [VM_DISTRO=centos],
        [debian*],              [VM_DISTRO=debian],
        [fedora*|*-cloud-base], [VM_DISTRO=fedora],
        [rhel*],                [VM_DISTRO=rhel],
        [ubuntu*],              [VM_DISTRO=ubuntu])
AC_SUBST([VM_DISTRO])

AC_CONFIG_FILES([Makefile
                 Containerfile
                 Vagrantfile
                 provision/Makefile
                 provision/detutils-install
                 provision/envconf-install
                 ])
AC_OUTPUT
