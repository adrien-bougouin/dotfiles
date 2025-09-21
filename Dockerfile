# syntax=docker/dockerfile:1
# check=error=true

FROM homebrew/brew:latest

USER linuxbrew

################################################################################
# Neovim dependencies

RUN brew install vim
RUN brew install neovim

# Tools for ibhagwan/fzf-lua plugin
RUN brew install --build-from-source fzf
RUN brew install fd ripgrep

# Language servers
RUN brew install harper
RUN brew install lua-language-server

################################################################################
# Dotfiles installation

RUN brew install stow

COPY --chown=linuxbrew . .dotfiles
RUN cd .dotfiles; ./link up

################################################################################

# For quick access to commands
RUN echo "exit" >> ${HOME}/.bash_history
RUN echo "nvim" >> ${HOME}/.bash_history

CMD ["bash"]
