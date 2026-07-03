#!/bin/bash
# Mole - History command.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

source "$ROOT_DIR/lib/core/history.sh"

HISTORY_JSON=false
HISTORY_LIMIT="$MOLE_HISTORY_DEFAULT_LIMIT"

show_history_help() {
    echo "Usage: mo history [OPTIONS]"
    echo ""
    echo "Review recent Mole operation and deletion activity."
    echo ""
    echo "$(t "Options:" "选项：")"
    echo "  --json           Output history as JSON"
    echo "  --limit N        Show the most recent N entries, 1-200"
    echo "  -h, --help       Show this help message"
}

main() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            "--json")
                HISTORY_JSON=true
                ;;
            "--limit")
                shift
                if [[ $# -eq 0 ]]; then
                    echo "$(t "Missing value for --limit" "--limit 缺少参数值")" >&2
                    exit 1
                fi
                if ! HISTORY_LIMIT=$(history_parse_limit "$1"); then
                    echo "$(t "Invalid value for --limit:" "--limit 参数值无效：") $1" >&2
                    exit 1
                fi
                ;;
            "--help" | "-h")
                show_history_help
                exit 0
                ;;
            -*)
                echo "$(t "Unknown option for mo history:" "mo history 未知选项：") $1" >&2
                echo "$(t "Run 'mo history --help' for usage." "运行 'mo history --help' 查看用法。")" >&2
                exit 1
                ;;
            *)
                echo "$(t "Unexpected argument for mo history:" "mo history 意外参数：") $1" >&2
                echo "$(t "Run 'mo history --help' for usage." "运行 'mo history --help' 查看用法。")" >&2
                exit 1
                ;;
        esac
        shift
    done

    history_load_operations "$(history_operations_log_file)"
    history_load_deletions "$(history_deletions_log_file)"

    if [[ "$HISTORY_JSON" == "true" ]]; then
        history_render_json "$HISTORY_LIMIT"
    else
        history_render_text "$HISTORY_LIMIT"
    fi
}

main "$@"
