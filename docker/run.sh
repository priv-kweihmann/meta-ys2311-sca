#!/bin/sh
# SPDX-FileCopyrightText: (C) 2023 Avnet Embedded GmbH
# SPDX-License-Identifier: GPL-3.0-only

set -e

if [ "$#" != 2 ]; then
    echo "Usage: $(basename "${0}") <image-tag> <source path>"
    exit
fi

TAG="${1}"
SRC="${2}"

docker run -it -v "${SRC}":/home/user/src/ "${TAG}"
