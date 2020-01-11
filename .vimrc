" .vimrc file 

set nocompatible

" Avoid loading this file twice
if exists("loaded_user_vimrc")
    finish
endif
let loaded_user_vimrc = 1

set number
set ruler                   " show the cursor position all the time
colorscheme elflord
set fileformat=unix         " set the file format to be always UNIX
set autoindent              " use the indent of previous line for newly created one
set expandtab
set shiftwidth=3
set softtabstop=3
set ignorecase
set mouse=a

" always show the filename
set modeline
set ls=2

" highlith while searching
set is

" highlight found results
set hls

" configuration to show empty spaces but (but not enabled, use set list)
set listchars=tab:>-,trail:-

" add the home directory (e.g. for .vimrc)
set path+=~/

" don't warn every time for writing to the file
set hidden

" always split on the right side
set splitright
" show a cursor line
set cursorline
" hi CursorLine ctermbg=green ctermfg=white cterm=bold
" hi CursorLine ctermbg=NONE ctermfg=white cterm=bold
hi CursorLine ctermbg=darkcyan ctermfg=white cterm=bold

" show trailing spaces
match Error /\s\+$/

" remove trailing spaces
function! <SID>StripTrailingWhitespaces()
   let l = line(".")
   let c = col(".")
   %s/\s\+$//e
   call cursor(l, c)
endfun
autocmd BufWritePre *.h,*.c,*.cpp,*.py,*.d :call <SID>StripTrailingWhitespaces()

" encoding
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.


" =============== Plugin Initialization ===============
" This loads all the plugins specified in ~/.vim/plugins.vim
if filereadable(expand("~/.vim/plugins.vim"))
   source ~/.vim/plugins.vim
endif

" set the wildmenu
" set wildmenu

" add some plugins
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
" Plug 'ajh17/vimcompletesme'
Plug 'ycm-core/YouCompleteMe'
" Plug '~/.vim/bundle/YouCompleteMe'
call plug#end()

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
