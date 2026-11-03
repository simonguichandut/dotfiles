# Dotfiles setup

**Requires [`chezmoi`](https://www.chezmoi.io/)**.

I prefer to keep my dotfiles in $HOME/ (instead of the default
`/.local/share/chezmoi/`). Add this line in
`$HOME/.config/chezmoi/chezmoi.toml`
```
sourceDir = "/home/simon/dotfiles"
```

## Making changes with chezmoi
Edit source files in ~/dotfiles/home, or run:
```
chezmoi edit ~/.zshrc.shared
```

Then preview and apply:
```
chezmoi diff
chezmoi apply
```

If you edit a managed file directly in $HOME, import it afterward:
```
chezmoi add ~/.bash_aliases
```

To commit changes, `chezmoi cd` goes to the path containing .git. Use git as
usual.


## Per-machine zsh setup

`.zshrc` is excluded from stow (see `.stow-local-ignore`) so that installers
which auto-append to `~/.zshrc` don't pollute the tracked file. Instead, place
this at the top of `~/.zshrc`:

```
source ~/.zshrc.shared
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
```

Include any machine-specific configs in `~/.zshrc.local`.

## Oh-my-zsh plugins
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
