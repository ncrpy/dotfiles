# ncrpy/dotfiles

## Installation

Clone the repository.

```console
export DOTFILES_DIR="${HOME}/.dotfiles"
git clone --recursive https://github.com/ncrpy/dotfiles "${DOTFILES_DIR}"
cd .dotfiles
```

### Zsh

Launch Zsh.

```console
zsh
```

Create symbolic links to the config files.

```console
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export ZDOTDIR="${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}"
ln -s "${DOTFILES_DIR}/.zshenv" "${HOME}/.zshenv"
ln -s "${DOTFILES_DIR}/.config/zsh" "${ZDOTDIR}"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR}/.${rcfile:t}"
done
```

Change the default shell to Zsh.

```console
chsh -s /bin/zsh
```

### Foot

```console
ln -s "${DOTFILES_DIR}/.config/foot" "${HOME}/.config/foot"
```

### Tmux

```console
ln -s "${DOTFILES_DIR}/.config/tmux" "${HOME}/.config/tmux"
```
Launch tmux and install plugins by pressing `prefix` + <kbd>I</kbd>.

### Vim

```console
ln -s "${DOTFILES_DIR}/.vim" "${HOME}/.vim"
```

### Neovim

wip

## Update
