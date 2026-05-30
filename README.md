# My dotfiles

`linker.sh` contains all symlink commands. Run it to link everything. It's idempotent, so re-running is safe.

`init.zsh` sources plugins from Nix store paths and requires the Nix package manager. Use `downloader.sh` to install most dependencies. Some will still need to be installed manually (see `downloader.sh`).

## TODO
- Nix Home Manager

