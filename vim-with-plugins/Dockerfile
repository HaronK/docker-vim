
FROM haron/vim:latest

MAINTAINER Oleg Khryptul <okreptul@yahoo.com> 

# Vim plugins

# Sensible
RUN git clone https://github.com/tpope/vim-sensible.git $HOME/.vim/bundle/vim-sensible

# Dockerfile syntax & snippet plugin
RUN git clone https://github.com/ekalinin/Dockerfile.vim.git $HOME/.vim/bundle/Dockerfile

# Vim airline
RUN git clone https://github.com/bling/vim-airline $HOME/.vim/bundle/vim-airline
RUN echo "set laststatus=2"                                    >> $HOME/.vimrc && \
    echo "let g:airline#extensions#tabline#enabled = 1"        >> $HOME/.vimrc && \
    echo "let g:airline#extensions#tabline#left_sep = ' '"     >> $HOME/.vimrc && \
    echo "let g:airline#extensions#tabline#left_alt_sep = '|'" >> $HOME/.vimrc

# CtrlP
RUN git clone https://github.com/kien/ctrlp.vim.git $HOME/.vim/bundle/ctrlp.vim

CMD vim
