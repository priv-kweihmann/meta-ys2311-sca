## SPDX-License-Identifier: Propriatary
## Copyright (c) 2023, Random Lazy Corp
SUMMARY = "A bad apple on a 3rd party package"
LICENSE = "CLOSED"
SRC_URI = "file://3rd-party.tar.gz;subdir=3rdparty"

S = "${WORKDIR}/3rdparty"

inherit bin_package

do_install:append() {
    if [ -z "${MAGIC_SUBSCRIPTION_KEY}" ]; then
        bbwarn "Subscription key want't set"
    fi
}
