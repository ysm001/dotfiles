"*****************************************************************************
"" NeoBundle core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
let solarized_vim=expand('~/.vim/colors/solarized.vim')

let g:vim_bootstrap_langs = "javascript,ruby,python,html,go"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"

  " Run shell script if exist on custom select language
endif

if !filereadable(solarized_vim)
  echo "Installing Solarized Theme..."
  echo ""

  silent !mkdir -p ~/.vim/colors
  silent !mkdir -p ~/.vim/tmp
  silent !git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/tmp/solarized
  !mv ~/.vim/tmp/solarized/colors/solarized.vim ~/.vim/colors/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"*****************************************************************************
""" Functions
"*****************************************************************************
function! s:meet_neocomplete_requirements()
  return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

"*****************************************************************************
"" VimProc DLL Path
"*****************************************************************************
if has('mac')
  let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
elseif has('win32')
  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win32.dll'
elseif has('win64')
  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win64.dll'
endif

"*****************************************************************************
"" NeoBundle install packages
"*****************************************************************************
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'scrooloose/nerdtree'

"" vimproc
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

"" 補完
if s:meet_neocomplete_requirements()
  NeoBundle 'Shougo/neocomplete'
	NeoBundle 'supermomonga/neocomplete-rsense.vim', {'depends': ['Shougo/neocomplete.vim', 'marcus/rsense'],}
else
	NeoBundle 'Shougo/neocomplcache'
	NeoBundle 'Shougo/neocomplcache-rsense.vim', {'depends': ['Shougo/neocomplcache.vim', 'marcus/rsense'],}
endif

"" スニペット
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'

"" ctags
NeoBundle 'majutsushi/tagbar'
NeoBundle 'szw/vim-tags'

NeoBundle 'tpope/vim-endwise'

"" 構文チェック
NeoBundle 'scrooloose/syntastic'

"" markdownプレビュー
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

"" python構文・コーディング規約チェック
NeoBundle 'Flake8-vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'hynek/vim-python-pep8-indent'

"" indent可視化
NeoBundle 'Yggdroot/indentLine'

"" HTML/CSS
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'mattn/emmet-vim'

NeoBundle 'tpope/vim-surround'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
let mapleader="\<Space>"

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set binary
set ttyfast

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

set whichwrap=h,l,b,s,<,>,[,]

"" 改行時に自動でコメントを挿入するのを防ぐ
autocmd FileType * setlocal formatoptions-=ro

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable
set background=dark
colorscheme solarized
set number
set ruler

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules', 'bower_components']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <leader>nf :NERDTreeFind<CR>
noremap <leader>n :NERDTreeToggle<CR>

"*****************************************************************************
""" Mappings
"*****************************************************************************
"" Copy/Paste/Cut
set clipboard=unnamed,unnamedplus

"******************
"" neosnippet
imap <c-k>     <Plug>(neosnippet_expand_or_jump)
smap <c-k>     <Plug>(neosnippet_expand_or_jump)
xmap <c-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": "\<TAB>"
if has('conceal')
	set conceallevel=2 concealcursor=i
endif
"******************

"******************
if s:meet_neocomplete_requirements()
  "" neocomplete
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
else
  "" neocomplcache
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_ignore_case = 1
  let g:neocomplcache_enable_smart_case = 1
  if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns._ = '\h\w*'
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
endif

" <TAB>: completion.                                         
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"   
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 
"******************

"******************
" tagbar
if ! empty(neobundle#get("tagbar"))
  let g:tagbar_width = 20
  nn <silent> <leader>t :TagbarToggle<CR>
endif
"******************

"******************
" ctags
let g:vim_tags_project_tags_command = "/usr/local/Cellar/ctags/5.8_1/bin/ctags -f .tags -R . 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/Cellar/ctags/5.8_1/bin/ctags -R -f .Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
let g:vim_tags_auto_generate = 1
set tags+=.tags
set tags+=.Gemfile.lock.tags

if has("path_extra")
  set tags+=tags;
endif

nnoremap <C-]> g<C-]> 
"******************

"******************
" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_scss_checkers = ['scss_lint']
"******************

"******************
au BufRead,BufNewFile *.md set filetype=markdown
"******************

"******************
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
			\    'variables': {
			\      'lang': "ja"
			\    },
			\   'indentation': '  '
			\ }
"******************

"******************
" rsense
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'
"******************

"******************
" PyFlake
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=10
"******************

"******************
" jedi
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"******************

"******************
" indentLine
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'calendar', 'thumbnail']
"******************

"*****************************************************************************
" Indent Width
"*****************************************************************************"
set shiftwidth=2
set tabstop=2

augroup indent
  autocmd! FileType python setlocal shiftwidth=4 tabstop=4
augroup END

set autoindent
set expandtab
