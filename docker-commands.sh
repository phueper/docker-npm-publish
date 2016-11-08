#!/usr/bin/env bash

dp-init() {
    docker-compose down -v --rmi all --remove-orphans
    docker-compose build
}

function dp-npm-run() {
    docker-compose run --rm publish $@
}

function dp-bash-run() {
#    set -x
    docker-compose run  --rm --entrypoint "/bin/bash -ec" publish "$*"
}

dp-checkout() {
    dp-bash-run /publish-functions.sh checkout
#    dp-bash-run 'echo "bla" > package.json'
#    dp-bash-run touch test2
#    dp-bash-run git status
    dp-bash-run /publish-functions.sh install
    dp-bash-run /publish-functions.sh build
    dp-bash-run /publish-functions.sh test
    dp-bash-run /publish-functions.sh verify
}


#TODO: check env vars
echo "source this file and use its functions:"

typeset -f | awk '!/^main[ (]/ && /^[^ {}]+ *\(\)/ { gsub(/[()]/, "", $1); print $1}' | grep ^dp-