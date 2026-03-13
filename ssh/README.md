# ssh stuff

Don't get any funny ideas. You won't find any private keys in this repo.

## keys

Public keys are copied over (not symlinked) when the linker file is run. This makes them easy to view on any machine.

The keys also need to have the correct name for the copying to happen: id_ed25519.pub

Key generation command:

ssh-keygen -t ed25519 -C "foo bar"
