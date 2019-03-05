" author: yushengnan
" install vim-plug
let is_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if empty(glob(vim_plug_path))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	let is_install = 1
endif

if is_installed
	:execute 'source '.fnameescape(vim_plug_path)
endif

"===================================================================================
" install plugin

call plug#begin('~/.vim/plugged')

" plugins can be found from github repository

" auto pair complete
Plug 'jiangmiao/auto-pairs'
" front end of fzf, fuzzy search (require fzf installed in the system)
Plug 'junegunn/fzf'
" display tag info (require ctag install in the system)
Plug 'majutsushi/tagbar'
" git integration
Plug 'motemen/git-vim'
" language server and auto complete
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" code search (require the_silver_search installed in the system)
Plug 'rking/ag.vim'
" display tree structure directory
Plug 'scrooloose/nerdtree'
" fast comment
Plug 'scrooloose/nerdcommenter'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


call plug#end()

syntax on
set nocompatible
set tabstop=4
set shiftwidth=4
set mouse=a
set nu
set	foldmethod=indent
set foldlevel=100
set autoindent

set incsearch	" incremental search
set hlsearch	" highlighted search results

" map jumping to beginning and end of line(emacs mode, same as default
" terminal, '0' and '$' quite sucks for me)
map <C-A> <Home>
map <C-E> <End>

" tab mapping
map tn :tabn<CR> 
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>

" open terminal
map <F2> :terminal<CR>

" save as sudo
ca w!! w !sudo tee "%"

" undo persist
set undofile
set undodir=~/.vim/dirs/undos
" create undo dir
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" yankring history persist
let g:yankring_history_dir = '~/.vim/dirs'

"[Plug]==NERDTree=="
" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" file types which does not display
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

"[Plug]==Ag==
let g:ag_prg="ag --vimgrep"

"[Plug]==coc-snippets
" Use <C-l> to trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> to select text for visual text of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> to jump to forward placeholder, which is default
let g:coc_snippet_next = '<c-j>'
" Use <C-k> to jump to backward placeholder, which is default
let g:coc_snippet_prev = '<c-k>'

"[Plug]==TagBar
nmap <F8> :TagbarToggle<CR>
