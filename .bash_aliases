# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias e='emacs'

# apt
alias aupdate='sudo apt-get -o Acquire::Check-Valid-Until=false update'
alias asearch='apt-cache search'
alias ainstall='sudo apt-get install'
alias apolicy='sudo apt-cache policy'
alias arm='sudo apt-get remove'
alias aupgrade='sudo apt-get dist-upgrade'

# fs
alias buildfs="sudo make build-dep && make -j4 packages && make testrepo"

# dpkg
alias list-pkg="sudo dpkg -l | grep -i"

# ssh
alias ssh-no-checks="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

# system
alias shutdown='sudo shutdown now'
alias reboot='sudo reboot'