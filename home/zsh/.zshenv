################################################################################
# EDITOR
if [ $(command -v nvim) ]; then
  export EDITOR=nvim
  alias vim="nvim"
elif [ $(command -v vim) ]; then
  export EDITOR=vim
fi

################################################################################
# PATH

################################################################################
# Miscelaneous
[[ "$OSTYPE" == "darwin"* ]] && export CLICOLOR=1 # enable colorized outputs
