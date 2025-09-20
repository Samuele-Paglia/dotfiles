# Dotfiles management

My dotfiles are managed by means of [GNU Stow](https://www.gnu.org/software/stow) (see documentation [here](https://www.gnu.org/software/stow/manual/stow.html)).


## TL;DR / commands to be executed

Clone this repo, install GNU Stow and execute it:

```bash
git clone https://github.com/Samuele-Paglia/dotfiles.git ~/.dotfiles
brew install stow
mkdir -p $HOME/.config
cd ~/.dotfiles
stow .
```

## GNU Stow installation and configuration details

### MacOS Installation

GNU Stow installation for MacOS:

```bash
brew install stow
```

### Usage

To show what `stow` will do without any change being applied, the following could be executed:

```bash
stow --adopt -t ~/.config --simulate --verbose . # or
stow --adopt -t ~/.config -nv .
```

This command will show all the symlink that will be created in the target directory, `~/.config`, pointing to directories and files present in the folder where it was executed (`.`).

>NOTE: The `--adopt` flag could be used if the file to symlink already exists in the target directory. This flag enables the overwrite in the stow directory of the file with the one in the target directory.
> Verbosity levels can be set from 0 to 5 (i.e., `verbose=3`).

To "de-stow" (unlink) only a specific file / directory, the `-D` (where its opposite flag is `-S` to "stow" files, which is the default behaviour) could be used:

 ```bash
stow -nvDt ~/.config bash
stow -nDt ~/.config bash
```

For the provided example, the bash directory in the target `~/.config` directory, that was symlinked with the one present in the stow directory, will be removed.

Multiple stow directories passing are actually supported:

```bash
stow -v -t ~/.config tmux nvim
```

To "re-stow" (unlink and link) all the following command could be executed:

 ```bash
stow -nvRt ~/.config bash
stow -nRt ~/.config bash
```

### `.stowrc`

The `.stowrc` file can be used to pass flags to stow, in this way the only command to be executed after this repo clone and stow installation (if required) will be:

```bash
stow .
```
