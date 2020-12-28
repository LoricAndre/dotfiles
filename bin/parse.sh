set -a
. "$1"
perl -p -e 's/%\{\{(\w+)\}\}/(exists $ENV{$1}?$ENV{$1}:"missing variable $1")/eg' \
  < "$2/$3" > "$2/parsed/$3"
set +a

