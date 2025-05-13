### Linking command for laptop (Macbook):

```
for file in ~/dotfiles/shell/oh-my-zsh/laptop/*; do ln -sf "$file" ~/.oh-my-zsh/custom/; done
```

### linking command for desktop (Windows WSL/Linux):

```
for file in ~/dotfiles/shell/oh-my-zsh/desktop/*; do ln -sf "$file" ~/.oh-my-zsh/custom/; done
```

### linking command for mobile (Termux):

```
for file in ~/dotfiles/shell/oh-my-zsh/mobile/*; do ln -sf "$file" ~/.oh-my-zsh/custom/; done
```
