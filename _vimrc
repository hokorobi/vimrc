scriptencoding cp932  " このファイルのエンコーディング

"---------------------------------------------------------------------------
" NeoBundle
set nocompatible
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
NeoBundle 'Shougo/neocomplcache'
NeoBundleLazy 'Rykka/riv.vim', {
      \ 'autoload':{
      \     'filetypes':['rst'],
      \   },
      \ }
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'rgarver/Kwbd.vim'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'Eivy/savevers.vim'
NeoBundleLazy 'tsukkee/lingr-vim', {
      \ 'autoload':{
      \     'commands':'LingrLaunch'
      \     },
      \ }
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'tyru/caw.vim'
NeoBundleLazy 'Shougo/vimshell', {
\   'autoload' : { 'commands' : [ 'VimShellBufferDir', 'VimShell' ] },
\   'depends': [ 'Shougo/vimproc' ],
\ }
" $HOME/_vim/bundle/vimproc/autoload に kaoriya vim 付属の vimproc_win32.dll を
" 配置

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
set scrolloff=999  " カーソルは画面上の真ん中に表示する
set backupdir=M:/Data/Backup/Win/OLS/Text/xyzzy/backup
" エンコードメニュー追加
" https://gist.github.com/koron/5562203
if filereadable(expand('$VIM/encmenu_ja.vim'))
  source $VIM/encmenu_ja.vim
endif


" vimrc 全体で使う augroup を定義
augroup MyVimrc
  autocmd!
augroup END

"---------------------------------------------------------------------------
" QFixHowm

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
nnoremap <silent> [unite]m :<C-u>Unite file_mru:long<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd MyVimrc FileType unite call s:unite_my_settings()
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
  "ctrl+lで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

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
let s:bundle = neobundle#get('Kwbd.vim')
function! s:bundle.hooks.on_source(bundle)
  function! My_bclose()
    if &modified == 0
      Kwbd
      return
    endif
    let confirm = confirm('Save buffer?', "&Yes\n&No\n&Cancel", 1, 'Question')
    if confirm == 1
      write
      Kwbd
    elseif confirm == 2
      Kwbd
    endif
  endfunction
  noremap <C-w>	:<C-u>call My_bclose()<CR>
endfunction
unlet s:bundle

"---------------------------------------------------------------------------
" open-browser
nmap <Space>o <Plug>(openbrowser-open)
vmap <Space>o <Plug>(openbrowser-open)

"---------------------------------------------------------------------------
" セッションの自動保存と復帰
" http://hail2u.net/blog/software/vim-auto-save-and-restore-session.html
autocmd MyVimrc VimEnter * nested call <SID>RestoreSessionWithConfirm()
autocmd MyVimrc VimLeave * execute 'SaveSession'

command! RestoreSession :source ~/_vim/.session
command! SaveSession    :mksession! ~/_vim/.session

" Restore session with confirm
function! s:RestoreSessionWithConfirm()
  let msg = 'Do you want to restore previous session?'

  if !argc() && confirm(msg, "&Yes\n&No", 1, 'Question') == 1
    execute 'RestoreSession'
  endif
endfunction


"---------------------------------------------------------------------------
" vim-smartinput

" vim では " は単一入力
call smartinput#define_rule({
      \   'at': '\%#',
      \   'char': '"',
      \   'input': '"',
      \   'filetype': ['vim'],
      \ })

"---------------------------------------------------------------------------
" savevers.vim
set backup
" savevers.vim バックアップファイルの設定" savevers.vimのためにパッチモードにします
set patchmode=.clean
" カンマで区切られたバックアップを作成するファイル名です "*.c,*.h,*.vim"
let savevers_types = "*"
" バックアップファイルが書き込まれるディレクトリ
" ここでは、オプション"backupdir"と同じディレクトリにしている
let savevers_dirs = &backupdir
"パッチモードでバージョン管理する最大数
let savevers_max = 10
" バックアップファイルとの比較でウィンドウのサイズを変更する場合は0
let versdiff_no_resize=1
" ウィンドウのサイズを変更する場合にどれだけの幅までを許可するか
"let versdiff_no_resize=80

"---------------------------------------------------------------------------
" lingr-vim
" id, password は別ファイルから読み込み
if filereadable(expand('~/_vim/_vimrc.local'))
  source ~/_vim/_vimrc.local
endif

"---------------------------------------------------------------------------
" Filetype
au MyVimrc FileType vim setlocal sw=2 ts=2 sts=2 et

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
vnoremap <C-c> "+y
inoremap <C-v> <MiddleMouse>
nnoremap <C-v> "+gP
cnoremap <C-v> <MiddleMouse>

" カーソル移動
noremap <A-j> <PageDown>
inoremap <A-j> <PageDown>
noremap <A-k> <PageUp>
inoremap <A-k> <PageUp>
inoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
noremap <C-e> $
noremap <C-a> 0
noremap <C-n> j
noremap <C-p> k
noremap <C-f> l
noremap <C-b> h
cnoremap <C-a> <Home>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-h> <BS>
cnoremap <C-d> <Del>

" ウィンドウ間移動
noremap <C-l> <C-w><C-w>

" ウィンドウを閉じる
noremap <C-q> :<C-u>close<CR>

" バッファ変更時のみ保存
nnoremap <silent> <C-s> :<C-u>update<CR>
inoremap <C-S> <C-O>:update<CR>

" ビジュアルモードローテーション
" ノーマルモードから v でビジュアルモード、さらに v で矩形ビジュアルモード、さ
" らに v でノーマルモード
vnoremap v <C-v>

" タブ間移動
noremap <C-Tab> :<C-u>tabnext<CR>
noremap <C-S-Tab> :<C-u>tabprevious<CR>

" インクリメンタルサーチで /, ? を簡単に検索できるようにする
" http://vim-users.jp/2009/10/hack91/
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

" 検索方向が変わってもnは下、Nは上に移動できるように対応
nnoremap <expr> n <SID>search_forward_p() ? 'n' : 'N'
nnoremap <expr> N <SID>search_forward_p() ? 'N' : 'n'
vnoremap <expr> n <SID>search_forward_p() ? 'n' : 'N'
vnoremap <expr> N <SID>search_forward_p() ? 'N' : 'n'
onoremap <expr> n <SID>search_forward_p() ? 'n' : 'N'
onoremap <expr> N <SID>search_forward_p() ? 'N' : 'n'
function! s:search_forward_p()
  return exists('v:searchforward') ? v:searchforward : 1
endfunction

" インクリメンタルサーチの最中に次、前の候補に移動する
cnoremap <expr> <C-s> getcmdtype() == '?' ? "<CR>/<Up>" : getcmdtype() == '/' ? "<CR>/<Up>" : "<C-s>"
cnoremap <expr> <C-r> getcmdtype() == '?' ? "<CR>?<Up>" : getcmdtype() == '/' ? "<CR>?<Up>" : "<C-r>"

