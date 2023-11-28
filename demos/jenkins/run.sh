#!/bin/sh
# SPDX-FileCopyrightText: (C) 2023 Konrad Weihmann
# SPDX-License-Identifier: BSD-2-Clause

set -e

if [ "$#" -lt 1 ]; then
    echo "Usage: $(basename "${0}") <deploy-dir>"
    exit
fi

DEPLOYDIR="${1}"

docker pull jenkins/jenkins:lts-jdk17
docker run -p 8080:8080 -p 50000:50000 --user=root --restart=on-failure \
    -e "DEPLOYDIR=${DEPLOYDIR}" \
    -v "$(pwd)"/jenkins_home:/var/jenkins_home -v "${DEPLOYDIR}":/var/deploydir jenkins/jenkins:lts-jdk17
