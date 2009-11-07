function parse_git_dirty {
  git status > /dev/null 2>/dev/null
  if [ $? != 128 ]; then
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*" || echo ""
  fi
}
 
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"
}