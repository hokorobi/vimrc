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
