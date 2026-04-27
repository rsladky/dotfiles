#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"

case "$(uname -s)" in
  Darwin) exec "$DIR/os/macos/bootstrap.sh" "$@" ;;
  Linux)  exec "$DIR/os/wsl-arch/bootstrap.sh" "$@" ;;
  *)
    echo "Unsupported OS: $(uname -s)" >&2
    exit 1
    ;;
esac
