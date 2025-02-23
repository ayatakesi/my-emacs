### nt/Makefile.  Generated from Makefile.in by configure.

# Copyright (C) 2013-2025 Free Software Foundation, Inc.

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

# Avoid trouble on systems where the `SHELL' variable might be
# inherited from the environment.
SHELL = /bin/sh

# ==================== Things `configure' will edit ====================

CC=gcc
CFLAGS=-g3 -O2
CPPFLAGS =   
LDFLAGS = 

version=30.1
## Used in $archlibdir.
configuration=x86_64-pc-linux-gnu
EXEEXT=
C_SWITCH_SYSTEM=
C_SWITCH_MACHINE=
PROFILING_CFLAGS = 
WARN_CFLAGS =  -Wall -Warith-conversion -Wdate-time -Wdisabled-optimization -Wdouble-promotion -Wduplicated-cond -Wextra -Wformat-signedness -Winit-self -Winvalid-pch -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs -Wmissing-prototypes -Wnested-externs -Wnull-dereference -Wold-style-definition -Wopenmp-simd -Wpacked -Wpointer-arith -Wstrict-prototypes -Wsuggest-attribute=format -Wsuggest-final-methods -Wsuggest-final-types -Wtrampolines -Wuninitialized -Wunknown-pragmas -Wunused-macros -Wvariadic-macros -Wvector-operation-performance -Wwrite-strings -Warray-bounds=2 -Wattribute-alias=2 -Wformat=2 -Wformat-truncation=2 -Wimplicit-fallthrough=5 -Wshift-overflow=2 -Wvla-larger-than=4031 -Wredundant-decls -Wno-missing-field-initializers -Wno-override-init -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-format-nonliteral
WERROR_CFLAGS = 

# Program name transformation.
TRANSFORM = s,x,x,

top_builddir = ..
-include ${top_builddir}/src/verbose.mk

# ==================== Where To Install Things ====================

# The default location for installation.  Everything is placed in
# subdirectories of this directory.  The default values for many of
# the variables below are expressed in terms of this one, so you may
# not need to change them.  This is set with the --prefix option to
# `../configure'.
prefix=/usr/local

# Like `prefix', but used for architecture-specific files.  This is
# set with the --exec-prefix option to `../configure'.
exec_prefix=${prefix}

# Where to install Emacs and other binaries that people will want to
# run directly (like etags).  This is set with the --bindir option
# to `../configure'.
bindir=${exec_prefix}/bin

# The root of the directory tree for read-only architecture-independent
# data files.  ${datadir}, ${infodir} and ${mandir} are based on this.
datarootdir=${prefix}/share

# Where to install architecture-independent data files.  ${lispdir}
# and ${etcdir} are subdirectories of this.  This is set with the
# --datadir option to `../configure'.
datadir=${datarootdir}

# Where to install and expect executable files to be run by Emacs
# rather than directly by users, and other architecture-dependent
# data.  ${archlibdir} is usually below this.  This is set with the
# --libexecdir option to `../configure'.
libexecdir=${exec_prefix}/libexec

# Directory for local state files for all programs.
localstatedir=${prefix}/var

# Where to find the source code.  This is set by the configure
# script's `--srcdir' option.  However, the value of ${srcdir} in
# this makefile is not identical to what was specified with --srcdir,
# since the variable here has `/lib-src' added at the end.

# We use $(srcdir) explicitly in dependencies so as not to depend on VPATH.
srcdir=.


# The top-level source directory, also set by configure.
top_srcdir=..
# MinGW CPPFLAGS may use this.
abs_top_srcdir=/home/runner/work/my-emacs/my-emacs

# ==================== Emacs-specific directories ====================

# These variables hold the values Emacs will actually use.  They are
# based on the values of the standard Make variables above.

# Where to put executables to be run by Emacs rather than the user.
# This path usually includes the Emacs version and configuration name,
# so that multiple configurations for multiple versions of Emacs may
# be installed at once.  This can be set with the --archlibdir option
# to `../configure'.
archlibdir=${libexecdir}/emacs/${version}/${configuration}

# ==================== Utility Programs for the Build =================

# ../configure figures out the correct values for these.
INSTALL = /usr/bin/install -c
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT = ${INSTALL}
# By default, we uphold the dignity of our programs.
INSTALL_STRIP =
MKDIR_P = /usr/bin/mkdir -p

# ========================== Lists of Files ===========================

# Things that a user might actually run, which should be installed in bindir.
INSTALLABLES = runemacs${EXEEXT} addpm${EXEEXT}

# Things that Emacs runs internally, which should not be installed in bindir.
UTILITIES = cmdproxy${EXEEXT} ddeclient${EXEEXT}

# Things that Emacs runs during the build process.
DONT_INSTALL =

# All files that are created by the linker, i.e., whose names end in ${EXEEXT}.
EXE_FILES = ${INSTALLABLES} ${UTILITIES} ${DONT_INSTALL}

# =========================== Configuration ===========================

# MS-Windows resource files and resource compiler
EMACSRES = 
EMACS_MANIFEST = 
WINDRES = 

## Extra libraries to use when linking addpm.
LIBS_ADDPM = -lole32 -luuid

## Compilation and linking flags
BASE_CFLAGS = $(C_SWITCH_SYSTEM) $(C_SWITCH_MACHINE) \
	      $(WARN_CFLAGS) $(WERROR_CFLAGS) \
	      -I../src -I${srcdir}/../src -I../lib -I${srcdir}/../lib \
	      -I. -I${srcdir}

ALL_CFLAGS = ${BASE_CFLAGS} ${PROFILING_CFLAGS} ${LDFLAGS} ${CPPFLAGS} ${CFLAGS}
## Unused.
LINK_CFLAGS = ${BASE_CFLAGS} ${LDFLAGS} ${CFLAGS}
## Unused.
CPP_CFLAGS = ${BASE_CFLAGS} ${PROFILING_CFLAGS} ${CPPFLAGS} ${CFLAGS}

all: ${EXE_FILES}

.PHONY: all

## Install the internal utilities.  Until they are installed, we can
## just run them directly from nt/.
$(DESTDIR)${archlibdir}: all
	@echo
	@echo "Installing utilities run internally by Emacs."
	umask 022; ${MKDIR_P} "$(DESTDIR)${archlibdir}"
	exp_archlibdir=`cd "$(DESTDIR)${archlibdir}" && pwd -P`; \
	if [ "$$exp_archlibdir" != "`pwd -P`" ]; then \
	  for file in ${UTILITIES}; do \
	    $(INSTALL_PROGRAM) $(INSTALL_STRIP) $$file "$(DESTDIR)${archlibdir}/$$file" ; \
	  done ; \
        fi

.PHONY: install uninstall mostlyclean clean distclean maintainer-clean
.PHONY: bootstrap-clean check tags

install: $(DESTDIR)${archlibdir}
	@echo
	@echo "Installing utilities for users to run."
	umask 022; ${MKDIR_P} "$(DESTDIR)${bindir}"
	for file in ${INSTALLABLES} ; do \
	  $(INSTALL_PROGRAM) $(INSTALL_STRIP) $${file} "$(DESTDIR)${bindir}"/`echo $${file} | sed -e 's/${EXEEXT}$$//' -e '$(TRANSFORM)'`${EXEEXT} ; \
	done
	${MKDIR_P} "$(DESTDIR)${datadir}/emacs/$(version)"
	$(INSTALL_DATA) ${srcdir}/README.W32 "$(DESTDIR)${datadir}/emacs/$(version)"

uninstall:
	rm -f "$(DESTDIR)${datadir}/emacs/$(version)/README.W32"
	for file in ${INSTALLABLES}; do \
	  rm -f "$(DESTDIR)${bindir}"/`echo $${file} | sed -e 's/${EXEEXT}$$//' -e '$(TRANSFORM)'`${EXEEXT} ; \
	done
	if [ -d "$(DESTDIR)${archlibdir}" ]; then \
	  (cd "$(DESTDIR)${archlibdir}" && rm -f ${UTILITIES}) \
	fi

mostlyclean:
	-rm -f core *.o *.res

clean: mostlyclean
	-rm -f ${EXE_FILES}

distclean: clean
	-rm -f TAGS Makefile *.rc

bootstrap-clean maintainer-clean: distclean
	true

## Test the contents of the directory.
check:
	@echo "We don't have any tests for the nt/ directory yet."

ETAGS = ../lib-src/etags${EXEEXT}

${ETAGS}: FORCE
	${MAKE} -C ../lib-src $(notdir $@)

tagsfiles= $(wildcard ${srcdir}/*.[ch])

FORCE:
.PHONY: tags FORCE
tags: TAGS
TAGS: ${ETAGS} ${tagsfiles}
	${ETAGS} ${tagsfiles}

## Build the programs
addpm${EXEEXT}: ${srcdir}/addpm.c ../src/epaths.h
	$(AM_V_CCLD)$(CC) ${ALL_CFLAGS} $< $(LIBS_ADDPM) -o $@

ddeclient${EXEEXT}: ${srcdir}/ddeclient.c
	$(AM_V_CCLD)$(CC) ${ALL_CFLAGS} $< -o $@

cmdproxy${EXEEXT}: ${srcdir}/cmdproxy.c
	$(AM_V_CCLD)$(CC) ${ALL_CFLAGS} $< -o $@

runemacs${EXEEXT}: ${srcdir}/runemacs.c $(EMACSRES)
	$(AM_V_CCLD)$(CC) ${ALL_CFLAGS} $^ -mwindows -o $@

## Also used in ../src/Makefile.
emacs.res ../src/emacs.res: emacs.rc ${srcdir}/icons/emacs.ico \
  ${srcdir}/icons/hand.cur ${srcdir}/$(EMACS_MANIFEST)
	$(AM_V_RC)${WINDRES} -I ${srcdir} -O coff -o $@ $<
