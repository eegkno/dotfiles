
# Link tmux
ln -s $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf 

# Link nvim
mkdir -p .vim/.backup
mkdir -p .vim/.swp
mkdir -p .vim/.undo
mkdir -p .vim/pack/bundle
mkdir -p .vim/pack/minpac/opt
mkdir -p .vim/pack/minpac/start

ln -s $HOME/.dotfiles/vim/vimrc $HOME/.vimrc

mkdir -p $HOME/.config/nvim
ln -s $HOME/.dotfiles/vim/init.vim $HOME/.config/nvim/init.vim 
