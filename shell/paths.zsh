OS=$(uname)

# MacOS-specifikt
# =================================================================================
if [[ $OS == Darwin ]]; then

    export PATH="/opt/homebrew/bin:$PATH"

    # dessa behövs inte pga 'export PATH="/opt/homebrew/bin:$PATH"' men jag behåller dem här ändå.
    #export PATH="/opt/homebrew/bin/python3:$PATH"
    #export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

    export PATH="$(gem env home)/bin:$PATH"

fi
