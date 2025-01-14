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

" Map <C-^> to gb, 3gb will go to the third buffer
nnoremap gb <C-^>

" Two <Esc> make terminal into normal mode, could scroll
tnoremap <Esc><Esc> <C-\><C-n>

" Set term window 12 rows
set termwinsize=12*0

" Split a window will put the new window below the current one
set splitbelow

" Maps Shift-[up,down,left,right] to resizing a window split
nnoremap <silent> <S-Left> <C-w><
nnoremap <silent> <S-Down> <C-W>-
nnoremap <silent> <S-Up> <C-W>+
nnoremap <silent> <S-Right> <C-w>>

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

""""""""""""""""""vim-indent-guides""""""""""""""""""
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

""""""""""""""""""cpp-enhanced-highlight""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

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
            \ 'coc-clangd','coc-sh','coc-go','coc-sql']

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

""""""""""""""Airline""""""""""""""
let g:airline_theme='wombat'
" Enable tabline
let g:airline#extensions#tabline#enabled = 1
" tabline formatter
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#tabline#show_close_button = 0

" Show buffer line
let g:airline#extensions#bufferline#enabled = 0

" Fugitive
let g:airline#extensions#branch#enabled = 1
"""""""""""""Bufferline"""""""""""""
let g:bufferline_rotate = 0

"""""""""""""nerdtree git plugin"""""""""""""
" 把没有变更的文件的括号去掉
let g:NERDTreeGitStatusConcealBrackets = 0

"""""""""""""""LeaderF""""""""""""""" 
" 以弹出窗口的形式显示
let g:Lf_WindowPosition = 'popup'
" 可以预览结果
let g:Lf_PreviewInPopup = 1
" 需要额外安装字体，给禁了
let g:Lf_ShowDevIcons = 0
" 设置哪些预览结果，哪些不预览
let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 1,
        \ 'Function': 1,
        \ 'Line': 1,
        \ 'Colorscheme': 0,
        \ 'Rg': 0,
        \ 'Gtags': 0
        \}

" 打开文件搜索的命令
let g:Lf_ShortcutF = '<leader>f'
" 打开Buffer搜索的命令
let g:Lf_ShortcutB = '<leader>fb'
" 显示插件所有供选择命令
noremap <leader>fs :LeaderfSelf<cr>
" 最近访问
noremap <leader>fm :LeaderfMru<cr>
" 函数
noremap <leader>ff :LeaderfFunction<cr>
" Buffer
noremap <leader>fb :LeaderfBuffer<cr>
" 本Buffer中的tag，是函数的超集
noremap <leader>ft :LeaderfBufTag<cr>
" 当前文件搜索行，可以替代/和?
noremap <leader>fl :LeaderfLine<cr>
" 搜索window
noremap <leader>fw :LeaderfWindow<cr>
" 显示上次搜索结果
noremap <leader>frr :LeaderfRgRecall<cr>

" 当前Buffer中搜索光标所在词
noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
" 所有文件中搜错光标所在词
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>

" 使用ripgrep进行搜索
nmap <leader>fr :Leaderf rg<cr>
nmap <leader>fra <Plug>LeaderfRgCwordLiteralNoBoundary
nmap <leader>frb <Plug>LeaderfRgCwordLiteralBoundary
nmap <leader>frc <Plug>LeaderfRgCwordRegexNoBoundary
nmap <leader>frd <Plug>LeaderfRgCwordRegexBoundary

vmap <leader>fra <Plug>LeaderfRgVisualLiteralNoBoundary
vmap <leader>frb <Plug>LeaderfRgVisualLiteralBoundary
vmap <leader>frc <Plug>LeaderfRgVisualRegexNoBoundary
vmap <leader>frd <Plug>LeaderfRgVisualRegexBoundary

"""""""""""""""Vista"""""""""""""""
" F9显示或关闭Vista
nmap <F9> :Vista!!<CR>
" 需要额外安装字体，给禁了
let g:vista#renderer#enable_icon = 0
