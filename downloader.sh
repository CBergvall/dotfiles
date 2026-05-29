#!/usr/bin/env bash

# exit immediately if any command fails
set -e

echo "Installing packages..."

nix profile add \
    nixpkgs#zsh-autosuggestions \
    nixpkgs#zsh-syntax-highlighting \
    nixpkgs#zsh-powerlevel10k \
    nixpkgs#zoxide \
    nixpkgs#fzf \
    nixpkgs#eza \
    nixpkgs#atuin \
    nixpkgs#tmux \
    nixpkgs#neovim \
    nixpkgs#yazi \
    nixpkgs#lazygit \
    nixpkgs#delta

echo "Done."
