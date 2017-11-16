# Because you know, db:pull is fucking slow...
function backup:pull () {
  force=false
  set -- `getopt f: "$@"`
  [ $# -lt 1 ] && exit 1	# getopt failed

  while [ $# -gt 0 ]
  do
      case "$1" in
          -f)	force=true;;
  	      --)	shift; break;;
  	       *)	break;;	# terminate while loop
      esac
      shift
  done
  # all command line switches are processed,
  app=$1

  echo "### Loading '$app' app data in local database." >&2

  if [ "$force" = true ] ; then
    echo "  Capturing a fresh backup…" >&2
    heroku pg:backups capture -a $app
  else
    echo '  Using last existing backup.' >&2
  fi
  echo "  Retrieving backup…" >&2
  echo "  " >&2
  wget `heroku pg:backups public-url -a $app` -O latest.dump --continue
  echo "  " >&2
  echo "  Backup downloaded. Restoring in local DB…" >&2
  pg_restore --verbose --clean --no-acl --no-owner -d $app latest.dump
  echo "  Cleaning up…" >&2
  rm -fr latest.dump
  echo "Data loaded." >&2
}
