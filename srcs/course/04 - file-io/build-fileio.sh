#!/usr/bin/env bash

set -Cue

thisDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
rootDir="$(cd "$thisDir/../../.." && pwd)"
binDir="$rootDir/bin"

cd "${thisDir}" \
  && nasm file-io.asm -f bin -o "${binDir}/file-io.com" \

echo "Builded Successfully! ✅"