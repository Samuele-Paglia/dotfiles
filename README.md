# Dotfiles

Personal dotfiles using **literate programming** (Emacs Org Mode) with **automated setup** (mise + GNU Stow).

## Philosophy

### Literate Programming
All configurations are written in **`.org` files** combining documentation and code:
- Code blocks contain minimal comments; explanations are in prose sections
- Tangle with `C-c C-v t` or `mise run tangle` to generate configs
- Edit `.org` source files, not generated configs

### Automation
**[mise](https://mise.jdx.dev/)** handles tool installation and tasks. **[GNU Stow](https://www.gnu.org/software/stow/)** symlinks configs to `~/.config`.

## Quick Start

```bash
# Clone repo
git clone https://github.com/Samuele-Paglia/dotfiles.git ~/.dotfiles && cd ~/.dotfiles

# Install & activate mise (add to ~/.zshrc)
brew install mise && eval "$(mise activate zsh)"

# Install tools and setup dotfiles
mise run install && mise run setup && mise run setup-tmux
```

## Repository Structure

Each tool has a directory with `README.org` (source) and generated config files:

- **nvim** - Neovim (Lua, lazy.nvim)
- **tmux** - Terminal multiplexer
- **wezterm** - Terminal emulator
- **aerospace** - Window manager (macOS)
- **starship** - Shell prompt
- **emacs** - Text editor (elpaca)
- **git** - Version control config
- **mise** - Tool automation

## Workflow

1. Edit `.org` files in tool directories
2. Tangle: `mise run tangle`
3. Verify: `mise run verify` (dry run)
4. Apply: `mise run restow` (if needed)
5. Commit both `.org` and generated files

## Common Tasks

```bash
mise run tangle    # Generate all configs from .org files
mise run install   # Install all tools
mise run setup     # Symlink configs with stow
mise run update    # Update all tools
mise run verify    # Dry run stow configuration
mise run doctor    # Check installation status
```

See tool-specific `README.org` files for detailed configuration documentation.
