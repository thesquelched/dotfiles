#! /bin/bash

set -eu -o pipefail

VIM=$HOME/.vim
BUNDLE=$VIM/bundle
REPOS=(tpope/vim-surround tpope/vim-repeat klen/python-mode)

# Install pathogen
mkdir -p $VIM/autoload
if [[ ! -f $VIM/autoload/pathogen.vim ]]; then
    curl -LSso $VIM/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# Install plugins
mkdir -p $BUNDLE
cd $BUNDLE

for REPO in ${REPOS[@]}; do
    if [[ ! -d "${REPO#*/}" ]]; then
        git clone https://github.com/$REPO
    fi
done
