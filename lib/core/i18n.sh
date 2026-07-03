#!/bin/bash
# Mole - i18n shell helpers
# Reads ~/.config/mole/lang to determine language.
# Usage: source this file, then use `t "English" "中文"`

set -euo pipefail

# Resolve language setting
__mole_resolve_lang() {
    if [[ -n "${MOLE_LANG_RESOLVED:-}" ]]; then
        return 0
    fi

    MOLE_LANG="en"

    # 1. Env var override
    if [[ -n "${MO_LANG:-}" ]]; then
        local lang_lower
        lang_lower=$(printf '%s' "$MO_LANG" | tr '[:upper:]' '[:lower:]')
        case "$lang_lower" in
            zh | zh-cn | zh_cn | chinese | cn) MOLE_LANG="zh" ;;
        esac
    fi

    # 2. Config file
    local lang_file="${MOLE_CONFIG_DIR:-$HOME/.config/mole}/lang"
    if [[ -f "$lang_file" ]]; then
        local file_lang
        file_lang=$(tr -d '[:space:]' < "$lang_file" | tr '[:upper:]' '[:lower:]')
        case "$file_lang" in
            zh | zh-cn | zh_cn | chinese | cn) MOLE_LANG="zh" ;;
        esac
    fi

    export MOLE_LANG
    MOLE_LANG_RESOLVED=1
}

# Translate: returns $1 for English, $2 for Chinese.
# Usage: t "English text" "中文文本"
t() {
    __mole_resolve_lang
    if [[ "${MOLE_LANG:-en}" == "zh" ]]; then
        printf '%s' "${2:-$1}"
    else
        printf '%s' "$1"
    fi
}

# Check if current language is Chinese
is_cn() {
    __mole_resolve_lang
    [[ "${MOLE_LANG:-en}" == "zh" ]]
}

# Set language (used by mo lang subcommand)
mo_set_lang() {
    local new_lang="${1:-en}"
    local lang_file="${MOLE_CONFIG_DIR:-$HOME/.config/mole}/lang"
    ensure_user_dir "$(dirname "$lang_file")"

    local lang_lower
    lang_lower=$(printf '%s' "$new_lang" | tr '[:upper:]' '[:lower:]')
    case "$lang_lower" in
        zh | zh-cn | chinese | cn)
            echo "zh" > "$lang_file"
            echo "语言已设置为中文"
            ;;
        en | english)
            echo "en" > "$lang_file"
            echo "Language set to English"
            ;;
        *)
            echo "Usage: mo lang zh|en" >&2
            return 1
            ;;
    esac
}

# Show current language
mo_show_lang() {
    __mole_resolve_lang
    if [[ "${MOLE_LANG:-en}" == "zh" ]]; then
        echo "当前语言: 中文"
        echo "配置文件: ${MOLE_CONFIG_DIR:-$HOME/.config/mole}/lang"
    else
        echo "Current language: English"
        echo "Config file: ${MOLE_CONFIG_DIR:-$HOME/.config/mole}/lang"
    fi
}
