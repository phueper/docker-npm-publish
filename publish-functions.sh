#!/usr/bin/env bash

#set -xv

check_git() {
    # check for unstaged/uncommitted changes
    source $(git --exec-path)/git-sh-setup
    (require_clean_work_tree continue) || return 1
    # check for untracked
    if [[ -n "$(git status -s)" ]]; then
        echo "Cannot continue: You have untracked files.";
        return 1;
    fi
    return 0
}

#TODO: verify env variables!!

case "$1" in
  checkout)
    git clone ${GIT_REPO_URL} .
    ;;
  build)
    npm run ${BUILD_SCRIPT}
    ;;
  install)
    npm install
    ;;
  test)
    npm test
    ;;
  verify)
    if check_git
        then
            echo "git is clean... ready to continue";
        else
            git status -s;
            echo "git is dirty, cannot continue!";
            exit 1;
        fi
esac