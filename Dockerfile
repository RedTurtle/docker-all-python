# Ubuntu 18.04 and Python 2.4, 2.5, 2.6, 2.7, 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7, pypy
FROM ubuntu:18.04
MAINTAINER Martina Bustacchini "martina.bustacchini@redturtle.it"
# update and upgrade all necessary packages
RUN apt-get update && apt-get upgrade
# install openssl
RUN apt-get update && \
    apt-get install -qq -y openssl
# install git, wget and curl
RUN apt-get update && \
    apt-get install -y wget \
    curl \
    git
# install zsh
RUN apt-get install -y zsh \ 
    fonts-powerline && \
    chsh -s /usr/bin/zsh root
# set env variables for zsh
ENV TERM xterm
ENV ZSH_THEME agnoster
# set up locale
# RUN locale-gen it.IT.UTF-8
# complete ohmyzsh configuration
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true 
#   cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
RUN apt-get install -qq -y software-properties-common && \
    add-apt-repository ppa:deadsnakes && \
    add-apt-repository ppa:pypy/ppa && \
    apt-get update
# install all python versions
RUN apt-get install -qq -y \
    python2.4 \
    python2.5 \
    python2.6 \
    python2.7 \
    python3.1 \
    python3.2 \
    python3.3 \
    python3.4 \
    python3.5 \
    python3.6 \
    python3.7 \
    pypy
# install pip for python 2 and 3
RUN apt-get update && \
    apt-get install -y python-pip python3-pip
# other additional steps if needed
# ================================
# download virtualenv package for python 2.4
RUN cd usr/local/bin 
RUN wget -P usr/local/bin "https://files.pythonhosted.org/packages/bf/a0/45ecac80034dbc040fb4f5036f32cb40005df71e496ccd137eb65e5a69e6/virtualenv-1.7.tar.gz"
RUN tar xfz usr/local/bin/virtualenv-1.7.tar.gz -C usr/local/bin/

# ================================
# clean cache
RUN apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
# start zsh
CMD ["zsh"]
