### Makefile.  Generated from Makefile.in by configure.

# Copyright (C) 2023-2025 Free Software Foundation, Inc.

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

# Configure build directory information.

     srcdir = .

   builddir = .

# Set up compilation tools.

	 CC = /usr/local/lib/android/sdk/ndk/26.3.11579264/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android22-clang
	 AS = /usr/local/lib/android/sdk/ndk/26.3.11579264/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android22-clang
	 LD = /usr/local/lib/android/sdk/ndk/26.3.11579264/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android22-clang
	 M4 = m4
	CPP = /usr/local/lib/android/sdk/ndk/26.3.11579264/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android22-clang -E
    ASFLAGS =  -c -O -g
    ARFLAGS = 
     CFLAGS =  -Werror=implicit-function-declaration
   CPPFLAGS = 
    LDFLAGS = 
LOADERFLAGS =  -nostdlib -nostartfiles -static -Wl,-Ttext=0x2000000000
FIND_DELETE = -delete

# Set up object files.

     LOADER = loader-aarch64.s
       OBJS = exec.o trace.o
   LOADOBJS = $(patsubst %.s,%.o,$(LOADER))

# Set up automatic dependency tracking.

AUTO_DEPEND = yes
DEPDIR = deps
ifeq ($(AUTO_DEPEND),yes)
DEPFLAGS = -MMD -MF $(DEPDIR)/$*.d -MP
-include $(OBJS:%.o=$(DEPDIR)/%.d)
-include $(DEPDIR)/test.d
-include $(DEPDIR)/exec1.d
else
DEPFLAGS =
include $(srcdir)/deps.mk
endif

# Set up the appropriate targets.

all: libexec.a loader

# Set up automatic Makefile regeneration.

$(srcdir)/configure: $(srcdir)/configure.ac
	cd $(srcdir) && autoreconf

config.status: $(srcdir)/configure
	if [ -x config.status ]; then	\
	  ./config.status --recheck;	\
	else				\
	  $(srcdir)/configure;		\
	fi

Makefile: config.status Makefile.in
	MAKE="$(MAKE)" ./config.status

# Set up rules to build targets.

.SUFFIXES: .c .s
.c.o:
	$(CC) -c $(CPPFLAGS) $(CFLAGS) $(DEPFLAGS) -I. -I$(srcdir) $< -o $@
.s.o:
	$(M4) $< > $(notdir $<).s
	$(AS) $(ASFLAGS) $(notdir $<).s -o $@

# Set up dependencies for config-mips.m4.

config-mips.m4: config-mips.m4.in
	cd $(srcdir) && ./config.status $@
$(LOADOBJS): config-mips.m4

# Set up rules to build libexec.a.

libexec.a: $(OBJS)
	$(AR) cru $(ARFLAGS) $@ $^

# And loader.

loader: $(LOADOBJS)
	$(LD) -o $@ $(LOADERFLAGS) $(LOADOBJS)

# And test.

test: test.o libexec.a
	$(CC) $(LDFLAGS) $< libexec.a -o $@

# And exec1.

exec1: exec1.o libexec.a
	$(CC) $(LDFLAGS) $< libexec.a -o $@

# Set up targets for cleaning.

.PHONY: clean distclean maintainer-clean extraclean bootstrap-clean
clean:
	rm -f *.o *.a loader test exec1 *.s.s
ifeq ($(AUTO_DEPEND),yes)
	rm -rf deps/*.d
endif

distclean: clean
	rm -f Makefile config.status config.h config-mips.m4

maintainer-clean: distclean

### This doesn't actually appear in the coding standards, but Karl
### says GCC supports it, and that's where the configuration part of
### the coding standards seem to come from.  It's like distclean, but
### it deletes backup and autosave files too.

# config.* and install-sh are copied from build-aux in the root of
# this repository by autogen.sh.
extraclean: maintainer-clean
	-rm -f config-tmp-* $(srcdir)/aclocal.m4 $(srcdir)/configure \
	  $(srcdir)/src/config.in $(srcdir)/config.guess	     \
	  $(srcdir)/config.sub $(srcdir)/install-sh
	-[ "$(srcdir)" = "." ] || \
	  find $(srcdir) '(' -name '*~' -o -name '#*' ')' $(FIND_DELETE)
	-find . '(' -name '*~' -o -name '#*' ')' $(FIND_DELETE)
bootstrap-clean: extraclean
