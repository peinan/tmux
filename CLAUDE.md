# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal tmux configuration repository. Single config file (`tmux.conf`) with plugins managed via TPM (Tmux Plugin Manager) as git submodules.

## tmux Version

Current: **3.5a** (macOS/Darwin)

## Manual Reference

Always consult `manuals/` for the tmux man page matching the current version before suggesting options or commands. The manual files are named by version (e.g., `manuals/v3.5a`) in troff format. Use `man -l manuals/v3.5a` or read the file directly to verify option syntax and availability.

Do not assume options exist — verify against the manual for the installed version.

## Key Conventions

- **Prefix**: `C-a` (not the default `C-b`)
- **Vi mode**: copy-mode uses vi keybindings
- **Pane navigation**: `M-h/j/k/l` (no prefix required)
- **Pane resize**: `Prefix + H/J/K/L` (repeatable)
- **Window navigation**: `Prefix + C-h/C-l`, swap with `Prefix + C-j/C-k`
- **Pane select by index**: `Prefix + 1-9`
- **Copy**: `Prefix + v` enters copy mode; `Enter`/`y` copies via `pbcopy`
- **Paste**: `Prefix + P` (uppercase) pastes from system clipboard
- **Split**: `Prefix + |` (horizontal), `Prefix + -` (vertical)
- **Reload**: `Prefix + r`
- **Popup shell**: `Prefix + C-p` (calls `tmux-popup-shell`)
- **Session manager**: `Prefix + C-s` (calls `tmux-session-manager`)
- **Lazygit**: `Prefix + g` (90% popup)

## Plugins

Managed via TPM. Plugin install path: `${XDG_DATA_HOME}/tmux/plugins/`.

| Plugin | Purpose |
|---|---|
| `tmux-plugins/tpm` | Plugin manager (submodule in `plugins/tpm`) |
| `atomicstack/tmux-resurrect` | Session save (`Prefix + S`) / restore (`Prefix + R`) |
| `tmux-plugins/tmux-continuum` | Auto-restore on tmux start |
| `sainnhe/tmux-fzf` | Fuzzy finder integration |
| `aserowy/tmux.nvim` | Neovim-tmux pane navigation (submodule in `plugins/tmux.nvim`) |

## Status Line

Custom status bar positioned at top, designed for **SF Mono Square** font. Uses Nerd Font icons. Shows: session count, window list with cwd, architecture, CPU/memory/disk usage.

Pane borders show prefix/mode indicators with color changes (cyan default, yellow in prefix mode).

## Applying Changes

```sh
tmux source-file ~/.config/tmux/tmux.conf
```

Or from within tmux: `Prefix + r`
