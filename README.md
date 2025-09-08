# Dotfiles management

My dotfiles are managed by means of [GNU Stow](https://www.gnu.org/software/stow) (see documentation [here](https://www.gnu.org/software/stow/manual/stow.html)).


## TL;DR / commands to be executed

Clone this repo, install GNU Stow and execute it:

```bash
git clone https://github.com/Samuele-Paglia/dotfiles.git ~/.dotfiles
brew install stow
cd ~/.dotfiles
stow .
```

## GNU Stow installation and configuration details

GNU Stow installation for MacOS:

```bash
brew install stow
```

Using the `.stowrc` file in order to pass flags to stow, the only command to be executed after this repo clone and stow installation (if required) will be:

```bash
mkdir -p $HOME/.config
stow .
```

To show what stow will do without any change applied, the following could be executed:

```bash
stow --adopt --simulate --verbose . # or
stow --adopt -nv .
```

Verbosity levels can be set from 0 to 5 (i.e., `verbose=3`).

Note: The `--adopt` flag could be used if the file to symlink already exists in the target directory. This flag enables the overwrite in the stow directory of the file with the one in the target directory.

To "de-stow" (unlink) only a specific file / directory, the `-D` (its opposite flag is `-S` to "stow" files, and it's the default behaviour) could be used:

 ```bash
stow -nvDt ~/.config bash
stow -nDt ~/.config bash
```

For the provided example the bash directory in the target `~/.config` directory, that was symlinked with the one present in the stow directory, will be removed.

Multiple stow directories passing are actually supported:

```bash
stow -v -t ~/.config tmux nvim
```

To "re-stow" (unlink and link) all the following command could be executed:

 ```bash
stow -nvRt ~/.config bash
stow -nRt ~/.config bash
```
