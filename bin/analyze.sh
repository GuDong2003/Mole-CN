#!/bin/bash
# Mole - Analyze command.
# Runs the Go disk analyzer UI.
# Uses bundled analyze-go binary.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GO_BIN="$SCRIPT_DIR/analyze-go"
if [[ -x "$GO_BIN" ]]; then
    exec "$GO_BIN" "$@"
fi

echo "$(t "Bundled analyzer binary not found. Please reinstall Mole or run mo update to restore it." "找不到内置分析二进制文件。请重新安装 Mole 或运行 mo update 恢复。")" >&2
exit 1
