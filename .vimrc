" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=^[[4%dm
     set t_Sf=^[[3%dm
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" syntax enable	
" set background=dark
" set number

" use colorscheme elflord
colorscheme elflord
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" cursorline highlight, stop highlight during insert mode
set cursorline
highlight CursorLine cterm=NONE ctermbg=234 ctermfg=NONE
autocmd InsertEnter * highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermbg=234 ctermfg=NONE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indentation without hard tabs
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show tabs and trails with symbols
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" swith cursor from block in insert mode
" source: https://gist.github.com/andyfowler/1195581
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mapping
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>
nmap <Leader>m :CtrlPMixed<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
" https://github.com/junegunn/vim-plug
" Auto executes filetype plugin indent on, syntax enable
" Revert settings after the call
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline plugin settings
" Use powerline symbols
let g:airline_powerline_fonts = 1
" Display all buffer when there's only one tab
let g:airline#extensions#tabline#enabled = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ctrlp plugin settings
" Ignore files in gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Exclude some files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(class|exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
