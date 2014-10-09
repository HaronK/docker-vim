
FROM ubuntu:latest

MAINTAINER Oleg Khryptul <okreptul@yahoo.com> 

RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y vim git wget fontconfig

RUN useradd dev
RUN echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
RUN dpkg-reconfigure locales
RUN locale-gen en_US.UTF-8
RUN /usr/sbin/update-locale LANG=en_US.UTF-8

WORKDIR /home/dev
ENV HOME /home/dev
ENV LC_ALL en_US.UTF-8

RUN chown -R dev:dev $HOME/
USER dev

# setup pathogen vim plugin manager
RUN mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle
RUN wget -P $HOME/.vim/autoload https://tpo.pe/pathogen.vim
RUN echo "execute pathogen#infect()" >> $HOME/.vimrc && \
    echo "syntax on"                 >> $HOME/.vimrc && \
    echo "filetype plugin indent on" >> $HOME/.vimrc

# Powerline fonts
RUN mkdir -p $HOME/.fonts $HOME/.config/fontconfig/conf.d
RUN wget -P $HOME/.fonts                     https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
RUN wget -P $HOME/.config/fontconfig/conf.d/ https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
RUN fc-cache -vf $HOME/.fonts/
RUN echo "set guifont=Droid\\ Sans\\ Mono\\ 10"
#RUN echo "set guifont=Liberation\\ Mono\\ for\\ Powerline\\ 10"

CMD vim
