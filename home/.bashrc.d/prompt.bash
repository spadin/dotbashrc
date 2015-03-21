green="\e[32m"
cyan="\e[36m"
red="\e[31m"
yellow="\e[33m"
reset_color="\e[0m"

export GITAWAREPROMPT=$HOME/.homesick/repos/git-aware-prompt
source $GITAWAREPROMPT/main.sh

customize_prompt() {
  local branch=$(echo $git_branch | sed -r 's/\((.*)\)/\1/')
  local dirty=""

  if [[ "$git_dirty" != "" ]]; then
    dirty='*'
  fi

  git_prompt=""
  if [[ "$branch" != "" ]]; then
    git_prompt=$(echo -e "(${cyan}${branch}${reset_color}${red}${dirty}${reset_color})")
  fi
}

PROMPT_COMMAND="$PROMPT_COMMAND customize_prompt;"
PS1="\n\[${green}\]\w\[${reset_color}\] \${git_prompt}\n(\[${yellow}\]\h\[${reset_color}\]) \$ "
