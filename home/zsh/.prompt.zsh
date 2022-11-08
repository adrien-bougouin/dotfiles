git_prompt() {
  [[ ! "$(command -v git)" ]] && return 0

  local branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  [[ "${branch}" == "" ]] && return 0

  local change=$([[ "$(git diff)" != "" ]] && echo "*")

  echo " - ${branch}${change}"
}

setopt prompt_subst # Evaluate functions during each prompt.
export PROMPT='%(?|%F{blue}|%F{red})%n@%m:%(6~|.../%4~|%~)$(git_prompt) %#%f '
