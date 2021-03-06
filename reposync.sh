#!/bin/bash
ORGANIZATION='iptomar'
PROJECT='projectary-bd'
TIMESTAMP="(date +"%T")"
git remote add upstream git@github.com:$ORGANIZATION/$PROJECT.git
git stash
git fetch upstream
git pull upstream master
git stash pop
mysqldump -u $1 -p --routines --databases projectary --result-file="projectary-bd-dump_$TIMESTAMP.sql"
mysql -u $1 -p < projectary-bd-dump.sql
