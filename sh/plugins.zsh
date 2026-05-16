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



fi
# ===================================== Arch ======================================
if [[ $DISTRO == arch ]]; then



fi
# =================================================================================
