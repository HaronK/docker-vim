docker-vim
==========

vim/Dockerfile
--------------

Docker image: **haron/vim**

Dockerfile with vim installed.
Additionally [pathogen](https://github.com/tpope/vim-pathogen) plugin and [powerline fonts](https://github.com/Lokaltog/powerline-fonts) are installed.

Command to run vim container:

    sudo docker run -i -t --name my-vim -v ~/:/home/dev/src haron/vim

vim-with-plugins/Dockerfile
---------------------------

Docker image: **haron/vim-with-plugins**  
Based on **haron/vim**

Adds support for the several useful plugins:

1. [Sensible](https://github.com/tpope/vim-sensible)
2. [Dockerfile](https://github.com/ekalinin/Dockerfile.vim)
3. [Vim airline](https://github.com/bling/vim-airline)
4. [CtrlP](https://github.com/kien/ctrlp.vim)

Command to run vim-with-plugins container:

    sudo docker run -i -t --name my-vim-with-plugins -v ~/:/home/dev/src haron/vim-with-plugins

Dockerfile with own plugins
---------------------------

See [vim-with-plugins Dockerfile](vim-with-plugins/Dockerfile) for example.

