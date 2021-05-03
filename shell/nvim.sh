# Nvim confogurations
#
alias vi=$(where nvim)

# Variables
export EDITOR=vi
export VIMCONFIG=$HOME/.vim
export VIMDATA=$HOME/.vim
export VIMRC=$HOME/.vimrc
export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
  export VISUAL="nvim"
fi
