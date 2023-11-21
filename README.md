# ncrpy/dotfiles

## Installation

Clone the repository.

```console
git clone --recursive https://github.com/ncrpy/dotfiles ~/.dotfiles
cd .dotfiles
```

### Zsh

Launch Zsh.

```console
zsh
```

Create symbolic links to the config files.

```console
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}
export ZDOTDIR=${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}
ln -s $HOME/.dotfiles/.zshenv $HOME/.zshenv
ln -s $HOME/.dotfiles/.config/zsh $ZDOTDIR
setopt EXTENDED_GLOB
for rcfile in $ZDOTDIR/.zprezto/runcoms/^README.md(.N); do
  ln -s $rcfile $ZDOTDIR/.${rcfile:t}
done
```

Change the default shell to Zsh.

```console
chsh -s /bin/zsh
```

### Foot

```console
ln -s ~/.dotfiles/.config/foot ~/.config/foot
```
