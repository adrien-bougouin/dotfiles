FROM ubuntu:plucky-20250714

ENV HOME /home/ubuntu

WORKDIR ${HOME}

RUN apt update --fix-missing
RUN apt install -y stow

# Install Neovim and its dependencies
RUN apt install -y neovim

# Configure
COPY . .dotfiles
RUN cd .dotfiles; ./link up

CMD ["nvim"]
