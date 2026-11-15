# Machine and platform identifiers used by the rest of the config.
OS=$(uname)
DISTRO=
WM=

if [[ $OS == Linux ]]; then
    DISTRO=$(. /etc/os-release && print -r -- "$ID")
    WM=$XDG_SESSION_TYPE
fi

case $(hostname -s) in
    laptop)  NAME=laptop ;;
    server)  NAME=server ;;
    disk)    NAME=disk ;;
    desktop) NAME=desktop ;;
    *)       NAME=unknown ;;
esac
