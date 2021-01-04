################################################################################
# Prompt
################################################################################

prompt_user() {
  user="%n"
  [[ "${IN_NIX_SHELL}" != "" ]] && user+="[nix-shell]"

  echo "${user}"
}

prompt_git() {
  [ ! "$(command -v git)" ] && return 0

  local branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  [[ "${branch}" == "" ]] && return 0

  local change=$([[ "$(git diff)" != "" ]] && echo "[±]")

  echo " · ${branch}${change}"
}

setopt prompt_subst # Evaluate functions at each prompt.
export PS1='%(?|%F{blue}|%F{red})$(prompt_user)@%(6~|.../%4~|%~)$(prompt_git) %#%f '

################################################################################
# Sources
################################################################################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
