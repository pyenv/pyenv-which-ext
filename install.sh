#!/bin/sh
# Usage: PREFIX=/usr/local ./install.sh
#
# Installs pyenv-ccache under $PREFIX.

set -e

cd "$(dirname "$0")"

if [ -z "${PREFIX}" ]; then
  PREFIX="/usr/local"
fi

ETC_PATH="${PREFIX}/etc/pyenv.d"

mkdir -p "$ETC_PATH"

cp -RPp etc/pyenv.d/* "$ETC_PATH"
