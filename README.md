# `platformio-freebsd-toolchain-xtensa`

Trick `platformio` so that it thinks `toolchain-xtensa`, a `platformio`
package, is installed.

## Rationale

`platformio` claims "No more hardware or software lock-ins", but users are
locked in their so-called _package system_. The _package system_ has several
issues:

- Undocumented
- Ignores lib versions, such as `libc`
- Publishes packages from unknown sources
- Does not sign packages
- Uses seemingly random version number scheme

Like similar attempts to manage dependencies by projects themselves, the
project has not successfully provided different OS/arch/machine, mostly
because the package build procedure is not documented.

This is an attempt to fix some of the issues.

The project stopped providing `toolchain-xtensa` for FreeBSD. Here is the log
you end up with:

```console
pio run -e tasmota
Processing tasmota (platform: espressif8266@2.5.1; framework: arduino; board: esp01_1m)
---------------------------------------------------------------------------------------
PackageManager: Installing toolchain-xtensa @ ~2.40802.191122
Error: Could not find a version that satisfies the requirement '~2.40802.191122' for your system 'freebsd_amd64'
```

## What it does

`init.sh` creates symlinks to the directories where the system package
installed the tool-chain, and creates `package.json`.

## Requirements

- [`devel/xtensa-lx106-elf`](https://github.com/trombik/freebsd-ports-xtensa-lx106-elf/tree/master/devel/xtensa-lx106-elf) is installed

## Usage

```console
cd ~/.platformio/packages
git clone https://github.com/trombik/platformio-freebsd-toolchain-xtensa.git toolchain-xtensa
cd toolchain-xtensa
./init.sh
```

`init.sh` creates symlinks and `package.json`.

## Further improvement

The script should be able to support other OSes, such as OpenBSD as long as a
package for the OS is provided.
