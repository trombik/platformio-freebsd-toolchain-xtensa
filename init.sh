#!/bin/sh

: ${XTENSA_LX106_ELF_DIR:="/usr/local/xtensa-lx106-elf"}
VERSION="2.40802.191122"
ARCH=`uname -p`
OS=`uname -s | tr '[[:upper:]]' '[[:lower:]]'`

if [ ! -z $1 ]; then
    VERSION="$1"
fi

for D in bin include lib libexec share xtensa-lx106-elf; do
    ln -s -f ${XTENSA_LX106_ELF_DIR}/${D} .
done

cat <<__EOF__ >package.json
{
    "description": "xtensa-gcc",
    "name": "toolchain-xtensa",
    "system": [
        "${OS}_${ARCH}"
    ],
    "url": "https://github.com/trombik/platformio-freebsd-toolchain-xtensa",
    "version": "${VERSION}"
}
__EOF__
