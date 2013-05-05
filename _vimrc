scriptencoding cp932  " ���̃t�@�C���̃G���R�[�f�B���O

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
"Kaoriya�łɓY�t����Ă���v���O�C���̖�����
"��肪������̂�����̂ňꗥ�ɖ��������܂��B
"�t�@�C�����Q��(�R�����g������ gf �����s)������ŁA�K�v�ȃv���O�C����
"let plugin_..._disable�̐ݒ�s���R�����g��(�폜)���ėL���ɂ��ĉ������B
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/kaoriya-trouble#TOC-Kaoriya-
"$VIM/plugins/kaoriya/autodate.vim
let plugin_autodate_disable  = 1
"$VIM/plugins/kaoriya/cmdex.vim
"let plugin_cmdex_disable     = 1  " Tutorial �͎g��
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
" ��{�ݒ�
set hidden  " �ҏW���ł����̃t�@�C�����J����悤�ɂ���
set whichwrap=b,s,h,l,<,>,[,]  " �J�[�\�����s���A�s���Ŏ~�܂�Ȃ��悤�ɂ���
set number  " �s�ԍ��\��
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P  " �X�e�[�^�X���C���ɕ����R�[�h�Ɖ��s������\��
"set clipboard=unnamed  " �N���b�v�{�[�h��OS�Ƌ��L
set guicursor=a:blinkon0  " �J�[�\����_�ł����Ȃ�

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
" �L�[�}�b�s���O

" ; �� : �̓���ւ�
noremap ; :
noremap : ;

" �\����̍s�ړ��ύX
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" �둀��h�~�̂��ߖ�����
nnoremap ZQ <Nop>  " �ۑ������ɕ���

" �o�b�t�@�ړ�
noremap <C-Right> :<C-u>bn<CR>
noremap <C-Left> :<C-u>bp<CR>

" �R�s�[�E�\��t��
vnoremap <C-c>	"+y
inoremap <C-v>	<MiddleMouse>
nnoremap <C-v>	"+gP
cnoremap <C-v>	<MiddleMouse>

" �J�[�\���ړ�
noremap <A-j>	<PageDown>
inoremap <A-j>	<PageDown>
noremap <A-k>	<PageUp>
inoremap <A-k>	<PageUp>

