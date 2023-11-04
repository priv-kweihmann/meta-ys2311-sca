## SPDX-License-Identifier: BSD-2-Clause
## Copyright (c) 2023, Konrad Weihmann
SUMMARY = "Demo service"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "\
    file://demo-service.sh;subdir=sources \
    file://demo-service.service;subdir=sources \
"

S = "${WORKDIR}/sources"

do_install() {
    install -d ${D}${bindir}
    install -d ${D}${systemd_system_unitdir}
    install -m 0755 ${S}/demo-service.sh ${D}${bindir}
    install -m 0600 ${S}/demo-service.service ${D}${systemd_system_unitdir}
}

FILES:${PN}:append = " ${systemd_system_unitdir}"
