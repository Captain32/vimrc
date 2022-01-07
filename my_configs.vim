""""""""""""""""""user interface""""""""""""""""""
" Set 0 lines to the cursor - when moving vertically using j/k
set so=0

" Set line number
set number

" Set show command
set showcmd

" Highlight line number and its background
hi LineNr ctermfg=31 ctermbg=236

" Set cursorline font bold
set cursorline
hi CursorLine term=bold cterm=bold

" Set wrap key add <-,-> in insert mode
set whichwrap+=~,[,]

""""""""""""""""""Text, tab and indent related""""""""""""""""""
" Set shiftround, indent auto align
set shiftround

""""""""""""""""""NERDTree""""""""""""""""""
" auto open NERDTree
au VimEnter * NERDTree
" NERDTRee position
let g:NERDTreeWinPos = "left"
