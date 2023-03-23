# Enable colorized outputs (e.g. with `ls`).
[[ "${OSTYPE}" == "darwin"* ]] && export CLICOLOR=1

[[ -f "/opt/homebrew/bin/brew" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -f "${HOME}/.cargo/env" ]] && source "${HOME}/.cargo/env"
[[ -d "${HOME}/.rbenv" ]] && export PATH="${HOME}/.rbenv/shims:${PATH}"

export EDITOR=`
  ([[ "$(command -v nvim)" ]] && echo "nvim") \
  || ([[ "$(command -v vim)" ]] && echo "vim") \
  || ([[ "$(command -v vi)" ]] && echo "vi")
`
