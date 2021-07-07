syntax on
execute pathogen#infect()
call pathogen#helptags()

set numberwidth=4
set number

"Spellcheck
set spelllang=en_us
set spell

"Spellcheck underline
hi clear SpellBad
hi SpellBad cterm=underline

"Start NERDTree on vim startup
"autocmd vimenter * NERDTree

"Sets the width of NERDTree when it opens
let g:NERDTreeWinSize=45

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

"Ale show errors
let g:ale_open_list = 1

set mouse=a

let g:airline_powerline_fonts = 1



inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
