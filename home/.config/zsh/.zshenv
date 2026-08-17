# ===
# NAME: Zsh Environment
# PATH: $ZDOTDIR/.zshenv
# ===

# === XDG Base Directory Specification ===

# The XDG exposes environment variables that specify
# how programs organize their user-specific data.
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"    # For configuration persistence.
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"   # For data persistence.
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}" # For state management.
# Linux users should set XDG_CACHE_HOME;
# macOS users should not for convenience.
# export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"       # For cache management.
export XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin}"       # For installed programs.

# === PATH Additions ===

# PATH is an environment variable that lists which folders can run programs.
typeset -U path # Ensure PATH adds only unique entries.

# Add XDG_BIN_HOME to PATH.
path=(
	"$XDG_BIN_HOME"
	$path
)
