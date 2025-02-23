### cross/ndk-build/ndk-build.mk.  Generated from ndk-build.mk.in by configure.

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

# This file is included all over the place to get and build
# prerequisites.

NDK_BUILD_MODULES =  libwebpdemux.a libwebp.a libwebpdecoder_static.a  libmagickwand-7_emacs.so libmagickcore-7_emacs.so libselinux_emacs.so libcrypto_emacs.so libpcre_emacs.so libpackagelistparser_emacs.so libpcre_emacs.so libpackagelistparser.a  libcrypto_emacs.so libgnutls_emacs.so libgmp_emacs.so libnettle_emacs.so libp11-kit_emacs.so libtasn1_emacs.so libhogweed_emacs.so libnettle_emacs.so libgmp_emacs.so libgmp_emacs.so libhogweed_emacs.so libgmp_emacs.so libnettle_emacs.so libgmp_emacs.so libtasn1_emacs.so libp11-kit_emacs.so libtree-sitter_emacs.so libharfbuzz_emacs.so libjpeg_emacs.so liblcms2.a  libpng_emacs.so libgif.a  libxml2_emacs.so libicuuc_emacs.so libicuuc_emacs.so libgmp_emacs.so
NDK_BUILD_CXX_SHARED = /usr/local/lib/android/sdk/ndk/26.3.11579264/toolchains/llvm/prebuilt/linux-x86_64/bin/../sysroot/usr/lib/aarch64-linux-android/libc++_shared.so
NDK_BUILD_CXX_STL = 
NDK_BUILD_CXX_LDFLAGS = -lc++_shared
NDK_BUILD_ANY_CXX_MODULE = yes
NDK_BUILD_SHARED =
NDK_BUILD_STATIC =
NDK_BUILD_READELF = /usr/bin/readelf

define uniqify
$(if $1,$(firstword $1) $(call uniqify,$(filter-out $(firstword $1),$1)))
endef

# Remove duplicate modules.  These can occur when a single module
# imports a module and also declares it in LOCAL_SHARED_LIBRARIES.
NDK_BUILD_MODULES := $(call uniqify,$(NDK_BUILD_MODULES))

# Here are all of the files to build.
NDK_BUILD_ALL_FILES := $(foreach file,$(NDK_BUILD_MODULES), \
			 $(top_builddir)/cross/ndk-build/$(file))

# The C++ standard library must be extracted from the Android NDK
# directories and included in the application package, if any module
# requires the C++ standard library.

ifneq ($(NDK_BUILD_ANY_CXX_MODULE),)
NDK_BUILD_SHARED += $(NDK_BUILD_CXX_SHARED)
endif

define subr-1
ifeq ($(suffix $(1)),.so)
NDK_BUILD_SHARED += $(top_builddir)/cross/ndk-build/$(1)
else
ifeq ($(suffix $(1)),.a)
NDK_BUILD_STATIC += $(top_builddir)/cross/ndk-build/$(1)
endif
endif
endef

# Generate rules for each module.

$(foreach module,$(NDK_BUILD_MODULES),$(eval $(call subr-1,$(module))))

# Generate rules to build everything now.
# Make sure to use the top_builddir currently defined.

NDK_TOP_BUILDDIR := $(top_builddir)
$(NDK_BUILD_ALL_FILES) &:
	$(MAKE) -C $(NDK_TOP_BUILDDIR)/cross/ndk-build $(NDK_BUILD_MODULES)
