#!/usr/bin/env bash

set -Cue

thisDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
rootDir="$(cd "$thisDir/../../.." && pwd)"
binDir="$rootDir/bin"

echo "Builded Successfully! ✅"

cd "${thisDir}" \
  && nasm keyboard.asm -f bin -o "${binDir}/keyboard.com" \