" plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

" Specify a directory for plugins.
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-git'
Plug 'preservim/nerdtree'
Plug 'psliwka/vim-smoothie'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sainnhe/sonokai'
Plug 'powerline/powerline'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/AutoComplPop'
Plug 'ryanoasis/vim-devicons'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'francoiscabrol/ranger.vim'
Plug 'iamcco/markdown-preview.vim'
"Plug 'ryanoasis/vim-webdevicons'
"Plug 'scrooloose/nerdtree', { 'commit': '8d005db' }
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'HerringtonDarkholme/yats.vim' " TS syntax
Plug 'ctrlpvim/ctrlp.vim' " fuzzy finder
call plug#end()

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }


" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Ranger settings
let g:NERDTreeHijackNetrw = 0 
let g:ranger_open_new_tab = 1


" nerdtree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <leader>n :call NERDTreeToggle()<CR>
function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction
" open files in new tab
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}
" nerdtree on startup

let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_autofind = 1
" Highlight currently open buffer in NERDTree
" Enable syntax highlighting.
syntax on
" Set the color scheme.
colorscheme landscape
"colorscheme gruvbox
" -----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------
set hlsearch
set laststatus=2
" sane editing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set encoding=UTF-8
set et
set ai
set incsearch
set undofile
set undodir=~/.vim/undodir
set cursorline
set scr=10

hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

" Jan Toth
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l
" FZF
let g:fzf_action = { 'enter': 'tabedit' }

function! Toc()
  let $file = @%
  let $linenr = line(".")
  .t.
  w
  echo system('sed -i -E  -e "${linenr}s/^[#]{2,} (.*)/<!-- - [\1](#\L\1)-->/;-:a-s/(\(#[^-]+)-/\1-/g;-ta"--e-"s/(.*)(\(#[0-9]{1,2})(\.)(.*)/\1\2\4/g"-$file')
  e!
endfunction

function! MarkdownImageInsertCustom()
  normal ^i![](img/
  normal $a)
endfunction

" quote function
function! Quote(scope)
  if a:scope == 'word'
    normal ea"
    normal bi"
  elseif a:scope == 'string'
    normal F a"
    normal f i"
  elseif a:scope == 'end'
    normal F a"
    normal $a"
  elseif a:scope == 'beg'
    normal f i"
    normal 0i"
  elseif a:scope == 'line'
    normal ^i"
    normal $a"
  endif
endfunction 

" boldme function
function! Boldme(scope)
  if a:scope == 'word'
    normal ea**
    normal bbi**
  elseif a:scope == 'string'
    normal F a**
    normal f i**
  elseif a:scope == 'end'
    normal F a**
    normal $a**
  elseif a:scope == 'beg'
    normal f i**
    normal 0i**
  elseif a:scope == 'line'
    normal ^i**
    normal $a**
  endif
endfunction

" quick .vimrc access with ,v
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>a :ls<CR>

nmap <leader>f :Files<CR>

nmap <leader>t :call Toc()<CR>
nmap <leader>i :call MarkdownImageInsertCustom()<CR>
"nmap <leader>c :read! sh tocreadme.sh ~/Documents/sbx/aws-eks-devopsinuse/README.md <CR>
nmap <leader>d :m+1<CR>
nmap <leader>u :m-2<CR>


" Paste to vim from clipboard
nmap <leader>p "*p<CR>

nmap <leader>qw :call Quote('word')<CR>
nmap <leader>qs :call Quote('string')<CR>
nmap <leader>qe :call Quote('end')<CR>
nmap <leader>qb :call Quote('beg')<CR>
nmap <leader>ql :call Quote('line')<CR>


nmap <leader>w :call Boldme('word')<CR>
nmap <leader>s :call Boldme('string')<CR>
nmap <leader>e :call Boldme('end')<CR>
nmap <leader>b :call Boldme('beg')<CR>
nmap <leader>l :call Boldme('line')<CR>

" Sum function
let g:S = 0
function! Sum(number)
    let g:S = g:S + str2float(a:number)
    return a:number
endfunction
"Usage:
":let g:S=0
":%s/[0-9\.]\+/\=Sum(submatch(0))/
":echo g:S

nmap gx yiW:!xdg-open <c-r>" & <CR><CR>

" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" delete section in yaml
function! Delyml(scope)
  if a:scope == '0'
    exec '?^[a-z]'
    normal V
    exec '/^[a-z]'
    normal kd
  elseif a:scope == '1'
    exec '?^\s\{2\}[a-z]'
    normal V
    exec '/^\s\{2\}[a-z]'
    normal kd
  elseif a:scope == '2'
    exec '?^\s\{4\}[a-z]'
    normal V
    exec '/^\s\{4\}[a-z]'
    normal kd
  elseif a:scope == '3'
    exec '?^\s\{6\}[a-z]'
    normal V
    exec '/^\s\{6\}[a-z]'
    normal kd
  endif
endfunction
nmap da0 :call Delyml('0')<CR>
nmap da1 :call Delyml('1')<CR>
nmap da2 :call Delyml('2')<CR>
nmap da3 :call Delyml('3')<CR>

" set powerline statusbar
let g:powerline_pycmd="py3"
"set relativenumber
" copy file content to clipboard
nmap <leader>x :!xclip -selection c %<CR><CR>
