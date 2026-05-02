#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"

case "$(uname -s)" in
  Darwin) exec "$DIR/os/macos/bootstrap.sh" "$@" ;;
  *)
    echo "Unsupported OS: $(uname -s) — Windows uses bootstrap.ps1, see INSTALL.md" >&2
    exit 1
    ;;
esac
