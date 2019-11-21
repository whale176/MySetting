# MySetting

## 1. vimrc

---

## Troubleshooting

1. Vim fzf not working on Mac's Vim

* Problem
```
Error running '/Users/$user/.fzf/bin/fzf'  '--multi' '--prompt' '~/$dir/' '-i' '/ma' --expect=ctrl-v,ctrl-x,ctrl-t --height=6 > /var/folders/...
```

* Solution

1. Please install fzf using Homebrew

```shell=
$ brew install fzf

# To install useful key bindings and fuzzy completion:
$ (brew --prefix)/opt/fzf/install
```

2. In /.vimrc, add these lines:  

```shell=
" This is vim-plugin for example
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf
```

3. Finished!


