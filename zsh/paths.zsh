# Paths

# ===================================== Linux =====================================
if [[ $OS == Linux ]]; then



fi
# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

eval "$(/opt/homebrew/bin/brew shellenv)" # brew official path command

export PATH="/Applications/Tailscale.app/Contents/MacOS:$PATH" # tailscale

export PATH="$PATH:$HOME/.pub-cache/bin" # Dart/Flutter CLI tools
export PATH="$PATH:$HOME/.local/bin" # pipx and other user-installed Python tools
export PATH="$HOME/.config/herd-lite/bin:$PATH" # Laravel Herd
export PHP_INI_SCAN_DIR="$HOME/.config/herd-lite/bin:$PHP_INI_SCAN_DIR" # Laravel ini config files

fi
# ==================================== Debian =====================================
if [[ $DISTRO == debian ]]; then

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

fi
# ===================================== Arch ======================================
if [[ $DISTRO == arch ]]; then



fi
# =================================================================================
