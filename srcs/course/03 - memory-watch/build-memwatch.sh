#!/usr/bin/env bash

set -Cue

thisDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
rootDir="$(cd "$thisDir/../../.." && pwd)"
binDir="$rootDir/bin"

cd "${thisDir}" \
  && nasm memwatch.asm -f bin -o "${binDir}/memwatch.com" \

echo "Builded Successfully! ✅"