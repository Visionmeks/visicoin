#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

GLADCOIND=${BITCOIND:-$BINDIR/gladcoind}
GLADCOINCLI=${BITCOINCLI:-$BINDIR/gladcoin-cli}
GLADCOINTX=${BITCOINTX:-$BINDIR/gladcoin-tx}
WALLET_TOOL=${WALLET_TOOL:-$BINDIR/gladcoin-wallet}
GLADCOINQT=${BITCOINQT:-$BINDIR/qt/gladcoin-qt}

[ ! -x $GLADCOIND ] && echo "$GLADCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
GLCVER=($($GLADCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for bitcoind if --version-string is not set,
# but has different outcomes for bitcoin-qt and bitcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$GLADCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $GLADCOIND $GLADCOINCLI $GLADCOINTX $WALLET_TOOL $GLADCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
