FROM ubuntu:latest

ENV HOME=/home/ubuntu
WORKDIR ${HOME}

RUN apt update --fix-missing
RUN apt install -y git
RUN apt install -y stow

################################################################################
# Neovim dependencies

RUN apt install -y vim
RUN apt install -y neovim

RUN apt install -y fd-find fzf ripgrep # See ibhagwan/fzf-lua

################################################################################

COPY . .dotfiles
RUN cd .dotfiles; ./link up

CMD ["bash"]
