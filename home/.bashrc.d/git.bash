function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

alias gb="git branch"
alias gco="git checkout"
alias ggpull="git pull --rebase origin $(current_branch)"
alias ggpush="git push origin $(current_branch)"
alias gst="git status -sb"
