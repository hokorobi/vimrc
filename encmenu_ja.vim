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

" �ǂݍ���
an 11.100.100 �G���R�[�h�w��(&N).�J��(&O)\.\.\..SJIS(&S)<Tab>fenc=cp932 :browse confirm e ++enc=cp932<CR>
if !s:support_jisx0213
  an 11.100.110 �G���R�[�h�w��(&N).�J��(&O)\.\.\..EUC(&E)<Tab>fenc=euc-jp :browse confirm e ++enc=euc-jp<CR>
  an 11.100.120 �G���R�[�h�w��(&N).�J��(&O)\.\.\..JIS(&J)<Tab>fenc=iso-2022-jp :browse confirm e ++enc=iso-2022-jp<CR>
else
  an 11.100.110 �G���R�[�h�w��(&N).�J��(&O)\.\.\..EUC(&E)<Tab>fenc=euc-jisx0213 :browse confirm e ++enc=euc-jisx0213<CR>
  an 11.100.120 �G���R�[�h�w��(&N).�J��(&O)\.\.\..JIS(&J)<Tab>fenc=iso-2022-jp-3 :browse confirm e ++enc=iso-2022-jp-3<CR>
endif
an 11.100.130 �G���R�[�h�w��(&N).�J��(&O)\.\.\..UTF-8(&8)<Tab>fenc=utf-8 :browse confirm e ++enc=utf-8<CR>

" �ēǍ�
an 11.110.100 �G���R�[�h�w��(&N).�ēǍ�(&R)\.\.\..SJIS(&S)<Tab>fenc=cp932 :e ++enc=cp932<CR>
if !s:support_jisx0213
  an 11.110.110 �G���R�[�h�w��(&N).�ēǍ�(&R)\.\.\..EUC(&E)<Tab>fenc=euc-jp :e ++enc=euc-jp<CR>
  an 11.110.120 �G���R�[�h�w��(&N).�ēǍ�(&R)\.\.\..JIS(&J)<Tab>fenc=iso-2022-jp :e ++enc=iso-2022-jp<CR>
else
  an 11.110.110 �G���R�[�h�w��(&N).�ēǍ�(&R)\.\.\..EUC(&E)<Tab>fenc=euc-jisx0213 :e ++enc=euc-jisx0213<CR>
  an 11.110.120 �G���R�[�h�w��(&N).�ēǍ�(&R)\.\.\..JIS(&J)<Tab>fenc=iso-2022-jp-3 :e ++enc=iso-2022-jp-3<CR>
endif
an 11.110.130 �G���R�[�h�w��(&N).�ēǍ�(&R)\.\.\..UTF-8(&8)<Tab>fenc=utf-8 :e ++enc=utf-8<CR>

" �ۑ�
an 11.115 �G���R�[�h�w��(&N).-SEP1- <Nop>
an 11.120.100 �G���R�[�h�w��(&N).�ۑ�(&S)\.\.\..SJIS(&S)<Tab>fenc=cp932 :set fenc=cp932 \| w<CR>
if !s:support_jisx0213
  an 11.120.110 �G���R�[�h�w��(&N).�ۑ�(&S)\.\.\..EUC(&E)<Tab>fenc=euc-jp :set fenc=euc-jp \| w<CR>
  an 11.120.120 �G���R�[�h�w��(&N).�ۑ�(&S)\.\.\..JIS(&J)<Tab>fenc=iso-2022-jp :set fenc=iso-2022-jp \| w<CR>
else
  an 11.120.110 �G���R�[�h�w��(&N).�ۑ�(&S)\.\.\..EUC(&E)<Tab>fenc=euc-jisx0213 :set fenc=euc-jisx0213 \| w<CR>
  an 11.120.120 �G���R�[�h�w��(&N).�ۑ�(&S)\.\.\..JIS(&J)<Tab>fenc=iso-2022-jp-3 :set fenc=iso-2022-jp-3 \| w<CR>
endif
an 11.120.130 �G���R�[�h�w��(&N).�ۑ�(&S)\.\.\..UTF-8(&8)<Tab>fenc=utf-8 :set fenc=utf-8 \| w<CR>

unlet s:support_jisx0213
