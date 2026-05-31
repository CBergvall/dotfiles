#!/usr/bin/env bash

set -e

# Manual installs:
# Nix package manager (Determinate Nix Installer)
# Zsh (make default)
# Ghostty
# MesloLGS NF

# Nix installs:
nix profile add \
    nixpkgs#zsh-powerlevel10k \
    nixpkgs#zsh-autosuggestions \
    nixpkgs#zsh-syntax-highlighting \
    nixpkgs#zoxide \
    nixpkgs#fzf \
    nixpkgs#fd \
    nixpkgs#ripgrep \
    nixpkgs#eza \
    nixpkgs#bat \
    nixpkgs#btop \
    nixpkgs#tldr \
    nixpkgs#fastfetch \
    nixpkgs#atuin \
    nixpkgs#tmux \
    nixpkgs#neovim \
    nixpkgs#yazi \
    nixpkgs#lazygit \
    nixpkgs#delta \
    nixpkgs#cmatrix \
    nixpkgs#asciiquarium \
    nixpkgs#cbonsai \
    nixpkgs#cowsay \
    nixpkgs#fortune \
    nixpkgs#lolcat

# Other software you might want to install:
# Homebrew, Mas (macOS)
# Nala (Debian)
# Paru (Arch)
# Docker
# AeroSpace (macOS)
