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
" ��{�ݒ�
set hidden  " �ҏW���ł����̃t�@�C�����J����悤�ɂ���
set whichwrap=b,s,h,l,<,>,[,]  " �J�[�\�����s���A�s���Ŏ~�܂�Ȃ��悤�ɂ���
set number  " �s�ԍ��\��
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P  " �X�e�[�^�X���C���ɕ����R�[�h�Ɖ��s������\��

"---------------------------------------------------------------------------
" qfixapp��runtimepath��ʂ�(�p�X�͊��ɍ��킹�Ă�������)
set runtimepath+=M:\ols\Text\vim\plugins\qfixapp

" �L�[�}�b�v���[�_�[
let QFixHowm_Key = 'g'

" howm_dir�̓t�@�C����ۑ��������f�B���N�g����ݒ�
let howm_dir             = 'M:\OLS\Text\xyzzy\howm'
let howm_filename        = '%Y/%m/%Y%m%d%H%M%S.howm'
let howm_fileencoding    = 'cp932'
let howm_fileformat      = 'dos'
" �O��grep�̐ݒ�
"let mygrepprg            = 'M:\OLS\Utility\cmd\grep.exe'

"---------------------------------------------------------------------------
" Unite.vim
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]
 
"unite general settings
"�C���T�[�g���[�h�ŊJ�n
let g:unite_enable_start_insert = 1
"�ŋߊJ�����t�@�C�������̕ۑ���
let g:unite_source_file_mru_limit = 50
 
"file_mru�̕\���t�H�[�}�b�g���w��B��ɂ���ƕ\���X�s�[�h�������������
let g:unite_source_file_mru_filename_format = ''
 
"���݊J���Ă���t�@�C���̃f�B���N�g�����̃t�@�C���ꗗ�B
"�J���Ă��Ȃ��ꍇ�̓J�����g�f�B���N�g��
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"�o�b�t�@�ꗗ
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"���W�X�^�ꗗ
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"�ŋߎg�p�����t�@�C���ꗗ
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"�u�b�N�}�[�N�ꗗ
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"�u�b�N�}�[�N�ɒǉ�
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"unite���J���Ă���Ԃ̃L�[�}�b�s���O
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  "ESC��unite���I��
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "���̓��[�h�̂Ƃ�jj�Ńm�[�}�����[�h�Ɉړ�
  imap <buffer> jj <Plug>(unite_insert_leave)
  "���̓��[�h�̂Ƃ�ctrl+w�Ńo�b�N�X���b�V�����폜
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "ctrl+j�ŏc�ɕ������ĊJ��
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+j�ŉ��ɕ������ĊJ��
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+o�ł��̏ꏊ�ɊJ��
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

"--------------------------------------------------------------------------
" smartchr
" ���Z�q�̊Ԃɋ󔒂�����
inoremap <buffer> <expr> ( smartchr#loop('(', '()')
inoremap <buffer> <expr> { smartchr#loop('{', '{}')
inoremap <buffer> <expr> ` smartchr#loop('`', '`<>`_')
