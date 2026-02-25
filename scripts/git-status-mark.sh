#!/bin/sh
# Git status marks for tmux pane border (starship-compatible symbols)
# Usage: git-status-mark.sh <path>

dir="${1:-.}"
cd "$dir" 2>/dev/null || exit 0
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0

marks=""

# ahead/behind upstream
ahead=$(git rev-list --count @{u}..HEAD 2>/dev/null)
[ "${ahead:-0}" -gt 0 ] && marks="${marks}⇡${ahead}"
behind=$(git rev-list --count HEAD..@{u} 2>/dev/null)
[ "${behind:-0}" -gt 0 ] && marks="${marks}⇣${behind}"

# working tree status
git diff --quiet 2>/dev/null || marks="${marks}!"
git diff --cached --quiet 2>/dev/null || marks="${marks}+"
[ -n "$(git ls-files --others --exclude-standard 2>/dev/null)" ] && marks="${marks}?"

[ -n "$marks" ] && printf "%s" "$marks"
