### Link to git repo:

Look for the the desired documentation in the readme file of the repo.

- https://github.com/unifiedremote/Docs/tree/master

### Linking command I used on my Windows setup:

```
mklink /D "C:\ProgramData\Unified Remote\Remotes\Custom" "\\wsl.localhost\Ubuntu\home\carlb\dotfiles\Unified Remote\Windows\Custom"
```

(Needs to be run in Command Prompt (not Powershell) in administrator mode)

### linking command used on my mac:

```
ln -s ~/dotfiles/Unified\ Remote/macOS/Custom /Users/carlbergvall/Library/Application\ Support/Unified\ Remote/Remotes/Bundled/Custom
```
