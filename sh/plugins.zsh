# Load plugins

# ===================================== Linux =====================================
if [[ $OS == Linux ]]; then



fi
# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme # powerlevel10k
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh # zsh-autosuggestions
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # zsh-syntax-highlighting
eval "$(zoxide init zsh)" # zoxide AKA z (also installed via brew)

fi
# ==================================== Debian =====================================
if [[ $DISTRO == debian ]]; then

source ~/.nix-profile/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh)"

fi
# ===================================== Arch ======================================
if [[ $DISTRO == arch ]]; then



fi
# =================================================================================
