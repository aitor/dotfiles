# Because you know, db:pull is fucking slow...
function backup:pull () {
  name=$(heroku info --shell | grep "^name=" | cut -d= -f2)
  echo "Loading '$name' app's data in local database."

  heroku pgbackups:capture --expire
  curl -o latest.dump `heroku pgbackups:url`
  pg_restore --verbose --clean --no-acl --no-owner -d $name latest.dump
  rm -fr latest.dump
}
