# ncrpy/dotfiles

## Installation

Clone the repository.

```console
export DOTFILES_DIR="${HOME}/.dotfiles"
git clone --recursive git@github.com:ncrpy/dotfiles.git "${DOTFILES_DIR}"
```

### Zsh

Create symbolic links to the config files.

```console
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export ZDOTDIR="${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}"
ln -s "${DOTFILES_DIR}/.config/zsh" "${ZDOTDIR}"
```

Launch Zsh.

```console
ln -s "${DOTFILES_DIR}/.zshenv" "${HOME}/.zshenv"
zsh
```

Change the default shell to Zsh.

```console
chsh -s /bin/zsh
```

### SSH

```console
cp -nrT "${DOTFILES_DIR}/.ssh-template" "${HOME}/.ssh"
```

Setup ssh-agent.

```console
cp -nrT "${DOTFILES_DIR}/.config/systemd" "${HOME}/.config/systemd"
systemctl --user enable --now ssh-agent
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

```console
ln -s "${DOTFILES_DIR}/.config/nvim" "${HOME}/.config/nvim"
```
Install Node.js, Deno, ripgrep for dependencies.

### Others

```console
for dotfile in "${DOTFILES_DIR}"/.*; do
  [[ ! -f "${dotfile}" ]] && continue
  [[ `basename ${dotfile}` == ".gitmodules" ]] && continue
  ln -s "${dotfile}" "${HOME}/`basename ${dotfile}`"
done
```

## Update

### Update this repository

```console
cd $DOTFILES_DIR
git pull
git submodule sync --recursive
git submodule update --init --recursive
```

### Update submodules

```console
git submodule update --remote
```
