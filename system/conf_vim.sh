# Create Nvim required directories
mkdir -p ~/.config/nvim

# Copy the vim configuration file
ln -s ~/Dropbox/_Git_repositories/dotfiles/vim/vimrc ~/.vimrc

# Copy the nvim configuration file.
# This will load the .vimrc as a configuration file for nvim  
cp ../vim/init.vim ~/.config/nvim
