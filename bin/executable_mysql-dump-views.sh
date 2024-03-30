#!/bin/bash -e
mysql --skip-column-names --batch -e \
"select table_name from information_schema.views \
 where table_schema = database()" $* |
xargs --max-args 1 mysqldump $*
