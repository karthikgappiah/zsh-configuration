# ===
# NAME: Zsh Settings
# PATH: $ZDOTDIR/.zshrc
# ===

# === History ===

# HISTFILE is the file that records every command run.
# Create its parent folder if it does not exist.
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
[[ -d "${HISTFILE:h}" ]] || mkdir -p "${HISTFILE:h}"

# SAVEHIST and HISTSIZE determine HISTFILE capacity.
SAVEHIST=10000             # SAVEHIST sets how much is persisted on disk.
HISTSIZE=$((SAVEHIST * 2)) # HISTSIZE sets how much is persisted in memory.

# Set options to deduplicate HISTFILE.
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Set options to reduce noise in HISTFILE.
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

# Set options for convenience.
setopt SHARE_HISTORY
# Share history across active sessions,
# incrementally append commands to HISTFILE,
# and write extra command metadata to HISTORY.

# === Completions ===

# Set options for convenience.
zstyle ':completion:*' menu select                        # Use a selector for visual navigation.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Ignore letter casing when completing commands.

# compinit is an expensive program that initializes the completions system.
# ZCOMPDUMP is the file that caches the result of compinit for better performance.
ZCOMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-$ZSH_VERSION"
[[ -d "${ZCOMPDUMP:h}" ]] || mkdir -p "${ZCOMPDUMP:h}"
autoload -Uz compinit

# Run compinit once a day to refresh ZCOMPDUMP.
if [[ ! -f "$ZCOMPDUMP" || -n "$ZCOMPDUMP"(Nmh+24) ]]; then
	compinit -i -d "$ZCOMPDUMP"
else
	compinit -C -d "$ZCOMPDUMP"
fi

# NOTE: You must refresh ZCOMPDUMP after adding a command-line tool.
# To refresh ZCOMPDUMP earlier, manually run this command:
# rm -f "$ZCOMPDUMP" && compinit -i -d "$ZCOMPDUMP"

# === Prompt ===

# PROMPT is an environment variable that sets the shell prompt.
# Customize PROMPT for productive minimalism.
PROMPT='%# '

# === Aliases ===

# Edit $ZDOTDIR/aliases.sh to set aliases.
[[ -r "$ZDOTDIR/aliases.sh" ]] && source "$ZDOTDIR/aliases.sh"
