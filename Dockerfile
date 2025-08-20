FROM ubuntu:plucky-20250714

ENV HOME=/home/ubuntu
WORKDIR ${HOME}

RUN apt update --fix-missing
RUN apt install -y git
RUN apt install -y stow

################################################################################
# Neovim dependencies

# Install Vim to look for potential issues from Neovim configurations.
RUN apt install -y vim

RUN apt install -y neovim
# TODO

################################################################################

COPY . .dotfiles
RUN cd .dotfiles; ./link up

CMD ["bash"]
