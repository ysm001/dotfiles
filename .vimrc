if has('gui_macvim')
    set transparency=3
    set guifont=Menlo:h12
    set lines=90 columns=200
    set guioptions-=T
endif

set nocompatible               " be iMproved
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  " call neobundle#rc(expand('~/.vim/bundle/'))
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif

let g:neobundle#types#git#default_protocol = 'ssh'
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'terryma/vim-multiple-cursors'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'

NeoBundle 'mattn/emmet-vim'
" NeoBundle 'taichouchou2/surround.vim'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
"NeoBundle 'taichouchou2/html5.vim'
"NeoBundle 'taichouchou2/vim-javascript' " jQuery syntax追加
"NeoBundle 'tpope/vim-endwise.git' 
"NeoBundle 'ruby-matchit'
NeoBundle 'vim-scripts/dbext.vim'
" syntax + 自動compile
NeoBundle 'kchmck/vim-coffee-script'
" js BDDツール
NeoBundle 'claco/jasmine.vim'
" indentの深さに色を付ける
NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'synboo/project.vim'

NeoBundle 'naberon/vim-cakehtml'
" ruby debugger
NeoBundle 'astashov/vim-ruby-debugger'
" slim
NeoBundle 'slim-template/vim-slim.git'

NeoBundle 'scrooloose/nerdtree'

filetype plugin indent on     " required!
filetype indent on
syntax on

let g:SrcExpl_UpdateTags = 1
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"

let g:tlist_actionscript_settings = 'actionscript;c:class;v:var;p:property;m:method;f:function;o:object;const:constants'

"neocomplcache を有効にする
let g:neocomplcache_enable_at_startup = 1
"neocomplcache の smart case 機能を有効にする
let g:neocomplcache_enable_smart_case = 1
"neocomplcache の camel case 機能を有効にする
let g:neocomplcache_enable_camel_case_completion = 1
"_区切りの補完を有効にする
let g:neocomplcache_enable_underbar_completion = 1
"シンタックスをキャッシュするときの最小文字長を設定する
let g:neocomplcache_min_syntax_length = 2

au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.ry set filetype=racc

autocmd BufNewFile,BufRead *.scala set filetype=scala
"ユーザ定義の辞書を指定
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'scala' : $HOME . '/.vim/dict/scala.dict',
  \ }

"set tags += "~/Programming/.ctags/scala_tags"
"autocmd FileType scala :set tags+=~/.vim/tags/scala.tags

let Tlist_Use_Right_Window = 1   

" スニペットファイルの配置場所
let g:NeoComplCache_SnippetsDir = '~/.vim/snippets'
 
" TABでスニペットを展開
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_jump_or_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

smap <C-k> <Plug>(neosnippet_jump_or_expand)

set rtp+=~/.vim/vundle/  
"call vundle#rc()  


"Bundle 'Shougo/neocomplcache.git'  
"Bundle 'Shougo/vimshell.git'  
"Bundle 'Shougo/unite.vim.git'  
"Bundle 'Shougo/git-vim'  
"Bundle 'Shougo/vimproc'  
"Bundle 'tpope/vim-surround.git'  
"Bundle 'thinca/vim-quickrun.git'  
"Bundle 'mattn/zencoding-vim.git' 

""
"" Vim-LaTeX
""
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_CompileRule_dvi = '/usr/texbin/platex -synctex=1 -interaction=nonstopmode $*'
"let g:Tex_CompileRule_dvi = '/usr/texbin/uplatex -synctex=1 -interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = '/usr/texbin/dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = '/usr/texbin/dvipdfmx $*.dvi'
"let g:Tex_CompileRule_pdf = '/usr/local/bin/ps2pdf $*.ps'
"let g:Tex_CompileRule_pdf = '/usr/texbin/pdflatex -synctex=1 -interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/lualatex -synctex=1 -interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/xelatex -synctex=1 -interaction=nonstopmode $*'
let g:Tex_BibtexFlavor = '/usr/texbin/pbibtex'
"let g:Tex_BibtexFlavor = '/usr/texbin/upbibtex'
let g:Tex_MakeIndexFlavor = '/usr/texbin/mendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
"let g:Tex_ViewRule_dvi = '/usr/texbin/pxdvi -watchfile 1'
let g:Tex_ViewRule_dvi = '/usr/bin/open -a PictPrinter.app'
"let g:Tex_ViewRule_dvi = '/usr/bin/open -a Skim.app'
let g:Tex_ViewRule_ps = '/usr/local/bin/gv --watch'
let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Skim.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a TeXShop.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a TeXworks.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a "Adobe Reader.app"'


" Ruby static code analyzer.
" let g:syntastic_ruby_checkers = ['rubocop']

"----------------------------------------
" zencoding
"----------------------------------------
"{{{
" codaのデフォルトと一緒にする
imap <C-E> <C-Y>,
let g:user_zen_leader_key = '<C-Y>'
" 言語別に対応させる
let g:user_zen_settings = {
      \  'lang' : 'ja',
      \  'html' : {
      \    'filters' : 'html',
      \    'indentation' : ' '
      \  },
      \  'css' : {
      \    'filters' : 'fc',
      \  },
      \}
"}
"
"" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

" リロード後に戻ってくるアプリ 変更してください
let g:returnApp = "MacVim"
nmap <Space>bc :ChromeReloadStart<CR>
nmap <Space>bC :ChromeReloadStop<CR>
nmap <Space>bf :FirefoxReloadStart<CR>
nmap <Space>bF :FirefoxReloadStop<CR>
nmap <Space>bs :SafariReloadStart<CR>
nmap <Space>bS :SafariReloadStop<CR>
nmap <Space>bo :OperaReloadStart<CR>
nmap <Space>bO :OperaReloadStop<CR>
nmap <Space>ba :AllBrowserReloadStart<CR>
nmap <Space>bA :AllBrowserReloadStop<CR>

" HTML 5 tags
syn keyword htmlTagName contained article aside audio bb canvas command
syn keyword htmlTagName contained datalist details dialog embed figure
syn keyword htmlTagName contained header hgroup keygen mark meter nav output
syn keyword htmlTagName contained progress time ruby rt rp section time
syn keyword htmlTagName contained source figcaption
syn keyword htmlArg contained autofocus autocomplete placeholder min max
syn keyword htmlArg contained contenteditable contextmenu draggable hidden
syn keyword htmlArg contained itemprop list sandbox subject spellcheck
syn keyword htmlArg contained novalidate seamless pattern formtarget
syn keyword htmlArg contained formaction formenctype formmethod
syn keyword htmlArg contained sizes scoped async reversed sandbox srcdoc
syn keyword htmlArg contained hidden role
syn match   htmlArg "\<\(aria-[\-a-zA-Z0-9_]\+\)=" contained
syn match   htmlArg contained "\s*data-[-a-zA-Z0-9_]\+"

"------------------------------------
" sass
"------------------------------------
""{{{
"let g:sass_compile_auto = 1
"let g:sass_compile_cdloop = 5
"let g:sass_compile_cssdir = ['css', 'stylesheet']
"let g:sass_compile_file = ['scss', 'sass']
"let g:sass_started_dirs = []
 
"autocmd FileType less,sass  setlocal sw=2 sts=2 ts=2 et
"au! BufWritePost * SassCompile
"}}}

set syntax=htmldjango

:set encoding=utf-8
:set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
:set fileformats=unix,dos,mac

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'open -a Preview.app'
let g:Tex_CompileRule_pdf = 'pdflatex -kanji=euc $*.tex'



:set nocompatible
:set whichwrap=b,s,h,l,<,>,[,],~

autocmd FileType scala :set dictionary=scala.dict
au FileType php :set dict=~/.vim/dict/php.dict


" neobundle"{{{
" コマンドを伴うやつの遅延読み込み
"bundle"{{{
" その他 {{{
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundleLazy 'taichouchou2/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ } }
" }}}

" 補完 {{{
"NeoBundleLazy 'Shougo/neocomplcache', {
"      \ 'autoload' : {
"      \   'insert' : 1,
"      \ }}
NeoBundleLazy 'Shougo/neosnippet', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}


" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/bin/rsense'
let g:rsenseUseOmniFunc = 1

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'


NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', { 'autoload' : {
  \ 'insert' : 1,
  \ 'filetypes': 'ruby',
  \ }}

" }}}

" 便利 {{{
" 範囲指定のコマンドが使えないので、tcommentのLazy化はNeoBundleのアップデートを待ちましょう...
NeoBundle 'tomtom/tcomment_vim'
NeoBundleLazy 'tpope/vim-surround', {
      \ 'autoload' : {
      \   'mappings' : [
      \     ['nx', '<Plug>Dsurround'], ['nx', '<Plug>Csurround'],
      \     ['nx', '<Plug>Ysurround'], ['nx', '<Plug>YSurround'],
      \     ['nx', '<Plug>Yssurround'], ['nx', '<Plug>YSsurround'],
      \     ['nx', '<Plug>YSsurround'], ['vx', '<Plug>VgSurround'],
      \     ['vx', '<Plug>VSurround']
      \ ]}}
" }}}

" ruby / railsサポート {{{
NeoBundle 'tpope/vim-rails'
NeoBundleLazy 'ujihisa/unite-rake', {
      \ 'depends' : 'Shougo/unite.vim' }
NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shjkougo/unite.vim' }
" NeoBundleLazy 'taichouchou2/unite-rails_best_practices', {
"       \ 'depends' : 'Shougo/unite.vim',
"       \ 'build' : {
"       \    'mac': 'gem install rails_best_practices',
"       \    'unix': 'gem install rails_best_practices',
"       \   }
"       \ }
" NeoBundleLazy 'taichouchou2/unite-reek', {
"       \ 'build' : {
"       \    'mac': 'gem install reek',
"       \    'unix': 'gem install reek',
"       \ },
"       \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] },
"       \ 'depends' : 'Shougo/unite.vim' }
" NeoBundleLazy 'taichouchou2/alpaca_complete', {
"       \ 'depends' : 'tpope/vim-rails',
"       \ 'build' : {
"       \    'mac':  'gem install alpaca_complete',
"       \    'unix': 'gem install alpaca_complete',
"       \   }
"       \ }


" .や::を入力したときにオムニ補完が有効になるようにする
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" 環境変数RSENSE_HOMEに'/usr/local/bin/rsense'を指定しても動く
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'

let s:bundle_rails = 'unite-rails unite-rails_best_practices unite-rake alpaca_complete'


"------------------------------------
" Unite-rails.vim
"------------------------------------
"{{{
function! UniteRailsSetting()
  nnoremap <buffer><C-H><C-H><C-H>  :<C-U>Unite rails/view<CR>
  nnoremap <buffer><C-H><C-H>       :<C-U>Unite rails/model<CR>
  nnoremap <buffer><C-H>            :<C-U>Unite rails/controller<CR>
 
  nnoremap <buffer><C-H>c           :<C-U>Unite rails/config<CR>
  nnoremap <buffer><C-H>s           :<C-U>Unite rails/spec<CR>
  nnoremap <buffer><C-H>m           :<C-U>Unite rails/db -input=migrate<CR>
  nnoremap <buffer><C-H>l           :<C-U>Unite rails/lib<CR>
  nnoremap <buffer><expr><C-H>g     ':e '.b:rails_root.'/Gemfile<CR>'
  nnoremap <buffer><expr><C-H>r     ':e '.b:rails_root.'/config/routes.rb<CR>'
  nnoremap <buffer><expr><C-H>se    ':e '.b:rails_root.'/db/seeds.rb<CR>'
  nnoremap <buffer><C-H>ra          :<C-U>Unite rails/rake<CR>
  nnoremap <buffer><C-H>h           :<C-U>Unite rails/heroku<CR>
endfunction
aug MyAutoCmd
  au User Rails call UniteRailsSetting()
aug END


function! s:bundleLoadDepends(bundle_names) "{{{
  " bundleの読み込み
  execute 'NeoBundleSource '.a:bundle_names
  au! RailsLazyPlugins
endfunction"}}}
aug RailsLazyPlugins
  au User Rails call <SID>bundleLoadDepends(s:bundle_rails)
aug END

" reference環境
NeoBundleLazy 'vim-ruby/vim-ruby', {
    \ 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }
NeoBundleLazy 'taka84u9/vim-ref-ri', {
      \ 'depends': ['Shougo/unite.vim', 'thinca/vim-ref'],
      \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }
NeoBundleLazy 'skwp/vim-rspec', {
      \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }
NeoBundleLazy 'ruby-matchit', {
    \ 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }
" }}}

" }}}
"}}}

"------------------------------------
" endwise.vim
"------------------------------------
"{{{
let g:endwise_no_mappings=1
"}}}

" NeoBundle 'taichouchou2/vim-rsense'

"------------------------------------
" neocomplcache
"------------------------------------
" 補完・履歴 neocomplcache "{{{
set infercase
 
"----------------------------------------
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
 
:set shiftwidth=2


au BufRead,BufNewFile *.coffee            set filetype=coffee
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab


" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

" taglistの設定 coffeeを追加
" let g:tlist_coffee_settings = 'coffee;f:function;v:variable'

" QuickRunのcoffee
" let g:quickrun_config['coffee'] = {
"      \'command' : 'coffee',
"      \'exec' : ['%c -cbp %s']
"      \}

"------------------------------------
" vim-coffee-script
"------------------------------------
" 保存時にコンパイル
" autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
autocmd BufWritePost *.coffee silent make!

"------------------------------------
" jasmine.vim
"------------------------------------
" ファイルタイプを変更
function! JasmineSetting()
  au BufRead,BufNewFile *Helper.js,*Spec.js  set filetype=jasmine.javascript
  au BufRead,BufNewFile *Helper.coffee,*Spec.coffee  set filetype=jasmine.coffee
  au BufRead,BufNewFile,BufReadPre *Helper.coffee,*Spec.coffee  let b:quickrun_config = {'type' : 'coffee'}
  call jasmine#load_snippets()
  map <buffer> <leader>m :JasmineRedGreen<CR>
  command! JasmineRedGreen :call jasmine#redgreen()
  command! JasmineMake :call jasmine#make()
endfunction
au BufRead,BufNewFile,BufReadPre *.coffee,*.js call JasmineSetting()

"------------------------------------
" indent_guides
"------------------------------------
" インデントの深さに色を付ける
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1

hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=237
au FileType coffee,ruby,javascript,python IndentGuidesEnable
nmap <silent><Leader>ig <Plug>IndentGuidesToggle

syntax enable
set background=dark
" colorscheme evening 
colorscheme solarized

"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi{<C-R>z}<ESC>
"vnoremap [ "zdi[<C-R>z]<ESC>
"vnoremap ( "zdi(<C-R>z)<ESC>
"vnoremap " "zdi"<C-R>z"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>

let g:SrcExpl_UpdateTags = 1

let g:neocomplcache_force_overwrite_completefunc = 1

nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let snf=&nf|set nf-=octal|let cl = col('.')|for nc in range(1, <count>?<count>-line('.'):1)|exe 'normal! j' . nc . <q-args>|call cursor('.', cl)|endfor|unlet cl|unlet snf

:set tabstop=4
:set autoindent
:set expandtab
:set shiftwidth=2

let g:vim_markdown_initial_foldlevel=1

augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
