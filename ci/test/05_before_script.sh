#!/usr/bin/env bash
#
# Copyright (c) 2018-2020 The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C.UTF-8

# Make sure default datadir does not exist and is never read by creating a dummy file
if [ "$TRAVIS_OS_NAME" == "osx" ]; then
  echo > $HOME/Library/Application\ Support/BlueMobius
else
  DOCKER_EXEC echo \> \$HOME/.bluemobius
fi

DOCKER_EXEC mkdir -p ${DEPENDS_DIR}/SDKs ${DEPENDS_DIR}/sdk-sources

if [ -n "$XCODE_VERSION" ] && [ ! -f "$OSX_SDK_PATH" ]; then
  DOCKER_EXEC curl --location --fail "${SDK_URL}/${OSX_SDK_BASENAME}" -o "$OSX_SDK_PATH"
fi
if [ -n "$XCODE_VERSION" ] && [ -f "$OSX_SDK_PATH" ]; then
  DOCKER_EXEC tar -C "${DEPENDS_DIR}/SDKs" -xf "$OSX_SDK_PATH"
fi
if [[ $HOST = *-mingw32 ]]; then
  DOCKER_EXEC update-alternatives --set $HOST-g++ \$\(which $HOST-g++-posix\)
fi
if [ -z "$NO_DEPENDS" ]; then
  if [[ $DOCKER_NAME_TAG == centos* ]]; then
    # CentOS has problems building the depends if the config shell is not explicitly set
    # (i.e. for libevent a Makefile with an empty SHELL variable is generated, leading to
    #  an error as the first command is executed)
    SHELL_OPTS="CONFIG_SHELL=/bin/bash"
  else
    SHELL_OPTS="CONFIG_SHELL="
  fi
  DOCKER_EXEC $SHELL_OPTS make $MAKEJOBS -C depends HOST=$HOST $DEP_OPTS
fi
if [ -n "$PREVIOUS_RELEASES_TO_DOWNLOAD" ]; then
  BEGIN_FOLD previous-versions
  DOCKER_EXEC test/get_previous_releases.py -b -t "$PREVIOUS_RELEASES_DIR" "${PREVIOUS_RELEASES_TO_DOWNLOAD}"
  END_FOLD
fi
