# My dotfiles repo

linker.sh contains all symlink commands (and more). To link everything:

```bash
~/dotfiles/linker.sh
```

Keep in mind that this is not a complete setup/install script for a new computer. The dotfiles in this repo affect the following programs that you will need to install manually:

- zsh
- oh-my-zsh
- neovim
- typst

macOS-specific:

- aerospace
- ghostty

You won't break this system by not installing these applications. The symlink will be created, but it just won't do anything.

TODO: Make an installer.sh file that acts a setup script (not too comprehensive). It could make use of brewfiles and such.
