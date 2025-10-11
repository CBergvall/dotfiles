# Shell setup instructions

## Install instructions

- Install oh-my-zsh
- Install MesloLGS Nerd Font
- Install powerlevel10k through om-my-zsh
- Link

## Linking commands:

### Link everything:

```bash
ln -sf ~/dotfiles/shell/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
ln -sf ~/dotfiles/shell/functions.zsh ~/.oh-my-zsh/custom/functions.zsh
ln -sf ~/dotfiles/shell/paths.zsh ~/.oh-my-zsh/custom/paths.zsh
ln -sf ~/dotfiles/shell/.zshrc ~/.zshrc
ln -sf ~/dotfiles/shell/.p10k.zsh ~/.p10k.zsh
```

### Link aliases, functions and paths:

```bash
ln -sf ~/dotfiles/shell/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
ln -sf ~/dotfiles/shell/functions.zsh ~/.oh-my-zsh/custom/functions.zsh
ln -sf ~/dotfiles/shell/paths.zsh ~/.oh-my-zsh/custom/paths.zsh
```

### Link .zshrc:

```bash
ln -sf ~/dotfiles/shell/.zshrc ~/.zshrc
```

### Link powerlevel10k config:

```bash
ln -sf ~/dotfiles/shell/.p10k.zsh ~/.p10k.zsh
```
