# Paths

# ===================================== laptop =====================================
if [[ $NAME == laptop ]]; then

eval "$(/opt/homebrew/bin/brew shellenv)" #brew official path command
export PATH="/Applications/Tailscale.app/Contents/MacOS:$PATH" #tailscale

fi
