# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository managing configuration for: Zsh, Neovim, Wezterm, and IdeaVim.

## Installation

Run `./install` to symlink all configs to their expected locations. The script destructively removes existing targets before creating symlinks:

| Source | Target |
|--------|--------|
| `nvim/` | `~/.config/nvim` |
| `idea/vimrc` | `~/.ideavimrc` |
| `wezterm/` | `~/.config/wezterm` |
| `zsh/zshrc` | `~/.zshrc` |

## Zsh Configuration

The `zsh/` directory holds a small modular setup. `zsh/zshrc` is the entry point (symlinked to `~/.zshrc`); it sources every `*.zsh` file in `zsh/conf.d/` in lexical order. Each file in `conf.d/` owns one concern — numeric prefixes (`00-`, `10-`, `20-`, ...) make load order explicit. To add a new concern, drop a new `NN-name.zsh` file in `conf.d/`; don't grow existing files past their responsibility.

The `40-autosuggestions.zsh` file is defensive: it sources zsh-autosuggestions only if the brew package is installed, so a fresh machine without the package still starts a clean shell. Installing it is optional: `brew install zsh-autosuggestions`.

## Neovim Configuration

The `nvim/` directory is an **NvChad v2.5** configuration. Key architecture:

- **`init.lua`** — Bootstraps lazy.nvim, loads NvChad core (branch v2.5), then loads user config
- **`lua/chadrc.lua`** — NvChad overrides (theme: `github_light`)
- **`lua/plugins/init.lua`** — Custom plugin specs added on top of NvChad defaults
- **`lua/configs/lspconfig.lua`** — LSP server definitions (extend the `servers` table to add new language servers)
- **`lua/configs/conform.lua`** — Formatter configuration (currently stylua for Lua)
- **`lua/mappings.lua`** — Custom keybindings layered on NvChad defaults

To add a new LSP server: edit `lua/configs/lspconfig.lua` and add to the `servers` table, then ensure the server is installed. To add a formatter: edit `lua/configs/conform.lua`.

The nvim config files are tracked directly in this repo (no submodule). NvChad core updates itself via lazy.nvim at runtime.

## Conventions

- Font: **OperatorMono Nerd Font** in Wezterm (18pt) — patched build with Nerd Font glyphs so prompt icons render
- Theme preference: light themes (github_light in nvim, Catppuccin Latte in Wezterm)
- Vim leader: `Space` (in IdeaVim config)
