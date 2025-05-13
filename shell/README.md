# Comprehensive linking commands and install instructions for the shell

## Installaions:

### Install oh-my-zsh:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install nerd font:

- https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
- https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
- https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
- https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

### Install powerlevel10k:

using homebrew:

```
brew install powerlevel10k
```

or using oh-my-zsh:

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```

## Linking commands for laptop (Macbook)

### Link oh-my-zsh custom startup files:

```
for file in ~/dotfiles/shell/oh-my-zsh/laptop/*; do ln -sf "$file" ~/.oh-my-zsh/custom/; done
```

### Link .zshrc:

```
ln -sf ~/dotfiles/shell/zshrc/laptop/.zshrc ~/.zshrc
```

### Link powerlevel10k config:

```
ln -sf ~/dotfiles/shell/powerlevel10k/.p10k.zsh ~/.p10k.zsh
```

## Linking commands for desktop (Windows WSL/Linux):

### Link oh-my-zsh custom startup files:

```
for file in ~/dotfiles/shell/oh-my-zsh/desktop/*; do ln -sf "$file" ~/.oh-my-zsh/custom/; done
```

### Link .zshrc:

```
ln -sf ~/dotfiles/shell/zshrc/desktop/.zshrc ~/.zshrc
```

### Link powerlevel10k config:

```
ln -sf ~/dotfiles/shell/powerlevel10k/.p10k.zsh ~/.p10k.zsh
```

## Linking commands for mobile (Termux):

### Link oh-my-zsh custom startup files:

```
for file in ~/dotfiles/shell/oh-my-zsh/mobile/*; do ln -sf "$file" ~/.oh-my-zsh/custom/; done
```

### Link .zshrc:

```
ln -sf ~/dotfiles/shell/zshrc/mobile/.zshrc ~/.zshrc
```
