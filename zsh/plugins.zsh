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
eval "$(zoxide init zsh)"

fi
# ==================================== Debian =====================================
if [[ $DISTRO == debian ]]; then

# nix profile add nixpkgs#zsh-powerlevel10k
source ~/.nix-profile/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
# sudo apt install zsh-autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# sudo apt install zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# nix profile add nixpkgs#zoxide
eval "$(zoxide init zsh)"

fi
# ===================================== Arch ======================================
if [[ $DISTRO == arch ]]; then



fi
# =================================================================================
