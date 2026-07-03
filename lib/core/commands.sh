#!/bin/bash

# Shared command list for help text and completions.
MOLE_COMMANDS=(
    "$(t "clean:Free up disk space" "clean:释放磁盘空间")"
    "$(t "uninstall:Remove apps completely" "uninstall:彻底删除应用")"
    "$(t "optimize:Refresh caches and services" "optimize:刷新缓存与服务")"
    "$(t "analyze:Explore disk usage" "analyze:分析磁盘使用")"
    "$(t "status:Monitor system health" "status:系统状态监控")"
    "$(t "history:Review cleanup activity" "history:查看清理记录")"
    "$(t "purge:Remove old project artifacts" "purge:清理项目构建产物")"
    "$(t "installer:Find and remove installer files" "installer:查找并删除安装包")"
    "$(t "touchid:Configure Touch ID for sudo" "touchid:配置 Touch ID")"
    "$(t "completion:Setup shell tab completion" "completion:设置补全")"
    "$(t "update:Update to latest version" "update:更新到最新版")"
    "$(t "remove:Remove Mole from system" "remove:卸载 Mole")"
    "$(t "help:Show help" "help:显示帮助")"
    "$(t "version:Show version" "version:显示版本")"
)
