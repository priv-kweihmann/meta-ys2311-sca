#!/bin/sh
# SPDX-FileCopyrightText: (C) 2023 Avnet Embedded GmbH
# SPDX-License-Identifier: GPL-3.0-only

set -e

if [ "$#" -lt 2 ]; then
    echo "Usage: $(basename "${0}") <image-tag> <sdk-install-script.sh> [entry-point]"
    exit
fi

TAG="${1}"
SDK="${2}"
if [ "$#" -gt 2 ]; then
    ENTRY="${3}"
else
    ENTRY="entry.sh"
fi

DIR=$(dirname "${0}")
cp "${SDK}" "${DIR}/sdk.sh"

docker build -t "${TAG}" --build-arg="SDKINSTALLER=${DIR}/sdk.sh" --build-arg="ENTRY=$ENTRY" .

rm "${DIR}/sdk.sh"
