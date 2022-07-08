export EDITOR=`
  ([[ "$(command -v nvim)" ]] && echo "nvim") \
  || ([[ "$(command -v vim)" ]] && echo "vim") \
  || ([[ "$(command -v vi)" ]] && echo "vi")
`

# Enable colorized outputs (e.g. with `ls`).
[[ "${OSTYPE}" == "darwin"* ]] && export CLICOLOR=1

## PATH
[[ "$(command -v brew)" ]] && export PATH="$(brew --prefix)/bin:${PATH}"
