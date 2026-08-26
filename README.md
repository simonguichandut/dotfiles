## Use with GNU stow
https://www.gnu.org/software/stow/
symlinks the dotfiles into $HOME
```
apt install stow
stow .
```

## Per-machine zsh setup

`.zshrc` is excluded from stow (see `.stow-local-ignore`) so that installers
which auto-append to `~/.zshrc` don't pollute the tracked file. Instead, place
this at the top of `~/.zshrc`:

```
source ~/dotfiles/.zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
```

## Oh-my-zsh plugins
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
