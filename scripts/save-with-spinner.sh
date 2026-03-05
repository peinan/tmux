#!/usr/bin/env bash
# Wrapper: ignore "quiet" argument from continuum to show spinner during auto-save
PLUGIN_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/tmux/plugins/tmux-resurrect/scripts"
exec "$PLUGIN_DIR/save.sh"
