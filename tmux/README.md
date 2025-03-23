# TMUX setup

## TMUX Plugin Manager installation

Clone the TMUX plugin manager repo:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

and initialize it adding as last line of the TMUX configuration file:

```bash
run '~/.config/tmux/plugins/tpm/tpm'
```

Once done that you'll be able to:
  - Install plugins and referesh TMUX environment with `prefix`+`I`
  - Update plugins with `prefix`+`u`
  - Uninstall plugins not in the plugins list with `prefix`+`U`

TPM repo: https://github.com/tmux-plugins/tpm
