set nocompatible " must be first line

fun SetupVAM()
  " YES, you can customize this vam_install_path path and everything still works!
  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  " * unix based os users may want to use this code checking out VAM
  " * windows users want to use http://mawercer.de/~marc/vam/index.php
  "   to fetch VAM, VAM-known-repositories and the listed plugins
  "   without having to install curl, unzip, git tool chain first
  if !isdirectory(vam_install_path.'/vim-addon-manager') && 1 == confirm("git clone VAM into ".vam_install_path."?","&Y\n&N")
    " I'm sorry having to add this reminder. Eventually it'll pay off.
    call confirm("Remind yourself that most plugins ship with documentation (README*, doc/*.txt). Its your first source of knowledge. If you can't find the info you're looking for in reasonable time ask maintainers to improve documentation")
    exec '!p='.shellescape(vam_install_path).'; mkdir -p "$p" && cd "$p" && git clone --depth 1 git://github.com/MarcWeber/vim-addon-manager.git'
  endif

  " call vam#ActivateAddons(['FuzzyFinder', 'delimitMate', 'checksyntax', 'HTML_AutoCloseTag', 'fugitive', 'phpfolding', 'phpcomplete', 'php_check_syntax', 'PIV', 'DirDiff', 'vim-twig', 'The_NERD_tree', 'matchit.zip', 'taglist'], {'auto_install' : 1})
  call vam#ActivateAddons(['delimitMate', 'checksyntax', 'HTML_AutoCloseTag', 'fugitive', 'phpfolding', 'phpcomplete', 'php_check_syntax', 'PIV', 'DirDiff', 'vim-twig', 'The_NERD_tree', 'matchit.zip', 'taglist'], {'auto_install' : 1})
  " sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})
  " where pluginA could be github:YourName or snipmate-snippets see vam#install#RewriteName()
  " also see section "5. Installing plugins" in VAM's documentation
  " which will tell you how to find the plugin names of a plugin
endf

call SetupVAM()
" experimental: run after gui has been started (gvim) [3]
" option1:  au VimEnter * call SetupVAM()
" option2:  au GUIEnter * call SetupVAM()
" See BUGS sections below [*]

set number
colorscheme desert
nmap <silent> <c-e> :NERDTreeToggle<CR>

syntax on

set nocompatible        " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set incsearch          " Incremental search
"set autowrite          " Automatically save before commands like :next and :make
set tabstop=4
set shiftwidth=4
set expandtab   " taby wypelniane spacjami
set hlsearch            " zaznacza wszystkie wystapienia szukanego tekstu
set nowrap              " wylacza zawijanie dlugich linii
set mouse=a
set smartindent
set textwidth=0
set wrapmargin=0

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

source ~/.vim/php-doc.vim
inoremap <C-P> ^[:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

let g:DirDiffDynamicDiffText = 1
set tags=~/tags

function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-N>"
endfunction


" generowanie nowych ctagos
command R !~/bin/tags.sh set tags=~/tags

" od gościa z githuba

    set backspace=indent,eol,start  " backspace for dummys
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set winminheight=0              " windows can be 0 line high
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    set wildmenu                    " show list instead of just completing
    set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
"    set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
    set scrolljump=5                " lines to scroll when cursor leaves screen
    set scrolloff=3                 " minimum lines to keep above and below cursor
    set foldenable                  " auto fold code
    set gdefault                    " the /g flag on :s substitutions by default
    set list
    set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace


if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
                                " selected characters/lines in visual mode
endif



if has('statusline')
    set laststatus=2

   " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
   "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

if has("autocmd")
    au BufReadPost if line("'\") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
"    autocmd FileType c,cpp,java,php,js,python,twig,xml,yml,tpl autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd BufNewFile,BufRead *.twig set filetype=twig
    autocmd BufNewFile,BufRead *.html.twig set filetype=htmltwig
endif

if exists('+colorcolumn')
    set colorcolumn=120
else
    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%121v.\+/
endif

" Fuzzy Finder {
    """ Fuzzy Find file, tree, buffer, line
    nmap <leader>ff :FufFile
    nmap <leader>ft :FufFile
    nmap <leader>fb :FufBuffer
    nmap <leader>fl :FufLine
    nmap <leader>fr :FufRenewCache
" }}

let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
let g:ctags_statusline=1


if &diff
    set background=dark
    colorscheme peaksea
endif

set hidden "Switch between unsaved buffers w/o needing to save, preserves history
filetype indent on "Syntax Highlight

" Taken from http://peterodding.com/code/vim/profile/vimrc
" Make Vim open and close folded text as needed because I can't be bothered to
" do so myself and wouldn't use text folding at all if it wasn't automatic.
set foldmethod=marker foldopen=all,insert foldclose=all
let g:php_folding=2
autocmd BufWritePost .vimrc source %
set showtabline=2

autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror

autocmd VimEnter * wincmd w
