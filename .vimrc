set nocompatible              " required
set number
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set mouse=a
set splitbelow
set backspace=indent,eol,start
filetype off                  " required
filetype plugin on

au BufNewFile,BufRead *.py
    \| set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=159
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap <C-C> :let @+= expand("%:p")<CR> 
map <C-t> :NERDTreeToggle<CR>
nnoremap <C-s> [s1z=<c-o>
inoremap <C-s> <c-g>u<Esc>[s1z=`]A<c-g>u
nnoremap <leader>c :nohl<CR> 

"autocmd BufReadPost,FileReadPost *.ged %!gedcom_indent
"autocmd FileType gedcom set foldmethod=indent nolist ts=4

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd call litecorrect#init()
  autocmd FileType textile call litecorrect#init()
augroup END
augroup textobj_sentence
  autocmd!
  autocmd FileType markdown call textobj#sentence#init()
  autocmd FileType textile call textobj#sentence#init()
augroup END

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:solarized_termcolors=256

" Write this in your vimrc file
" ALE settings
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']

" status line
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set noruler
set laststatus=2
set statusline=
set statusline+=\ %f
set statusline+=%{virtualenv#statusline()}
set statusline+=%{StatuslineGit()}
set statusline+=%=%l:%c

let g:virtualenv_stl_format = '[%n]'


let python_highlight_all=1
syntax on

color desert

hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" delete buffer w/o removing split window
command Bd bp|bd #
" when text gets stuck overlaid this 'refreshes'
command Br bp|bn


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" allows us to install vundle on opening if not installed
let s:bootstrap = 0
try
	call vundle#begin()
catch /E117:/
	let s:bootstrap = 1
	silent !mkdir -p ~/.vim/bundle
	silent !unset GIT_DIR && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	redraw!
	call vundle#begin()
endtry

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" general plugins
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'sillybun/vim-repl'
Plugin 'tpope/vim-surround'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'jnurmine/Zenburn'
Plugin 'preservim/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'chrisbra/csv.vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'dense-analysis/ale'

" writing plugins
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-abolish'
Plugin 'junegunn/goyo.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'reedes/vim-lexical'
Plugin 'reedes/vim-litecorrect'
Plugin 'reedes/vim-textobj-sentence'
Plugin 'reedes/vim-wordy'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

