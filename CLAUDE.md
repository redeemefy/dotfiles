# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository managing configuration for: Neovim, Wezterm, Tmux, Kitty, IdeaVim, and Elixir IEx.

## Installation

Run `./install` to symlink all configs to their expected locations. The script destructively removes existing targets before creating symlinks:

| Source | Target |
|--------|--------|
| `kitty/` | `~/.config/kitty` |
| `tmux/tmux.conf` | `~/.tmux.conf` |
| `nvim/` | `~/.config/nvim` |
| `idea/vimrc` | `~/.ideavimrc` |
| `wezterm/` | `~/.config/wezterm` |
| `elixir/.iex.exs` | `~/.iex.exs` |

## Neovim Configuration

The `nvim/` directory is an **NvChad v2.5** configuration. Key architecture:

- **`init.lua`** — Bootstraps lazy.nvim, loads NvChad core (branch v2.5), then loads user config
- **`lua/chadrc.lua`** — NvChad overrides (theme: `github_light`)
- **`lua/plugins/init.lua`** — Custom plugin specs added on top of NvChad defaults
- **`lua/configs/lspconfig.lua`** — LSP server definitions (extend the `servers` table to add new language servers)
- **`lua/configs/conform.lua`** — Formatter configuration (currently stylua for Lua)
- **`lua/mappings.lua`** — Custom keybindings layered on NvChad defaults

To add a new LSP server: edit `lua/configs/lspconfig.lua` and add to the `servers` table, then ensure the server is installed. To add a formatter: edit `lua/configs/conform.lua`.

Note: `nvim/` has its own `.git` directory (separate from the dotfiles repo). The untracked `nvim/` in git status is the new personal setup being developed alongside the NvChad-based one.

## Conventions

- Font: **Operator Mono** across terminal configs (Wezterm 18pt, Kitty 18pt)
- Theme preference: light themes (github_light in nvim, Catppuccin Latte in Wezterm)
- Tmux prefix: `Ctrl+Space`
- Vim leader: `Space` (in IdeaVim config)
