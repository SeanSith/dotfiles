set nocompatible              " be iMproved, required
set encoding=UTF-8
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'scrooloose/syntastic'     " Syntax checking
Plug 'Valloric/MatchTagAlways'  " matching HTML tag highlighting
Plug 'unblevable/quick-scope'   " left-right movement
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' | Plug 'edkolev/tmuxline.vim' | Plug 'bling/vim-bufferline'
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter' | Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
"Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
call plug#end()

set noautoindent
set incsearch	" Find the next match as we type the search
set hlsearch	" Highlight search by default
"set paste	" Don't retab everything when pasting
set hidden	" Allow switch between buffers without saving

" Absolute Numbers
nnoremap <silent><leader>n :set number!<cr>

" Swap words
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

" Write with sudo
cmap w!! w !sudo tee > /dev/null %

" Split line on cursor with S
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>

" FZF
nnoremap <C-p> :FZF<CR>

" GitGutter
nnoremap <silent><leader>hh :GitGutterToggle<cr>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
set updatetime=100
let g:gitgutter_show_msg_on_hunk_jumping = 0
let g:gitgutter_async = 0
highlight SignColumn ctermbg=black

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Syntastic Recommendations
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" NERDTree Customization
" Start NERDTree when no files opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Toggle
map <C-d> :NERDTreeToggle<CR>
" Close vim if no other windows than NERDTree are open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" unblevable/quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Vim-Airline customization
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1

