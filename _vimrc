scriptencoding cp932  " このファイルのエンコーディング

"---------------------------------------------------------------------------
" NeoBundle
set nocompatible
filetype off

if has("vim_starting")
  set rtp+=$HOME/_vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/_vim/bundle'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Align'
NeoBundle 'anyakichi/vim-surround'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'rgarver/Kwbd.vim'
NeoBundle 'Rykka/riv.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'rgarver/Kwbd.vim'

filetype plugin on
filetype indent on

"---------------------------------------------------------------------------
"Kaoriya版に添付されているプラグインの無効化
"問題があるものもあるので一律に無効化します。
"ファイルを参照(コメント部分で gf を実行)した上で、必要なプラグインは
"let plugin_..._disableの設定行をコメント化(削除)して有効にして下さい。
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/kaoriya-trouble#TOC-Kaoriya-
"$VIM/plugins/kaoriya/autodate.vim
let plugin_autodate_disable  = 1
"$VIM/plugins/kaoriya/cmdex.vim
"let plugin_cmdex_disable     = 1  " Tutorial は使う
"$VIM/plugins/kaoriya/dicwin.vim
let plugin_dicwin_disable    = 1
"$VIMRUNTIME/plugin/format.vim
let plugin_format_disable    = 1
"$VIM/plugins/kaoriya/hz_ja.vim
let plugin_hz_ja_disable     = 1
"$VIM/plugins/kaoriya/scrnmode.vim
let plugin_scrnmode_disable  = 1
"$VIM/plugins/kaoriya/verifyenc.vim
"let plugin_verifyenc_disable = 1

"---------------------------------------------------------------------------
" 基本設定
set hidden  " 編集中でも他のファイルを開けるようにする
set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする
set number  " 行番号表示
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P  " ステータスラインに文字コードと改行文字を表示
"set clipboard=unnamed  " クリップボードをOSと共有
set guicursor=a:blinkon0  " カーソルを点滅させない

"---------------------------------------------------------------------------
" qfixappにruntimepathを通す(パスは環境に合わせてください)
set runtimepath+=M:\ols\Text\vim\plugins\qfixapp

" キーマップリーダー
let QFixHowm_Key = 'g'

" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = 'M:\OLS\Text\xyzzy\howm'
let howm_filename        = '%Y/%m/%Y%m%d%H%M%S.howm'
let howm_fileencoding    = 'cp932'
let howm_fileformat      = 'dos'
" 外部grepの設定
"let mygrepprg            = 'M:\OLS\Utility\cmd\grep.exe'

"---------------------------------------------------------------------------
" Unite.vim
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]
 
"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50
 
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''
 
"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+jで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

"--------------------------------------------------------------------------
" smartchr
" 演算子の間に空白を入れる
inoremap <buffer> <expr> ( smartchr#loop('(', '()')
inoremap <buffer> <expr> { smartchr#loop('{', '{}')
inoremap <buffer> <expr> ` smartchr#loop('`', '`<>`_')

"---------------------------------------------------------------------------
" neocomplcache
" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
" let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"---------------------------------------------------------------------------
" kwbd
noremap <C-w>	:Kwbd<CR>

"---------------------------------------------------------------------------
" キーマッピング

" ; と : の入れ替え
noremap ; :
noremap : ;

" 表示上の行移動変更
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" 誤操作防止のため無効へ
nnoremap ZQ <Nop>  " 保存せずに閉じる

" バッファ移動
noremap <C-Right> :<C-u>bn<CR>
noremap <C-Left> :<C-u>bp<CR>

" コピー・貼り付け
vnoremap <C-c>	"+y
inoremap <C-v>	<MiddleMouse>
nnoremap <C-v>	"+gP
cnoremap <C-v>	<MiddleMouse>

" カーソル移動
noremap <A-j>	<PageDown>
inoremap <A-j>	<PageDown>
noremap <A-k>	<PageUp>
inoremap <A-k>	<PageUp>

