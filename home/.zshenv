# ===
# NAME: Zsh Bootstrap Environment
# PATH: $HOME/.zshenv
# ===

# .zshenv is the script that runs every time a shell is run,
# regardless of how the shell is run (i.e., interactive, login).

# === XDG Base Directory Compliance ===

# ZDOTDIR is the folder where Zsh looks for its configuration files.
# Set ZDOTDIR to an XDG-compliant folder.
export ZDOTDIR="$HOME/.config/zsh"
# Create ZDOTDIR if it does not exist.
[[ -d "$ZDOTDIR" ]] || mkdir -p "$ZDOTDIR"

# Because $HOME/.zshenv is reserved for bootstrapping Zsh,
# $ZDOTDIR/.zshenv will set up the XDG specification.

# Setting ZDOTDIR does not run what is in ZDOTDIR,
# so run $ZDOTDIR/.zshenv (if it exists)
# whenever $HOME/.zshenv is run.
if [[ -r "$ZDOTDIR/.zshenv" ]]; then
	source "$ZDOTDIR/.zshenv"
fi
