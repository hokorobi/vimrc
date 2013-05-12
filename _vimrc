scriptencoding cp932  " ���̃t�@�C���̃G���R�[�f�B���O

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
" $HOME/_vim/bundle/vimproc/autoload �� kaoriya vim �t���� vimproc_win32.dll ��
" �z�u

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
set scrolloff=999  " �J�[�\���͉�ʏ�̐^�񒆂ɕ\������
set backupdir=M:/Data/Backup/Win/OLS/Text/xyzzy/backup
" �G���R�[�h���j���[�ǉ�
" https://gist.github.com/koron/5562203
if filereadable(expand('$VIM/encmenu_ja.vim'))
  source $VIM/encmenu_ja.vim
endif


" vimrc �S�̂Ŏg�� augroup ���`
augroup MyVimrc
  autocmd!
augroup END

"---------------------------------------------------------------------------
" QFixHowm

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
nnoremap <silent> [unite]m :<C-u>Unite file_mru:long<CR>
"�u�b�N�}�[�N�ꗗ
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"�u�b�N�}�[�N�ɒǉ�
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"unite���J���Ă���Ԃ̃L�[�}�b�s���O
autocmd MyVimrc FileType unite call s:unite_my_settings()
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
  "ctrl+l�ŉ��ɕ������ĊJ��
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+o�ł��̏ꏊ�ɊJ��
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
" �Z�b�V�����̎����ۑ��ƕ��A
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

" vim �ł� " �͒P�����
call smartinput#define_rule({
      \   'at': '\%#',
      \   'char': '"',
      \   'input': '"',
      \   'filetype': ['vim'],
      \ })

"---------------------------------------------------------------------------
" savevers.vim
set backup
" savevers.vim �o�b�N�A�b�v�t�@�C���̐ݒ�" savevers.vim�̂��߂Ƀp�b�`���[�h�ɂ��܂�
set patchmode=.clean
" �J���}�ŋ�؂�ꂽ�o�b�N�A�b�v���쐬����t�@�C�����ł� "*.c,*.h,*.vim"
let savevers_types = "*"
" �o�b�N�A�b�v�t�@�C�����������܂��f�B���N�g��
" �����ł́A�I�v�V����"backupdir"�Ɠ����f�B���N�g���ɂ��Ă���
let savevers_dirs = &backupdir
"�p�b�`���[�h�Ńo�[�W�����Ǘ�����ő吔
let savevers_max = 10
" �o�b�N�A�b�v�t�@�C���Ƃ̔�r�ŃE�B���h�E�̃T�C�Y��ύX����ꍇ��0
let versdiff_no_resize=1
" �E�B���h�E�̃T�C�Y��ύX����ꍇ�ɂǂꂾ���̕��܂ł������邩
"let versdiff_no_resize=80

"---------------------------------------------------------------------------
" lingr-vim
" id, password �͕ʃt�@�C������ǂݍ���
if filereadable(expand('~/_vim/_vimrc.local'))
  source ~/_vim/_vimrc.local
endif

"---------------------------------------------------------------------------
" Filetype
au MyVimrc FileType vim setlocal sw=2 ts=2 sts=2 et

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
vnoremap <C-c> "+y
inoremap <C-v> <MiddleMouse>
nnoremap <C-v> "+gP
cnoremap <C-v> <MiddleMouse>

" �J�[�\���ړ�
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

" �E�B���h�E�Ԉړ�
noremap <C-l> <C-w><C-w>

" �E�B���h�E�����
noremap <C-q> :<C-u>close<CR>

" �o�b�t�@�ύX���̂ݕۑ�
nnoremap <silent> <C-s> :<C-u>update<CR>
inoremap <C-S> <C-O>:update<CR>

" �r�W���A�����[�h���[�e�[�V����
" �m�[�}�����[�h���� v �Ńr�W���A�����[�h�A����� v �ŋ�`�r�W���A�����[�h�A��
" ��� v �Ńm�[�}�����[�h
vnoremap v <C-v>

" �^�u�Ԉړ�
noremap <C-Tab> :<C-u>tabnext<CR>
noremap <C-S-Tab> :<C-u>tabprevious<CR>

" �C���N�������^���T�[�`�� /, ? ���ȒP�Ɍ����ł���悤�ɂ���
" http://vim-users.jp/2009/10/hack91/
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

" �����������ς���Ă�n�͉��AN�͏�Ɉړ��ł���悤�ɑΉ�
nnoremap <expr> n <SID>search_forward_p() ? 'n' : 'N'
nnoremap <expr> N <SID>search_forward_p() ? 'N' : 'n'
vnoremap <expr> n <SID>search_forward_p() ? 'n' : 'N'
vnoremap <expr> N <SID>search_forward_p() ? 'N' : 'n'
onoremap <expr> n <SID>search_forward_p() ? 'n' : 'N'
onoremap <expr> N <SID>search_forward_p() ? 'N' : 'n'
function! s:search_forward_p()
  return exists('v:searchforward') ? v:searchforward : 1
endfunction

" �C���N�������^���T�[�`�̍Œ��Ɏ��A�O�̌��Ɉړ�����
cnoremap <expr> <C-s> getcmdtype() == '?' ? "<CR>/<Up>" : getcmdtype() == '/' ? "<CR>/<Up>" : "<C-s>"
cnoremap <expr> <C-r> getcmdtype() == '?' ? "<CR>?<Up>" : getcmdtype() == '/' ? "<CR>?<Up>" : "<C-r>"

