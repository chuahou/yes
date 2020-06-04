#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2020 Chua Hou

BINDIR=bin

if [ "$#" -ne 1 ]; then
	ls "$BINDIR"
	exit 1
fi

"$BINDIR/$1" | pv > /dev/null
