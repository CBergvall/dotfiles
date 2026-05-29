# Load plugins

# nix profile add nixpkgs#zsh-powerlevel10k
source ~/.nix-profile/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
# nix profile add nixpkgs#zsh-autosuggestions
source ~/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# nix profile add nixpkgs#zsh-syntax-highlighting
source ~/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# nix profile add nixpkgs#zoxide
eval "$(zoxide init --cmd cd zsh)"
# nix profile add nixpkgs#atuin
eval "$(atuin init zsh)"

