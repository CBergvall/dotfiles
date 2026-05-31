Key generation:

```bash
ssh-keygen -t ed25519 -C "foo bar"
```
Add public-key to repo:

```bash
cp ~/.ssh/id_ed25519.pub ~/dotfiles/ssh/public-keys/$(hostname).pub
```
