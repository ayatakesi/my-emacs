### cross/ndk-build/Makefile.  Generated from Makefile.in by configure.

# Copyright 2023-2025 Free Software Foundation, Inc.

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

# ndk-build works by including a bunch of Makefiles which set
# variables, and then having those Makefiles include another makefile
# which actually builds targets.

              srcdir = .

# This is a list of Android.mk files which provide targets.
 NDK_BUILD_ANDROID_MK = /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-icu/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-p11-kit-0.24.1/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-libtasn1-4.19.0/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-gmp-6.2.1/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-nettle-3.8/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-gmp-6.2.1/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-nettle-3.8/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-boringssl/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-core/libpackagelistparser/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-pcre/Android.mk  /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-webp/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-Android-ImageMagick7/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-libselinux/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-gnutls-3.7.8/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-tree-sitter-0.20.7/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-harfbuzz-7.1.0/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-libjpeg-turbo/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-Android-ImageMagick7/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-libpng/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-giflib/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-libxml2/Android.mk /home/runner/work/my-emacs/my-emacs/my_sub_modules/my-gmp-6.2.1/Android.mk
       NDK_BUILD_ARCH = arm64
	NDK_BUILD_ABI = arm64-v8a
	NDK_BUILD_SDK = 22
	 NDK_BUILD_CC = /usr/local/lib/android/sdk/ndk/26.3.11579264/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android22-clang
	NDK_BUILD_CXX = /usr/local/lib/android/sdk/ndk/26.3.11579264/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android22-clang++ 
    NDK_BUILD_CXX_STL = 
NDK_BUILD_CXX_LDFLAGS = -lc++_shared
	 NDK_BUILD_AR = /usr/local/lib/android/sdk/ndk/26.3.11579264/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ar
       NDK_BUILD_NASM = 
     NDK_BUILD_CFLAGS = 

# This is a list of targets to build.
   NDK_BUILD_MODULES =  libwebpdemux.a libwebp.a libwebpdecoder_static.a  libmagickwand-7_emacs.so libmagickcore-7_emacs.so libselinux_emacs.so libcrypto_emacs.so libpcre_emacs.so libpackagelistparser_emacs.so libpcre_emacs.so libpackagelistparser.a  libcrypto_emacs.so libgnutls_emacs.so libgmp_emacs.so libnettle_emacs.so libp11-kit_emacs.so libtasn1_emacs.so libhogweed_emacs.so libnettle_emacs.so libgmp_emacs.so libgmp_emacs.so libhogweed_emacs.so libgmp_emacs.so libnettle_emacs.so libgmp_emacs.so libtasn1_emacs.so libp11-kit_emacs.so libtree-sitter_emacs.so libharfbuzz_emacs.so libjpeg_emacs.so liblcms2.a  libpng_emacs.so libgif.a  libxml2_emacs.so libicuuc_emacs.so libicuuc_emacs.so libgmp_emacs.so

# This is set by the Android in tree build system and is used by some
# libraries to look for the NDK.  Its value is unimportant.
	    NDK_ROOT = /tmp/

# Finally, here are rules common to Emacs.
.PHONY: all
all: $(NDK_BUILD_MODULES)

define uniqify
$(if $1,$(firstword $1) $(call uniqify,$(filter-out $(firstword $1),$1)))
endef

# Remove duplicate files.
NDK_BUILD_ANDROID_MK := $(call uniqify,$(NDK_BUILD_ANDROID_MK))

# Remove duplicate modules as well.  These can occur when a single
# module imports a module and also declares it in
# LOCAL_SHARED_LIBRARIES.
NDK_BUILD_MODULES := $(call uniqify,$(NDK_BUILD_MODULES))

# Define CFLAGS for compiling C++ code; this involves removing all
# -std=NNN options and inserting compilation options for the C++
# library.
NDK_BUILD_CFLAGS_CXX := $(filter-out -std=%,$(NDK_BUILD_CFLAGS)) \
  $(NDK_BUILD_CXX_STL)

define subr-1

# Define ndk-build functions.  Many of these are identical to those in
# build-aux/ndk-build-helper.mk.

# NDK_LAST_MAKEFILE is the last Makefile that was included.
NDK_LAST_MAKEFILE = $$(lastword $$(filter %Android.mk,$$(MAKEFILE_LIST)))

# local-makefile is the current Makefile being loaded.
local-makefile = $$(NDK_LAST_MAKEFILE)

# my-dir is a function that returns the Android module directory.  If
# no Android.mk has been loaded, use the directory of the Makefile
# being included.
my-dir = $$(or $$(and $$(local-makefile),$$(dir $$(local-makefile))),$(dir $(1)))

# Return all Android.mk files under the first arg.
all-makefiles-under = $$(wildcard $$(1)/*/Android.mk)

# Return all Android.mk files in subdirectories of this Makefile's
# location.
all-subdir-makefiles = $$(call all-makefiles-under,$$(call my-dir))

# NDK-defined include variables.

CLEAR_VARS = $(srcdir)/ndk-clear-vars.mk
BUILD_EXECUTABLE = $(srcdir)/ndk-build-executable.mk
BUILD_SHARED_LIBRARY = $(srcdir)/ndk-build-shared-library.mk
BUILD_STATIC_LIBRARY = $(srcdir)/ndk-build-static-library.mk
PREBUILT_SHARED_LIBRARY = $(srcdir)/ndk-prebuilt-shared-library.mk
PREBUILT_STATIC_LIBRARY = $(srcdir)/ndk-prebuilt-static-library.mk

# Target information variables.

TARGET_ARCH = $(NDK_BUILD_ARCH)
TARGET_PLATFORM = android-$(NDK_BUILD_SDK)
TARGET_ARCH_ABI = $(NDK_BUILD_ABI)
TARGET_ABI = $(TARGET_PLATFORM)-$(TARGET_ABI)

# Module description variables.  These are defined by Android.mk.
LOCAL_PATH :=
LOCAL_MODULE :=
LOCAL_MODULE_FILENAME :=
LOCAL_SRC_FILES :=
LOCAL_CPP_EXTENSION :=
LOCAL_CPP_FEATURES :=
LOCAL_C_INCLUDES :=
LOCAL_CFLAGS :=
LOCAL_CPPFLAGS :=
LOCAL_STATIC_LIBRARIES :=
LOCAL_SHARED_LIBRARIES :=
LOCAL_WHOLE_STATIC_LIBRARIES :=
LOCAL_LDLIBS :=
LOCAL_LDFLAGS :=
LOCAL_ALLOW_UNDEFINED_SYMBOLS :=
LOCAL_ARM_MODE :=
LOCAL_ARM_NEON :=
LOCAL_DISABLE_FORMAT_STRING_CHECKS :=
LOCAL_EXPORT_CFLAGS :=
LOCAL_EXPORT_CPPFLAGS :=
LOCAL_EXPORT_C_INCLUDES :=
LOCAL_EXPORT_LDFLAGS :=
LOCAL_EXPORT_LDLIBS :=
LOCAL_ASM_RULE_DEFINED :=
LOCAL_ASM_RULE :=

# Now load Android.mk.
include $(1)

endef

# Now define rules for each Android.mk file.
$(foreach android_mk,$(NDK_BUILD_ANDROID_MK),$(eval $(call subr-1,$(android_mk))))

.PHONY: clean mostlyclean
clean mostlyclean:
	rm -rf *.o *.so *.a

.PHONY: extraclean dist-clean maintainer-clean
extraclean dist-clean maintainer-clean:
	rm -rf Makefile
