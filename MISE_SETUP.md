# Mise Setup Guide

This document provides a quick reference for the mise automation setup in your dotfiles repository.

## Overview

The dotfiles repository now includes comprehensive mise configuration for automated tool installation and task management using literate programming.

## Created Files

### Main Configuration
- **`README.org`** - Main mise configuration (tangles to `mise.toml`)
  - Tool installation definitions
  - Environment variables
  - Task definitions for common operations

### Tool-Specific Documentation
- **`fonts/README.org`** - Font installation (JetBrains Mono Nerd Font)
- **`wezterm/mise.README.org`** - WezTerm installation and verification tasks
- **`aerospace/mise.README.org`** - AeroSpace window manager setup and tasks

## Quick Start

1. **Install mise:**
   ```bash
   brew install mise
   ```

2. **Activate mise in your shell** (add to `~/.zshrc`):
   ```bash
   eval "$(mise activate zsh)"
   ```

3. **Tangle the mise configuration:**
   ```bash
   cd ~/Documents/repos/dotfiles
   # Open README.org in Emacs and press C-c C-v t
   # Or use emacs in batch mode:
   emacs --batch README.org --eval "(org-babel-tangle)"
   ```

4. **Install all tools:**
   ```bash
   mise run install
   ```

5. **Set up dotfiles:**
   ```bash
   mise run setup
   mise run setup-tmux
   ```

## Available Tasks

The main `mise.toml` provides these tasks:

- `mise run install` - Install all tools
- `mise run setup` - Set up dotfiles with stow
- `mise run setup-tmux` - Install TMUX Plugin Manager
- `mise run tangle` - Tangle all Org mode files
- `mise run update` - Update all tools
- `mise run verify` - Verify stow configuration (dry run)
- `mise run restow` - Re-stow all configurations
- `mise run clean` - Remove all symlinks
- `mise run doctor` - Check installation status

## Tool-Specific Tasks

### WezTerm
From `wezterm/` directory:
- `mise run verify-wezterm` - Verify installation and list fonts
- `mise run open-wezterm` - Open WezTerm

### AeroSpace
From `aerospace/` directory:
- `mise run start-aerospace` - Start window manager
- `mise run reload-aerospace` - Reload configuration
- `mise run verify-aerospace` - Verify installation
- `mise run list-workspaces` - List all workspaces
- `mise run aerospace-help` - Show help

## Installed Tools

### Core Tools
- stow - Dotfiles symlink manager
- git, git-lfs - Version control
- mise - Tool version manager

### Shell Utilities
- eza - Modern `ls` replacement
- bat - Modern `cat` replacement
- fzf - Fuzzy finder
- zoxide - Smarter `cd`
- ripgrep - Fast grep alternative
- fd - Fast find alternative
- zsh-autosuggestions
- zsh-syntax-highlighting
- atuin - Shell history management

### Terminal & Editors
- tmux - Terminal multiplexer
- starship - Cross-shell prompt
- wezterm - Terminal emulator (cask)
- neovim - Modern Vim-based editor
- emacs - Extensible text editor

### Window Management
- aerospace - i3-like tiling window manager for macOS

### Fonts
- font-jetbrains-mono-nerd-font - Primary font for terminal and editor

## Workflow

The recommended workflow for using mise with dotfiles:

1. **Edit configurations** - Modify `README.org` files as needed
2. **Tangle** - `mise run tangle` to generate config files
3. **Test** - `mise run verify` to check stow configuration
4. **Apply** - `mise run restow` to update symlinks
5. **Update tools** - `mise run update` periodically

## Integration with Literate Programming

All mise configurations are written in Org mode following the literate programming approach:

- Edit the `.org` files, not the generated `.toml` files
- Tangle with `C-c C-v t` in Emacs or `mise run tangle`
- Commit both `.org` and tangled `.toml` files

## Verification

After setup, verify everything is working:

```bash
# Check mise installation
mise doctor

# List installed tools
mise list

# Check stow configuration
mise run verify

# Verify specific tools
wezterm --version
aerospace --version
tmux -V
```

## Next Steps

1. Tangle all org files: `mise run tangle`
2. Install tools: `mise run install`
3. Set up dotfiles: `mise run setup`
4. Configure TMUX: `mise run setup-tmux`
5. Restart your shell to apply all changes

For detailed information about each tool and its configuration, see the respective `README.org` files in each tool directory.
