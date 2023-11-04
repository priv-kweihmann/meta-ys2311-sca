#!/bin/sh
## SPDX-License-Identifier: BSD-2-Clause
## Copyright (c) 2023, Konrad Weihmann

## A shell script with deliberately added errors

config=$(< /etc/my-product.config)
if grep "debug" "$config"; then
    echo "Running in debug config"
fi
