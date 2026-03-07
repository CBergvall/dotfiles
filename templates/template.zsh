# funktion som hjälper till att skapa diverse templates och grejer
template() {
    # ---- helper: list templates ----
    echo_templates() {
        echo "Available templates:"
        echo "  - liu_typst"
        echo "  - gitignore"
    }

    # ---- argument handling ----

    # No argument given
    if [ -z "$1" ]; then
        echo_templates
        return 0
    fi

    # ---- template selection ----

    # LiU-mall för typst (gjord av MÄSTER MATTIAS)
    if [ "$1" = "liu_typst" ]; then
        cp -r "$HOME/dotfiles/templates/liu_typst" ./typst
        return 0
    fi

    # min standard .gitignore
    if [ "$1" = "gitignore" ]; then
        cp "$HOME/dotfiles/templates/gitignore/gitignore" ./.gitignore
        return 0
    fi

    # ---- fallback: unknown template ----

    echo "Unknown template: $1"
    echo
    echo_templates
    return 1
}
