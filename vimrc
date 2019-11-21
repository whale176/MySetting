call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-slash'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tpope/vim-unimpaired'
Plug 'svermeulen/vim-easyclip'
Plug 'bkad/CamelCaseMotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Theme
Plug 'nightsense/cosmic_latte'
Plug 'morhetz/gruvbox'

call plug#end()

set rtp+=/usr/local/opt/fzf

set nocompatible

" general settings
filetype plugin indent on
syntax on

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

" Fix backspace indent
set backspace=indent,eol,start

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smarttab
set expandtab
set autoindent
set smartindent
set smartcase

" Searching
set incsearch
set hlsearch
set ic

" Directories for wap files
set nobackup
set noswapfile

set showcmd
set clipboard=unnamed
set number
set cursorline
set ruler
set t_Co=256
set autochdir
set autoread

" Buffer
set nostartofline

" Autocomplete
set complete-=i
set completeopt=longest,menuone

" Performance
set lazyredraw
set hidden
set re=1

" Command complete menu
set wildmenu

set background=dark
"color cosmic_latte
color gruvbox

packadd! matchit

autocmd BufEnter * :syntax sync fromstart

" lightline {
    set laststatus=2
    let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'readonly', 'absolutepath', 'modified' ] ],
        \ }
        \ }
"}

" t-comment {
    noremap <c-/> <c-_>
"}

" indentLine {
    let g:indentLine_concealcursor = 'inc'
    let g:indentLine_conceallevel = 2
"}

" learder {
    let mapleader=","
    let g:mapleader=","
"}

" basic {
    " :W sudo save the file
    command! W w !sudo tee % > /dev/null
    command! Q qall
"}

" ultisnips {
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsJumpForwardTrigger="<C-n>"
    let g:UltiSnipsJumpBackwardTrigger="<C-p>"
"}

" fzf {
    nnoremap <c-p> :FZF -i $HOME/Documents/Program/Perl<CR>
    command! F FZF -i
"}


" buffer {
    " navigation
    nmap <leader>b :bp<CR>
    nmap <leader>f :bn<CR>
    " buffer list
    nmap <leader>l :ls<CR>
    " delete buffer
    nmap <leader>d :bd<CR>
    " open new buffer
    nmap <leader>v :vsplit<CR>
    nmap <leader>s :split<CR>
    nmap <leader>o <C-w>o

    " resize
    if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
    endif
"}

" buftabline {
    let g:buftabline_numbers = 2
    let g:buftabline_indicators = 1
    " mapping
    nmap <leader>1 <Plug>BufTabLine.Go(1)
    nmap <leader>2 <Plug>BufTabLine.Go(2)
    nmap <leader>3 <Plug>BufTabLine.Go(3)
    nmap <leader>4 <Plug>BufTabLine.Go(4)
    nmap <leader>5 <Plug>BufTabLine.Go(5)
    nmap <leader>6 <Plug>BufTabLine.Go(6)
    nmap <leader>7 <Plug>BufTabLine.Go(7)
    nmap <leader>8 <Plug>BufTabLine.Go(8)
    nmap <leader>9 <Plug>BufTabLine.Go(9)
    nmap <leader>0 <Plug>BufTabLine.Go(10)
    " color scheme
    hi BufTabLineCurrent ctermfg=50
    hi BufTabLineHidden ctermfg=67
    hi BufTabLineActive ctermfg=97
"}


" window {
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
"}

" easyclip {
    let g:EasyClipUseSubstituteDefaults = 1
"}

" use j and k choose complete
inoremap <expr> j pumvisible() ? '<C-n>' : 'j'
inoremap <expr> k pumvisible() ? '<C-p>' : 'k'

" use <c-n>、<c-p> choose command history
cnoremap <C-n> <down>
cnoremap <C-p> <up>

" don't lose selection when shifting sidewards
xnoremap < <gv
xnoremap > >gv

" bracketed paste mode (valid in tmux)
if has('patch-8.0.0238')
    if &term =~ "screen"
        let &t_BE = "\e[?2004h"
        let &t_BD = "\e[?2004l"
        exec "set t_PS=\e[200~"
        exec "set t_PE=\e[201~"
    endif
else
    if has('patch-8.0.0210')
        set t_BE=
    endif

    if &term =~ "xterm" || &term =~ "screen"
        function XTermPasteBegin(ret)
            set paste
            set pastetoggle=<Esc>[201~
            return a:ret
        endfunction

        let &t_ti .= "\e[?2004h"
        let &t_te .= "\e[?2004l"

        noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
        inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
        vnoremap <special> <expr> <Esc>[200~ XTermPasteBegin("c")
        cnoremap <special> <Esc>[200~ <nop>
        cnoremap <special> <Esc>[201~ <nop>
    endif
endif

" Fix matchparen plugin slow {
    let g:matchparen_timeout = 20
    let g:matchparen_insert_timeout = 20
"}

" autochdir {
    "autochdir for some plugins
    " autocmd BufEnter * silent! lcd %:p:h
    "command for quick directory change
    nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" }

" CamelCaseMotion {
    map <silent> w <Plug>CamelCaseMotion_w
    map <silent> b <Plug>CamelCaseMotion_b
    map <silent> e <Plug>CamelCaseMotion_e
    map <silent> ge <Plug>CamelCaseMotion_ge
    omap <silent> iw <Plug>CamelCaseMotion_iw
    xmap <silent> iw <Plug>CamelCaseMotion_iw
    omap <silent> ib <Plug>CamelCaseMotion_ib
    xmap <silent> ib <Plug>CamelCaseMotion_ib
    omap <silent> ie <Plug>CamelCaseMotion_ie
    xmap <silent> ie <Plug>CamelCaseMotion_ie
    sunmap w
    sunmap b
    sunmap e
    sunmap ge
"}

" sql.vim {
    " Disabled sql.vim mapping
    let g:omni_sql_no_default_maps = 1
" }

" remap ESC
inoremap <c-c> <ESC>

