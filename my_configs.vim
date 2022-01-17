""""""""""""""""""user interface""""""""""""""""""
" Set 0 lines to the cursor - when moving vertically using j/k
set so=0

" Set line number
set number

" Set show command
set showcmd

" Highlight line number and its background
" hi LineNr ctermfg=31 ctermbg=236

" Set cursorline font bold
set cursorline
" hi CursorLine term=bold cterm=bold

" Set wrap key add <-,-> in insert mode
set whichwrap+=~,[,]

""""""""""""""""""Text, tab and indent related""""""""""""""""""
" Set shiftround, indent auto align
set shiftround
" Set softtabstop
set softtabstop=4

""""""""""""""""""NERDTree""""""""""""""""""
" auto open NERDTree
au VimEnter * NERDTree
" NERDTRee position
let g:NERDTreeWinPos = "left"

""""""""""""""""""vim-indent_guides""""""""""""""""""
" Enable indent guides when startup
let g:indent_guides_enable_on_vim_startup = 1
" Disable auto colors
let g:indent_guides_auto_colors = 0
" Which indent level to start showing guide
let g:indent_guides_start_level = 2
" Specify a list of filetypes to disable the plugin
let g:indent_guides_exclude_filetypes = ['help']
" Customize the size of the indent guide
let g:indent_guides_guide_size = 1
" Set indent line color
hi IndentGuidesOdd  ctermbg=238
hi IndentGuidesEven ctermbg=240


""""""""""""""""""Go Config""""""""""""""""""
" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

""""""""""""""""""COC Config""""""""""""""""""
" Support custom coc-settings.json file path in .vimrc
let g:coc_config_home = '~/.vim_runtime'

let g:coc_global_extensions = ['coc-tsserver','coc-html','coc-css', 'coc-json',
            \ 'coc-java','coc-pyright','coc-flutter',
            \ 'coc-emmet','coc-snippets','coc-xml','coc-yaml',
            \ 'coc-markdownlint','coc-highlight',
            \ 'coc-clangd','coc-sh','coc-go']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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
