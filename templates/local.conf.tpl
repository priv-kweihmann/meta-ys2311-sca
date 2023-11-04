## Demo configuration for Yocto Summit 23.11
## SPDX-License-Identifier: BSD-2-Clause
## Copyright (c) 2023, Konrad Weihmann

INHERIT += "sca"

SCA_AUTO_INH_ON_IMAGE = "1"
SCA_AUTO_INH_ON_RECIPE = "1"
SCA_AUTO_LICENSE_FILTER = ".*"
SCA_AVAILABLE_MODULES = "bashate bitbake checkbashism pkgqaenc shellcheck systemdlint"
SCA_BACKTRACK = "1"
SCA_EXPORT_FINDING_SRC = "1"
SCA_ALLOW_LAYER = "meta-ys2311-sca"
SCA_TRACEFILES_MODE = "full"
SCA_VERBOSE_OUTPUT = "0"
SCA_WARNING_LEVEL = "warning"
