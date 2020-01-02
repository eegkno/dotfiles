# Link tmux
echo "Linking tmux configuration files"
ln -s $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf
chmod u+x $HOME/.dotfiles/tmux/tmuxcwd.sh

# Link nvim
echo "creating vim directories"
mkdir -p .vim/.backup
mkdir -p .vim/.swp
mkdir -p .vim/.undo
mkdir -p .vim/pack/bundle
mkdir -p .vim/pack/minpac/opt
mkdir -p .vim/pack/minpac/start
mkdir -p $HOME/.config/nvim

echo "Linking vim configuration files"
ln -s $HOME/.dotfiles/vim/vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/vim/init.vim $HOME/.config/nvim/init.vim

echo "Copying git files"
cp $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig
cp $HOME/.dotfiles/git/.gitignore_global $HOME/.gitignore_global

printf "Setting up Git...\\n\\n"

defaultName=$( git config --global user.name )
defaultEmail=$( git config --global user.email )
defaultGithub=$( git config --global github.user )

read -rp "Name [$defaultName] " name
read -rp "Email [$defaultEmail] " email
read -rp "Github username [$defaultGithub] " github

git config --global user.name "${name:-$defaultName}"
git config --global user.email "${email:-$defaultEmail}"
git config --global github.user "${github:-$defaultGithub}"

