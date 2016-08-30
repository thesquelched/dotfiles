#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

######################################################################
# Variables
######################################################################

unsetopt CORRECT

#export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/Applications:$PATH

######################################################################
# Functions/aliases
######################################################################

alias gvim=mvim

venv_activate() {
    source .venv*/bin/activate
}

mkvenv() {
    virtualenv .venv
    venv_activate
}

# Git functions/aliases

alias gf="git fetch --all --prune"
alias gcb="git checkout -b"

git_untrack() {
    git update-index --assume-unchanged $@
}

git_track() {
    git update-index --no-assume-unchanged $@
}

git_branch_cleanup() {
    if [[ -z "$1" ]]; then
        BRANCH="master"
    else
        BRANCH=$1
    fi

    MERGED=$(git branch --merged | grep -v $BRANCH | grep -vF '*' | grep -v docker-hub | tr -d " ")
    if [[ -z "$MERGED" ]]; then
        echo "No merged branches"
    else
        echo $MERGED
        echo
        echo -n "Delete merged branches (y/N)? "
        read CONFIRM
        if [[ "$CONFIRM" == "y" || "$CONFIRM" == "Y" ]]; then
            echo $MERGED | xargs git branch -d
            echo "Deleted branches"
        else
            echo "Aborted"
        fi
    fi

    git branch -r --merged |
    grep origin |
    grep -v '>' |
    grep -v $BRANCH |
    xargs -L1 |
    cut -d"/" -f2- |
    xargs git push origin --delete
}

git_update() {
    REMOTE="upstream"
    if [[ -n "$1" ]]; then REMOTE=$1; fi

    if [[ -z "$2" ]]; then
        BRANCH="master"
    else
        BRANCH=$2
    fi

    git checkout $BRANCH
    git fetch --all --prune
    git merge $REMOTE/$BRANCH
    git_branch_cleanup
}

git_pr_update() {
    REMOTE="origin"
    if [[ -n "$1" ]]; then REMOTE=$1; fi
    BRANCH=`git branch | grep -F '*' | cut -d" " -f2`
    git commit --amend -a
    git push --force $REMOTE $BRANCH
}
