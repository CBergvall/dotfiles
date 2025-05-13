### linking command:

```
ln -sf ~/dotfiles/ssh/config ~/.ssh/config
```

### To generate ssh key for LiU GitLab:

```
ssh-keygen -t rsa -b 4096 -C "GitLab" -f ~/.ssh/id_rsa_liu
```

### To generate ssh key for GitHub:

```
ssh-keygen -t rsa -b 4096 -C "GitHub" -f ~/.ssh/id_rsa_github
```
