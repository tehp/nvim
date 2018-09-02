syntax on
execute pathogen#infect()
call pathogen#helptags()

set numberwidth=4
set number
highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

"Start NERDTree on vim startup
"autocmd vimenter * NERDTree

"Start NERDTree if no files are specified, otherwise use Ctrl + N
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Close NERDTree if it is the last thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"CTRL + N open NERDTree
map <C-n> :NERDTreeToggle<CR>

"Show hidden files
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.DS_Store$']

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }