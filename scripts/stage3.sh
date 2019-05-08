#!/bin/bash
set -x
set -e

if [ -e "${GB_ROOT}/stage3.tar.bz2" ] ; then
  echo "skipping stage3"
  exit 0
fi

if [ "$GB_INIT" = "systemd" ]; then
  if [ "${GB_STAGE3}" = "latest" ]; then
    wget -O "${GB_ROOT}/stage3.tar.bz2" "${GB_STAGE3_MIRROR}"'/releases/amd64/autobuilds/current-stage3-amd64-systemd/stage3-amd64-systemd-2*.tar.bz2'
  else
    wget -O "${GB_ROOT}/stage3.tar.bz2" "${GB_STAGE3_MIRROR}/releases/amd64/autobuilds/${GB_STAGE3}/systemd/stage3-amd64-systemd-${GB_STAGE3}.tar.bz2"
  fi
else
  if [ "${GB_STAGE3}" = "latest" ]; then
    wget -O "${GB_ROOT}/stage3.tar.bz2" "${GB_STAGE3_MIRROR}"'/releases/amd64/autobuilds/current-stage3-amd64/stage3-amd64-2*.tar.xz'
  else
    wget -O "${GB_ROOT}/stage3.tar.bz2" "${GB_STAGE3_MIRROR}/releases/amd64/autobuilds/${GB_STAGE3}/stage3-amd64-${GB_STAGE3}.tar.xz"
  fi

fi

tar xpf "${GB_ROOT}/stage3.tar.bz2" --xattrs -C "${GB_ROOT}"
