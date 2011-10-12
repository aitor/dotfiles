function _rails_command () {
  if [ -e "script/server" ]; then
    ruby script/$@
  else
    ruby script/rails $@
  fi
}

alias rc='_rails_command console'
alias rs='_rails_command server'
alias rsd='_rails_command server --debugger'
