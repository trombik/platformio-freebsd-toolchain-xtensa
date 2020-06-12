#!/bin/sh

: ${XTENSA_LX106_ELF_DIR:="/usr/local/xtensa-lx106-elf"}
VERSION="2.40802.191122"

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
        "linux_x86_64"
    ],
    "url": "https://github.com/jcmvbkbc/gcc-xtensa",
    "version": "${VERSION}"
}
__EOF__
