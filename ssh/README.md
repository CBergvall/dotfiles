Key generation:

```bash
ssh-keygen -t ed25519 -C "foobar"

```
Add public-key to repo:

```bash
cp ~/.ssh/id_ed25519.pub ~/dotfiles/ssh/public-keys/foobar.pub

public-keys:

ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDvLzzpPRmLCkRHpLdCX6MQDHV9ZHQpUoIcravE0CvZC laptop

ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBbACVGhsSl09YsKPXVq/497PQ6SZaoqlSEuvJuEozTb disk
```
