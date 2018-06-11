export TERM=screen-256color

for bash_file in ~/.bashrc.d/*.bash; do source $bash_file; done
