#!/usr/bin/env bash

check_git() {
    git diff-index --quiet HEAD || exit 1
}

if `check_git`
then
    echo "continue";
else
    git status;
    echo "git is dirty, cannot continue!";
    exit 1;
fi