" vi:set sts=2 sw=2 tw=0 et:
"
" encmenu.vim - Add encode related menu items.
"
" Maintainer:   MURAOKA Taro <koron.kaoriya@gmail.com>
"
" Copyright (C) 2013 MURAOKA Taro <koron.kaoriya@gmail.com>
" THIS FILE IS DISTRIBUTED UNDER THE VIM LICENSE.

scriptencoding cp932

if !has('iconv') || exists('g:loaded_encmenu_ja')
  finish
end
let g:loaded_encmenu_ja = 1

let s:support_jisx0213 = (iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb") ? 1 : 0

" 読み込み
an 11.100.100 エンコード指定(&N).開く(&O)\.\.\..SJIS(&S)<Tab>fenc=cp932 :browse confirm e ++enc=cp932<CR>
if !s:support_jisx0213
  an 11.100.110 エンコード指定(&N).開く(&O)\.\.\..EUC(&E)<Tab>fenc=euc-jp :browse confirm e ++enc=euc-jp<CR>
  an 11.100.120 エンコード指定(&N).開く(&O)\.\.\..JIS(&J)<Tab>fenc=iso-2022-jp :browse confirm e ++enc=iso-2022-jp<CR>
else
  an 11.100.110 エンコード指定(&N).開く(&O)\.\.\..EUC(&E)<Tab>fenc=euc-jisx0213 :browse confirm e ++enc=euc-jisx0213<CR>
  an 11.100.120 エンコード指定(&N).開く(&O)\.\.\..JIS(&J)<Tab>fenc=iso-2022-jp-3 :browse confirm e ++enc=iso-2022-jp-3<CR>
endif
an 11.100.130 エンコード指定(&N).開く(&O)\.\.\..UTF-8(&8)<Tab>fenc=utf-8 :browse confirm e ++enc=utf-8<CR>

" 再読込
an 11.110.100 エンコード指定(&N).再読込(&R)\.\.\..SJIS(&S)<Tab>fenc=cp932 :e ++enc=cp932<CR>
if !s:support_jisx0213
  an 11.110.110 エンコード指定(&N).再読込(&R)\.\.\..EUC(&E)<Tab>fenc=euc-jp :e ++enc=euc-jp<CR>
  an 11.110.120 エンコード指定(&N).再読込(&R)\.\.\..JIS(&J)<Tab>fenc=iso-2022-jp :e ++enc=iso-2022-jp<CR>
else
  an 11.110.110 エンコード指定(&N).再読込(&R)\.\.\..EUC(&E)<Tab>fenc=euc-jisx0213 :e ++enc=euc-jisx0213<CR>
  an 11.110.120 エンコード指定(&N).再読込(&R)\.\.\..JIS(&J)<Tab>fenc=iso-2022-jp-3 :e ++enc=iso-2022-jp-3<CR>
endif
an 11.110.130 エンコード指定(&N).再読込(&R)\.\.\..UTF-8(&8)<Tab>fenc=utf-8 :e ++enc=utf-8<CR>

" 保存
an 11.115 エンコード指定(&N).-SEP1- <Nop>
an 11.120.100 エンコード指定(&N).保存(&S)\.\.\..SJIS(&S)<Tab>fenc=cp932 :set fenc=cp932 \| w<CR>
if !s:support_jisx0213
  an 11.120.110 エンコード指定(&N).保存(&S)\.\.\..EUC(&E)<Tab>fenc=euc-jp :set fenc=euc-jp \| w<CR>
  an 11.120.120 エンコード指定(&N).保存(&S)\.\.\..JIS(&J)<Tab>fenc=iso-2022-jp :set fenc=iso-2022-jp \| w<CR>
else
  an 11.120.110 エンコード指定(&N).保存(&S)\.\.\..EUC(&E)<Tab>fenc=euc-jisx0213 :set fenc=euc-jisx0213 \| w<CR>
  an 11.120.120 エンコード指定(&N).保存(&S)\.\.\..JIS(&J)<Tab>fenc=iso-2022-jp-3 :set fenc=iso-2022-jp-3 \| w<CR>
endif
an 11.120.130 エンコード指定(&N).保存(&S)\.\.\..UTF-8(&8)<Tab>fenc=utf-8 :set fenc=utf-8 \| w<CR>

unlet s:support_jisx0213
