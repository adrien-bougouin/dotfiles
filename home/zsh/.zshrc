[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.cargo/env ]] && source ~/.cargo/env

[[ -f ~/.prompt.zsh ]] && source ~/.prompt.zsh

# When EDITOR is set to vi/vim, the zsh keymap will be the vi keymap. This
# command resets the keymap to the default one.
bindkey -e

## Aliases
[[ "$(command -v nvim)" ]] && alias vim="nvim"
