# Verification Guide for Org Mode Tangled Configurations

This document provides instructions for verifying that all README.org files tangle correctly to match the original configuration files.

## Prerequisites

1. Emacs with Org Mode installed
2. Original configuration files in their respective directories

## Tangling Process

To tangle (export) configuration files from Org mode:

1. Open the README.org file in Emacs
2. Press `C-c C-v t` (or `M-x org-babel-tangle`)
3. The configuration files will be generated in the same directory

## Verification Commands

Run these commands from the `dotfiles` directory to verify that tangled outputs match the original files:

### TMUX Configuration

```bash
cd tmux
# Tangle the org file first in Emacs with C-c C-v t
# Then compare:
diff tmux.conf tmux.conf.original
diff tmux-global-options.conf tmux-global-options.conf.original
diff tmux-key-bindings.conf tmux-key-bindings.conf.original
```

Note: Before tangling, you should backup the original files:
```bash
cp tmux.conf tmux.conf.original
cp tmux-global-options.conf tmux-global-options.conf.original
cp tmux-key-bindings.conf tmux-key-bindings.conf.original
```

### WezTerm Configuration

```bash
cd wezterm
# Backup original
cp wezterm.lua wezterm.lua.original
# Tangle in Emacs, then compare:
diff wezterm.lua wezterm.lua.original
```

### AeroSpace Configuration

```bash
cd aerospace
# Backup original
cp aerospace.toml aerospace.toml.original
# Tangle in Emacs, then compare:
diff aerospace.toml aerospace.toml.original
```

### Starship Configuration

```bash
cd starship
# Backup original (currently empty)
cp starship.toml starship.toml.original
# Tangle in Emacs, then compare:
diff starship.toml starship.toml.original
```

Note: The starship configuration is currently empty (using defaults), so both files should be empty.

### Git Configuration

```bash
cd git
# Backup original
cp .gitconfig .gitconfig.original
# Tangle in Emacs, then compare:
diff .gitconfig .gitconfig.original
```

## Automated Verification Script

You can create a script to automate the verification process:

```bash
#!/bin/bash

# Save as verify-tangled-configs.sh in dotfiles directory

DIRS=("tmux" "wezterm" "aerospace" "starship" "git")
ERRORS=0

for dir in "${DIRS[@]}"; do
    echo "Checking $dir..."
    cd "$dir" || exit

    case $dir in
        tmux)
            FILES=("tmux.conf" "tmux-global-options.conf" "tmux-key-bindings.conf")
            ;;
        wezterm)
            FILES=("wezterm.lua")
            ;;
        aerospace)
            FILES=("aerospace.toml")
            ;;
        starship)
            FILES=("starship.toml")
            ;;
        git)
            FILES=(".gitconfig")
            ;;
    esac

    for file in "${FILES[@]}"; do
        if [ -f "${file}.original" ]; then
            if diff -q "$file" "${file}.original" > /dev/null; then
                echo "  ✓ $file matches original"
            else
                echo "  ✗ $file differs from original"
                ERRORS=$((ERRORS + 1))
            fi
        else
            echo "  ⚠ ${file}.original not found (run backup first)"
        fi
    done

    cd ..
done

if [ $ERRORS -eq 0 ]; then
    echo -e "\n✓ All files match!"
    exit 0
else
    echo -e "\n✗ $ERRORS file(s) differ from originals"
    exit 1
fi
```

## Workflow

The recommended workflow is:

1. **Initial Setup**: Backup all original configuration files with `.original` extension
2. **Edit**: Make changes to the README.org files with documentation
3. **Tangle**: Export using `C-c C-v t` in Emacs
4. **Verify**: Run diff commands to ensure output matches
5. **Deploy**: Once verified, the tangled files can replace the originals
6. **Maintain**: From now on, edit only the README.org files and tangle to generate configs

## Important Notes

- Always edit the README.org files, never the generated config files directly
- The `.stowrc` file is configured to ignore `*.org` files during stowing
- After verifying, you can remove the `.original` backup files
- Keep the README.org files as the single source of truth

## Tangling in Batch

To tangle all org files at once, you can use this Emacs Lisp script:

```elisp
(require 'org)

(defun tangle-dotfile-configs ()
  "Tangle all README.org files in dotfiles subdirectories."
  (interactive)
  (let ((org-files '("~/Documents/claude/dotfiles/tmux/README.org"
                     "~/Documents/claude/dotfiles/wezterm/README.org"
                     "~/Documents/claude/dotfiles/aerospace/README.org"
                     "~/Documents/claude/dotfiles/starship/README.org"
                     "~/Documents/claude/dotfiles/git/README.org")))
    (dolist (file org-files)
      (when (file-exists-p file)
        (message "Tangling %s..." file)
        (with-current-buffer (find-file-noselect file)
          (org-babel-tangle)
          (kill-buffer))))))

;; Run with: M-x tangle-dotfile-configs
```
