# ssh stuff

Don't get any funny ideas. You won't find any private keys in this repo.

Public keys are copied over (not symlinked) when the linker file is run.

The keys need to have the correct name for the copying to happen: id_ed25519.pub

## Key generation

ssh-keygen -t ed25519 -C "foo bar"

## Push public ssh key to repo

cp ~/.ssh/id_ed25519.pub ~/dotfiles/ssh/public_keys/$(HOSTNAME).pub
