FROM ubuntu:latest

MAINTAINER Oleg Khryptul <okreptul@yahoo.com> 

RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y vim git python-pip wget openjdk-7-jre
RUN pip install flake8

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
RUN echo 'execute pathogen#infect()' >> $HOME/.vimrc && \
    echo 'syntax on'                 >> $HOME/.vimrc && \
    echo 'filetype plugin indent on' >> $HOME/.vimrc

# Powerline fonts
RUN mkdir -p $HOME/.fonts $HOME/.config/fontconfig/conf.d
RUN wget -P $HOME/.fonts                     https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
RUN wget -P $HOME/.config/fontconfig/conf.d/ https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
RUN fc-cache -vf $HOME/.fonts/

# Vim plugins

# Sensible
RUN git clone git://github.com/tpope/vim-sensible.git $HOME/.vim/bundle

# Dockerfile syntax & snippet plugin
RUN git clone https://github.com/ekalinin/Dockerfile.vim.git $HOME/.vim/bundle/Dockerfile

# Vim airline
RUN git clone https://github.com/bling/vim-airline $HOME/.vim/bundle/vim-airline
RUN echo 'set laststatus=2'                                      >> $HOME/.vimrc && \
    echo 'let g:airline#extensions#tabline#enabled = 1'          >> $HOME/.vimrc && \
    echo 'let g:airline#extensions#tabline#left_sep = \' \''     >> $HOME/.vimrc && \
    echo 'let g:airline#extensions#tabline#left_alt_sep = \'|\'' >> $HOME/.vimrc

# CtrlP
RUN git clone https://github.com/kien/ctrlp.vim.git $HOME/.vim/bundle/ctrlp.vim

#RUN vim -u $HOME/.vim/bundles.vim +PluginInstall +qall

ENTRYPOINT ["vim"]
