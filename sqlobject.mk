
# sqlobject.mk
# Makefile to include building sqlobject in a larger top-level project
# Copyright (C) 2018 Long Range Systems, LLC.  All rights reserved.

ifndef SQLOBJECT_SRC_DIR
  SQLOBJECT_SRC_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
endif

ifndef BUILD_TOOLS_DIR
  ${error BUILD_TOOLS_DIR not defined! You must specify where build tools reside}
endif

# greenlet package version
SQLOBJECT_PV = 1.4.1

# Build revision
SQLOBJECT_PR = -r1

# Overall build version
SQLOBJECT_BV = $(SQLOBJECT_PV)$(SQLOBJECT_PR)


SQLOBJECT_DOTFILE = $(call python-cross-dotfile,sqlobject,$(SQLOBJECT_BV))

SQLOBJECT_DEPS = $(SQLOBJECT_DOTFILE)

$(SQLOBJECT_DOTFILE): $(BUILD_PYTHON_NATIVE_MODULE_DEPS)
	$(call build-python-native-module,$(SQLOBJECT_SRC_DIR))
	touch $@
