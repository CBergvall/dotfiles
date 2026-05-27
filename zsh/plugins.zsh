# Load plugins

# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

# brew install powerlevel10k
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
# brew install zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# brew install zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# brew install zoxide
eval "$(zoxide init --cmd cd zsh)"
# brew install atuin
eval "$(atuin init zsh)"

fi
# ==================================== Debian =====================================
if [[ $DISTRO == debian ]]; then

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

fi
# ===================================== Arch ======================================
if [[ $DISTRO == arch ]]; then

# paru -S zsh-theme-powerlevel10k-git
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# paru -S zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# paru -S zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# paru -S zoxide
eval "$(zoxide init --cmd cd zsh)"

fi
# =================================================================================
