green="\033[32m"
cyan="\033[36m"
red="\033[31m"
yellow="\033[33m"
reset_color="\033[0m"

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
