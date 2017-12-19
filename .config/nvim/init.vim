" Requires
" zsh, git, ag, pyenv, pyenv-virtualenv

if !has('nvim') && v:version < 800
  echoerr 'This settings requires NeoVIM or VIM version 8'
endif

if !empty($PYENV_ROOT)
  let pyenv_root = $PYENV_ROOT
else
  let pyenv_root = $HOME.'/.pyenv'
endif

" virtualenvのneovim3環境を利用
let g:python3_host_prog = pyenv_root . '/versions/neovim3/bin/python'

" virtualenvにneovim3環境が無い場合は新規作成
if !filereadable(g:python3_host_prog)
  if system('pyenv --version') == '' || system('pyenv virtualenvs --version') == ''
    echoerr 'This settings requires pyenv-virtualenvs'
  endif

  let init_pyenv = 'eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"'
  call system(init_pyenv . ' && pyenv install 3.5.1')
  call system(init_pyenv . ' && pyenv virtualenv 3.5.1 neovim3 && pyenv activate neovim3 && pip install neovim')
  echo 'Please run "UpdateRemotePlugins" to enable auto-completion'
endif

"*****************************************************************************
"" Dein core
"*****************************************************************************
if &compatible
  set nocompatible
endif

" Directory to install dein plugins
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" If dein directory does not exist, run git clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

let g:vim_bootstrap_langs = "javascript,ruby,python,html,go"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

"*****************************************************************************
""" Functions
"*****************************************************************************
function! s:meet_neocomplete_requirements()
  return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

function! s:meet_deoplete_requirements()
  return (has('nvim')  || has('timers')) && has('python3') "&& system('pip3 show neovim') !=# ''
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
"" Dein install packages
"*****************************************************************************
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('altercation/vim-colors-solarized')
  call dein#source('altercation/vim-colors-solarized')
  call dein#add('scrooloose/nerdtree')
  
  "" vimproc
  call dein#add('Shougo/vimproc.vim', {
  \ 'build' : {
  \     'windows' : 'tools\\update-dll-mingw',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'linux' : 'make -f make_mac.mak',
  \     'unix' : 'gmake -f make_mac.mak',
  \    },
  \ })
  
  "" 補完
  if s:meet_deoplete_requirements()
    call dein#add('Shougo/deoplete.nvim')

    "" python補完
    call dein#add('zchee/deoplete-jedi')

    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif
  elseif s:meet_neocomplete_requirements()
    call dein#add('Shougo/neocomplete')
    call dein#add('davidhalter/jedi-vim')
  endif
  
  "" スニペット
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('honza/vim-snippets')
  
  "" ctags
  call dein#add('majutsushi/tagbar')
  call dein#add('szw/vim-tags')
  
  call dein#add('tpope/vim-endwise')
  
  "" 構文チェック
  call dein#add('w0rp/ale')
 
  "" markdownプレビュー
  call dein#add('plasticboy/vim-markdown')
  call dein#add('kannokanno/previm')
  call dein#add('tyru/open-browser.vim')
  
  "" python構文・コーディング規約チェック
  call dein#add('hynek/vim-python-pep8-indent')
  
  "" indent可視化
  call dein#add('Yggdroot/indentLine')
  
  "" HTML/CSS
  call dein#add('vim-scripts/HTML-AutoCloseTag')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('gorodinskiy/vim-coloresque')
  call dein#add('mattn/emmet-vim')
  
  call dein#add('tpope/vim-surround')
  
  call dein#add('othree/yajs.vim')
  
  "" JSON syntax
  call dein#add('elzr/vim-json')
  
  call dein#add('leafgarland/typescript-vim')
  call dein#add('jason0x43/vim-js-indent')
  
  "" mustache / handlebars
  call dein#add('mustache/vim-mustache-handlebars')
  
  "" nodejs補完
  call dein#add('myhere/vim-nodejs-complete')
  
  "" VCL
  call dein#add('smerrill/vcl-vim-plugin')

  "" ファイル操作
  call dein#add('Shougo/denite.nvim')

  "" yank履歴
  call dein#add('Shougo/neoyank.vim')

  "" バッファ履歴
  call dein#add('Shougo/neomru.vim')

  call dein#add('thinca/vim-qfreplace')
  
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
 call dein#install()
endif

" Required:
filetype plugin indent on

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

"" JSONのダブルクォーテーションを表示する
let g:vim_json_syntax_conceal = 0

"" 改行時に自動でコメントを挿入するのを防ぐ
autocmd FileType * setlocal formatoptions-=ro

let g:vim_json_syntax_conceal=0

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

"" terminal
set sh=zsh
tnoremap <silent> <ESC> <C-\><C-n>
"******************

"******************
if s:meet_deoplete_requirements()
  let g:deoplete#enable_at_startup = 1
elseif s:meet_neocomplete_requirements()
  "" neocomplete
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
endif

" <TAB>: completion.                                         
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"   
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 
"******************

"******************
" ctags
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -f .tags -R . 2>/dev/null"
let g:vim_tags_auto_generate = 1
set tags+=.tags

if has('path_extra')
  set tags+=tags;
endif

nnoremap <C-]> g<C-]> 

if dein#tap('tagbar')
  let g:tagbar_width = 20
  nn <silent> <leader>t :TagbarToggle<CR>
endif
"******************

"******************
" typescript
au BufRead,BufNewFile,BufReadPre *.ts set filetype=typescript
autocmd FileType typescript setlocal sw=2 sts=2 ts=2 et
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
" Denite
if system('ag --version') != ''
  call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'default_opts', ['--follow', '--no-group', '--no-color'])
endif

nnoremap <silent> <C-k><C-f> :<C-u>Denite file_rec<CR>
nnoremap <silent> <C-k><C-g> :<C-u>Denite grep<CR>
nnoremap <silent> <C-k><C-w> :<C-u>DeniteCursorWord grep<CR>
nnoremap <silent> <C-k><C-l> :<C-u>Denite line<CR>
nnoremap <silent> <C-k><C-u> :<C-u>Denite file_mru<CR>
nnoremap <silent> <C-k><C-y> :<C-u>Denite neoyank<CR>
nnoremap <silent> <C-k><C-r> :<C-u>Denite -resume<CR>

" 複数ファイルの文字列置換
" 1. <C-k><C-w>などでgrep検索
" 2. <C-o>でノーマルモード移行
" 3. <Space>や*で対象を洗濯
" 4. <Tab>でアクション選択を行い、qfreplaceを起動
if dein#tap('denite.nvim') && dein#tap('vim-qfreplace')
  function! MyDeniteReplace(context)
    let qflist = []
    for target in a:context['targets']
      if !has_key(target, 'action__path') | continue | endif
      if !has_key(target, 'action__line') | continue | endif
      if !has_key(target, 'action__text') | continue | endif

      call add(qflist, {
            \ 'filename': target['action__path'],
            \ 'lnum': target['action__line'],
            \ 'text': target['action__text']
            \ })
    endfor
    call setqflist(qflist)
    call qfreplace#start('')
  endfunction
  call denite#custom#action('file', 'qfreplace', function('MyDeniteReplace'))
endif
"******************


"******************
" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'python': ['flake8'],
\}
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

set completeopt-=preview

let g:deoplete#sources#jedi#python_path = g:python3_host_prog
"******************

"******************
" typescript
autocmd BufRead,BufNewFile *.ts set filetype=typescript
let g:typescript_indent_disable = 1
"******************

"******************
" indentLine
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'calendar', 'thumbnail']
"******************

"******************
" mustache / handlebars
let g:mustache_abbreviations = 1
"******************

"******************
" vim-nodejs-complete
:setl omnifunc=jscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
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

"*****************************************************************************
" Large File
"*****************************************************************************"
set synmaxcol=256
set nowrap

" file is large from 10mb
let g:LargeFile = 1024 * 100
augroup LargeFile 
  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
  " no syntax highlighting etc
  set eventignore+=FileType
  " save memory when other file is viewed
  setlocal bufhidden=unload
  " display message
  autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

au BufRead,BufNewFile *.vcl.handlebars set filetype=vcl
