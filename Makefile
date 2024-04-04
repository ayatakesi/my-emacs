### Makefile.  Generated from Makefile.in by configure.

# Copyright (C) 1992-2024 Free Software Foundation, Inc.

# This file is part of GNU Emacs.

# GNU Emacs is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# GNU Emacs is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

### Commentary:

# make all	to compile and build Emacs.
# make install	to install it.
# make TAGS	to update tags tables.
#
# make clean  or  make mostlyclean
#      Delete all files from the current directory that are normally
#      created by building the program.	 Don't delete the files that
#      record the configuration.  Also preserve files that could be made
#      by building, but normally aren't because the distribution comes
#      with them.
#
#      Delete '.dvi' files here if they are not part of the distribution.
#
# make distclean
#      Delete all files from the current directory that are created by
#      configuring or building the program.  If you have unpacked the
#      source and built the program without creating any other files,
#      'make distclean' should leave only the files that were in the
#      distribution.
#
# make maintainer-clean
#      Delete everything from the current directory that can be
#      reconstructed with this Makefile.  This typically includes
#      everything deleted by distclean, plus more: .elc files,
#      C source files produced by Bison, tags tables, info files,
#      and so on.
#
# make extraclean
#      Still more severe - delete backup and autosave files, too.
#
# make bootstrap
#      Removes all the compiled files to force a new bootstrap from a
#      clean slate, and then build in the normal way.  If the FAST Make
#      variable is set, then the autom4te.cache directory and the
#      config.cache file are not removed.  This lets you say
#
#      ./configure -C
#      make FAST=true bootstrap
#
#      and use the cached results from the configure run, which is much
#      faster though it does not work in general.
#
# make docs
#      Make Emacs documentation files from their sources; requires makeinfo.
#
# make check (or check-expensive or check-all)
#      Run the Emacs test suite.
#      check-expensive includes additional tests that can be slow.
#      check-all runs all tests, including ones that can be slow, or
#        fail unpredictably

SHELL = /bin/bash

DUMPING=pdumper

# This only matters when inheriting a CDPATH not starting with the
# current directory.
CDPATH=

# ==================== Things 'configure' Might Edit ====================

cache_file = /dev/null
CONFIGURE_FLAGS = --cache-file=$(cache_file)

AWK = gawk

EXEEXT=

### These help us choose version- and architecture-specific directories
### to install files in.

### This should be the number of the Emacs version we're building,
### like '24.5' or '25.0.50'.
version=30.0.50

### This should be the name of the configuration we're building Emacs
### for, like 'x86_64-unknown-linux-gnu' or 'powerpc-ibm-aix7.1.2.0'.
configuration=x86_64-pc-linux-gnu

### The nt/ subdirectory gets built only for MinGW
NTDIR=

top_builddir = .
-include ${top_builddir}/src/verbose.mk

FIND_DELETE = -delete

USE_STARTUP_NOTIFICATION = no

HAVE_NATIVE_COMP = no
HAVE_BE_APP = no
HAVE_PGTK = no
HAVE_GSETTINGS = no

ANDROID = yes

# ==================== Where To Install Things ====================

# Location to install Emacs.app under GNUstep / macOS.
# Later values may use these.
ns_appdir=
ns_appbindir=
ns_applibexecdir=
ns_appresdir=
ns_applibdir=
# Either yes or no depending on whether this is a relocatable Emacs.app.
ns_self_contained=no

# The default location for installation.  Everything is placed in
# subdirectories of this directory.  The default values for many of
# the variables below are expressed in terms of this one, so you may
# not need to change them.  This defaults to /usr/local.
prefix=/usr/local

# Like 'prefix', but used for architecture-specific files.
exec_prefix=${prefix}

# Where to install Emacs and other binaries that people will want to
# run directly (like etags).
bindir=${exec_prefix}/bin

# The root of the directory tree for read-only architecture-independent
# data files.  ${datadir}, ${infodir} and ${mandir} are based on this.
datarootdir=${prefix}/share

# Where to install architecture-independent data files.	 ${lispdir}
# and ${etcdir} are subdirectories of this.
datadir=${datarootdir}

# Where to install and expect the files that Emacs modifies as it
# runs.  These files are all architecture-independent.
# Right now, this is not used.
sharedstatedir=${prefix}/com

# Where to install and expect executable files to be run by Emacs
# rather than directly by users (and other architecture-dependent
# data, although Emacs does not have any).  The executables
# are actually installed in ${archlibdir}, which is (normally)
# a subdirectory of this.
libexecdir=${exec_prefix}/libexec

# Currently only used for the systemd service file.
libdir=${exec_prefix}/lib

# Where to install emacs-module.h.
includedir=${prefix}/include

# Where to install Emacs's man pages.
# Note they contain cross-references that expect them to be in section 1.
mandir=${datarootdir}/man
man1dir=$(mandir)/man1

# Where to install and expect the info files describing Emacs.
infodir=${datarootdir}/info
# Info files not in the doc/misc directory (we get those via make echo-info).
INFO_NONMISC=emacs.info eintr.info elisp.info

# Directory for local state files for all programs.
localstatedir=${prefix}/var

# Where to look for bitmap files.
bitmapdir=

# Where to find the source code.  The source code for Emacs's C kernel is
# expected to be in ${srcdir}/src, and the source code for Emacs's
# utility programs is expected to be in ${srcdir}/lib-src.  This is
# set by the configure script's '--srcdir' option.

# We use $(srcdir) explicitly in dependencies so as not to depend on VPATH.
srcdir=.
abs_srcdir=/home/runner/work/my-emacs/my-emacs

# Where the manpage source files are kept.
mansrcdir=$(srcdir)/doc/man

# Tell make where to find source files; this is needed for the makefiles.


# Where to find the application default.
x_default_search_path=

# Where the etc/emacs.desktop file is to be installed.
desktopdir=$(datarootdir)/applications

# Where the etc/emacs.metainfo.xml file is to be installed.
metainfodir=$(datarootdir)/metainfo

# Where the etc/emacs.service file is to be installed.
# The system value (typically /usr/lib/systemd/user) can be
# obtained with: pkg-config --variable=systemduserunitdir systemd
# but that does not respect configure's prefix.
# It is not clear where we should install this file when
# prefix != /usr (or /usr/local?) (eg for non-root installs).
# Other options include ~/.config/systemd/user/,
# $XDG_RUNTIME_DIR/systemd/user/
# It seems the user may end up having to make a manual link...
systemdunitdir=$(libdir)/systemd/user

# Where the etc/images/icons/hicolor directory is to be installed.
icondir=$(datarootdir)/icons

# The source directory for the icon files.
iconsrcdir=$(srcdir)/etc/images/icons

# Where to install the gsettings schema file.
gsettingsschemadir = $(datadir)/glib-2.0/schemas

# ==================== Emacs-specific directories ====================

# These variables hold the values Emacs will actually use.  They are
# based on the values of the standard Make variables above.

# Where lisp files are installed in a distributed with Emacs (relative
# path to the installation directory).
lispdirrel=${version}/lisp

# Where to install the lisp files distributed with Emacs.
# This includes the Emacs version, so that the lisp files for different
# versions of Emacs will install themselves in separate directories.
lispdir=${datadir}/emacs/${version}/lisp

# Directories Emacs should search for standard lisp files.
# The default is ${lispdir}.
standardlisppath=${lispdir}

# Directories Emacs should search for lisp files specific to this
# site (i.e. customizations), before consulting ${standardlisppath}.
# This should be a colon-separated list of directories.
locallisppath=${datadir}/emacs/${version}/site-lisp:${datadir}/emacs/site-lisp

# Where Emacs will search to find its lisp files.  Before
# changing this, check to see if your purpose wouldn't
# better be served by changing locallisppath.  This
# should be a colon-separated list of directories.
# The default is ${locallisppath}:${standardlisppath}.
lisppath=${locallisppath}:${standardlisppath}

# Where Emacs will search for its lisp files while building.
# This is only used during the process of compiling Emacs,
# to help Emacs find its lisp files before they've been installed
# in their final location.
# This should be a colon-separated list of directories.
# Normally it points to the lisp/ directory in the sources.
# NB lread.c relies on lisp/ being first here.
buildlisppath=${abs_srcdir}/lisp

# Where to install the other architecture-independent
# data files distributed with Emacs (like the tutorial,
# the cookie recipes and the Zippy database). This path
# usually contains the Emacs version number, so the data
# files for multiple versions of Emacs may be installed
# at once.
etcdir=${datadir}/emacs/${version}/etc

# Where to put executables to be run by Emacs rather than
# the user.  This path usually includes the Emacs version
# and configuration name, so that multiple configurations
# for multiple versions of Emacs may be installed at
# once.
archlibdir=${libexecdir}/emacs/${version}/${configuration}

# Where to put the etc/DOC file.
etcdocdir=${datadir}/emacs/${version}/etc

# User or group of the auxiliary program update-game-score, which is
# installed on platforms with a game directory shared by multiple users.
# On other platforms Emacs can update the score files itself.
gameuser=
gamegroup=
# Where to install game score files, if gameuser or gamegroup is nonempty.
gamedir=${localstatedir}/games/emacs
# Nonempty if and only if a shared gamedir is used.
use_gamedir=$(gameuser)$(gamegroup)

# ==================== Utility Programs for the Build ====================

# Allow the user to specify the install program.
# Note that if the system does not provide a suitable install,
# configure will use build-aux/install-sh.  Annoyingly, it does
# not use an absolute path.  So we must take care to always run
# INSTALL-type commands from the directory containing the Makefile.
# This explains (I think) the cd thisdir seen in several install rules.
SYSTEM_TYPE = gnu/linux
INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_INFO = /usr/bin/install-info
ifeq ($(SYSTEM_TYPE),cygwin)
  INSTALL_ELN = $(INSTALL)
else
  INSTALL_ELN = $(INSTALL_DATA)
endif
# By default, we uphold the dignity of our programs.
INSTALL_STRIP =
MKDIR_P = /usr/bin/mkdir -p
# Create a link to a file in the same directory as the target.
LN_S_FILEONLY = ln -s

# We use gzip to compress installed .el and some .txt files.
GZIP_PROG = /usr/bin/gzip

GLIB_COMPILE_SCHEMAS = glib-compile-schemas

# ============================= Targets ==============================

# Program name transformation.
TRANSFORM = s,x,x,

# Prevent any settings in the user environment causing problems.
unexport EMACSDATA EMACSDOC EMACSLOADPATH EMACSPATH

# What emacs should be called when installed.
EMACS_NAME = `echo emacs | sed '$(TRANSFORM)'`
EMACS = ${EMACS_NAME}${EXEEXT}
EMACSFULL = `echo emacs-${version} | sed '$(TRANSFORM)'`${EXEEXT}
EMACS_PDMP = `./src/emacs${EXEEXT} --fingerprint`.pdmp

# Subdirectories to make recursively.
SUBDIR = $(NTDIR) lib lib-src src lisp

ifeq ($(ANDROID),yes)
SUBDIR := $(SUBDIR) java
endif

# The subdir makefiles created by config.status.
SUBDIR_MAKEFILES_IN =  $(srcdir)/lib/Makefile.in $(srcdir)/lib-src/Makefile.in $(srcdir)/oldXMenu/Makefile.in $(srcdir)/src/Makefile.in $(srcdir)/lwlib/Makefile.in $(srcdir)/nextstep/Makefile.in $(srcdir)/nt/Makefile.in $(srcdir)/doc/emacs/Makefile.in $(srcdir)/doc/misc/Makefile.in $(srcdir)/doc/lispintro/Makefile.in $(srcdir)/doc/lispref/Makefile.in $(srcdir)/lisp/Makefile.in $(srcdir)/leim/Makefile.in $(srcdir)/test/Makefile.in $(srcdir)/test/infra/Makefile.in $(srcdir)/java/Makefile.in $(srcdir)/cross/Makefile.in $(srcdir)/admin/charsets/Makefile.in $(srcdir)/admin/unidata/Makefile.in $(srcdir)/admin/grammars/Makefile.in
SUBDIR_MAKEFILES = $(patsubst ${srcdir}/%,%,${SUBDIR_MAKEFILES_IN:.in=})

# Non-makefile files created by config.status.
CONFIG_STATUS_FILES_IN = \
 ${srcdir}/nt/emacs.rc.in ${srcdir}/nt/emacsclient.rc.in \
 ${srcdir}/doc/man/emacs.1.in ${srcdir}/src/emacs-module.h.in \
 ${srcdir}/src/module-env-*.h

# Subdirectories to install, and where they'll go.  lib-src's and nt's
# makefiles know how to install them, so we don't do that here.
# Directories that cannot simply be copied, eg info, are treated
# separately.
COPYDIR = ${srcdir}/etc ${srcdir}/lisp
COPYDESTS = "$(DESTDIR)${etcdir}" "$(DESTDIR)${lispdir}"

ifeq (${ns_self_contained},no)
BIN_DESTDIR='$(DESTDIR)${bindir}/'
ELN_DESTDIR = $(DESTDIR)${libdir}/emacs/${version}/
else
BIN_DESTDIR='${ns_appbindir}/'
ELN_DESTDIR = ${ns_applibdir}/
endif

gsettings_SCHEMAS = etc/org.gnu.emacs.defaults.gschema.xml

all:
	$(MAKE) actual-all || $(MAKE) advice-on-failure make-target=all exit-status=$$?
	$(MAKE) sanity-check make-target=all

# This target is used by the 'bootstrap' target in GNUmakefile, instead of 'all'.
bootstrap-all:
	$(MAKE) actual-all || $(MAKE) advice-on-failure make-target=bootstrap exit-status=$$?
	$(MAKE) sanity-check make-target=bootstrap

.PHONY: bootstrap-all actual-all advice-on-failure sanity-check

actual-all: ${SUBDIR} info $(gsettings_SCHEMAS:.xml=.valid) src-depending-on-lisp

# ADVICE-ON-FAILURE-BEGIN:all
# You could try to:
# - run "make bootstrap", which might fix the problem
# - run "make V=1", which displays the full commands invoked by make,
#   to further investigate the problem
# ADVICE-ON-FAILURE-END:all

# ADVICE-ON-FAILURE-BEGIN:bootstrap
# You could try to:
# - run "make extraclean" and run "make" again (or, equivalently, run
#   "make bootstrap configure=default"), to rebuild Emacs with the
#   default configuration options, which might fix the problem
# - run "git clean -fdx" and run "make bootstrap" again, which might
#   fix the problem if "make bootstrap configure=default" did not
#   !BEWARE! "git clean -fdx" deletes all files that are not under
#   !BEWARE! version control, which means that all changes to such
#   !BEWARE! files will be lost and cannot be restored later
# - run "make V=1", which displays the full commands invoked by make,
#   to further investigate the problem
# - report the problem and ask for help by sending an email to
#   bug-gnu-emacs@gnu.org, mentioning at least the build error
#   message, the platform, and the repository revision displayed by
#   "git rev-parse HEAD"
# ADVICE-ON-FAILURE-END:bootstrap

advice-on-failure:
	@[ -f .no-advice-on-failure ] && exit ${exit-status}; true
	@echo >&2 '***'
	@echo >&2 '*** '"\"make ${make-target}\" failed with exit status ${exit-status}."
	@echo >&2 '***'
	@cat Makefile | \
	  sed -n '/^# ADVICE-ON-FAILURE-BEGIN:${make-target}/,$${p;/^# ADVICE-ON-FAILURE-END:${make-target}/q;};' | \
	  sed 's/^# /*** /' | grep -v '^\*\*\* ADVICE-ON-FAILURE-' >&2
	@echo >&2 '***'
	@exit ${exit-status}

sanity-check:
	@[ -f .no-advice-on-failure ] && exit 0; true
	@v=`src/emacs${EXEEXT} --batch -Q --eval \
	  '(progn (defun f (n) (if (= 0 n) 1 (* n (f (- n 1))))) (princ (f 10)))' \
	  2> /dev/null`; \
	[ "X$$v" = "X3628800" ] && exit 0; \
	echo >&2 '***'; \
	echo >&2 '*** '"\"make ${make-target}\" succeeded, but Emacs is not functional."; \
	echo >&2 '***'; \
	cat Makefile | \
	  sed -n '/^# ADVICE-ON-FAILURE-BEGIN:${make-target}/,$${p;/^# ADVICE-ON-FAILURE-END:${make-target}/q;};' | \
	  sed 's/^# /*** /' | grep -v '^\*\*\* ADVICE-ON-FAILURE-' >&2; \
	echo >&2 '***'; \
	exit 1

.PHONY: all ${SUBDIR} blessmail epaths-force epaths-force-w32 epaths-force-ns-self-contained etc-emacsver

# Changes in lisp may require us to reconsider the build in src.  For
# example, if loaddefs.{el,elc} were built in lisp, we need a new
# .pdmp containing the new autoloads.
.PHONY: src-depending-on-lisp
src-depending-on-lisp: lisp
	${MAKE} -C src BIN_DESTDIR='$(BIN_DESTDIR)' ELN_DESTDIR='$(ELN_DESTDIR)'

# If configure were to just generate emacsver.tex from emacsver.tex.in
# in the normal way, the timestamp of emacsver.tex would always be
# newer than that of the pdf files, which are prebuilt in release tarfiles.
# So we use this rule, and move-if-change, to avoid that.
etc-emacsver:
	majorversion=`echo ${version} | sed 's/\..*//'`; \
	sed "s/[@]majorversion@/$${majorversion}/" \
	  ${srcdir}/etc/refcards/emacsver.tex.in > emacsver.tex.$$$$ && \
	  ${srcdir}/build-aux/move-if-change emacsver.tex.$$$$ \
	  ${srcdir}/etc/refcards/emacsver.tex

# The shared gamedir name as a C string literal, or a null ptr if not in use.
PATH_GAME = $(if $(use_gamedir),"$(gamedir)",((char const *) 0))

# Generate epaths.h from epaths.in.  This target is invoked by 'configure'.
# See comments in configure.ac for why it is done this way, as opposed
# to just letting configure generate epaths.h from epaths.in in a
# similar way to how Makefile is made from Makefile.in.
epaths-force:
	@for dir in '$(abs_srcdir)' '$(lispdir)' '$(archlibdir)'; do \
	  case $$dir in \
	    *:*) \
	      printf >&2 "Build or installation directory '%s'\\n" "$$dir"; \
	      echo >&2 "cannot contain ':'."; \
	      exit 1;; \
	  esac; \
	done
	@(gamedir='${gamedir}'; \
	  sed < ${srcdir}/src/epaths.in > epaths.h.$$$$					\
	  -e 's;\(#define.*PATH_LOADSEARCH\).*$$;\1 "${standardlisppath}";'		\
	  -e 's;\(#define.*PATH_REL_LOADSEARCH\).*$$;\1 "${lispdirrel}";'		\
	  -e 's;\(#define.*PATH_SITELOADSEARCH\).*$$;\1 "${locallisppath}";'		\
	  -e 's;\(#define.*PATH_DUMPLOADSEARCH\).*$$;\1 "${buildlisppath}";'		\
	  -e '/^#define PATH_[^ ]*SEARCH /s/\([":]\):*/\1/g'				\
	  -e '/^#define PATH_[^ ]*SEARCH /s/:"/"/'					\
	  -e 's;\(#define.*PATH_EXEC\).*$$;\1 "${archlibdir}";'				\
	  -e 's;\(#define.*PATH_INFO\).*$$;\1 "${infodir}";'				\
	  -e 's;\(#define.*PATH_DATA\).*$$;\1 "${etcdir}";'				\
	  -e 's;\(#define.*PATH_BITMAPS\).*$$;\1 "${bitmapdir}";'			\
	  -e 's;\(#define.*PATH_X_DEFAULTS\).*$$;\1 "${x_default_search_path}";'	\
	  -e 's;\(#define.*PATH_GAME\).*$$;\1 $(PATH_GAME);'				\
	  -e 's;\(#define.*PATH_DOC\).*$$;\1 "${etcdocdir}";') &&			\
	${srcdir}/build-aux/move-if-change epaths.h.$$$$ src/epaths.h

# The w32 build needs a slightly different editing, and it uses
# nt/epaths.nt as the template.
#
# Use the value of ${locallisppath} supplied by 'configure',
# to support the --enable-locallisppath argument.
#
# In this case, the paths written to 'src/epaths.h' must be in native
# MS-Windows format (e.g. 'c:/foo/bar'), because temacs is a MinGW
# program that doesn't support MSYS-style paths (e.g. '/c/foo/bar' or
# '/foo/bar').
epaths-force-w32:
	@(w32srcdir=`${srcdir}/build-aux/msys-to-w32 "${abs_srcdir}"`; \
	  w32prefix=`${srcdir}/build-aux/msys-to-w32 "${prefix}"`; \
	  w32locallisppath=`${srcdir}/build-aux/msys-to-w32 "${locallisppath}"` ; \
	  w32locallisppath=$${w32locallisppath//$${w32prefix}/"%emacs_dir%"} ; \
	  sed < ${srcdir}/nt/epaths.nt > epaths.h.$$$$		\
	  -e 's;\(#.*PATH_SITELOADSEARCH\).*$$;\1 "'"$${w32locallisppath//;/\\;}"'";' \
	  -e 's;\(#.*PATH_REL_LOADSEARCH\).*$$;\1 "${lispdirrel}";' \
	  -e '/^.*#/s/@VER@/${version}/g' 			\
	  -e '/^.*#/s/@CFG@/${configuration}/g' 		\
	  -e "/^.*#/s|@SRC@|$${w32srcdir}|g") &&		\
	${srcdir}/build-aux/move-if-change epaths.h.$$$$ src/epaths.h

# A NextStep style app bundle is relocatable, so instead of
# hard-coding paths try to generate them at run-time.
#
# The paths are mostly the same, and the bundle paths are different
# between macOS and GNUstep, so just replace any references to the app
# bundle root itself with the relative path.
epaths-force-ns-self-contained: epaths-force
	@(sed < src/epaths.h > epaths.h.$$$$		\
	  -e 's;${ns_appdir}/;;') &&			\
	${srcdir}/build-aux/move-if-change epaths.h.$$$$ src/epaths.h

ifneq ($(NTDIR),)
$(NTDIR): lib
endif

lib-src src: $(NTDIR) lib

src: lib-src

# We need to build 'emacs' in 'src' to compile the *.elc files in 'lisp'.
lisp: src

# These targets should be "${SUBDIR} without 'src'".
lib lib-src lisp nt: Makefile
	$(MAKE) -C $@ all

java: lisp info
	$(MAKE) -C $@ all

cross: src
	$(MAKE) -C $@ all

trampolines: src lisp
ifeq ($(HAVE_NATIVE_COMP),yes)
	$(MAKE) -C lisp trampolines
endif

# Pass an unexpanded $srcdir to src's Makefile, which then
# expands it using its own value of srcdir (which points to the
# source directory of src/).
src: Makefile
	$(MAKE) -C $@ BIN_DESTDIR='$(BIN_DESTDIR)' \
		 ELN_DESTDIR='$(ELN_DESTDIR)' all

blessmail: Makefile src
	$(MAKE) -C lib-src maybe-blessmail

# We used to have one rule per */Makefile.in, but that leads to race
# conditions with parallel makes, so assume that the timestamp on
# ./Makefile represents the timestamp on all the other Makefiles.
# Similarly, assume the timestamp on ./configure represents the
# timestamp on src/config.in.
#
# config.status overrides MAKEFILE_NAME with a bogus name when creating
# src/epaths.h, so that 'make epaths-force' does not recursively invoke
# config.status and overwrite config.status while executing it (Bug#11214).
#
# 'make bootstrap' overrides MAKEFILE_NAME to a nonexistent file but
# then attempts to build that file.  This forces 'Makefile', 'lib/Makefile',
# etc. to be built without running into similar recursion problems.
MAKEFILE_NAME = Makefile
$(MAKEFILE_NAME): config.status $(srcdir)/configure \
	 $(srcdir)/lib/gnulib.mk.in \
         $(srcdir)/Makefile.in $(SUBDIR_MAKEFILES_IN) $(CONFIG_STATUS_FILES_IN)
	MAKE='$(MAKE)' ./config.status

# Don't erase these files if make is interrupted while refreshing them.
.PRECIOUS: Makefile config.status

# Note that calling config.status --recheck is insufficient on Android
# due to the recursive calls to configure.

config.status: ${srcdir}/configure
	if [ -x ./config.status ]; then		\
	    $(CFG) ./config.status --recheck;	\
	else					\
	    $(CFG) $(srcdir)/configure $(CONFIGURE_FLAGS); \
	fi

$(srcdir)/configure: $(srcdir)/configure.ac $(srcdir)/m4/*.m4
	cd $(srcdir) && ./autogen.sh autoconf

# ==================== Installation ====================

.PHONY: install install-arch-dep install-arch-indep install-etcdoc install-info
.PHONY: install-man install-etc install-strip install-$(NTDIR) install-eln
.PHONY: uninstall uninstall-$(NTDIR)

## If we let lib-src do its own installation, that means we
## don't have to duplicate the list of utilities to install in
## this Makefile as well.

install: actual-all install-arch-indep install-etcdoc install-arch-dep install-$(NTDIR) blessmail install-eln install-gsettings-schemas
	@true

## Ensure that $subdir contains a subdirs.el file.
## Here and elsewhere, we set the umask so that any created files are
## world-readable.
## TODO it might be good to warn about non-standard permissions of
## pre-existing directories, but that does not seem easy.
write_subdir=if [ -f "$${subdir}/subdirs.el" ]; \
	then true; \
	else \
	  umask 022; \
	  ${MKDIR_P} "$${subdir}"; \
	  (echo "(if (fboundp 'normal-top-level-add-subdirs-to-load-path)"; \
	   echo "    (normal-top-level-add-subdirs-to-load-path))") \
	    > "$${subdir}/subdirs.el"; \
	fi

### Install the executables that were compiled specifically for this machine.
### We do install-arch-indep first because the executable needs the
### Lisp files and DOC file to work properly.
install-arch-dep: src install-arch-indep install-etcdoc install-$(NTDIR)
	umask 022; ${MKDIR_P} "$(DESTDIR)${bindir}"
	$(MAKE) -C lib-src install
ifeq (${ns_self_contained},no)
	${INSTALL_PROGRAM} $(INSTALL_STRIP) src/emacs${EXEEXT} "$(DESTDIR)${bindir}/$(EMACSFULL)"
ifeq (${HAVE_BE_APP},yes)
	${INSTALL_PROGRAM} $(INSTALL_STRIP) src/Emacs "$(DESTDIR)${prefix}/apps/Emacs"
endif
ifeq (${DUMPING},pdumper)
ifeq (${HAVE_BE_APP},yes)
	${INSTALL_DATA} src/Emacs.pdmp "$(DESTDIR)${libexecdir}/emacs/${version}/${configuration}"/Emacs.pdmp
endif
	${INSTALL_DATA} src/emacs.pdmp "$(DESTDIR)${libexecdir}/emacs/${version}/${configuration}"/emacs-${EMACS_PDMP}
endif
	-chmod 755 "$(DESTDIR)${bindir}/$(EMACSFULL)"
ifndef NO_BIN_LINK
	rm -f "$(DESTDIR)${bindir}/$(EMACS)"
	cd "$(DESTDIR)${bindir}" && $(LN_S_FILEONLY) "$(EMACSFULL)" "$(EMACS)"
endif
else
	${INSTALL_DATA} src/emacs.pdmp "$(DESTDIR)${libexecdir}/Emacs.pdmp"
	subdir=${ns_appresdir}/site-lisp && ${write_subdir}
	rm -rf ${ns_appresdir}/share
endif

### Windows-specific install target for installing programs produced
### in nt/, and its Posix do-nothing shadow.
install-:
install-nt:
	$(MAKE) -C $(NTDIR) install

## In the share directory, we are deleting:
## applications (with emacs.desktop, also found in etc/)
## emacs (basically empty except for unneeded site-lisp directories)
## icons (duplicates etc/images/icons/hicolor)

## This is install-etc for everything except self-contained-ns builds.
## For them, it is empty.
INSTALL_ARCH_INDEP_EXTRA = install-etc

## https://lists.gnu.org/r/emacs-devel/2007-10/msg01672.html
## Needs to be the user running install, so configure can't set it.
set_installuser=for installuser in $${LOGNAME} $${USERNAME} $${USER} \
	  `(id -u) 2> /dev/null`; do \
	  [ -n "$${installuser}" ] && break ; \
	done; \
	installgroup=`(id -g) 2>/dev/null` && [ -n "$$installgroup" ] && \
	  installuser=$$installuser:$$installgroup

### Install the files that are machine-independent.
### Most of them come straight from the distribution; the exception is
### the DOC file, which is copied from the build directory.

## We delete each directory in ${COPYDESTS} before we copy into it;
## that way, we can reinstall over directories that have been put in
## place with their files read-only (perhaps because they are checked
## into RCS).  In order to make this safe, we make sure that the
## source exists and is distinct from the destination.

## We delete etc/DOC* because there may be irrelevant DOC files from
## other builds in the source directory.  This is ok because we just
## deleted the entire installed etc/ directory and recreated it.
## install-etcdoc installs the relevant DOC.

## Note that we install etc/refcards/*.ps if present.
## TODO we should compress these if GZIP_PROG is set.
## It would be simpler to have a separate install rule for etc/refcards
## (maybe move it to doc/refcards?).

## Note that the Makefiles in the etc directory are potentially useful
## in an installed Emacs, so should not be excluded.

## We always create the _default_ locallisppath directories, and
## ensure that they contain a subdirs.el file (via write_subdir).
## This is true even if locallisppath has a non-default value.
## In case of non-default value, we used to create the specified directories,
## but not add subdirs.el to them.  This was a strange halfway house.
## Nowadays we do not create non-default directories.

## Note that we use tar instead of plain old cp -R/-r because the latter
## is apparently not portable (even in 2012!).
## https://lists.gnu.org/r/emacs-devel/2012-05/msg00278.html
## I have no idea which platforms Emacs supports where cp -R does not
## work correctly, and therefore no idea when tar can be replaced.
## See also these comments from 2004 about cp -r working fine:
## https://lists.gnu.org/r/autoconf-patches/2004-11/msg00005.html
install-arch-indep: lisp install-info install-man ${INSTALL_ARCH_INDEP_EXTRA}
	umask 022 && $(MKDIR_P) "$(DESTDIR)$(includedir)"
	$(INSTALL_DATA) src/emacs-module.h "$(DESTDIR)$(includedir)/emacs-module.h"
	-set ${COPYDESTS} ; \
	unset CDPATH; \
	$(set_installuser); \
	for dir in ${COPYDIR} ; do \
	  [ -d $${dir} ] || exit 1 ; \
	  dest="$$1" ; shift ; \
	  if [ -d "$${dest}" ]; then \
	    exp_dest=`cd "$${dest}" && pwd -P`; \
	    [ "$$exp_dest" = "`cd $${dir} && pwd -P`" ] && continue ; \
	  else true; \
	  fi; \
	  rm -rf "$${dest}" ; \
	  umask 022; ${MKDIR_P} "$${dest}" ; \
	  printf 'Copying %s to %s...\n' "$$dir" "$$dest" ; \
	  (cd $${dir}; tar -chf - . ) \
	    | (cd "$${dest}"; umask 022; \
	       tar -xvf - && cat > /dev/null) || exit 1; \
	  if [ "$${dir}" = "${srcdir}/etc" ]; then \
	      rm -f "$${dest}/DOC"* ; \
	      rm -f "$${dest}/refcards"/*.aux "$${dest}/refcards"/*.dvi; \
	      rm -f "$${dest}/refcards"/*.log "$${dest}/refcards"/*.in; \
	  else true; \
	  fi; \
	  (cd "$${dest}" || exit 1; \
	    for subdir in `find . -type d -print` ; do \
	      chmod a+rx $${subdir} ; \
	      rm -f $${subdir}/.gitignore ; \
	      rm -f $${subdir}/.arch-inventory ; \
	      rm -f $${subdir}/.DS_Store ; \
	      rm -f $${subdir}/#* ; \
	      rm -f $${subdir}/.#* ; \
	      rm -f $${subdir}/*~ ; \
	      rm -f $${subdir}/*.orig ; \
	      rm -f $${subdir}/ChangeLog* ; \
	      [ "$${dir}" != "${srcdir}/etc" ] && \
	        rm -f $${subdir}/[mM]akefile*[.-]in $${subdir}/[mM]akefile ; \
	    done ); \
	  find "$${dest}" -exec chown $${installuser} {} ';' ;\
	done
	-rm -f "$(DESTDIR)${lispdir}/subdirs.el"
	umask 022; $(srcdir)/build-aux/update-subdirs "$(DESTDIR)${lispdir}"
	subdir="$(DESTDIR)${datadir}/emacs/${version}/site-lisp" ; \
	  ${write_subdir}
	subdir="$(DESTDIR)${datadir}/emacs/site-lisp" ; \
	  ${write_subdir} || true
	[ -z "${GZIP_PROG}" ] || { \
	  echo "Compressing *.el etc. ..." && \
	  cd "$(DESTDIR)${lispdir}" && \
	  for f in `find . -name "*.elc" -print | sed 's/.elc$$/.el/'`; do \
	    ${GZIP_PROG} -9n "$$f"; \
	  done; \
	  ${GZIP_PROG} -9n "../etc/publicsuffix.txt"; \
	}
	-chmod -R a+r "$(DESTDIR)${datadir}/emacs/${version}" ${COPYDESTS}

## The above chmods are needed because "umask 022; tar ..." is not
## guaranteed to do the right thing; eg if we are root and tar is
## preserving source permissions.

## Note that install-arch-indep deletes and recreates the entire
## installed etc/ directory, so we need it to run before this does.
install-etcdoc: src install-arch-indep
	-unset CDPATH; \
	umask 022; ${MKDIR_P} "$(DESTDIR)${etcdocdir}" ; \
	exp_etcdocdir=`cd "$(DESTDIR)${etcdocdir}"; pwd -P`; \
	if [ "`cd ./etc; pwd -P`" != "$$exp_etcdocdir" ]; \
	then \
	   docfile="DOC"; \
	   printf 'Copying %s to %s ...\n' "etc/$$docfile" \
	     "$(DESTDIR)${etcdocdir}"; \
	   ${INSTALL_DATA} etc/$${docfile} "$(DESTDIR)${etcdocdir}/$${docfile}"; \
	else true; fi

## FIXME:
## If info/dir is missing, but we have install-info, we should let
## that handle it.  If info/dir is present and we do not have install-info,
## we should check for missing entries and add them by hand.
install-info: info
	umask 022; ${MKDIR_P} "$(DESTDIR)${infodir}"
	-unset CDPATH; \
	thisdir=`pwd -P`; \
	exp_infodir=`cd "$(DESTDIR)${infodir}" && pwd -P`; \
	if [ "`cd ${srcdir}/info && pwd -P`" = "$$exp_infodir" ]; then \
	  true; \
	else \
	   [ -f "$(DESTDIR)${infodir}/dir" ] || \
	      [ ! -f ${srcdir}/info/dir ] || \
	      ${INSTALL_DATA} ${srcdir}/info/dir "$(DESTDIR)${infodir}/dir"; \
	   info_misc=`MAKEFLAGS= $(MAKE) --no-print-directory -s -C doc/misc echo-info`; \
	   cd ${srcdir}/info ; \
	   for elt in ${INFO_NONMISC} $${info_misc}; do \
	      for f in `ls $$elt $$elt-[1-9] $$elt-[1-9][0-9] 2>/dev/null`; do \
	       (cd "$${thisdir}"; \
	        ${INSTALL_DATA} ${srcdir}/info/$$f "$(DESTDIR)${infodir}/$$f"); \
	        [ -n "${GZIP_PROG}" ] || continue ; \
	        rm -f "$(DESTDIR)${infodir}/$$f.gz"; \
	        ${GZIP_PROG} -9n "$(DESTDIR)${infodir}/$$f"; \
	      done; \
	     (cd "$${thisdir}"; \
	      ${INSTALL_INFO} --info-dir="$(DESTDIR)${infodir}" "$(DESTDIR)${infodir}/$$elt"); \
	      cp elisp_type_hierarchy* $(DESTDIR)${infodir}/; \
	   done; \
	fi

## "gzip || true" is because some gzips exit with non-zero status
## if compression would not reduce the file size.  Eg, the gzip in
## OpenBSD 4.9 seems to do this (2013/03).  In Emacs, this can
## only happen with the tiny ctags.1 manpage.  We don't really care if
## ctags.1 is compressed or not.  "gzip -f" is another option here,
## but not sure if portable.
install-man:
	umask 022; ${MKDIR_P} "$(DESTDIR)${man1dir}"
	thisdir=`pwd -P`; \
	cd ${mansrcdir}; \
	for page in *.1; do \
	  test "$$page" = ChangeLog.1 && continue; \
	  dest=`echo "$${page}" | sed -e 's/\.1$$//' -e '$(TRANSFORM)'`.1; \
	  (cd "$${thisdir}"; \
	   ${INSTALL_DATA} ${mansrcdir}/$${page} "$(DESTDIR)${man1dir}/$${dest}"); \
	  [ -n "${GZIP_PROG}" ] || continue ; \
	  rm -f "$(DESTDIR)${man1dir}/$${dest}.gz"; \
	  ${GZIP_PROG} -9n "$(DESTDIR)${man1dir}/$${dest}" || true; \
	done

## Install those items from etc/ that need to end up elsewhere.

## If you prefer, choose "emacs22" at installation time.
## Note: emacs22 does not have all the resolutions.
EMACS_ICON=emacs

ifeq (${USE_STARTUP_NOTIFICATION},no)
USE_STARTUP_NOTIFICATION_SED_CMD=-e "/^StartupNotify=true$$/d"
endif
ifeq ($(HAVE_PGTK),yes)
USE_WAYLAND_DISPLAY_SED_CMD=-e "s/display=[^ ]*/reuse-frame/"
endif
install-etc:
	umask 022; ${MKDIR_P} "$(DESTDIR)${desktopdir}"
	tmp=etc/emacs.tmpdesktop; rm -f $${tmp}; \
	sed -e "/^Exec=emacs/ s/emacs/${EMACS_NAME}/" \
	  -e "/^Icon=emacs/ s/emacs/${EMACS_NAME}/" \
	  $(USE_STARTUP_NOTIFICATION_SED_CMD) \
	  ${srcdir}/etc/emacs.desktop > $${tmp}; \
	${INSTALL_DATA} $${tmp} "$(DESTDIR)${desktopdir}/${EMACS_NAME}.desktop"; \
	rm -f $${tmp}
	tmp=etc/emacsclient.tmpdesktop; rm -f $${tmp}; \
	client_name=`echo emacsclient | sed '$(TRANSFORM)'`${EXEEXT}; \
	sed -e "/^Exec=/ s|emacsclient|${bindir}/$${client_name}|" \
	  -e "/^Icon=emacs/ s/emacs/${EMACS_NAME}/" \
	  $(USE_STARTUP_NOTIFICATION_SED_CMD) \
	  $(USE_WAYLAND_DISPLAY_SED_CMD) \
	  ${srcdir}/etc/emacsclient.desktop > $${tmp}; \
	${INSTALL_DATA} $${tmp} "$(DESTDIR)${desktopdir}/$${client_name}.desktop"; \
	rm -f $${tmp}
	tmp=etc/emacs-mail.tmpdesktop; rm -f $${tmp}; \
	sed -e "/^Exec=emacs/ s/emacs/${EMACS_NAME}/" \
	  -e "/^Icon=emacs/ s/emacs/${EMACS_NAME}/" \
	  ${srcdir}/etc/emacs-mail.desktop > $${tmp}; \
	${INSTALL_DATA} $${tmp} "$(DESTDIR)${desktopdir}/${EMACS_NAME}-mail.desktop"; \
	rm -f $${tmp}
	tmp=etc/emacsclient-mail.tmpdesktop; rm -f $${tmp}; \
	client_name=`echo emacsclient | sed '$(TRANSFORM)'`${EXEEXT}; \
	sed -e "/^Exec=/ s|emacsclient|${bindir}/$${client_name}|" \
	  -e "/^Icon=emacs/ s/emacs/${EMACS_NAME}/" \
	  $(USE_WAYLAND_DISPLAY_SED_CMD) \
	  ${srcdir}/etc/emacsclient-mail.desktop > $${tmp}; \
	${INSTALL_DATA} $${tmp} "$(DESTDIR)${desktopdir}/$${client_name}-mail.desktop"; \
	rm -f $${tmp}
	umask 022; ${MKDIR_P} "$(DESTDIR)${metainfodir}"
	tmp=etc/emacs.tmpmetainfo; rm -f $${tmp}; \
	sed -e "s/emacs\.desktop/${EMACS_NAME}.desktop/" \
	  ${srcdir}/etc/emacs.metainfo.xml > $${tmp}; \
	${INSTALL_DATA} $${tmp} "$(DESTDIR)${metainfodir}/${EMACS_NAME}.metainfo.xml"; \
	rm -f $${tmp}
	umask 022; $(MKDIR_P) "$(DESTDIR)$(systemdunitdir)"
	tmp=etc/emacs.tmpservice; rm -f $${tmp}; \
	client_name=`echo emacsclient | sed '$(TRANSFORM)'`${EXEEXT}; \
	sed -e '/^##/d' \
	  -e "/^Documentation/ s/emacs(1)/${EMACS_NAME}(1)/" \
	  -e "/^ExecStart/ s|emacs|${bindir}/${EMACS}|" \
	  -e "/^ExecStop/ s|emacsclient|${bindir}/$${client_name}|" \
	  ${srcdir}/etc/emacs.service > $${tmp}; \
	$(INSTALL_DATA) $${tmp} "$(DESTDIR)$(systemdunitdir)/${EMACS_NAME}.service"; \
	rm -f $${tmp}
	thisdir=`pwd -P`; \
	cd ${iconsrcdir} || exit 1; umask 022 ; \
	for dir in */*/apps */*/mimetypes; do \
	  [ -d $${dir} ] || continue ; \
	  ( cd "$${thisdir}"; ${MKDIR_P} "$(DESTDIR)${icondir}/$${dir}" ) ; \
	  for icon in $${dir}/${EMACS_ICON}[.-]*; do \
	    [ -r $${icon} ] || continue ; \
	    ext=`echo "$${icon}" | sed -e 's|.*\.||'`; \
	    dest=`echo "$${icon}" | sed -e 's|.*/||' -e "s|\\.$${ext}\$$||" -e 's/$(EMACS_ICON)/emacs/' -e '$(TRANSFORM)'`.$${ext} ; \
	    ( cd "$${thisdir}"; \
	      ${INSTALL_DATA} ${iconsrcdir}/$${icon} "$(DESTDIR)${icondir}/$${dir}/$${dest}" ) \
	    || exit 1; \
	  done ; \
	done

### Install native compiled Lisp files.
install-eln: lisp
ifeq ($(HAVE_NATIVE_COMP),yes)
	umask 022 ; \
	find native-lisp -type d -exec $(MKDIR_P) "$(ELN_DESTDIR){}" \; ; \
	find native-lisp -type f -exec ${INSTALL_ELN} "{}" "$(ELN_DESTDIR){}" \;
endif

### Build Emacs and install it, stripping binaries while installing them.
install-strip:
	$(MAKE) INSTALL_STRIP=-s install

### Delete all the installed files that the 'install' target would
### create (but not the noninstalled files such as 'make all' would create).
###
### Don't delete the lisp and etc directories if they're in the source tree.
uninstall: uninstall-$(NTDIR) uninstall-doc uninstall-gsettings-schemas
	rm -f "$(DESTDIR)$(includedir)/emacs-module.h"
	$(MAKE) -C lib-src uninstall
	-unset CDPATH; \
	for dir in "$(DESTDIR)${lispdir}" "$(DESTDIR)${etcdir}" "$(ELN_DESTDIR)" ; do 	\
	  if [ -d "$${dir}" ]; then			\
	    case `cd "$${dir}" ; pwd -P` in		\
	      "`cd ${srcdir} ; pwd -P`"* ) ;;		\
	      * ) rm -rf "$${dir}" ;;			\
	    esac ;					\
	    case "$${dir}" in				\
	      "$(DESTDIR)${datadir}/emacs/${version}"/* )		\
	        rm -rf "$(DESTDIR)${datadir}/emacs/${version}"	\
	      ;;					\
	    esac ;					\
	  fi ;						\
	done
	-rm -rf "$(DESTDIR)${libexecdir}/emacs/${version}"
	thisdir=`pwd -P`; \
	(info_misc=`MAKEFLAGS= $(MAKE) --no-print-directory -s -C doc/misc echo-info`; \
	 if cd "$(DESTDIR)${infodir}"; then \
	   for elt in ${INFO_NONMISC} $${info_misc}; do \
	     (cd "$${thisdir}"; \
	      $(INSTALL_INFO) --remove --info-dir="$(DESTDIR)${infodir}" "$(DESTDIR)${infodir}/$$elt"); \
	     if [ -n "${GZIP_PROG}" ]; then \
	        ext=.gz; else ext=; fi; \
	     rm -f $$elt$$ext $$elt-[1-9]$$ext $$elt-[1-9][0-9]$$ext; \
	   done; \
	   rm -f elisp_type_hierarchy.jpg elisp_type_hierarchy.txt; \
	 fi)
	(if [ -n "${GZIP_PROG}" ]; then \
	    ext=.gz; else ext=; fi; \
	 if cd ${mansrcdir}; then \
	   for page in *.1; do \
	     rm -f "$(DESTDIR)${man1dir}"/`echo "$${page}" | sed -e 's/\.1$$//' -e '$(TRANSFORM)'`.1$$ext; done; \
	 fi)
	rm -f "$(DESTDIR)${bindir}/$(EMACS)" "$(DESTDIR)${bindir}/$(EMACSFULL)"
	(if cd "$(DESTDIR)${icondir}"; then \
	   rm -f hicolor/*x*/apps/"${EMACS_NAME}.png" \
	     "hicolor/scalable/apps/${EMACS_NAME}.svg" \
	     "hicolor/scalable/apps/${EMACS_NAME}.ico" \
	     "hicolor/scalable/mimetypes/${EMACS_NAME}-document.svg" \
	     "hicolor/scalable/mimetypes/${EMACS_NAME}-document23.svg"; \
	fi)
	-rm -f "$(DESTDIR)${desktopdir}/${EMACS_NAME}.desktop"
	-rm -f "$(DESTDIR)${metainfodir}/${EMACS_NAME}.metainfo.xml"
	-rm -f "$(DESTDIR)$(systemdunitdir)/${EMACS_NAME}.service"
  ifneq (,$(use_gamedir))
	for file in snake-scores tetris-scores; do \
	  file="$(DESTDIR)${gamedir}/$${file}"; \
	  [ -s "$${file}" ] || rm -f "$$file"; \
	done
  endif

### Windows-specific uninstall target for removing programs produced
### in nt/, and its Posix do-nothing shadow.
uninstall-:
uninstall-nt:
	$(MAKE) -C $(NTDIR) uninstall

# ==================== Cleaning up and miscellanea ====================

.PHONY: mostlyclean clean distclean bootstrap-clean maintainer-clean extraclean

## Eg:
## src_clean:
##     make -C src clean
define submake_template
.PHONY: $(1)_$(2)
$(1)_$(2):
	$$(MAKE) -C $(1) $(2)
endef

### 'mostlyclean'
###      Like 'clean', but may refrain from deleting a few files that people
###      normally don't want to recompile.  For example, the 'mostlyclean'
###      target for GCC does not delete 'libgcc.a', because recompiling it
###      is rarely necessary and takes a lot of time.
mostlyclean_dirs = src oldXMenu lwlib lib lib-src nt doc/emacs doc/misc \
  doc/lispref doc/lispintro test

### Add the libexec directory to mostlyclean_dirs if its Makefile has
### been created.
ifneq ($(wildcard exec/Makefile),)
mostlyclean_dirs := $(mostlyclean_dirs) exec
endif

$(foreach dir,$(mostlyclean_dirs),$(eval $(call submake_template,$(dir),mostlyclean)))

mostlyclean: $(mostlyclean_dirs:=_mostlyclean)

### 'clean'
###      Delete all files from the current directory that are normally
###      created by building the program.  Don't delete the files that
###      record the configuration.  Also preserve files that could be made
###      by building, but normally aren't because the distribution comes
###      with them.
###
###      Delete '.dvi' files here if they are not part of the distribution.
clean_dirs = $(mostlyclean_dirs) java cross nextstep admin/charsets \
  admin/unidata

$(foreach dir,$(clean_dirs),$(eval $(call submake_template,$(dir),clean)))

clean: $(clean_dirs:=_clean) clean-gsettings-schemas
	-rm -f ./*.tmp etc/*.tmp*
	-rm -rf info-dir.*
	-rm -rf native-lisp

### 'bootclean'
###      Delete all files that need to be remade for a clean bootstrap.
top_bootclean=\
	rm -f config.log ${srcdir}/doc/man/emacs.1

### 'distclean'
###      Delete all files from the current directory that are created by
###      configuring or building the program.  If you have unpacked the
###      source and built the program without creating any other files,
###      'make distclean' should leave only the files that were in the
###      distribution.
top_distclean=\
	${top_bootclean}; \
	rm -f config.cache config.status config.log~ \
	  Makefile makefile lib/gnulib.mk ${SUBDIR_MAKEFILES}

distclean_dirs = $(clean_dirs) leim lisp admin/grammars

$(foreach dir,$(distclean_dirs),$(eval $(call submake_template,$(dir),distclean)))

distclean: $(distclean_dirs:=_distclean) clean-gsettings-schemas
	${top_distclean}
ifeq ($(HAVE_NATIVE_COMP),yes)
	rm -rf native-lisp
endif

### 'bootstrap-clean'
###      Delete everything that can be reconstructed by 'make' and that
###      needs to be deleted in order to force a bootstrap from a clean state.
$(foreach dir,$(distclean_dirs),$(eval $(call submake_template,$(dir),bootstrap-clean)))

bootstrap-clean: $(distclean_dirs:=_bootstrap-clean)
	[ ! -f config.log ] || mv -f config.log config.log~
	rm -rf ${srcdir}/info
	rm -f ${srcdir}/etc/refcards/emacsver.tex
	rm -rf native-lisp/ lisp/leim/ja-dic/
ifndef FAST
	rm -fr autom4te.cache config.cache
endif
	${top_bootclean}

### 'maintainer-clean'
###      Delete everything from the current directory that can be
###      reconstructed with this Makefile.  This typically includes
###      everything deleted by distclean, plus more: C source files
###      produced by Bison, tags tables, info files, and so on.
###
###      One exception, however: 'make maintainer-clean' should not delete
###      'configure' even if 'configure' can be remade using a rule in the
###      Makefile.  More generally, 'make maintainer-clean' should not delete
###      anything that needs to exist in order to run 'configure' and then
###      begin to build the program.
top_maintainer_clean=\
	${top_distclean}; \
	rm -fr ${srcdir}/autom4te.cache

$(foreach dir,$(distclean_dirs),$(eval $(call submake_template,$(dir),maintainer-clean)))

maintainer-clean: $(distclean_dirs:=_maintainer-clean)
	rm -rf ${srcdir}/info
	rm -f ${srcdir}/etc/refcards/emacsver.tex
	${top_maintainer_clean}

### This doesn't actually appear in the coding standards, but Karl
### says GCC supports it, and that's where the configuration part of
### the coding standards seem to come from.  It's like distclean, but
### it deletes backup and autosave files too.
extraclean: maintainer-clean
	-rm -f config-tmp-* ${srcdir}/aclocal.m4 ${srcdir}/configure \
	  ${srcdir}/src/config.in
	-[ "${srcdir}" = "." ] || \
	  find ${srcdir} '(' -name '*~' -o -name '#*' ')' ${FIND_DELETE}
	-find . '(' -name '*~' -o -name '#*' ')' ${FIND_DELETE}
	-rm -f ${srcdir}/exec/config-tmp-* ${srcdir}/exec/aclocal.m4 \
	  ${srcdir}/src/config.in ${srcdir}/exec/configure

# The src subdir knows how to do the right thing
# even when the build directory and source dir are different.
.PHONY: TAGS tags
# FIXME: We used to include `src` in the dependencies, not sure why.
# I removed it because it causes `make tags` to build Emacs.
TAGS tags: lib lib-src # src
	$(MAKE) -C src tags
	$(MAKE) -C doc/emacs tags
	$(MAKE) -C doc/lispintro tags
	$(MAKE) -C doc/lispref tags
	$(MAKE) -C doc/misc tags

CHECK_TARGETS = check check-maybe check-expensive check-all check-byte-compile
.PHONY: $(CHECK_TARGETS)
$(CHECK_TARGETS): all
	$(MAKE) -C test $@

test/%:
	$(MAKE) -C test $*


dist:
	cd ${srcdir}; ./make-dist

DVIS  = lispref-dvi  lispintro-dvi  emacs-dvi  misc-dvi
HTMLS = lispref-html lispintro-html emacs-html misc-html
INFOS = lispref-info lispintro-info emacs-info misc-info
PDFS  = lispref-pdf  lispintro-pdf  emacs-pdf  misc-pdf
PSS   = lispref-ps   lispintro-ps   emacs-ps   misc-ps

DOCS = $(DVIS) $(HTMLS) $(INFOS) $(PDFS) $(PSS)
$(DOCS):
	$(MAKE) -C doc/$(subst -, ,$@)

.PHONY: $(DOCS) docs pdf ps
.PHONY: info dvi dist html info-dir check-info

## TODO add etc/refcards.
docs: $(DOCS)
dvi: $(DVIS)
html: $(HTMLS)
info: $(INFOS) info-dir
pdf: $(PDFS)
ps: $(PSS)

# This dependency is due to those doc/misc/ manuals that use .org sources.
# Depending on src is sufficient, but ends up being slow, since the
# uncompiled lisp/org/*.el files are used to build the .texi files
# (which can be slow even with the elc files).
misc-info: lisp
# Using src rather than lisp because one is less likely to get unnecessary
# rebuilds of stuff that is not strictly necessary for generating manuals.
misc-dvi misc-html misc-pdf misc-ps: src

info-dir: ${srcdir}/info/dir

texi_misc = $(shell MAKEFLAGS= ${MAKE} --no-print-directory -s -C doc/misc echo-sources)

srcdir_doc_info_dir_inputs = \
  ${srcdir}/doc/emacs/emacs.texi \
  ${srcdir}/doc/lispintro/emacs-lisp-intro.texi \
  ${srcdir}/doc/lispref/elisp.texi \
  $(addprefix ${srcdir}/doc/misc/,${texi_misc})
info_dir_inputs = \
  ../build-aux/dir_top \
  $(subst ${srcdir}/doc/,,${srcdir_doc_info_dir_inputs})
info_dir_deps = \
  ${srcdir}/build-aux/make-info-dir \
  ${srcdir}/build-aux/dir_top \
  ${srcdir_doc_info_dir_inputs}

## It would be much simpler if info/dir was only created in the
## installation location by the install-info rule, but we also
## need one in the source directory for people running uninstalled.
## FIXME it would be faster to use the install-info program if we have it,
## but then we would need to depend on ${INFOS}, which would
## slow down parallelization.
${srcdir}/info/dir: ${info_dir_deps}
	$(AM_V_GEN)${MKDIR_P} ${srcdir}/info
	$(AM_V_at)(cd ${srcdir}/doc && \
	 AWK='${AWK}' ../build-aux/make-info-dir ${info_dir_inputs} \
	) >$@.tmp && mv $@.tmp $@

INSTALL_DVI = install-emacs-dvi install-lispref-dvi \
	install-lispintro-dvi install-misc-dvi
INSTALL_HTML = install-emacs-html install-lispref-html \
	install-lispintro-html install-misc-html
INSTALL_PDF = install-emacs-pdf install-lispref-pdf \
	install-lispintro-pdf install-misc-pdf
INSTALL_PS = install-emacs-ps install-lispref-ps \
	install-lispintro-ps install-misc-ps
INSTALL_DOC = $(INSTALL_DVI) $(INSTALL_HTML) $(INSTALL_PDF) $(INSTALL_PS)

## Install non .info forms of the documentation.
## TODO add etc/refcards.
$(INSTALL_DOC):
	$(MAKE) -C doc/$(subst -, install-,$(subst install-,,$@))

.PHONY: $(INSTALL_DOC) install-doc
.PHONY: install-dvi install-html install-pdf install-ps

install-doc: $(INSTALL_DOC)
install-dvi: $(INSTALL_DVI)
install-html: $(INSTALL_HTML)
install-pdf: $(INSTALL_PDF)
install-ps: $(INSTALL_PS)


UNINSTALL_DVI = uninstall-emacs-dvi uninstall-lispref-dvi \
	uninstall-lispintro-dvi uninstall-misc-dvi
UNINSTALL_HTML = uninstall-emacs-html uninstall-lispref-html \
	uninstall-lispintro-html uninstall-misc-html
UNINSTALL_PDF = uninstall-emacs-pdf uninstall-lispref-pdf \
	uninstall-lispintro-pdf uninstall-misc-pdf
UNINSTALL_PS = uninstall-emacs-ps uninstall-lispref-ps \
	uninstall-lispintro-ps uninstall-misc-ps
UNINSTALL_DOC = $(UNINSTALL_DVI) $(UNINSTALL_HTML) $(UNINSTALL_PDF) $(UNINSTALL_PS)

$(UNINSTALL_DOC):
	$(MAKE) -C doc/$(subst -, uninstall-,$(subst uninstall-,,$@))

.PHONY: $(UNINSTALL_DOC) uninstall-doc
.PHONY: uninstall-dvi uninstall-html uninstall-pdf uninstall-ps

uninstall-doc: $(UNINSTALL_DOC)
uninstall-dvi: $(UNINSTALL_DVI)
uninstall-html: $(UNINSTALL_HTML)
uninstall-pdf: $(UNINSTALL_PDF)
uninstall-ps: $(UNINSTALL_PS)

## build-aux/make-info-dir expects only certain dircategories.
check-info: info
	cd info ; \
	bad= ; \
	for file in *; do \
	  test -f "$${file}" || continue ; \
	  case $${file} in \
	    *-[0-9]*|COPYING|dir) continue ;; \
	  esac ; \
	  cat=`sed -n 's/^INFO-DIR-SECTION //p' $${file}`; \
	  case $${cat} in \
	   "Texinfo documentation system" | "Emacs"| "Emacs lisp" | \
           "Emacs editing modes" | "Emacs network features" | \
	   "Emacs misc features" | "Emacs lisp libraries" ) : ;; \
	   *)  bad="$${bad} $${file}" ;; \
	  esac; \
	done ; \
	if test -n "$${bad}"; then \
	  echo "Unexpected dircategory in: $${bad}" ; \
	  exit 1 ; \
	fi ; \
	echo "info files are OK"

#### Bootstrapping.

### This first cleans the lisp subdirectory, removing all compiled
### Lisp files.  Then re-run make to build all the files anew.

.PHONY: bootstrap actual-bootstrap

bootstrap:
	$(MAKE) actual-bootstrap || $(MAKE) advice-on-failure make-target=bootstrap exit-status=$$?
	$(MAKE) sanity-check make-target=bootstrap

# Without a 'configure' variable, bootstrapping does the following:
#  * Remove files to start from a bootstrap-clean slate.
#  * Run autogen.sh.
#  * Rebuild Makefile, to update the build procedure itself.
#  * Do the actual build.
# With a 'configure' variable, bootstrapping does the following:
#  * Remove files to start from an extraclean slate.
#  * Do the actual build, during which the 'configure' variable is
#    used (see the Makefile goal in GNUmakefile).
actual-bootstrap:
ifndef configure
	$(MAKE) bootstrap-clean
	cd $(srcdir) && ./autogen.sh autoconf
	$(MAKE) MAKEFILE_NAME=force-Makefile force-Makefile
else
	$(MAKE) extraclean
endif
	$(MAKE) actual-all

.PHONY: ChangeLog change-history change-history-commit change-history-nocommit
.PHONY: preferred-branch-is-current unchanged-history-files

CHANGELOG = ChangeLog
emacslog = build-aux/gitlog-to-emacslog
# The ChangeLog history files are called ChangeLog.1, ChangeLog.2, ...,
# ChangeLog.$(CHANGELOG_HISTORY_INDEX_MAX).  $(CHANGELOG_N) stands for
# the newest (highest-numbered) ChangeLog history file.
CHANGELOG_HISTORY_INDEX_MAX = 3
CHANGELOG_N = ChangeLog.$(CHANGELOG_HISTORY_INDEX_MAX)

# Convert git commit log to ChangeLog file.  make-dist uses this.
# I guess this is PHONY so it always updates?
ChangeLog:
	$(AM_V_GEN)cd $(srcdir) && \
	  ./$(emacslog) -o $(CHANGELOG) -n $(CHANGELOG_HISTORY_INDEX_MAX)

# Check that we are in a good state for changing history.
PREFERRED_BRANCH = emacs-28
preferred-branch-is-current:
	git branch | grep -q '^\* $(PREFERRED_BRANCH)$$'
unchanged-history-files:
	x=`git diff-files --name-only $(CHANGELOG_N) $(emacslog)` && \
	  test -z "$$x"

# Regular expression that matches the newest commit covered by a ChangeLog.
new_commit_regexp = ^commit [0123456789abcdef]* (inclusive)

# Copy newer commit messages to the start of the ChangeLog history file,
# and consider them to be older.
change-history-nocommit: preferred-branch-is-current unchanged-history-files
	-rm -f ChangeLog.tmp
	$(MAKE) ChangeLog CHANGELOG=ChangeLog.tmp
	sed '/^This file records repository revisions/,$$d' \
	  ChangeLog.tmp >$(CHANGELOG_N).tmp
	new_commit_line=`grep '$(new_commit_regexp)' ChangeLog.tmp` && \
	sed 's/$(new_commit_regexp).*/'"$$new_commit_line/" \
	  $(CHANGELOG_N) >>$(CHANGELOG_N).tmp
	rm ChangeLog.tmp
	mv $(CHANGELOG_N).tmp $(CHANGELOG_N)

change-history: change-history-nocommit
	$(MAKE) $@-commit

# If 'make change-history' fails because the newest ChangeLog history
# file contains invalid text, fix the file by hand and then run
# 'make change-history-commit'.
change-history-commit:
	git commit -m'; make $@' $(CHANGELOG_N) $(emacslog)

.PHONY: check-declare

check-declare:
	@if [ ! -f $(srcdir)/src/emacs ]; then \
	  echo "You must build Emacs to use this command"; \
	  exit 1; \
	fi
	$(MAKE) -C lisp $@
	$(MAKE) -C test $@

.PHONY: gitmerge

GITMERGE_EMACS = ./src/emacs${EXEEXT}
GITMERGE_NMIN = 10

gitmerge:
	${GITMERGE_EMACS} -batch --no-site-file --no-site-lisp \
	  -l ${srcdir}/admin/gitmerge.el \
	  --eval '(setq gitmerge-minimum-missing ${GITMERGE_NMIN})' -f gitmerge

install-gsettings-schemas:
ifeq ($(HAVE_PGTK)$(HAVE_GSETTINGS),yesyes)
	$(MKDIR_P) "$(DESTDIR)$(gsettingsschemadir)"
	$(INSTALL_DATA) $(srcdir)/$(gsettings_SCHEMAS) "$(DESTDIR)$(gsettingsschemadir)"
	if [ -z "$(DESTDIR)" ]; then $(GLIB_COMPILE_SCHEMAS) $(gsettingsschemadir); fi
endif

uninstall-gsettings-schemas:
ifeq ($(HAVE_PGTK)$(HAVE_GSETTINGS),yesyes)
	for x in $(gsettings_SCHEMAS); do \
	  xx=`echo $$x | sed -e 's|.*/||'`; \
	  rm -f "$(DESTDIR)$(gsettingsschemadir)/$${xx}"; \
	done
	if [ -z "$(DESTDIR)" ]; then $(GLIB_COMPILE_SCHEMAS) $(gsettingsschemadir); fi
endif

clean-gsettings-schemas:
ifeq ($(HAVE_PGTK)$(HAVE_GSETTINGS),yesyes)
	rm -f $(gsettings_SCHEMAS:.xml=.valid)
endif

$(gsettings_SCHEMAS:.xml=.valid): $(srcdir)/$(gsettings_SCHEMAS)
ifeq ($(HAVE_PGTK)$(HAVE_GSETTINGS),yesyes)
	$(GLIB_COMPILE_SCHEMAS) --strict --dry-run --schema-file=$(srcdir)/$(gsettings_SCHEMAS)
	$(MKDIR_P) $(@D)
	touch $@
endif
