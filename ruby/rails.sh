#alias sc='script/console'
#alias ss='script/server'
#
#alias rc='rails console'
#alias rs='rails server'


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
