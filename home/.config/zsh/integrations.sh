# ===
# NAME: Zsh Integrations
# PATH: $ZDOTDIR/integrations.sh
# ===

# Zoxide
if (($+commands[zoxide])); then
	eval "$(zoxide init zsh --cmd cd)"
fi

# Starship
if (($+commands[starship])); then
	eval "$(starship init zsh)"
fi

# Node.js
if (($+commands[fnm])); then
	eval "$(fnm env --use-on-cd --shell zsh)"
fi
