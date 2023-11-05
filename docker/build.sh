#!/bin/sh
# SPDX-FileCopyrightText: (C) 2023 Avnet Embedded GmbH
# SPDX-License-Identifier: GPL-3.0-only

set -e

if [ "$#" != 2 ]; then
    echo "Usage: $(basename "${0}") <image-tag> <sdk-install-script.sh>"
    exit
fi

TAG="${1}"
SDK="${2}"

DIR=$(dirname "${0}")
cp "${SDK}" "${DIR}/sdk.sh"

docker build -t "${TAG}" --build-arg="SDKINSTALLER=${DIR}/sdk.sh" .

rm "${DIR}/sdk.sh"
