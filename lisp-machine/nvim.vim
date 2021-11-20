filetype off
set nocompatible
"
" -------------------
" Dre's Neovim config
" ===================

" Leader
let mapleader = ","
colorscheme boring

" neovim-plug Plugins -----------------
" using the `plugged` plugin manager
call plug#begin(stdpath('data') . '/plugged')
    
    Plug 'jpalardy/vim-slime' " TMUXREPL
    Plug 'bhurlow/vim-parinfer' 
    Plug 'kovisoft/paredit'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb' "allows 'open in github'

    Plug 'tpope/vim-commentary' "allow toggle comment line

    Plug 'kshenoy/vim-signature' "show marks in the number column, very handy as reminder
    "
    " Plug 'Olical/conjure'
    Plug 'Olical/aniseed'
    
    Plug 'tpope/vim-markdown'
    Plug 'xolox/vim-misc'

    Plug 'ewilazarus/preto'

call plug#end()

" Vim Slime 
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name":"default","target_pane":"{last}"}



" Vim commentary
" this is special key, so it means Ctrl forward Slash, under '?'
noremap <C-_> :Commentary<CR>

set stl=%F\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B] 
"set statusline=%<%F\ %h%m%r%=%{tagbar#currenttag('%s\ ','','f')}%-.(%l,%c%V%)\ %P


let g:netrw_liststyle=3     " Tree mode view
let g:netrw_browse_split=0  " Open file in previous buffer
let g:netrw_winsize=10      " Make netrw window smaller

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0
let g:markdown_minlines = 100



let g:fzf_preview_window = ['right:60%', 'ctrl-/']

set signcolumn=yes

nnoremap \ :<C-u>marks<CR>:normal! `


" Keybindings 
" =========================

" gq shows current diff (fugitive) - acts like a toggle, as gq closes it again
nnoremap gq :Git<Cr>
" F2 shows open buffers (fzf), Ctrl-F2 delete buffers (tab select)
nmap <F2> :Buffers<CR>
nmap <C-F2> :BufferDelete<CR>
" F3 Open new file (fzf)
nmap <F3> :Files<CR>
" F4 search for line and open file (fzf)
nmap <F4> :Ag<CR>

" Commands based on navigating code at a macro level
" F5 - find where "the function I'm in" is used. go up call stack
nmap <F5> ?\C\<def\><CR>w:Ag (?<!def )(?<!_)<C-r><C-w><CR>
" F6 - find where else this is mentioned
nmap <F6> :Ag <C-r><C-w><CR>

" F7 - Files near me
nmap <F7> :Explore<CR>

" F8 - outline of symbols on page
nmap <F8> :TagbarToggle<CR>
nmap <C-F8> :CocList outline<CR>

" History browser.
nmap <C-H> :History<CR>

" F9 - Find similarly named files
" <leader>t - Find related test/func files
nmap <F9> :SearchFiles expand('%:t')<CR>
nmap <leader>t :execute 'SearchFiles "'.<SID>related_test().'"'<CR>

" go to definition of function, ( go down call stack ) 
nmap <leader>d <Plug>(coc-definition)
" open up definition of function in a vsplit 
nmap <leader>v :vsp<CR><Plug>(coc-definition)<C-w>j

nmap <leader>] <Plug>(coc-diagnostic-next)
nmap <leader>\ :<C-u>CocList diagnostics<cr>

" change from = sign onwards.
nmap c= $T=C
" ============== Find similar files (by name or by test)

" F9 - Find similarly named files
nmap <F9> :SearchFiles expand('%:t')<CR>

" <leader>t - Find related test/func files
nmap <leader>t :execute 'SearchFiles "'.<SID>related_test().'"'<CR>

" ---------------- 
command! -nargs=1 SearchFiles call fzf#vim#files('.', {'options':'--query <args>'})
function! s:related_test()
    " this will get 'context.py' from 'test_context.py'
    " and 'test_context.py' from 'context.py'
    " with the filepath extended out
    let l:filename = expand('%:t')
    if l:filename =~ 'test'
        let l:searchfile = substitute(l:filename,'^test_','','')
    else
        let l:searchfile = 'test_' . l:filename
    endif

    return join(split(expand('%:h'),'/')[3:],' ') . ' ' . l:searchfile
endfunction


" ============== This is all related to being able to dlete buffer window from
" Ctrl-F2

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout!' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BufferDelete call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

" ==============================================================================

function SetPythonOptions()
    let b:ale_fixers = ['black', 'isort']
    let b:ale_fix_on_save = 1
endfunction

" au BufReadPost */tickets/* call SetMarkdownOptions()
au FileType python call SetPythonOptions()
" Don't hide values
au FileType json let conceallevel=0

filetype plugin indent on
syntax enable
set mouse=a

set background=dark
" A nice font
set guifont=Comic\ Mono:h16

set tabstop=4 
set expandtab
set shiftwidth=4
set softtabstop=4

"set wrapscan
set wrap!
set linebreak

set cursorline
set noshowcmd
set noshowmode

set number
" set relativenumber "Not needed when writing markdown

function! NumberToggle()
	if(&relativenumber == 1)
        set norelativenumber
	else
		set relativenumber
	endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

"Searching
" nnoremap / /\v
" vnoremap / /\v

" backspace over tabs
set backspace=indent,eol,start

" Search options
set hlsearch 
set incsearch 
set showmatch
set ignorecase
set smartcase


"set showbreak=~>
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set list

"nnoremap K <nop>

set shellslash
set vb
set backspace=2
set hidden

set nopaste

set laststatus=2

set pastetoggle=<F2>

set scrolloff=999
set fillchars=""

nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

set autoindent
set nobackup
set noswapfile

map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nmap <silent> ,/ :nohlsearch<CR>

let g:python_recommended_style = 0
set wrap
