scriptencoding cp932  " このファイルのエンコーディング

"---------------------------------------------------------------------------
" NeoBundle
set nocompatible
if has("vim_starting")
  set rtp+=$HOME/_vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/_vim/bundle'))

NeoBundleDisable 'rgarver/Kwbd.vim'
filetype plugin on
filetype indent on


"---------------------------------------------------------------------------
" kwbd
let s:hooks = neobundle#get_hooks('Kwbd.vim')
function! s:hooks.on_source(bundle)
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
unlet s:hooks

