## SPDX-License-Identifier: BSD-2-Clause
## Copyright (c) 2023, Konrad Weihmann

require recipes-core/images/core-image-minimal.bb

IMAGE_INSTALL += "\
    3rd-party-package \
    ys2311-demo-service \
"

do_project_magic() {
    cat << EOF > ${IMAGE_ROOTFS}/usr/bin/magic-service.sh
#!/bin/sh
cat $(< /etc/my-magic-key.config) > /etc/my-product.config
EOF
}

ROOTFS_POSTPROCESS_COMMAND:append = " do_project_magic;"
TOOLCHAIN_HOST_TASK:append = " nativesdk-sca-tools"
