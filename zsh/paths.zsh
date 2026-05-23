# Paths

# ===================================== Linux =====================================
if [[ $OS == Linux ]]; then



fi
# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

# brew official path command
eval "$(/opt/homebrew/bin/brew shellenv)"

# tailscale
export PATH="/Applications/Tailscale.app/Contents/MacOS:$PATH" 

fi
# ==================================== Debian =====================================
if [[ $DISTRO == debian ]]; then

# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

fi
# ===================================== Arch ======================================
if [[ $DISTRO == arch ]]; then

# cargo install git-delta
# had to download with cargo since aur version was broken
export PATH="$HOME/.cargo/bin:$PATH"

fi
# =================================================================================
