dotfiles
========

My config files.

Installation
============

```bash
$ git clone https://github.com/thesquelched/dotfiles.git
$ cd dotfiles
$ git submodule init
$ git submodule update
$ for item in `ls -A`; do cp -r $item ~; done
```
