set nocompatible
filetype off            " for vundle

if has("vim_starting")
  set rtp+=$HOME/_vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/_vim/bundle'))

" NeoBundle
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Align'
NeoBundle 'surround.vim'
NeoBundle 'smartchr'

filetype plugin on
filetype indent on

"---------------------------------------------------------------------------
" 基本設定
set hidden  " 編集中でも他のファイルを開けるようにする
set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする
set number  " 行番号表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P  " ステータスラインに文字コードと改行文字を表示

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
let mygrepprg            = 'M:\OLS\Utility\cmd\grep.exe'

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
inoremap <buffer><expr> < search('^#include\%#', 'bcn')? ' <': smartchr#one_of(' < ', ' << ', '<')
inoremap <buffer><expr> > search('^#include <.*\%#', 'bcn')? '>': smartchr#one_of(' > ', ' >> ', '>')
inoremap <buffer><expr> + smartchr#one_of(' + ', '++', '+')
inoremap <buffer><expr> - smartchr#one_of(' - ', '--', '-')
inoremap <buffer><expr> / smartchr#one_of(' / ', '// ', '/')
" *はポインタで使うので、空白はいれない
inoremap <buffer><expr> & smartchr#one_of(' & ', ' && ', '&')
inoremap <buffer><expr> % smartchr#one_of(' % ', '%')
inoremap <buffer><expr> <Bar> smartchr#one_of(' <Bar> ', ' <Bar><Bar> ', '<Bar>')
inoremap <buffer><expr> , smartchr#one_of(', ', ',')
" 3項演算子の場合は、後ろのみ空白を入れる
inoremap <buffer><expr> ? smartchr#one_of('? ', '?')
inoremap <buffer><expr> : smartchr#one_of(': ', '::', ':')

" =の場合、単純な代入や比較演算子として入力する場合は前後にスペースをいれる。
" 複合演算代入としての入力の場合は、直前のスペースを削除して=を入力
inoremap <buffer><expr> = search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs>= '
				\ : search('\(*\<bar>!\)\%#', 'bcn') ? '= '
				\ : smartchr#one_of(' = ', ' == ', '=')

" 下記の文字は連続して現れることがまれなので、二回続けて入力したら改行する
inoremap <buffer><expr> } smartchr#one_of('}', '}<cr>')
inoremap <buffer><expr> ; smartchr#one_of(';', ';<cr>')
" 「->」は入力しづらいので、..で置換え
inoremap <buffer><expr> . smartchr#loop('.', '->', '...')
" 行先頭での@入力で、プリプロセス命令文を入力
inoremap <buffer><expr> @ search('^\(#.\+\)\?\%#','bcn')? smartchr#one_of('#define', '#include', '#ifdef', '#endif', '@'): '@'

inoremap <buffer><expr> " search('^#include\%#', 'bcn')? ' "': '"'
" if文直後の(は自動で間に空白を入れる
inoremap <buffer><expr> ( search('\<\if\%#', 'bcn')? ' (': '('

