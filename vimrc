set fileformats=unix
set shiftwidth=3
set softtabstop=3
set expandtab
syntax on

set hlsearch
set diffopt+=iwhite
set hidden
set nocompatible               " be iMproved
set ignorecase
set number
set ruler
set smartindent

"set tw to 500
set tw=500
"set rtp+=~/.vim/pythonf/
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"This function seems to send the cursor to the beginning
"of the file whenever its called so we will store the initial
"cursor position and then after executing the command send it back
"to where it was. :)
function! TagbarTogglePauseMacro()
   TagbarToggle
   TagbarTogglePause
endfunction

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-pathogen'

" My Bundles here:
"
" original repos on github
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" git repos on your local machine (ie. when working on your own plugin)
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/syntastic'
Bundle 'ivanov/vim-ipython'
"Bundle 'Lokaltog/powerline' , {'rtp': 'powerline/bindings/vim/'}
Bundle 'Command-T'
Bundle 'Doxygen-via-Doxygen'
Bundle 'DoxygenToolkit.vim'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'SyntaxComplete'
Bundle 'Tabular'
Bundle 'Tagbar'
Bundle 'VisIncr'
Bundle 'ack.vim'
Bundle 'bufexplorer.zip'
Bundle 'doxygen-support.vim'
Bundle 'fugitive.vim'
Bundle 'gundo'
Bundle 'neocomplcache'
Bundle 'pathogen.vim'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-sleuth'
Bundle "pangloss/vim-javascript"
Bundle 'ervandew/screen'


" ...
"let g:clang_format_style = '/home/gupta/Transatsuite/transatMB/transat-format'
"let g:ycm_global_ycm_extra_conf = '/home/gupta/Transatsuite/transatMB/.ycm_extra_conf.py'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
nnoremap U :GundoToggle<CR>
execute pathogen#infect()

"Doxygen Shortcuts
noremap <silent><C-X><C-D> :DoxyClass<CR>
noremap <silent><C-X><C-F> :DoxyFunction<CR>
noremap <silent><C-X><C-M> :DoxyBriefAfterMember<CR>
noremap <silent><C-X><C-H> :DoxyFILEHeader<CR>
noremap <silent><C-X><C-B><C-B> :DoxyBriefDetailed<CR>
noremap <silent><C-X><C-B> :DoxyBlockLong<CR>
"let g:syntastic_cxx_compiler = 'clang++'
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_errorformat = '%f:%l:%c: %trror :%m'
"let g:syntastic_c_compiler = 'clang'
"let g:syntastic_c_errorformat = '%f:%l:%c: %trror: %m'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['fortran']}

let g:ycm_register_as_syntastic_checker=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:ycm_autoclose_preview_window_after_insertion = 1
""This should be there so that ycm errors are pushed to syntastic
let g:syntastic_always_populate_loc_list = 1
"Compile when <F5> is pressed
nnoremap <F5> :YcmDiags<CR>
"Go to defnition or declaration
nnoremap <F4> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"To open a list of buffers
nnoremap <silent><space> :BufExplorer<CR>
nnoremap <F6> :lnext<CR>

"let g:syntastic_cpp_config_file = '.syntastic'
"let g:syntastic_fortran_compiler = 'mpif90'
"let g:syntastic_fortran_compiler_options = '-fdefault-real-8 -ffree-form'
"let g:syntastic_fortran_config_file = '/home/gupta/Transatsuite/transatMB/.syntastic_fortran'
autocmd FileType fortran set omnifunc=syntaxcomplete#Complete
"if has("autocmd") && exists("+omnifunc")
"        autocmd Filetype *
"                \   if &omnifunc == "" |
"                        \       setlocal omnifunc=syntaxcomplete#Complete |
"                                \   endif
"                                endif
let g:ycm_cache_omnifunc = 1
"This ensures that when we open a file using :e 
"it shows all options
set wildmenu
set wildmode=longest:full
"set completeopt=longest,menu,preview 
set completeopt=longest,menuone

"Tagbar
let g:tagbar_width = 75
let g:tagbar_type_cpp = {
            \ 'ctagstype' : 'c++',
            \ 'kinds'     : [
                \ 'd:macros:1:0',
                \ 'p:prototypes:1:0',
                \ 'g:enums',
                \ 'e:enumerators:0:0',
                \ 't:typedefs:1:0',
                \ 'n:namespaces',
                \ 'c:classes',
                \ 's:structs',
                \ 'u:unions',
                \ 'f:functions',
                \ 'm:members:1:0',
                \ 'v:variables'
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
                \ 'g' : 'enum',
                \ 'n' : 'namespace',
                \ 'c' : 'class',
                \ 's' : 'struct',
                \ 'u' : 'union'
            \ },
            \ 'scope2kind' : {
                \ 'enum'      : 'g',
                \ 'namespace' : 'n',
                \ 'class'     : 'c',
                \ 'struct'    : 's',
                \ 'union'     : 'u'
            \ }
        \ }
nnoremap <silent><C-A><C-K> :pyf ~/.vim/pythonf/clang-format-all.py<CR>
vnoremap <silent><C-K> :pyf ~/.vim/pythonf/clang-format.py<CR>
imap <silent><C-K> <ESC>:pyf ~/.vim/pythonf/clang-format.py<CR>i

command! DefinitionTree call TagbarTogglePauseMacro()
nnoremap <silent> <F9> :DefinitionTree<CR>
let g:ycm_filetype_whitelist = {'python' : 1,
               \ 'cpp' : 1}
"So that the vim window is not close when we close the error window
let g:ycm_confirm_extra_conf = 0
"Toggle error location list
let g:lt_location_list_toggle_map = '<C-L>'
let g:lt_quickfix_list_toggle_map = '<C-F>'
"Powerline
set laststatus=2
" ---------------- "
" VIM latex-suite  "
" ---------------- "

" REQUIRED. This makes vim invoke latex-suite when you open a tex file.
filetype plugin on
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf="evince"
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
" set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
"set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on
"
"" für make

"Doxygen
"let g:DoxygenToolkit_briefTag_pre="@Synopsis  " 
"let g:DoxygenToolkit_paramTag_pre="@Param " 
"let g:DoxygenToolkit_returnTag="@Returns   " 
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
"let g:DoxygenToolkit_authorName="Shubham Gupta" 

"let g:ycm_extra_conf_globlist = ['~/Transatsuite/transatMB/*','!~/*']
"for clang-format
"Taglist
"let Tlist_Use_Right_Window = 1
"let Tlist_Compact_Format = 1
"let Tlist_File_Fold_Auto_Close = 1
"let Tlist_Process_File_Always = 1
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
set winaltkeys=no
"let c='a'
"while c <= 'z'
"exec "set <A-".c.">=\e".c
"exec "imap \e".c." <A-".c.">"
"let c = nr2char(1+char2nr(c))
"endw
set backspace=indent,eol,start
nnoremap <C-I> <C-]>
nnoremap <C-X><C-A> :Tabularize /
vnoremap <C-X><C-A> :Tabularize /
let g:neocomplcache_enable_at_startup = 1
set background=dark
let g:solarized_termcolors = 16
let g:solarized_termtrans = 1
colorscheme onedark
"set guifont=Inconsolata\ for\ Powerline:h15
"let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set mouse=a
set laststatus=2
set viewoptions=cursor,folds,slash,unix 
let g:skipview_files = ['*\.vim'] 
let g:indentLine_color_term = 239
let g:indentLine_char = '│'

"Select pasted text using gp
nnoremap gp `[v`]
set re=1
let g:rehash256 = 1
let g:molokai_original = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:rainbow_activate = 1
let loaded_rainbow = 1
