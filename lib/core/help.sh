#!/bin/bash

show_clean_help() {
    echo "Usage: mo clean [OPTIONS]"
    echo ""
    echo "$(t "Clean up disk space by removing caches, logs, temporary files, and app leftovers from already-uninstalled apps." "通过清理缓存、日志、临时文件和已卸载应用残留来释放磁盘空间。")"
    echo ""
    echo "$(t "Options:" "选项：")"
    echo "  --dry-run, -n     Preview cleanup without making changes"
    echo "  --external PATH   Clean OS metadata from a mounted external volume"
    echo "  --whitelist       Manage protected paths"
    echo "  --debug           Show detailed operation logs"
    echo "  -h, --help        Show this help message"
}

show_installer_help() {
    echo "Usage: mo installer [OPTIONS]"
    echo ""
    echo "$(t "Find and remove installer files (.dmg, .pkg, .iso, .xip, .zip)." "查找并移除安装文件（.dmg、.pkg、.iso、.xip、.zip）。")"
    echo ""
    echo "$(t "Options:" "选项：")"
    echo "  --dry-run         Preview installer cleanup without making changes"
    echo "  --debug           Show detailed operation logs"
    echo "  -h, --help        Show this help message"
}

show_optimize_help() {
    echo "Usage: mo optimize [OPTIONS]"
    echo ""
    echo "$(t "Refresh system caches and services, repair safe maintenance issues." "刷新系统缓存和服务，修复安全的维护问题。")"
    echo ""
    echo "$(t "Options:" "选项：")"
    echo "  --dry-run         Preview optimization without making changes"
    echo "  --whitelist       Manage protected items"
    echo "  --debug           Show detailed operation logs"
    echo "  -h, --help        Show this help message"
}

show_touchid_help() {
    echo "Usage: mo touchid [COMMAND]"
    echo ""
    echo "$(t "Configure Touch ID for sudo authentication." "配置 Touch ID 用于 sudo 认证。")"
    echo ""
    echo "$(t "Commands:" "命令：")"
    echo "  enable            Enable Touch ID for sudo"
    echo "  disable           Disable Touch ID for sudo"
    echo "  status            Show current Touch ID status"
    echo ""
    echo "$(t "Options:" "选项：")"
    echo "  --dry-run         Preview Touch ID changes without modifying sudo config"
    echo "  -h, --help        Show this help message"
    echo ""
    echo "$(t "If no command is provided, an interactive menu is shown." "如未提供命令，将显示交互式菜单。")"
}

show_uninstall_help() {
    echo "Usage: mo uninstall [OPTIONS] [APP_NAME ...]"
    echo ""
    echo "$(t "Interactively remove applications and their leftover files." "交互式移除应用及其残留文件。")"
    echo "$(t "Optionally specify one or more app names to uninstall directly." "可选：直接指定一个或多个应用名称进行卸载。")"
    echo "$(t "For leftovers from apps that are already gone, use mo clean." "已删除应用的残留文件，请使用 mo clean。")"
    echo ""
    echo "$(t "Examples:" "示例：")"
    echo "  mo uninstall                   Open interactive app selector"
    echo "  mo uninstall slack             Uninstall Slack"
    echo "  mo uninstall slack zoom        Uninstall Slack and Zoom"
    echo "  mo uninstall --dry-run slack   Preview Slack uninstallation"
    echo "  mo uninstall --list            Show installed apps and the names mo uninstall accepts"
    echo ""
    echo "$(t "Options:" "选项：")"
    echo "  --list            List installed apps with the exact name mo uninstall accepts"
    echo "  --dry-run         Preview app uninstallation without making changes"
    echo "  --permanent       Bypass macOS Trash and rm -rf immediately"
    echo "  --whitelist       Not supported for uninstall (use clean/optimize)"
    echo "  --debug           Show detailed operation logs"
    echo "  -h, --help        Show this help message"
    echo ""
    echo "$(t "By default, uninstalled files go to the macOS Trash so they can be" "默认情况下，卸载的文件会移入 macOS 废纸篓以便")"
    echo "$(t "recovered. Use --permanent to skip the Trash step." "恢复。使用 --permanent 可跳过废纸篓。")"
}
