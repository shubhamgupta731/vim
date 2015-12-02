set fileformats=unix
set shiftwidth=3
set softtabstop=3
syntax on
let mapleader=','

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
Bundle 'SyntaxComplete'
Bundle 'Tabular'
"Bundle 'Tagbar'
Bundle 'ack.vim'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'doxygen-support.vim'
Bundle 'fugitive.vim'
Bundle 'gundo'
Bundle 'pathogen.vim'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-sleuth'
Bundle "pangloss/vim-javascript"
Bundle 'ervandew/screen'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'Shougo/vimshell.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'ervandew/matchem'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/VisIncr'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'KurtPreston/vim-autoformat-rails'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'surround.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'basyura/unite-rails'
Plugin 'Shougo/unite-outline'
Plugin 'thoughtbot/vim-rspec'

" ...
"let g:clang_format_style = '/home/gupta/Transatsuite/transatMB/transat-format'
let g:ycm_global_ycm_extra_conf = '/home/gupta/Transatsuite/transatMB/.ycm_extra_conf.py'
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
"let g:SYNTASTIC_C_ERRORFORMAT = '%f:%l:%c: %trror: %m'
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
nnoremap <C-A> :Tabularize /
vnoremap <C-A> :Tabularize /
let g:neocomplcache_enable_at_startup = 1
"set background=dark
let g:solarized_termcolors = 16
let g:solarized_termtrans = 1
colorscheme onedark-customized
"set guifont=Inconsolata\ for\ Powerline:h15
"let g:Powerline_symbols = 'fancy'
"let g:airline_powerline_fonts = 1
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color
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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
let g:rainbow_activate = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|a)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }
let loaded_rainbow = 1
let g:airline_theme= 'serene'
let g:airline_right_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_left_sep = ' '
"let g:cpp_class_scope_highlight = 1
"let g:cpp_experimental_template_highlight = 1
if executable('ag')
    let g:unite_source_rec_async_command =
                \ 'ag --follow --nocolor --nogroup --hidden -g ""'
endif
let g:unite_source_history_yank_enable = 1

" For unite-menu.
let g:unite_source_menu_menus = {}

let g:unite_source_menu_menus.git = {
    \ 'description' : '            gestionar repositorios git
        \                            ⌘ [espacio]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git status       (Fugitive)                                ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff         (Fugitive)                                ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit       (Fugitive)                                ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log          (Fugitive)                                ⌘ ,gl',
        \'exe "silent Glog | Unite quickfix"'],
    \['▷ git blame        (Fugitive)                                ⌘ ,gb',
        \'Gblame'],
    \['▷ git stage        (Fugitive)                                ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout     (Fugitive)                                ⌘ ,go',
        \'Gread'],
    \['▷ git rm           (Fugitive)                                ⌘ ,gr',
        \'Gremove'],
    \['▷ git mv           (Fugitive)                                ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
        \'Git! pull'],
    \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git cd           (Fugitive)',
        \'Gcd'],
    \]
nnoremap <silent>mg :Unite -silent -start-insert menu:git<CR>
let g:vimshell_prompt="~"
let g:vimshell_prompt_expr =
\ 'escape(fnamemodify(getcwd(), ":~")." $", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+$ '
let g:formatdef_clangformat = '"clang-format -style=file"'
let g:onedark_background_color="282c34"
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]\%V/&'.char.'/ge'

endfunction

function! ShowColorScheme()
  so $VIMRUNTIME/syntax/hitest.vim
endfunction

function! ShowSyntaxGroupUnderCursor()
  call SyntaxAttr()
endfunction

let vim_markdown_preview_github=1
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_toggle=2
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
let g:vimshell_editor_command="mvim"
let g:rubycomplete_rails = 1
set expandtab
let g:syntastic_eruby_checkers=['rubocop']
set cc=80
let g:javascript_enable_domhtmlcss = 1
let g:ycm_collect_identifiers_from_tags_files = 1
"let g:loaded_youcompleteme = 1
" Call SyntasticCheck ruboocp
nnoremap <leader>fr :SyntasticCheck rubocop<cr>
nnoremap <leader>fw :FixWhitespace<cr>
nnoremap <leader>ev :vs $MYVIMRC <cr>
nnoremap <leader>sv :source $MYVIMRC <cr>
nnoremap <leader>aw :Ack<cword><CR>
let g:onedark_terminal_italics=1
let g:onedark_termcolors=16
